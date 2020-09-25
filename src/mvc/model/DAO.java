package mvc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DAO {
	private Connection connection = null;
	
	public DAO () throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost/Projeto1", "root", "alexehulk");
	}
	
	public List<Note> getLista() throws SQLException {
		List<Note> notes = new ArrayList<Note>();
		PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Notes");
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Note note = new Note();
			note.setId(rs.getInt("id"));
			note.setTitle(rs.getNString("title"));
			note.setTexto(rs.getNString("texto"));
			note.setCategoria(rs.getNString("categoria"));
			note.setDate(rs.getDate("data"));
			note.setUser(rs.getNString("user"));
			notes.add(note);
		}
		
		rs.close();
		stmt.close();
		return notes;
	}
	
	public void close() throws SQLException {
		connection.close();
	}
	
	public void adiciona(Note note) throws SQLException {
		String sql = "INSERT INTO Notes (title, texto, categoria, data, user ) VALUES (?,?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setNString(1, note.getTitle());
		stmt.setNString(2, note.getTexto());
		stmt.setNString(3, note.getCategoria());
		stmt.setDate(4, note.getDate());
		stmt.setNString(5, note.getUser());
		stmt.execute();
		stmt.close();
	}
	
	public void update(Note note) throws SQLException {
		String sql = "UPDATE Notes SET title=?, texto=?, categoria=?, data=?, user=? WHERE id=?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setNString(1, note.getTitle());
		stmt.setNString(2, note.getTexto());
		stmt.setNString(3, note.getCategoria());
		stmt.setDate(4, note.getDate());
		stmt.setNString(5, note.getUser());
		stmt.setInt(6, note.getId());
		stmt.execute();
		stmt.close();
	}
	
	public void deleta(Integer id) throws SQLException {
		String sql = "DELETE FROM Notes WHERE id=?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setInt(1, id);
		stmt.execute();
		stmt.close();
	}
	
	public boolean login(User user) throws SQLException {
		boolean didLogin = false;
		String sql = "SELECT COUNT(*) FROM User WHERE username=? AND password=? LIMIT 1";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setNString(1, user.getUsername());
		stmt.setNString(2, user.getPassword());
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) != 0) {
				didLogin = true;
			}
		}
		rs.close();
		stmt.close();
		return didLogin;			 
	}
	
	public void cadastro(User user) throws SQLException {
		String sql = "INSERT INTO User (username, password) VALUES (?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setNString(1, user.getUsername());
		stmt.setNString(2, user.getPassword());
		stmt.execute();
		stmt.close();
	}
	
	public List<Note> pesquisa(String string) throws SQLException {
		PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Notes WHERE title LIKE '%"+string+"%' or texto LIKE '%"+string+"%'");
		ResultSet rs = stmt.executeQuery();
		List<Note> results = new ArrayList<Note>();
		while (rs.next()) {
			Note note = new Note();
			note.setId(rs.getInt("id"));
			note.setTitle(rs.getString("title"));
			note.setTexto(rs.getString("texto"));
			note.setCategoria(rs.getString("categoria"));
			note.setDate(rs.getDate("data"));
			note.setUser(rs.getNString("user"));
			results.add(note);
			}
		
		rs.close();
		stmt.close();
		
		return results;
		
	}
	

}
