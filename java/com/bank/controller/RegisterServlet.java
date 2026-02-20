package com.bank.controller;

import java.io.IOException;

import com.bank.dao.AccountDAO;
import com.bank.dao.UserDAO;
import com.bank.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/register")
public class RegisterServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name =req.getParameter("name");
		String email=req.getParameter("email");
		String password =req.getParameter("password");
		
		User user=new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		
		UserDAO dao=new UserDAO();
		
		
		if (dao.emailExists(email)) {
		    resp.getWriter().println("Email already registered. Try another.");
		    return;
		}
		
		if (dao.registerUser(user)) {

		    // get user after registration
		    User loggedUser = dao.Login(email, password);

		    // create account
		    AccountDAO accDao = new AccountDAO();
		    accDao.createAccount(loggedUser.getUserId());

		    resp.sendRedirect("login.jsp");
		}
		
		if(dao.registerUser(user)) {
			resp.sendRedirect("Login.jsp");
		}else {
			resp.getWriter().println("Registeration Failed");
		}
	}

}
