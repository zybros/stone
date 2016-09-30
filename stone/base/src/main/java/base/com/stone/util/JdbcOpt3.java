package com.stone.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class JdbcOpt3 {

	public static void main(String[] s) {
		
	}

	private static String userName = "root";
	private static String password = "111111";
	private static String url = "jdbc:mysql://localhost:3306/gzjs?useUnicode=true&amp;characterEncoding=utf8";
	
	
	static void insertGzjs(List<Gzjs> list) {
		String sql = "INSERT INTO gzjs(num,name,company,register_major,register_num,certificate_num,validity_date,type) VALUES(?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, userName,
					password);
			conn.setAutoCommit(false);   
			PreparedStatement  pstmt = conn.prepareStatement(sql);
			for(int i=0;i<list.size();i++){
				pstmt.setInt(1,list.get(i).getNum());
				pstmt.setString(2, list.get(i).getName());
				pstmt.setString(3,list.get(i).getCompany());
				pstmt.setString(4,list.get(i).getRegisterMajor());
				pstmt.setString(5,list.get(i).getRegisterNum());
				pstmt.setString(6,list.get(i).getCertificateNum());
				pstmt.setString(7,list.get(i).getValidity_date());
				pstmt.setInt(8,list.get(i).getType());
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			conn.commit();
			pstmt.close();
			conn.close();
			System.out.println("data inserted1");
		} catch (SQLException e) {
			System.err.println("SQLException: " + e);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
}
