package com.test.sist.house;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sist.house.dao.HouseDAO;
import com.test.sist.house.dto.HouseDTO;

@WebServlet("/house/searchjsondata.do")
public class SearchJsonData extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");

		PrintWriter writer = response.getWriter();
		String where = request.getParameter("whereSearch");
		
		HouseDAO dao = new HouseDAO();
		ArrayList<HouseDTO> list = dao.searchHouse(where);
		
		String temp = "";
		String priceTag = "";
		
		temp += "[";
			for(HouseDTO dto : list) {	
				priceTag = dto.getDtype() + " " + dto.getPrice() + (dto.getDtype().equals("월세") ? "/" + dto.getRent() : "") + "(만원)";

				temp += "{";
				temp += String.format("\"seq\":\"%s\",", dto.getSeq());
				temp += String.format("\"address\":\"%s\",", dto.getAddress());
				temp += String.format("\"priceTag\":\"%s\",", priceTag);
				temp += String.format("\"bType\":\"%s\"", dto.getBtype());
				temp += "}";
				temp += ",";
			}
		
		temp = temp.substring(0, temp.length()-1);
		temp += "]";
		
		//조건이 없을 경우, [{"seq" : "0"}] 을 반환한다.
		if (temp.equals("]")) {
			temp = "[{\"seq\":\"0\"}]";
		}
		
		writer.print(temp);
		
		writer.close();
		
	}

}
