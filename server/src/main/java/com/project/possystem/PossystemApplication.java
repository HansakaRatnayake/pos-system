package com.project.possystem;

import com.project.possystem.service.RoleService;
import com.project.possystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class PossystemApplication  {
	
	public static void main(String[] args) {
		SpringApplication.run(PossystemApplication.class, args);
	}


}
