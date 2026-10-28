<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="joinwrap">
	 	<h2 align="center"> MyPage </h2>
	 	<form action="MyPageUpdate.do" method="post" name="mfrm">
	 		<table width="500" border="1">
	 		<c:forEach var="mdto" items="${alist }">
	 			<tr height="50">
	 				<td align="center" width="150">아이디</td>
	 				<td width="350">
	 					<input type="text" name="id" readonly="readonly" value="${mdto.id }">
	 				</td>
	 			</tr>
	 			<tr height="50">
	 				<td align="center" width="150">비밀번호</td>
	 				<td width="350">
	 					<input type="password" name="pass" placeholder="영문과 숫자만 입력하세요" >
	 				</td>
	 			</tr>
	 			<tr height="50">
	 				<td align="center" width="150">비밀번호 확인</td>
	 				<td width="350">
	 					<input type="password" name="passchk" placeholder="영문과 숫자만 입력하세요">
	 				</td>
	 			</tr>
	 			<tr height="50">
	 				<td align="center" width="150">Email</td>
	 				<td width="350">
	 					<input type="email" name="email" placeholder="@를 포함하여 입력하세요" value="${mdto.email }">
	 				</td>
	 			</tr>
	 			<tr height="50">
	 				<td align="center" width="150">전화번호</td>
	 				<td width="350">
	 					<input type="tel" name="tel" placeholder="010-0000-0000 형식으로 입력하세요" value="${mdto.tel }">
	 				</td>
	 			</tr>
	 			<tr height="50">
	 				<td align="center" width="150">관심분야</td>
	 				<td width="350">
	 					<input type="checkbox" name="hobby" value="캠핑" id="camping">
	 					<label for="camping">캠핑</label>&nbsp;&nbsp;
	 					<input type="checkbox" name="hobby" value="등산" id="mount">
	 					<label for="mount">등산</label>&nbsp;&nbsp;
	 					<input type="checkbox" name="hobby" value="영화" id="movie">
	 					<label for="movie">영화</label>&nbsp;&nbsp;
	 					<input type="checkbox" name="hobby" value="독서" id="book">
	 					<label for="book">독서</label>&nbsp;&nbsp;
	 				</td>
	 			</tr>
	 			<tr height="50">
	 				<td width="150" align="center">직업</td>
	 				<td width="350" align="center">
	 					<select name="job">
	 						<option value="교사" ${mdto.job=='교사'?'selected':'' }>교사</option>
	 						<option value="변호사" ${mdto.job=='변호사'?'selected':'' }>변호사</option>
	 						<option value="의사" ${mdto.job=='의사'?'selected':'' }>의사</option>
	 						<option value="기술사" ${mdto.job=='기술사'?'selected':'' }>기술사</option>
	 					</select>
	 				</td>
	 			</tr>
	 			<tr height="50">
	 				<td align="center" width="150">연령</td>
	 				<td width="350">
	 					<input type="radio" name="age" value="10대" id="teenage" ${mdto.age=='10대'?'checked':'' }>
	 					<label for="teenage">10대</label>&nbsp;&nbsp;
	 					<input type="radio" name="age" value="20대" id="twenty" ${mdto.age=='20대'?'checked':'' }>
	 					<label for="twenty">20대</label>&nbsp;&nbsp;
	 					<input type="radio" name="age" value="30대" id="thirty" ${mdto.age=='30대'?'checked':'' }>
	 					<label for="thirty">30대</label>&nbsp;&nbsp;
	 					<input type="radio" name="age" value="40대" id="forty" ${mdto.age=='40대'?'checked':'' }>
	 					<label for="forty">40대</label>&nbsp;&nbsp;
	 				</td>
	 			</tr>
	 			<tr height="50">
	 				<td align="center" width="150">남기는 말</td>
	 				<td width="350">
	 					<textarea rows="5" cols="40" name="info">${mdto.info }</textarea>
	 				</td>
	 			</tr>	
	 			<tr height="50">
	 				<td colspan="2" align="center">
						<input type="button" value="수정" onclick="checkform()"> 					
						<input type="reset" value="취소"> 					
	 				</td>
	 			</tr>
	 		</c:forEach>	
	 		</table>
	 	</form>
 </div>
	<script type="text/javascript">
		function checkform() {
			let f = document.mfrm;
			let hobCheck = false;
			
			for(let i=0; i<f.hobby.length; i++){
				if(f.hobby[i].checked){
					hobCheck = true;
					break;
				}
			}
			if(f.id.value == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			if(f.pass.value == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			if(f.passchk.value == ""){
				alert("비밀번호확인을 입력하세요.");
				return;
			}
			if(f.email.value == ""){
				alert("이메일를 입력하세요.");
				return;
			}
			if(f.tel.value == ""){
				alert("전화번호를 입력하세요.");
				return;
			}			
			if(!hobCheck){
				alert("관심분야를 선택하세요.");
				return;
			}
			if(f.job.value == ""){
				alert("직업을 선택하세요.");
				return;
			}
			if(f.age.value == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			if(f.info.value == ""){
				alert("남기는말을 입력하세요.");
				return;
			}
			f.submit();
		}
	</script>