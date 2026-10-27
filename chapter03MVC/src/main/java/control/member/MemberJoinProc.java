package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;


@WebServlet("/MProc.do")
public class MemberJoinProc extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqpro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqpro(request, response);
	}
	
	protected void reqpro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 작성순서
		// 1) 인코딩 하기
		// 2) input입력받은 값 request.getParameter() 가져오기
		// 3) MemberDTO 인스턴스 하기
		// 4) MemberDAO 인스턴스 하기
		// 5) 예외처리하기 (중복아이디 체크, pass=passchk...)
		// 6) request.setAttribute("변수작명",값) 저장
		// 7) requestDispatcher 객체로 jsp파일로 forward하기
		
		request.setCharacterEncoding("utf-8");
		
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		
		// DAO의 getId()메소드를 추출
		String id = request.getParameter("id");
		mdto.setId(id);
		String chkid = mdao.getID(id);
		
		
		String pass = request.getParameter("pass");		
		String passchk = request.getParameter("passchk");		
				
		// mdto 가방에 input에서 받은 값을 꺼내어 담는다.
		
		mdto.setPass(pass);
		mdto.setPasschk(passchk);
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		
		// hobby는 체크박스이므로 동시에 여러개가 선택되어 저장되도록 코드작성해야함
		String [] arr = request.getParameterValues("hobby"); 
		String oneHobby ="";
		//확장 for문 이용하여 배열의 값 출력
		for(String hob:arr) {
			oneHobby += hob+" ";
		}
		mdto.setHobby(oneHobby);		
		mdto.setJob(request.getParameter("job"));
		mdto.setAge(request.getParameter("age"));
		mdto.setInfo(request.getParameter("info"));
		
		// 예외처리 중복아이디 체크 => 현재 체크 불가능, 이유는 현재 DB연결 안되어있음
		
		// pass = passchk가 같으면 member테이블에 insert해야함
		
		
		System.out.println("입력 : ["+id+"], 조회 결과 :["+chkid+"]");
		// pass가 틀리면 비밀번호를 확인하세요 
		String jspAddress = "";		
		if(chkid.equals(id)) {
			request.setAttribute("msgid", "이미 존재하는 아이디 입니다.");
			jspAddress = "/member/joiiderr.jsp";
		}else if(pass.equals(passchk)) {
			// mdao의 insert 쿼리문
			mdao.insertID(mdto);
			// 회원전체 목록을 출력하는 MemberList생성할 예정
			// MemberJoinProc 컨트롤러에서 ->MemberListCon.do 컨트롤러로 이동
			jspAddress = "MemberListCon.do";
		}else {
			request.setAttribute("msg", "비밀번호를 확인하세요.");
			jspAddress = "/member/joinerr.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(jspAddress);
		rd.forward(request, response);		
	}
}
