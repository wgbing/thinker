package com.wgbing.thinker.config.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 * TODO: Spring Security 配置
 * @author wgbing
 * @date 2018/7/10 18:00
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)//开启security注解
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    /**
     * TODO: 定义系统安全策略，如哪些url路径需要经过授权才能访问，哪些不用
     * @author wgbing
     * @date 2018/7/12 15:52
     * @param http
     * @return
     * @throws
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.headers().frameOptions().disable();             //解决SpringBoot不允许加载iframe问题
        http.exceptionHandling().accessDeniedPage("/denied");//没有权限访问时跳转路径
        /*.csrf().disable()*/
        http
            .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/css/**").permitAll()
                .antMatchers("/fonts/**").permitAll()
                .antMatchers("/images/**").permitAll()
                .antMatchers("/js/**").permitAll()
                .antMatchers("/libs/**").permitAll()
                .antMatchers("/plugins/**").permitAll()
                .antMatchers("/login").permitAll()
                .antMatchers("/register").permitAll()
                .antMatchers("/captcha/image").permitAll()
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/auth")
                .failureUrl("/login?error")
                .and()
            .logout() //logout config
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .invalidateHttpSession(true)
                .logoutSuccessUrl("/login");

    }

    /**
     * TODO: 重写父类方法，添加自定义用户及角色
     * @author wgbing
     * @date 2018/7/11 9:43
     * @param auth
     * @return
     * @throws
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("admin").password("123456").roles("USER");
        super.configure(auth);
    }
}
