package com.bank.controller;

import java.io.IOException;

import com.bank.dao.AccountDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String fromAcc=req.getParameter("fromAcc");
		String toAcc=req.getParameter("toAcc");
		double amount =Double.parseDouble(req.getParameter("amount"));
		
		
		AccountDAO dao = new AccountDAO();
		boolean status=dao.transfer(fromAcc, toAcc, amount);
		
		if(status) {
			resp.sendRedirect("dashboard.jsp");
		}else {
			resp.getWriter().println("Transfer Is Failed");
		}
	}

}
