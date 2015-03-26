package com.partdb.license.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.partdb.license.domain.Computer;

@Repository(value="computerMapper")
public interface ComputerMapper {
	public List<Computer> getComputers();

	public List<Computer> getComputersByGroup(String id);
}
