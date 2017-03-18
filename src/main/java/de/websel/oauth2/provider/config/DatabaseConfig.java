package de.websel.oauth2.provider.config;

import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.flyway.FlywayMigrationStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class DatabaseConfig {
	
	@Value("${database.reset}")
	private Boolean toClean;
	
	@Value("${spring.datasource.driver-class-name}")
	private String jdbcDriverClassName;
	@Value("${spring.datasource.url}")
	private String jdbcUrl;
	@Value("${spring.datasource.username}")
	private String username;
	@Value("${spring.datasource.password}")
	private String password;

	@Bean
	public FlywayMigrationStrategy cleanMigrateStartegy() {
		FlywayMigrationStrategy strategy = new FlywayMigrationStrategy() {
			@Override
			public void migrate(Flyway flyway) {
				if(toClean) {
					flyway.clean();
				}
				flyway.migrate();
			}
		};
		return strategy;
	}
	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(jdbcDriverClassName);
		dataSource.setUrl(jdbcUrl);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		return dataSource;
	}
}
