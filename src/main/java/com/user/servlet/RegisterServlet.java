package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.w3c.dom.UserDataHandler;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String confirmpassword = req.getParameter("confirmpassword");

			// System.out.println(name+" "+email+" "+password);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setConfirmpassword(confirmpassword);

			HttpSession session = req.getSession();

			if (password.equals(confirmpassword)) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f = dao.userRegister(us);
				if (f) {
					// System.out.println("User Register Success..");

					session.setAttribute("succMsg", "Registration Success..");
					resp.sendRedirect("register.jsp");
				} else {
					// System.out.println("Something Went Wrong..");
					session.setAttribute("failedMsg", "An account with this name and email already exists.");
					resp.sendRedirect("register.jsp");
				}
			} else {
				// System.out.println("Passwords do not match!");
				session.setAttribute("failedMsg", "Passwords do not match!");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
