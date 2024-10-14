// package com.example.demo.config;

// import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

// public class SecurityConfig extends WebSecurityConfigurerAdapter {
//   @Override
//   protected void configure(HttpSecurity http) throws Exception {
//     http
//         .authorizeRequests()
//         .antMatchers("/api/manage-product",
//             "/v3/api-docs",
//             "/v2/api-docs",
//             "/swagger-resources/**",
//             "/swagger-ui/**")
//         .permitAll()
//         .anyRequest().authenticated();
//   }

// }
