package sampleproject.pds.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sampleproject.pds.vo.PdsVO;




public class PdsDAO {
	private PdsDAO() {}
	private static PdsDAO instance = new PdsDAO();
	public static PdsDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	// 전체 데이터 검색
	public List<PdsVO> pdsList() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT * FROM SAM_PDS ORDER BY NUM DESC";
			List<PdsVO> list = new ArrayList<PdsVO>();
			PdsVO vo = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
					while(rs.next()) {
						vo = new PdsVO();
						vo.setNum(rs.getInt("num"));
						vo.setName(rs.getString("name"));
						vo.setPass(rs.getString("pass"));
						vo.setEmail(rs.getString("email"));
						vo.setSubject(rs.getString("subject"));
						vo.setContents(rs.getString("contents"));
						vo.setIndate(rs.getString("indate").substring(0,10));
						vo.setReadcnt(rs.getInt("readcnt"));
						vo.setFilename(rs.getString("filename"));
						list.add(vo);
					}
				} catch (Exception e) {

				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (Exception e) {

					}
				}
				return list;

			}
	// 등록 메소드
	public int pdsWrite(PdsVO pds) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "INSERT INTO SAM_PDS(NUM,NAME,PASS,EMAIL,SUBJECT,CONTENTS,FILENAME) VALUES (SAM_PDS_SEQ_NUM.NEXTVAL,?,?,?,?,?,?)";
		int row = 0; // 리턴타입
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			// pstmt = myConn.prepareStatement("SELECT * FROM GUEST ORDER BY NUM DESC");
	
			pstmt.setString(1, pds.getName());
			pstmt.setString(2, pds.getPass());
			pstmt.setString(3, pds.getEmail());
			pstmt.setString(4, pds.getSubject());
			pstmt.setString(5, pds.getContents());
			pstmt.setString(6, pds.getFilename());
			row = pstmt.executeUpdate();
	
			} catch (Exception e) {
			e.printStackTrace();
	
			} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		
		}
		return row;
	}
	//조회수 증가 메소드
	public int pdsCount(int num){
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		int row  = 0;
		String query="UPDATE SAM_PDS SET READCNT = READCNT+1 WHERE NUM=?";
		try {
			conn = getConnection();//커넥션 풀 이용
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// View 메소드 
	
	public PdsVO pdsView(int num) {
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String query="select * from sam_pds where num=?";
		PdsVO vo = null;
		try {
			conn = getConnection();//커넥션 풀 이용
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new PdsVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setEmail(rs.getString("email"));
				vo.setPass(rs.getString("pass"));
				vo.setContents(rs.getString("contents"));
				vo.setIndate(rs.getString("indate").substring(0,10));
				vo.setReadcnt(rs.getInt("readcnt"));
				vo.setFilename(rs.getString("filename"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
		return vo;
	}

	// 수정 메소드
			public int pdsModify(PdsVO vo)  {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String query = "UPDATE SAM_PDS SET EMAIL=?, SUBJECT=?, CONTENTS=?, FILENAME=? WHERE NUM=? ";
				int row = 0;
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
									
					pstmt.setString(1, vo.getEmail());
					pstmt.setString(2, vo.getSubject());
					pstmt.setString(3, vo.getContents());
					pstmt.setString(4, vo.getFilename());
					pstmt.setInt(5, vo.getNum());		
					
					row = pstmt.executeUpdate();
			
				} catch (Exception e) {
					e.printStackTrace();
			
				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (Exception e) {
					}
				}
				return row;
			}
			
	//삭제 메소드	
			public int pdsDelete(int num){
			Connection conn = null;
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			String query="DELETE FROM SAM_PDS WHERE NUM=?";
			int row = 0;
			
			try {
				conn = getConnection();//커넥션 풀 이용
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, num);
				row = pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {}
			}
			return row;
		}
			
		// Search 메소드
			
			   public List<PdsVO> pdsSearch(String option, String input) {
	               Connection conn = null;
	               PreparedStatement pstmt = null;
	               ResultSet rs = null;
	                  String query = "select * from sam_pds where "+option+" like'%"+input+"%'";
	               List<PdsVO> list = new ArrayList<PdsVO>();
	               PdsVO vo = null;
	               try {
	                  conn = getConnection();
	                  pstmt = conn.prepareStatement(query);
	                  //pstmt.setString(1, option);
	                  rs = pstmt.executeQuery();
	                  while(rs.next()) {
							vo = new PdsVO();
							vo.setNum(rs.getInt("num"));
							vo.setName(rs.getString("name"));
							vo.setPass(rs.getString("pass"));
							vo.setEmail(rs.getString("email"));
							vo.setSubject(rs.getString("subject"));
							vo.setContents(rs.getString("contents"));
							vo.setIndate(rs.getString("indate").substring(0,10));
							vo.setReadcnt(rs.getInt("readcnt"));
							vo.setFilename(rs.getString("filename"));
							list.add(vo);
						}
	               } catch (Exception e) {
	                  e.printStackTrace();
	               } finally {
	                  try {
	                     if (rs != null)
	                        rs.close();
	                     if (pstmt != null)
	                        pstmt.close();
	                     if (conn != null)
	                        conn.close();
	                  } catch (Exception e) {
	                  }
	               }
	               return list;
	            }
	   
	      
	      
	   }	
			

