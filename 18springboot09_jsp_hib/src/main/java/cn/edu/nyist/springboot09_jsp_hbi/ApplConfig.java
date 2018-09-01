package cn.edu.nyist.springboot09_jsp_hbi;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.ui.context.ThemeSource;
import org.springframework.ui.context.support.ResourceBundleThemeSource;
import org.springframework.web.servlet.ThemeResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.theme.CookieThemeResolver;
import org.springframework.web.servlet.theme.ThemeChangeInterceptor;

import com.alibaba.druid.pool.DruidDataSource;

import cn.edu.nyist.springboot09_jsp_hbi.controller.AdminInterceptor;

@Configuration   //读取配置的数据源和模板
public class ApplConfig extends WebMvcConfigurerAdapter{
	@Autowired
	private Environment env; //读取属性文件
    @Bean(name="dataSource",destroyMethod="close")
	public DataSource getDataSource() {
		DruidDataSource dds=new DruidDataSource();
		dds.setUrl(env.getProperty("spring.datasource.url").trim());
		dds.setUsername(env.getProperty("spring.datasource.username").trim());
		dds.setPassword(env.getProperty("spring.datasource.password").trim());
		dds.setDriverClassName(env.getProperty("spring.datasource.driver-class-name"));
		return dds;
		
	}
    
    @Bean(name="themeSource")
    public ThemeSource getThemeSource() {
    	ResourceBundleThemeSource resourceBundleThemeSource=new ResourceBundleThemeSource();
    	//主题属性文件目录前缀（结尾必须带     .  ）
    	resourceBundleThemeSource.setBasenamePrefix("cn.edu.nyist.springboot07_jsp_mybatis.theme.");
    	return resourceBundleThemeSource;
    	
    }
    
    //主题解析器
    @Bean(name="themeResolver")
    public ThemeResolver getThemeResolver() {
    	CookieThemeResolver cookieThemeResolver=new CookieThemeResolver();
    	//设置默认主题
    	cookieThemeResolver.setDefaultThemeName("sketchy");
    	return cookieThemeResolver;
    }
    //主题修改拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	registry.addInterceptor(new ThemeChangeInterceptor());
    	registry.addInterceptor(new AdminInterceptor());//配置拦截器
    	
    }
   @Override
public void addResourceHandlers(ResourceHandlerRegistry registry) {
	   //开放/WEB-INF/upload/目录下面资源，当收到请求是upload
	registry.addResourceHandler("/upload/**").addResourceLocations("/WEB-INF/upload/");
	super.addResourceHandlers(registry);
}
    
}
