package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;


@WebServlet("/MyPage.do")
public class MyPage extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
				
		HttpSession session = request.getSession(false);
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		String id = (String)session.getAttribute("id");
		if(session != null) {
			mdto= mdao.mypage(id);
		}
		request.setAttribute("mdto",mdto);
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/Mypage.jsp");
		rd.forward(request, response); //select문을 제외한 나머지 쿼리문 작성시 F5로 새로고침 시 화면이 다시 재요청이 되는 현상이 발생한다.
		
	}
}
