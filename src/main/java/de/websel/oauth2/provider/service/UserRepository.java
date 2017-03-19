package de.websel.oauth2.provider.service;

import org.springframework.data.repository.CrudRepository;

import de.websel.oauth2.provider.model.User;

public interface UserRepository extends CrudRepository<User, Long> {
	public User findByUsername(String username);
}
