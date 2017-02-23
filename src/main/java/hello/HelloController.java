package hello;

import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
    @RequestMapping("/")
    public String index() {
        try {
			return "Able to get db connection? " + jdbcTemplate.getDataSource().getConnection().isValid(100);
		} catch (SQLException e) {
			return "Error: " + e.getMessage();
		}
    }
    
}
