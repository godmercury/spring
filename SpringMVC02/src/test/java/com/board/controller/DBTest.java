package com.board.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBTest {

	@Test
	public void test() {
		try (Connection conn = DriverManager.getConnection
				("jdbc:mariadb://localhost:3306/java_db","java", "java!@")) {
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
