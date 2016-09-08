package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.DoUserService;


public class CheckUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DoUserService cku = new DoUserService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserServlet() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String returnUrl = request.getParameter("returnUrl");
		String verify = request.getParameter("verify");
		System.out.println("verify="+verify);
		if(request.getSession().getAttribute("vcode")!=null){
			System.out.println("vcode="+request.getSession().getAttribute("vcode").toString());
			if(!verify.equals((String)request.getSession().getAttribute("vcode"))){
				request.setAttribute("msg", "verifyFailed");
				rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}else{
				if(username == null || password == null){
					request.setAttribute("msg", "username or password is empty.");
					rd = request.getRequestDispatcher("error.jsp");
					rd.forward(request, response);
				}else{
					User user = new User();
					user.setUsername(username);
					user.setPassword(password);
					boolean bool = cku.check(user);
					//System.out.println("Username:"+username+"--VerifyState:"+bool);
					if(bool){
						//设置session 存储用户名
						request.getSession().setAttribute("username",username);
						request.getSession().setAttribute("login_flag","login_success");
						//跳转
						if(returnUrl!=null){//之前有页面
							rd=request.getRequestDispatcher(returnUrl);
							rd.forward(request, response);
						}else{//之前什么也没打开过
							rd=request.getRequestDispatcher("index.jsp");
							rd.forward(request, response);
						}
					}else{
						request.getSession().setAttribute("login_flag", "login_error");
						request.setAttribute("msg", "username or password error");
						rd = request.getRequestDispatcher("error.jsp");
						rd.forward(request, response);
					}
				}
			}
		}else{
			request.setAttribute("msg", "验证码无法获取，请联系网站管理员");
			rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

}
