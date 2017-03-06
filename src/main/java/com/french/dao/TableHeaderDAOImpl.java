package com.french.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.french.model.TableHeader;

@Repository
public class TableHeaderDAOImpl implements TableHeaderDAO {
	private final static String getAllTableHeaders = 
			"select ht.header_type_code as headerTypeCode, " + 
			"h.header_text as headerText, " + 
			"h.header_code as headerCode, " + 
			"h.default as isDefault, " + 
			"h.seq as sequence " + 
			"from header h " +
			"join header_type ht ON h.header_type_id = ht.header_type_id;";
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<TableHeader> getAllTableHeaders() {
		return jdbcTemplate.query(getAllTableHeaders, new TableHeaderMapper());
	}
	
	private class TableHeaderMapper implements RowMapper<TableHeader>{

		@Override
		public TableHeader mapRow(ResultSet rs, int rowNum) throws SQLException {
			TableHeader tableHeader = new TableHeader();
			tableHeader.setHeaderTypeCode(rs.getString("headerTypeCode"));
			tableHeader.setHeaderCode(rs.getString("headerCode"));
			tableHeader.setHeaderText(rs.getString("headerText"));
			tableHeader.setIsDefault(rs.getBoolean("isDefault"));
			tableHeader.setSequence(rs.getInt("sequence"));
			return tableHeader;
		}
		
	}

}
