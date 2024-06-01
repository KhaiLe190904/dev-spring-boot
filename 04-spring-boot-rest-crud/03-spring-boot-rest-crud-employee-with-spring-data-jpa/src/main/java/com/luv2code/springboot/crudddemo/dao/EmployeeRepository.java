package com.luv2code.springboot.crudddemo.dao;

import com.luv2code.springboot.crudddemo.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
    // that's it ... no need write any code
}
