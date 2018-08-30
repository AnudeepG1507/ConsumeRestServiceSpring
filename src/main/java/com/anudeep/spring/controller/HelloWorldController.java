package com.anudeep.spring.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.anudeep.spring.Entity.testClass;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

/**
 * @author imssbora
 */
@Controller
public class HelloWorldController {
   
	@RequestMapping(path={"/"},method=RequestMethod.GET)
   public ModelAndView listuser() {
	   
	   RestTemplate restTemplate = new RestTemplate();
	   
	   testClass[] users = (testClass[]) restTemplate.getForObject("http://localhost:8080/StudentRestAPI/api/students", testClass[].class);
	   
	   return new ModelAndView("index", "users", users);

	   
			   
      
   }
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		// create model attribute to bind form data
		testClass theStudent = new testClass();
		
		theModel.addAttribute("student", theStudent);
		
		return "customer-form";
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("student") testClass theStudent) {
		
		
		RestTemplate restTemplate = new RestTemplate();
		testClass testPost = restTemplate.postForObject("http://localhost:8080/StudentRestAPI/api/students", theStudent, testClass.class);
		
		
		return "redirect:/";
	}
	
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("studentId") int theId) {
		
		RestTemplate restTemplate = new RestTemplate();
		String entityUrl = "http://localhost:8080/StudentRestAPI/api/students" + "/" + theId;
		restTemplate.delete(entityUrl);
		
		
		return "redirect:/";
		
	}
	

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentId") int theId,
									Model theModel) {

		RestTemplate restTemplate = new RestTemplate();
		testClass tempStudent = restTemplate.getForObject("http://localhost:8080/StudentRestAPI/api/students" + "/" + theId, testClass.class);
		
		
		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("student", tempStudent);
		
		// send over to our form		
		return "customer-form";
	}
	
	 @PostMapping("/search")
	    public String searchCustomers(@RequestParam("theSearchName") String theSearchName,
	                                    Model theModel) {
		 
		 RestTemplate restTemplate = new RestTemplate();
		 testClass[] theStudents = (testClass[]) restTemplate.getForObject("http://localhost:8080/StudentRestAPI/api/students/name/"+ theSearchName, testClass[].class);

	       
	                
	        // add the customers to the model
	        theModel.addAttribute("users", theStudents);

	        return "index";        
	    }
	
	
}
