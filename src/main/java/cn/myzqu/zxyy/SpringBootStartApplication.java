package cn.myzqu.zxyy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 修改启动类，继承 SpringBootServletInitializer 并重写 configure 方法
 */
@SpringBootApplication
public class SpringBootStartApplication{

	/* @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	        return application.sources(SpringBootStartApplication.class);
	    }*/

	    public static void main(String[] args) throws Exception {
	        SpringApplication.run(SpringBootStartApplication.class, args);
	    }
}
