package model;

import java.util.List;

import vo.GroupcodeVO;
import vo.ProductVO;

public interface ProductDAO {

	int insert_product(ProductVO pvo);
	
	int update_product(ProductVO pvo);
	
	int delete_product(String code);
	
	ProductVO selectByCode(String code);
	
	List<String[]> select_ByProductPriority();
	
	List<String[]> select_BySalesRank();
	
	List<String[]> select_ByQuintityOfStuck();
	
	List<GroupcodeVO> select_gcode();
	
}
