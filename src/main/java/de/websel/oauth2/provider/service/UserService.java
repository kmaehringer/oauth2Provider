package de.websel.oauth2.provider.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import de.websel.oauth2.provider.model.Role;
import de.websel.oauth2.provider.model.User;

@Service
public class UserService {

	@Autowired
	private UserRepository users;

	public User findByUsername(String username) {
		return users.findByUsername(username);
	}

	public String combineRoles(User user) {
		String result = "";
		if (user != null && user.getRoles() != null) {
			for (Role role : user.getRoles()) {
				if (!result.isEmpty()) {
					result += ",";
				}
				result += role.getRolename();
			}
		}
		return result;
	}
}
