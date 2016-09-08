package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;
import service.DoUserService;

/**
 * Servlet implementation class ShowPersonalServlet
 */
@WebServlet("/showPersonalServlet")
public class ShowPersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DoUserService dus = new DoUserService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPersonalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		
		HttpSession s = request.getSession();
		String username = (String)s.getAttribute("username");
		//System.out.println("username="+username);
		User user = dus.getUserInformation(username);
		//System.out.println(user.getPassword());
		request.setAttribute("personalInfo", user);
		rd = request.getRequestDispatcher("personalPage.jsp");
		rd.forward(request, response);
	}

}
