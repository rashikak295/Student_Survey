//Author: Rashika Koul
//SWE 642 : Homework 4
//The servlet acts as a front controller in the MVC implementation and receives and 
//handles all requests from the client, performs business logic via business delegate 
//classes (which may return JavaBean objects), stores the beans into a session object, 
//and then forwards the request to appropriate JSP to present the data to the user using 
//a RequestDispatcher object
package survey;

import java.io.IOException;
import java.util.List;
import java.lang.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String studentID = request.getParameter("studentID");
			StudentDAO studentDAO = new StudentDAO();
			StudentBean studentBean = studentDAO.getByID(studentID);
			
			HttpSession session = request.getSession();
			session.setAttribute("studentBean", studentBean);
			
			RequestDispatcher dispatcher;
			if (studentBean != null) {
				dispatcher = request.getRequestDispatcher("./student.jsp");
				dispatcher.forward(request, response);

			} else {
				dispatcher = request.getRequestDispatcher("./noSuchStudent.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			System.err.println("Exception occured.");
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			response.setHeader("Access-Control-Allow-Origin", "http://mason.gmu.edu");
			
			String data = request.getParameter("data").toString();
			DataProcessor dataProcessor = new DataProcessor();
			DataBean dataBean = dataProcessor.processData(data);
			
			StudentBean studentBean = new StudentBean();
			studentBean.setStudentID(request.getParameter("studentID"));
			studentBean.setUserName(request.getParameter("username"));
			studentBean.setAddress(request.getParameter("address"));
			studentBean.setZipcode(request.getParameter("zipcode"));
			studentBean.setCity(request.getParameter("city"));
			studentBean.setState(request.getParameter("state"));
			studentBean.setEmail(request.getParameter("email"));
			studentBean.setURL(request.getParameter("url"));
			studentBean.setPhone(request.getParameter("telephone"));
			studentBean.setSurveyDate(request.getParameter("surveyDate"));
			studentBean.setInterest(request.getParameter("interest"));
			studentBean.setGradMonth(request.getParameter("grad_month"));
			studentBean.setGradYear(request.getParameter("grad_year"));
			studentBean.setComments(request.getParameter("comments"));
			studentBean.setRecommend(request.getParameter("recommend"));
			studentBean.setLikes(String.join(", ", request.getParameterValues("likes")));
			
			StudentDAO sDAO = new StudentDAO();
			boolean saved = sDAO.save(studentBean);
			List<String> studentIDList = sDAO.getIDList();
			
			HttpSession session = request.getSession();
			session.setAttribute("dataBean", dataBean);
			session.setAttribute("studentIDList", studentIDList);

			RequestDispatcher dispatcher;
			if (dataBean.getMean() >= 90) {
				dispatcher = request.getRequestDispatcher("./winnerAcknowledgement.jsp");
				dispatcher.forward(request, response);
			} else {
				dispatcher = request.getRequestDispatcher("./simpleAcknowledgement.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			System.err.println("Exception occured.");
			e.printStackTrace();
		}
	}
}
