package com.itbank.repository;

import java.sql.Date;

import org.apache.ibatis.annotations.Select;


public interface TestDAO {

	@Select("select banner from v$version")
	String selectVersion();

	@Select("select sysdate from dual")
	Date selectSysdate();

}
