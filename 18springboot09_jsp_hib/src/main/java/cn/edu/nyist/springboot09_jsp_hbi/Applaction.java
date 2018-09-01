package cn.edu.nyist.springboot09_jsp_hbi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;

@EnableAutoConfiguration     
@ComponentScan     //扫描注解
@Controller
public class Applaction {
	

	public static void main(String[] args) {
		SpringApplication.run(Applaction.class, args);
	}
}
