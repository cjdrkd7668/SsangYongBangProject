package com.test.codestudy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/board/writeok.do")
public class WriteOk extends HttpServlet {

	//GET -> doGet //O
	//POST -> doPost //O
	//GET -> doPost //X -> 405 Error
	//POST -> doGet //X -> 405 Error
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		

		//1. 데이터 가져오기(subject, content)
		//2. DB 작업 > insert
		//3. 결과 처리
		
		HttpSession session = req.getSession();
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		
		//insert into tblBoard (seq, subject, content, regdate, readcount, mseq) values (seqBoard.nextVal, '게시판 테스트입니다.', '내용입니다.', default, default, 1);
		
		
		//String subject = req.getParameter("subject");
		//String content = req.getParameter("content");
		
		String subject = "";
		String content = "";
		String filename = "";
		String orgfilename = "";
		String mseq = (String)session.getAttribute("seq"); //로그인한 회원 번호 & 글쓴이 번호
		String reply = "";
		int parentThread = 0;
		int parentDepth = 0;
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("/files"),
										1024 * 1024 * 100,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
			System.out.println(req.getRealPath("/files"));

			subject = multi.getParameter("subject");
			content = multi.getParameter("content");
			filename = multi.getFilesystemName("attach");
			orgfilename = multi.getOriginalFileName("attach");
			reply = multi.getParameter("reply");
			
			//view.do -> 부모글의 thread값 + 부모글의 depth값
			parentThread = Integer.parseInt(multi.getParameter("thread"));
			parentDepth = Integer.parseInt(multi.getParameter("depth"));
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		//2.
/*
		
		계층형 게시판(=답변형 게시판)
		- thread, depth 컬럼 추가
		
		1. 새글 쓰기
			a. 게시물 중 가장 큰 thread를 찾아서 그 값에 +1000 한 값을 새글의 thread 값으로 사용한다.(단, 첫번째 글은 이전 글이 존재하지 않기 때문에 일단 1000을 넣는다.)
			b. 새글의 depth는 무조건 0을 넣는다.
		
		2. 답변글 쓰기
			a. 게시물의 모든 thread 값 중 답변글의 부모글 thread 값보다 작고, 이전 새글의 thread 값보다 큰 글들을 모두 찾아서 thread - 1 업데이터 한다.
			b. 답변글의 thread 값은 부모글의 thread - 1을 넣는다.
			c. 답변글의 depth 값은 부모글의 depth + 1을 넣는다.
				
		*/
		
		
		
		
		int thread = 0;
		int depth = 0;
		
		BoardDAO dao = new BoardDAO();
		
		if (reply.equals("n")) {
			
			//1. 새글 쓰기
			//a. 게시물 중 가장 큰 thread를 찾아서 그 값에 +1000 한 값을 새글의 thread 값으로 사용한다.(단, 첫번째 글은 이전 글이 존재하지 않기 때문에 일단 1000을 넣는다.)
			//b. 새글의 depth는 무조건 0을 넣는다.
			
			thread = dao.getThread();
			
			depth = 0;
					
		} else {
			
			//2. 답변글 쓰기
			//a. 게시물의 모든 thread 값 중 답변글의 부모글 thread 값보다 작고, 이전 새글의 thread 값보다 큰 글들을 모두 찾아서 thread - 1 업데이트 한다.
			//b. 답변글의 thread 값은 부모글의 thread - 1을 넣는다.
			//c. 답변글의 depth 값은 부모글의 depth + 1을 넣는다.
			
			//이전 새글의 thread
			int previousThread = (int)Math.floor((parentThread - 1) / 1000) * 1000;
			
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			map.put("parentThread", parentThread);
			map.put("previousThread", previousThread);
			
			dao.updateThead(map);
			
			thread = parentThread - 1;
			depth = parentDepth + 1;
			
		}
		
		
		BoardDTO dto = new BoardDTO();
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setMseq(mseq);
		
		dto.setFilename(filename);
		dto.setOrgfilename(orgfilename);
		
		
		dto.setThread(thread);
		dto.setDepth(depth);
		
		int result = dao.write(dto); //글쓰기
		
		
		
		if (result == 1) {
			//글쓰기 성공 -> 게시판 목록으로 이동
			resp.sendRedirect("/codestudy/board/list.do");
			
		} else {
			//글쓰기 실패 -> 경고 + 뒤로 가기
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html><body>");
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body></html>");
			
			writer.close();
		}
		
		

	}

}






















