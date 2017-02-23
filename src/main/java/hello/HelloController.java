package hello;

import org.springframework.web.bind.annotation.RestController;

import model.Laptop;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {
	
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
