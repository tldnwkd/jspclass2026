package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/MyPageUpdate.do")
public class MyPageUpdate extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		
		String pass = request.getParameter("pass");		
		String passchk = request.getParameter("passchk");		
				
		// mdto 가방에 input에서 받은 값을 꺼내어 담는다.
			
		String [] arr = request.getParameterValues("hobby"); 
		String oneHobby ="";
		//확장 for문 이용하여 배열의 값 출력
		for(String hob:arr) {
			oneHobby += hob+" ";
		}
		
		
		String jspAddress = "";
		if(pass!=null &&passchk!=null) {
			if(pass.equals(passchk)) {
				mdto.setId(request.getParameter("id"));
				mdto.setPass(pass);
				mdto.setPasschk(passchk);
				mdto.setEmail(request.getParameter("email"));
				mdto.setTel(request.getParameter("tel"));
				mdto.setHobby(oneHobby);		
				mdto.setJob(request.getParameter("job"));
				mdto.setAge(request.getParameter("age"));
				mdto.setInfo(request.getParameter("info"));
				mdao.updateID(mdto);
				jspAddress = "MyPage.do?result=ok";
			}else {
				jspAddress = "MyPage.do?result=passfail";
			}
			response.sendRedirect(jspAddress);	
		}
	}
}
