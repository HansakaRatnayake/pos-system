package com.project.possystem;

import com.project.possystem.service.RoleService;
import com.project.possystem.service.UserService;
import com.project.possystem.service.UserStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class PossystemApplication implements CommandLineRunner {

	private final UserService userService;
	private final RoleService roleService;
	private final UserStatusService userStatusService;

	@Autowired
	public PossystemApplication(UserService userService, RoleService roleService, UserStatusService userStatusService) {
		this.userService = userService;
		this.roleService = roleService;
		this.userStatusService = userStatusService;
	}

	public static void main(String[] args) {
		SpringApplication.run(PossystemApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		userStatusService.initializeUserStatuses();
		roleService.initializeUserRoles();
		userService.initializeAdmin();

	}
}
