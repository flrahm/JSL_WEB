package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.GroupcodeVO;
import vo.ProductVO;

public class ProductDAOimpl extends DAOBase implements ProductDAO {

	private ProductDAOimpl() {
		// TODO Auto-generated constructor stub
	}

	private static ProductDAOimpl instance = new ProductDAOimpl();

	public static ProductDAOimpl getInstance() {
		return instance;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List<GroupcodeVO> select_gcode() {
		String sql = "select * from groupcode";

		List<GroupcodeVO> list = new ArrayList<GroupcodeVO>();
		GroupcodeVO gvo = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				gvo = new GroupcodeVO();
				gvo.setGcode(rs.getString(1));
				gvo.setGname(rs.getString(2));
				list.add(gvo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return list;
	}

	@Override
	public int insert_product(ProductVO pvo) {

		int insertOk = 0;

		String sql = "insert into product values (?,?,?,?,?,?,?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pvo.getCode());
			pstmt.setString(2, pvo.getPname());
			pstmt.setInt(3, pvo.getCost());
			pstmt.setInt(4, pvo.getPnum());
			pstmt.setInt(5, pvo.getJnum());
			pstmt.setInt(6, pvo.getSale());
			pstmt.setString(7, pvo.getGcode());

			insertOk = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return insertOk;
	}

	@Override
	public int update_product(ProductVO pvo) {
		int updateOk = 0;

		String sql = "update product set code=?,pname=?,cost=?,pnum=?,jnum=?,sale=?,gcode=? where code = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pvo.getCode());
			pstmt.setString(2, pvo.getPname());
			pstmt.setInt(3, pvo.getCost());
			pstmt.setInt(4, pvo.getPnum());
			pstmt.setInt(5, pvo.getJnum());
			pstmt.setInt(6, pvo.getSale());
			pstmt.setString(7, pvo.getGcode());
			pstmt.setString(8, pvo.getCode());

			updateOk = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return updateOk;
	}

	@Override
	public int delete_product(String code) {
		int deleteOk = 0;

		String sql = "delete product where code = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			deleteOk = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return deleteOk;
	}

	@Override
	public ProductVO selectByCode(String code) {
		String sql = "select * from product where code = ?";
		ProductVO pvo = new ProductVO();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pvo.setCode(code);
				pvo.setCost(rs.getInt("cost"));
				pvo.setGcode(rs.getString("gcode"));
				pvo.setPname(rs.getString("pname"));
				pvo.setJnum(rs.getInt("jnum"));
				pvo.setPnum(rs.getInt("pnum"));
				pvo.setSale(rs.getInt("sale"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return pvo;
	}

	@Override
	public List<String[]> select_ByProductPriority() {
		// TODO Auto-generated method stub

		String sql = "select pname,(pnum+(jnum*(-1))) as p from product where (jnum/pnum)*100 <= 20";

		List<String[]> list = new ArrayList<String[]>();
		String[] strArr = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				strArr = new String[2];
				strArr[0] = rs.getString(1);
				strArr[1] = rs.getString(2);
				list.add(strArr);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return list;
	}

	@Override
	public List<String[]> select_ByQuintityOfStuck() {
		String sql = "select gcode,sum(jnum) from PRODUCT group by gcode";

		List<String[]> list = new ArrayList<String[]>();
		String[] strArr = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				strArr = new String[2];
				strArr[0] = rs.getString(1);
				strArr[1] = rs.getString(2);
				list.add(strArr);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return list;
	}

	@Override
	public List<String[]> select_BySalesRank() {
		String sql = "select pname,(jnum*sale) as profit from product order by profit desc";

		List<String[]> list = new ArrayList<String[]>();
		String[] strArr = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				strArr = new String[2];
				strArr[0] = rs.getString(1);
				strArr[1] = rs.getString(2);
				list.add(strArr);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return list;

	}

	private void closeAll() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
