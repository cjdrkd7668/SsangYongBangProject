package com.test.codestudy.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax/ex05xmldata.do")
public class Ex05XmlData extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 단일값
		//2. 다중값
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/xml"); //*** XML
		
//		String name = "홍길동";
//		String age = "22";
//		String address = "서울시 강동구 천호동";
		
		/*
		
		<data>
			<name>홍길동</name>
			<age>22</age>
			<address>서울시</address>
		</data>
		
		*/

		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.list();
		
		/*
			<data>
				<user>
					<seq>10</seq>
					<name>홍길동</name>
					<id>hong</id>
					<email>hong@test.com</email>
				</user>
				<user>
					<seq>10</seq>
					<name>홍길동</name>
					<id>hong</id>
					<email>hong@test.com</email>
				</user>
				<user>
					<seq>10</seq>
					<name>홍길동</name>
					<id>hong</id>
					<email>hong@test.com</email>
				</user>
			</data>			
		*/
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		//writer.print("<data>" + name + "</data>");
		
//		writer.print("<data>");
//			writer.print("<name>");
//			writer.print(name);
//			writer.print("</name>");
//			writer.print("<age>");
//			writer.print(age);
//			writer.print("</age>");
//			writer.print("<address>");
//			writer.print(address);
//			writer.print("</address>");
//		writer.print("</data>");
		
		
		
		writer.print("<data>");
			for (MemberDTO dto : list) {
			writer.print("<user>");
				writer.print("<seq>");
				writer.print(dto.getSeq());
				writer.print("</seq>");
				writer.print("<name>");
				writer.print(dto.getName());
				writer.print("</name>");
				writer.print("<id>");
				writer.print(dto.getId());
				writer.print("</id>");
				writer.print("<email>");
				writer.print(dto.getEmail());
				writer.print("</email>");
			writer.print("</user>");
			}
		writer.print("</data>");
		
		
		
		
		
		writer.close();
		
	}

}



























