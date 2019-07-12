package net.hrdkorea.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InsaDAO {
	private static InsaDAO instance = new InsaDAO();
	
	private InsaDAO() {}
	
	public static InsaDAO getInstance() {
		return instance;
	}
	
	
	private static Connection getConnection() {
		Connection conn = null;
		
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(db_url,"webmvc","123123");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// auto generate id 
	public String idGenerate() {
		String id = "";
		String sql = "select id from personnel order by id desc ";
		try {
			conn = getConnection();
			pstmt =conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int maxid = rs.getInt(1);
				id = (maxid + 1) + "";
				
				for(int i = 0; i < 4-id.length() ; i++)
					id = "0" + id;
				
			}else
				id = "0001";
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return id;
	}
	
	// delete
	public int delete_InsaVO(String id) {
		
		int deleteOk = -1;
		String sql = "delete personnel where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			deleteOk = pstmt.executeUpdate();
	
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return deleteOk;
	}
	
	// modify
	public int update_InsaVO(InsaVO ivo) {
		
		int updateOk = -1;
		String sql = "update personnel set name = ?, dept = ?, position = ?, duty = ?, phone =? where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(6, ivo.getId());
			pstmt.setString(1, ivo.getName());
			pstmt.setString(2, ivo.getDept());
			pstmt.setString(3, ivo.getPosition());
			pstmt.setString(4, ivo.getDuty());
			pstmt.setString(5, ivo.getPhone());
			
			updateOk = pstmt.executeUpdate();
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return updateOk;
	}
	
	//insert
	
	public int insert_InsaVO(InsaVO ivo) {
		
		int insertOk = -1;
		String sql = "insert into personnel values(?,?,?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ivo.getId());
			pstmt.setString(2, ivo.getName());
			pstmt.setString(3, ivo.getDept());
			pstmt.setString(4, ivo.getPosition());
			pstmt.setString(5, ivo.getDuty());
			pstmt.setString(6, ivo.getPhone());
			
			insertOk = pstmt.executeUpdate();
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return insertOk;
	}
	
	
	
	
	// select insaVO by id
	public InsaVO select_ByID(String id){
		
		InsaVO ivo = new InsaVO();
		String sql = "select * from personnel where id = ? ";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ivo = new InsaVO();
				ivo.setDept(rs.getString("dept"));
				ivo.setDuty(rs.getString("duty"));
				ivo.setId(rs.getString("id"));
				ivo.setName(rs.getString("name"));
				ivo.setPhone(rs.getString("phone"));
				ivo.setPosition(rs.getString("position"));
				
				
				}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return ivo;
	}
	
	// search
	public List<InsaVO> select_ByIdOrDept(String searchVal,String searchFlag , String orderVal){
		
		List<InsaVO> list = new ArrayList<InsaVO>();
		String sql = "select * from personnel ";
		if(searchFlag.equals("1"))
			sql += "where id = ?";
		else
			sql += "where dept = ?";
		
		sql += " order by " + orderVal;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchVal);
			rs = pstmt.executeQuery();
			InsaVO ivo = null;
			while(rs.next()){
				ivo = new InsaVO();
				ivo.setDept(rs.getString("dept"));
				ivo.setDuty(rs.getString("duty"));
				ivo.setId(rs.getString("id"));
				ivo.setName(rs.getString("name"));
				ivo.setPhone(rs.getString("phone"));
				ivo.setPosition(rs.getString("position"));
				
				list.add(ivo);
				}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	private void closeAll() {
		try {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
