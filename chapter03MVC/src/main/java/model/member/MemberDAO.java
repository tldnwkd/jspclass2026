package model.member;

import java.sql.*;
import java.util.ArrayList;

import DBPKG.Util;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	
	//---- 아래 부분은 sql문 작성 메소드들의 모임이다.
	// id만 추출하는 메소드를 작성한다.
	// 메소드이름 : getId()
	
	public String getID(String id) {
		String chkid = "";
		
		try {	
			con =Util.getConnection();
			String sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chkid = rs.getString("id");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
			}catch(Exception e){e.printStackTrace();}
		}	
		return chkid;
	}
	//---------------------------------------------------------------
	public void insertID(MemberDTO mdto) {
		try {	
			con =Util.getConnection();
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mdto.getId());
			pstmt.setString(2,mdto.getPass());
			pstmt.setString(3,mdto.getEmail());
			pstmt.setString(4,mdto.getTel()); 
			pstmt.setString(5,mdto.getHobby());
			pstmt.setString(6,mdto.getJob());
			pstmt.setString(7,mdto.getAge());
			pstmt.setString(8,mdto.getInfo());			
			
			pstmt.executeUpdate();						
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
			}catch(Exception e){e.printStackTrace();}
		}	
	}
	//-------------------------------------------------------
	//회원 전체의 정보를 추출하는 메소드 생성
	public ArrayList<MemberDTO> getallMember(){
		ArrayList<MemberDTO> m = new ArrayList<MemberDTO>();
		
		try {	
			con =Util.getConnection();
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setId(rs.getString(1));
				mdto.setPass(rs.getString(2));
				mdto.setEmail(rs.getString(3));
				mdto.setTel(rs.getString(4));
				mdto.setHobby(rs.getString(5));
				mdto.setJob(rs.getString(6));
				mdto.setAge(rs.getString(7));
				mdto.setInfo(rs.getString(8));
				
				m.add(mdto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
			}catch(Exception e){e.printStackTrace();}
		}	
		return m;
	}
	
}
