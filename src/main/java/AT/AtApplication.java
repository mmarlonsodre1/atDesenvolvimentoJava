package AT;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class AtApplication extends SpringBootServletInitializer{
        @Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(AtApplication.class);
	}
        
	public static void main(String[] args) {
            SpringApplication.run(AtApplication.class, args);
    }

}
