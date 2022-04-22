package com.edutecno.desafio.ContactManager;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.edutecno.desafio.ContactManager.controller.ContactController;

@SpringBootTest
class ApplicationTests {
	
	ContactController cc = new ContactController();

	@Test
	void deleteContact() {
		cc.deleteContact(1, null);
		
	}

}
