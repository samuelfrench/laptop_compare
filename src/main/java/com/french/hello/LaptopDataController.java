package com.french.hello;

import org.springframework.web.bind.annotation.RestController;

import com.french.dao.LaptopDAO;
import com.french.model.Laptop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/data/laptop")
public class LaptopDataController {
	
	@Autowired
	LaptopDAO laptopDAO;
	
    @RequestMapping("/")
    public List<Laptop> getLaptops() {
    	return laptopDAO.getAllLaptops();
    }
	
    @RequestMapping("/size")
    public String getSize() {
    	return Integer.toString(laptopDAO.getAllLaptops().size());
    }
    
}
