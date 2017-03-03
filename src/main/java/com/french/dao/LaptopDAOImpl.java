package com.french.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.french.model.Laptop;


@Component
public class LaptopDAOImpl implements LaptopDAO {
	
	private final static String getAllLaptops = "SELECT mfr.mfr_name as mfr,\r\n" + 
			"ost.os_type_name as osType,\r\n" + 
			"osv.os_version_name as osVersion,\r\n" + 
			"cpub.cpu_brand as cpuBrand,\r\n" + 
			"cpum.cpu_model_id as cpuModel,\r\n" + 
			"st.storage_type as storageType,\r\n" + 
			"CONCAT(dr.width, \"x\", dr.height) as displayRes,\r\n" + 
			"l.model as model,\r\n" + 
			"l.screen_size as screenSize,\r\n" + 
			"l.weight as weight,\r\n" + 
			"l.battery_life_hr as batteryLifeHr,\r\n" + 
			"l.base_cpu_clock_ghz as baseCpuClockGhz,\r\n" + 
			"l.is_touch_screen as isTouchScreen,\r\n" + 
			"l.is_ips_screen as isIpsScreen,\r\n" + 
			"l.is_tab_convert as isTabConvert,\r\n" + 
			"l.has_discrete_gpu as isDiscreteGpu,\r\n" + 
			"l.release_date as releaseDate,\r\n" + 
			"l.photo_url as photoUrl,\r\n" + 
			"l.price as price,\r\n" + 
			"l.buy_link as buyLink\r\n" + 
			"FROM laptop as l\r\n" + 
			"JOIN mfr as mfr ON l.mfr_id = mfr.mfr_id\r\n" + 
			"JOIN os_version as osv ON l.os_version_id = osv.os_version_id\r\n" + 
			"JOIN os_type as ost ON osv.os_type_id = ost.os_type_id\r\n" + 
			"JOIN cpu_model as cpum ON l.cpu_model_id = cpum.cpu_model_id\r\n" + 
			"JOIN cpu_brand as cpub ON cpum.cpu_brand_id = cpub.cpu_brand_id\r\n" + 
			"JOIN storage_type as st ON l.storage_type_id = st.storage_type_id\r\n" + 
			"JOIN display_res as dr ON l.display_res_id = dr.display_res_id;";
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Laptop> getAllLaptops() {
		return jdbcTemplate.query(getAllLaptops, new LaptopMapper());
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
