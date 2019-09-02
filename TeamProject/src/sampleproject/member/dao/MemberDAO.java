package sampleproject.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sampleproject.member.vo.SampleVO;
import sampleproject.member.vo.ZipVO;

public class MemberDAO {

	MemberDAO() {
	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection myConn = null;

		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		myConn = ds.getConnection();
		return myConn;
	}

	public int checkID(String userid) {

		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		try {
			String query = "select * from sam_member where userid = ?";
			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				row = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}
		return row;
	}

	public List<ZipVO> findZip(String dong) {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ZipVO> zList = new ArrayList<ZipVO>();
		ZipVO zVO = null;
		String addr = dong + "%";
		try {
			String query = "select * from zipcode where  dong like ?";
			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, addr);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				zVO = new ZipVO();
				zVO.setSido(rs.getString("sido"));
				zVO.setGugun(rs.getString("gugun"));
				zVO.setDong(rs.getString("dong"));
				zVO.setZipcode(rs.getString("zipcode"));
				zVO.setBunji(rs.getString("bunji"));
				zList.add(zVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}
		return zList;
	}

	public int insertMember(SampleVO vo) {

		Connection myConn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			String query = "insert into sam_member(idx,name,userid,passwd,gubun,zipcode,addr1,addr2,tel,email,job,intro,favorite,first_time,last_time)"
					+ " values (sam_member_seq_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?)";

			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getUserid());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setString(4, vo.getGubun());
			pstmt.setString(5, vo.getZipcode());
			pstmt.setString(6, vo.getAddr1());
			pstmt.setString(7, vo.getAddr2());
			pstmt.setString(8, vo.getTel());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getJob());
			pstmt.setString(11, vo.getIntro());
			pstmt.setString(12, vo.getFavorite());
			pstmt.setString(13, vo.getLast_time());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}

		return row;
	}

	public List<SampleVO> sList() {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SampleVO sVO = null;
		List<SampleVO> sList = new ArrayList<SampleVO>();
		try {
			String query = "select * from sam_member order by first_time desc";

			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sVO = new SampleVO();
				sVO.setIdx(rs.getInt("idx"));
				sVO.setName(rs.getString("name"));
				sVO.setUserid(rs.getString("userid"));
				sVO.setPasswd(rs.getString("passwd"));
				sVO.setGubun(rs.getString("gubun"));
				sVO.setAddr1(rs.getString("addr1"));
				sVO.setAddr2(rs.getString("addr2"));
				sVO.setEmail(rs.getString("email"));
				sVO.setFavorite(rs.getString("favorite"));
				sVO.setJob(rs.getString("job"));
				sVO.setTel(rs.getString("tel"));
				sVO.setIntro(rs.getString("intro"));
				sVO.setFirst_time(rs.getString("first_time"));
				sVO.setLast_time(rs.getString("last_time"));
				sList.add(sVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}
		return sList;
	}

	public int login(String id, String passwd) {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;

		try {
			String query = "select * from sam_member where userid =?";

			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("AAAAAAAAAAAAAAAAA");
				String check = rs.getString("passwd");
				if (passwd.equalsIgnoreCase(check)) {
					row = 1;
				} else {
					row = -1;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}
		System.out.println(row);
		return row;

	}

	public List<SampleVO> searchByName(String name) {

		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SampleVO sVO = null;
		List<SampleVO> sList = new ArrayList<SampleVO>();
		try {
			String query = "select * from sam_member where name like ?";

			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sVO = new SampleVO();
				sVO.setIdx(rs.getInt("idx"));
				sVO.setName(rs.getString("name"));
				sVO.setUserid(rs.getString("userid"));
				sVO.setTel(rs.getString("tel"));
				sVO.setFirst_time(rs.getString("first_time"));
				sVO.setLast_time(rs.getString("last_time"));
				sList.add(sVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}

		return sList;
	}

	public List<SampleVO> searchByAddr(String addr) {

		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SampleVO> sList = new ArrayList<SampleVO>();
		SampleVO sVO = null;
		try {
			String query = "select * from sam_member where addr1 like ?";
			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, "%" + addr + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sVO = new SampleVO();
				sVO.setIdx(rs.getInt("idx"));
				sVO.setName(rs.getString("name"));
				sVO.setUserid(rs.getString("userid"));
				sVO.setTel(rs.getString("tel"));
				sVO.setFirst_time(rs.getString("first_time"));
				sVO.setLast_time(rs.getString("last_time"));
				sList.add(sVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}
		return sList;
	}

	public int updateInfo(SampleVO vo) {

		Connection myConn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			String query = "update  sam_member set passwd =?, gubun =?, zipcode =?, addr1 = ?, addr2= ?, tel = ?, "
					+ "email = ?, job = ?, intro = ?,  favorite= ?";

			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, vo.getPasswd());
			pstmt.setString(2, vo.getGubun());
			pstmt.setString(3, vo.getZipcode());
			pstmt.setString(4, vo.getAddr1());
			pstmt.setString(5, vo.getAddr2());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getJob());
			pstmt.setString(9, vo.getIntro());
			pstmt.setString(10, vo.getFavorite());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}
		return row;
	}
	
	
	public String searchByID(String id) {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String name = "";

		try {
			String query = "select * from sam_member where userid =?";

			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}
		return name;

	}
	
	public int updateLastdate(String userid)  {
		
		Connection myConn = null;
		PreparedStatement pstmt = null;
		int row = 0;

		try {
			String query = "update sam_member set last_time = sysdate where userid = ?";

			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			pstmt.setString(1, userid);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {

				if (pstmt != null)
					pstmt.close();
				if (myConn != null)
					myConn.close();
			} catch (Exception e) {
			}
		}
		return row;
		
		
	}

}
