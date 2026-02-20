package com.bank.controller;

import java.io.IOException;

import com.bank.dao.AccountDAO;
import com.bank.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		double amount=Double.parseDouble(req.getParameter("amount"));
		
		HttpSession session =req.getSession();
		User user =(User) session.getAttribute("user");
		
		AccountDAO dao =new AccountDAO();
		boolean status=dao.withdraw(user.getUserId(), amount);
		
		
		if(status) {
			resp.sendRedirect("dashboard.jsp");
			
		}else {
			resp.getWriter().println("Insufficient Balance");
		}
	}

}
