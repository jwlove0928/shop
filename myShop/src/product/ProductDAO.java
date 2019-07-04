package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ProductDAO {

	Connection con;
	
	DBConnectionMgr mgr;
	
	public int insert(ProductDTO dto) {
		
		int res = 0;
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/myShop";
			String user = "root";
			String password = "1234";
			
			con = mgr.getConnection();
			
			String sql = "insert into Product values(?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getPrice());
			
			res = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			mgr.freeConnection(con);
		}
		return res;
	}
	
	public int update(ProductDTO dto) {
		
		int res = 0;
		mgr = DBConnectionMgr.getInstance();
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/myShop";
			String user = "root";
			String password = "1234";
			
			con = mgr.getConnection();
			
			String sql = "update Product set content=?, price=? where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getContent());
			ps.setString(2, dto.getPrice());
			ps.setString(3, dto.getId());
			
			res = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			mgr.freeConnection(con);
		}
		return res;
	}
	
	public int delete(ProductDTO dto) {
		
		int res = 0;
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/myShop";
			String user = "root";
			String password = "1234";
			
			con = mgr.getConnection();
			
			String sql = "delete from Product where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getId());
			
			res = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			mgr.freeConnection(con);
		}
		return res;
	}
	
	public ProductDTO select(String inputId) {
		
		String id = null;
		String title = null;
		String content = null;
		String price = null;
		
		ProductDTO dto = null;
		
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/myShop";
			String user = "root";
			String password = "1234";
			
			con = mgr.getConnection();
			
			String sql = "select * from Product where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, inputId);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new ProductDTO();
				id = rs.getString("id");
				title = rs.getString("title");
				content = rs.getString("content");
				price = rs.getString("price");
				dto.setId(id);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setPrice(price);
			}else {
				dto.setId(id);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setPrice(price);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			mgr.freeConnection(con);
		}
		return dto;
	}
	
	public ArrayList<ProductDTO> selectAll(ProductDTO dto) {
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		String id = null;
		String title = null;
		String content = null;
		String price = null;
		
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/myShop";
			String user = "root";
			String password = "1234";
			
			con = mgr.getConnection();
			
			String sql = "select * from Product";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPrice(rs.getString(4));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			mgr.freeConnection(con);
		}
		return list;
	}
}
