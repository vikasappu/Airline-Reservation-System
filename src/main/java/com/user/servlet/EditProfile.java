package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/editprofile")
public class EditProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);

			HttpSession session = req.getSession();
			if (f) {

				boolean f2 = dao.updateprofile(us);
				if (f2) {
					session.setAttribute("succMsg", "Profile Updated Successfully..");
					resp.sendRedirect("editProfile.jsp");
				} else {
					session.setAttribute("failedMsg", "Something Went Wrong On Server.");
					resp.sendRedirect("editProfile.jsp");
				}

			} else {
				session.setAttribute("failedMsg", "Your Password is incorrect");
				resp.sendRedirect("editProfile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
