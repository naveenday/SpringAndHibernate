package com.test.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.test.spring.model.Student;

@Repository
public class StudentDAOImpl implements StudentDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(StudentDAOImpl.class);
    @Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addStudent(Student s) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(s);
		logger.info("Student saved successfully, Student Details="+s);
	}

	@Override
	public void updateStudent(Student s) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(s);
		logger.info("Student updated successfully, Student Details="+s);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> listStudents() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Student> studentList = session.createQuery("from Student").list();
		for(Student s : studentList){
			logger.info("*************************student List::"+s);
		}
		return studentList;
	}

	@Override
	public Student getStudentById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Student s = (Student) session.load(Student.class, new Integer(id));
		logger.info("student loaded successfully, student details="+s);
		return s;
	}

	@Override
	public void removeStudent(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Student s = (Student) session.load(Student.class, new Integer(id));
		if(null != s){
			session.delete(s);
		}
		logger.info("student deleted successfully, student details="+s);
	}

}
