package com.edutecno.desafio.ContactManager.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edutecno.desafio.ContactManager.model.Contact;

@Controller
@RequestMapping("/contactManager")
public class ContactController {

	List<Contact> contacts = new ArrayList<Contact>();

	@RequestMapping(value =  "/addContact", method = RequestMethod.POST)
	public String addContact(@ModelAttribute Contact contact, Model model) {
		int id = 0;
		if (contacts.size() == 0) {
			id = contacts.size() + 1;
		} else {
			id = contacts.get(contacts.size() - 1).getId() + 1;
		}

		contact.setId(id);
		contacts.add(contact);
		return getListContact(model);

	}

	@RequestMapping("/selectContact")
	public String selectContact(@RequestParam Integer id, Model model) {
		for (Contact tempContact : contacts) {
			if (id == tempContact.getId()) {
				model.addAttribute("selectContact", tempContact);
				break;

			}

		}

		return getListContact(model);
	}

	@RequestMapping(value =  "/deleteContact", method = RequestMethod.GET)
	public String deleteContact(@RequestParam(value = "id", required = false) Integer id, Model model) {
		if (id != null) {
			for (Contact tempContact : contacts) {
				if (id == tempContact.getId()) {
					contacts.remove(contacts.indexOf(tempContact));
					break;

				}

			}

		}
		return getListContact(model);
	}

	@RequestMapping(value = "", method =  RequestMethod.GET)
	public String getListContact(Model model) {
		model.addAttribute("contacts", contacts);
		return "contactManager";
	}
}
