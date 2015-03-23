package com.partdb.license.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.partdb.license.domain.Computer;
import com.partdb.license.service.ComputerService;

@Controller
public class ComputerController {
	
	@Autowired
	ComputerService computerService;
	
	private static final Logger logger = LoggerFactory.getLogger(ComputerController.class);
	
	@RequestMapping(value = "/computer", method = RequestMethod.GET)
	@ResponseBody
	public List<Computer> getComputers() {		
		return computerService.getComputers();
	}	
}
