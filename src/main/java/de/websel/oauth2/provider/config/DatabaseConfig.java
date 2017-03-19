package de.websel.oauth2.provider.config;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.flyway.FlywayMigrationStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DatabaseConfig {

	@Value("${database.reset}")
	private Boolean toClean;

	@Bean
	public FlywayMigrationStrategy cleanMigrateStartegy() {
		FlywayMigrationStrategy strategy = new FlywayMigrationStrategy() {
			@Override
			public void migrate(Flyway flyway) {
				if (toClean) {
					flyway.clean();
				}
				flyway.migrate();
			}
		};
		return strategy;
	}
}
