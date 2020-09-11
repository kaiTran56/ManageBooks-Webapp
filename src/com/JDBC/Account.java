package com.JDBC;

public class Account {
	private String user;
	private String password;

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Account(String user, String password) {
		super();
		this.user = user;
		this.password = password;
	}
}
