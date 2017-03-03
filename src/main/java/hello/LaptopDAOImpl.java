package hello;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import model.Laptop;

@Component
public class LaptopDAOImpl implements LaptopDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Laptop> getAllLaptops() {
		String query = "select * from laptop";
		
		return jdbcTemplate.query(query, new LaptopMapper());
	}
	
	private class LaptopMapper implements RowMapper<Laptop>{

		@Override
		public Laptop mapRow(ResultSet rs, int rowNum) throws SQLException {
			Laptop laptop = new Laptop();
			laptop.setModel(rs.getString("model"));
			laptop.setMfr("TODO - Expand Query");
			return laptop;
		}
		
	}

}
