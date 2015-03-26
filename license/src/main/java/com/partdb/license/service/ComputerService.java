package com.partdb.license.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partdb.license.domain.Computer;
import com.partdb.license.mapper.ComputerMapper;

@Service
public class ComputerService {		
	@Autowired
	ComputerMapper ComputerMapper;
	
	public List<Computer> getComputers() {
		return ComputerMapper.getComputers();
	}

	public List<Computer> getComputersByGroup(String id) {
		return ComputerMapper.getComputersByGroup(id);
	}
}
