package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Dao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	

	public Dao (){
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection
			 ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			
			System.out.println("DB연동성공");
			
		} catch( Exception e) {
			System.out.println("DB연동실패 : "+e);
		}
	
	}


	// 1. JOIN 메소드 생성
	public boolean join( String custno, String custname,
						 String phone, String address,
						 String joindate, String grade, String city) {
		
		try {
			String SQL = "insert into member_tbl_02 values(?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, custno );
			ps.setString(2, custname );
			ps.setString(3, phone );
			ps.setString(4, address );
			ps.setString(5, joindate );
			ps.setString(6, grade );
			ps.setString(7, city );
			ps.executeUpdate();
			
			System.out.println("회원 등록 성공");
			return true;
			
		} catch ( Exception e) { System.out.println(e); }

		return false;
	}
	
	
	// 2. 마지막 전호 +1
	public int lastNo() {
		try {
			String SQL = "select max(custno) from member_tbl_02";
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			if( rs.next() ) return rs.getInt(1)+1;
			
		} catch(Exception e) { System.out.println(e);}
		
		return 0;
	}
	
	
	// 3. 회원 정보 모두 출력
	public List< Map< String, String >> getMemberList(){
		try {
			String SQL = "select * from member_tbl_02";
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			
			List< Map< String, String >> list = new ArrayList();

			while(rs.next()) {
				Map<String, String> map = new HashMap();
				map.put("custno", rs.getString(1));
				map.put("custname", rs.getString(2));
				map.put("phone", rs.getString(3));
				map.put("address", rs.getString(4));
				map.put("joindate", rs.getString(5));
				map.put("grade", rs.getString(6));
				map.put("city", rs.getString(7));
				list.add(map);
			}
			System.out.println("list => " +list);
			return list;
			
		} catch(Exception e) { System.out.println(e);}
		
		return null;
	}
	
	// 4. 매출 조회
	public List<Map<String, String>> getMoney(){
	      
		List<Map<String, String> > list = new ArrayList<>();
		      
		try {
		    String sql = "select m.custno as custno ,"
		   + " m.custname as custname ,"
		   + " m.grade as grade ,"
		   + " sum( mo.price ) as sum"
		   + " from money_tbl_02 mo inner join member_tbl_02 m"
		   + " on mo.custno = m.custno"
		   + " group by ( m.custno , m.custname , m.grade )"
		   + " order by sum( mo.price ) desc";
		 
		 ps= conn.prepareStatement(sql);
		 
		 rs = ps.executeQuery();
		 
		 while (rs.next()) {
	    
		    Map<String, String> map = new HashMap<>();
		    map.put( "custno" , rs.getString("custno") );
			map.put( "custname" , rs.getString("custname") );
			map.put( "grade" , rs.getString("grade") );
			map.put( "sum" , rs.getString("sum") );
	            
	            list.add(map);
	         }
	         
	      } catch (Exception e) {
	         System.out.println(e);
	      }
	      
	      return list;
	}
	
	// 5. 개별조회
	public Map<String,String> getMember( int custno ) {
		
		try {
			String SQL = " select * from member_tbl_02 where custno = ?"; 
			
			ps = conn.prepareStatement(SQL);
			ps.setInt( 1, custno );
			rs = ps.executeQuery();
			if( rs.next() ) {
				Map<String,String> r = new HashMap<>();
				r.put("custno", rs.getString("custno"));
				r.put("custname", rs.getString("custname"));
				r.put("phone", rs.getString("phone"));
				r.put("address", rs.getString("address"));
				r.put("joindate", rs.getString("joindate"));
				r.put("grade", rs.getString("grade"));
				r.put("city", rs.getString("city"));
				return r;
			}
			
		} catch( Exception e) { System.out.println(e);}

		return null;
		
	}
	
	// 6. 회원정보 수정 
	public boolean update( String custno, String custname,
			 String phone, String address,
			 String joindate, String grade, String city) {
		System.out.println(" 업데이트 들어옴 !! ");
		try {
			String SQL = 
			"update member_tbl_02 set custname =  ?, phone = ?," +
			"address = ?, joindate = ?, grade = ?, city = ? where custno = ?";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, custname );
			ps.setString(2, phone );
			ps.setString(3, address );
			ps.setString(4, joindate );
			ps.setString(5, grade );
			ps.setString(6, city );
			ps.setString(7, custno );
			System.out.println(SQL);
			System.out.println("SQL 성공");
			ps.executeUpdate();
			
			System.out.println("회원 수정 성공");
			return true;
			
		} catch ( Exception e) { System.out.println(e); }

		return false;
	}
	
	
	
	
	
	
	
	
	
	
}












