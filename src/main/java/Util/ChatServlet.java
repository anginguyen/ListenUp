package Util;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter printWriter = response.getWriter();
		
		HttpSession httpSession = request.getSession(true);
		Cookie c[] = request.getCookies();
		String username = c[0].getValue();
		String temp = username.replaceAll("=", " ");
		username = "" + temp + "";

		httpSession.setAttribute("username", username);
		
		if(username != null) {
			
		}
	}
}
