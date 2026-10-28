package control.login;

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


@WebServlet("/loginProc.do")
public class loginProc extends HttpServlet {
          
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("utf-8");
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(mdao.loginCheck(id, pass)) {
//			로그인에 성공하면 세션에 ID를 저장해야한다.
//			jsp페이지에서는 세션을 인스턴스 없이 사용하지만
//			Servlet은 세션을 인스턴스로 꺼내와야 사용할 수 있다.
			HttpSession session = request.getSession(); //세션 생성
			session.setAttribute("id", id);
			
			session.setMaxInactiveInterval(60*30); //초:60 *30이라 30분임
			response.sendRedirect("index.jsp");
		}else {
			request.setAttribute("msg", "아이디와 패스워드를 확인하세요.");
			RequestDispatcher rd = request.getRequestDispatcher("/login/loginErr.jsp");
			rd.forward(request, response);
		}	
	}
	
}
