package mvc.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.DAO;
import mvc.model.Note;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/formUpdate.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DAO dao = new DAO();
			
		
		Note note = new Note();
		note.setTitle(request.getParameter("title"));
		note.setTexto(request.getParameter("texto"));
		note.setCategoria(request.getParameter("categoria"));
		note.setDate(Date.valueOf(request.getParameter("data")));
		note.setUser(request.getParameter("user"));
		note.setId(Integer.valueOf(request.getParameter("id")));
		
		dao.update(note);
		
		List<Note> notes = dao.getLista();
		request.setAttribute("notes", notes);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
		dispatcher.forward(request, response);
		dao.close();
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
