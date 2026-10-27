package control.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;


@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqpro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqpro(request, response);
	}
	
	protected void reqpro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 여러명의 자료를 화면에 출력하기 위해 DB에서 Select 꺼내온다.
		// ArrayList<> 이용하여 select로 추출한 모든 회원의 정보를 담는다.
		MemberDAO mdao = new MemberDAO();
		
		ArrayList<MemberDTO> allMember = mdao.getallMember();
		// request.setAttribute() 객체에 담아 디스패쳐 할 예정임
		request.setAttribute("alist", allMember);
		// jsp파일로 디스패쳐 하기
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/MemberList.jsp");
		rd.forward(request, response);
	}

}
