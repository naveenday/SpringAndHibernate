package com.test.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.test.spring.model.Student;
import com.test.spring.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	
	
	@RequestMapping(value = "/students", method = RequestMethod.GET)
	public String listStudents(Model model) {
		model.addAttribute("student", new Student());
		model.addAttribute("listStudents", this.studentService.listStudents());
		return "student";
	}
	
	//For add and update student both
	@RequestMapping(value= "/student/add", method = RequestMethod.POST)
	public String addStudent(@ModelAttribute("student") Student s){
		
		if(s.getId() == 0){
			//new student, add it
			this.studentService.addStudent(s);
		}else{
			//existing student, call update
			this.studentService.updateStudent(s);
		}
		
		return "redirect:/students";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removeStudent(@PathVariable("id") int id){
		
        this.studentService.removeStudent(id);
        return "redirect:/students";
    }
 
    @RequestMapping("/edit/{id}")
    public String editStudent(@PathVariable("id") int id, Model model){
        model.addAttribute("student", this.studentService.getStudentById(id));
        model.addAttribute("listStudents", this.studentService.listStudents());
        return "student";
    }
	
}
