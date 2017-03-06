package com.french.hello;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.french.dao.TableHeaderDAO;
import com.french.model.TableHeader;

@RestController
@RequestMapping("/table/header")
public class TableHeaderController {
	
	@Autowired
	TableHeaderDAO tableHeaderDAO;
	
	@RequestMapping("/")
	public List<TableHeader> getTableHeaders(){
		return tableHeaderDAO.getAllTableHeaders();
	}
}
