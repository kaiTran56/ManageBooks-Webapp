package com.JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Function {

	private String user;
	private String password;
	private String address;
	private Connection connect;

	public Function(String user, String password, String address) {
		this.user = user;
		this.password = password;
		this.address = address;
	}

	public void getConnection() {
		try {
			System.out.println("Connecting...");
			if (connect == null || connect.isClosed()) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connect = DriverManager.getConnection(address, user, password);
				System.out.println("Access granted !");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void getDisconnection() {
		try {
			if (!(connect.isClosed()) || connect != null) {
				connect.close();
				System.out.println("Closed!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Book> listAllBook() {
		getConnection();
		List<Book> listBook = new ArrayList<Book>();

		String sql = "select * from libary";

		try {
			Statement statement = connect.createStatement();
			ResultSet result = statement.executeQuery(sql);
			while (result.next()) {
				int id = result.getInt("id");
				String name = result.getString("name");
				String author = result.getString("author");
				double price = result.getDouble("price");
				Book book = new Book(id, name, author, price);
				listBook.add(book);
			}
			statement.close();
			result.close();
			getDisconnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return listBook;
	}

	public void updateBook(Book book) {
		String sql = "insert into libary value (?,?,?,? )";
		getConnection();
		try {
			PreparedStatement statement = connect.prepareStatement(sql);
			statement.setInt(1, book.getId());
			statement.setString(2, book.getName());
			statement.setString(3, book.getAuthor());
			statement.setDouble(4, book.getPrice());

			statement.executeUpdate();
			System.out.println("Updated done!");
			statement.close();
			getDisconnection();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Account getLogin(String user, String password) {
		String sql = "select * from login where user like ? and password like ?;";
		getConnection();
		try {
			PreparedStatement statement = connect.prepareStatement(sql);
			statement.setString(1, user);
			statement.setString(2, password);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				String userJDBC = result.getString("user");
				String passwordJDBC = result.getString("password");
				Account account = new Account(userJDBC, passwordJDBC);
				return account;
			}
			statement.close();
			result.close();
			getDisconnection();
		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null;
	}

	public List<Book> searchBookByAuthor(String author) {

		List<Book> listBookTemp = this.listAllBook().stream().filter(p -> p.getAuthor().equals(author))
				.collect(Collectors.toList());
		System.out.println(listBookTemp.toString());
		return listBookTemp;
	}

	public Book editById(int id) {
		Book bookTemp = this.listAllBook().stream().filter(p -> p.getId() == id).findFirst().orElse(null);
		System.out.println(bookTemp.toString());
		return bookTemp;
	}

	public void editBook(Book book) {
		String sql = "update libary set name = ?, author =?, price = ? where id = ?";
		getConnection();
		try {
			PreparedStatement statement = connect.prepareStatement(sql);
			statement.setString(1, book.getName());
			statement.setString(2, book.getAuthor());
			statement.setDouble(3, book.getPrice());
			statement.setInt(4, book.getId());
			statement.executeUpdate();
			System.out.println("Edit Done!");
			statement.close();
			getDisconnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
