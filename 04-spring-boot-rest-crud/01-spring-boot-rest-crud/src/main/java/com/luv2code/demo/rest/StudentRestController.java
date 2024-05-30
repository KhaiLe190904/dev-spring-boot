package com.luv2code.demo.rest;

import com.luv2code.demo.entity.Student;
import jakarta.annotation.PostConstruct;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class StudentRestController {

    private List<Student> theStudents;
    // define @PostConstruct to load the student data ... only once!
    @PostConstruct
    public void loadData(){
        theStudents = new ArrayList<>();
        theStudents.add(new Student("Khai", "Le"));
        theStudents.add(new Student("An", "Trinh"));
        theStudents.add(new Student("Huy", "Dang"));
    }

    // define endpoint for "/student" - return a list of students
    @GetMapping("/student")
    public List<Student> getStudents(){
        return theStudents;
    }
    // define endpoint or "/students/{studentId}" - return student at index
    @GetMapping("/students/{studentId}")
    public Student getStudent(@PathVariable int studentId){
        // just index into the list ... keep it simple for new

        // check the studentId agian list size
        if(studentId > theStudents.size() || studentId < 0){
            throw new StudentNotFoundException("StudentID not found - " + studentId);
        }
        return theStudents.get(studentId);
    }

}
