package mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.model.classes.Aula;
import mvc.model.utils.JDBCUtils;

public class Login {
	public int validate(LoginBean loginBean) throws ClassNotFoundException {
		int status = 0;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from alumnos where dni = ? and contrasena = ? ")) {
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());
			
				PreparedStatement preparedStatement2 = connection
						.prepareStatement("select * from docentes where dni = ? and contrasena = ? ");
			preparedStatement2.setString(1, loginBean.getUsername());
			preparedStatement2.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			ResultSet rs2 = preparedStatement2.executeQuery();
			
			if(rs.next()) {
				status = 1;
			}
			if(rs2.next()) {
				status = 2;
			}

		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return status;
	}
	
	public LoginBean getUser(String username, int tipo) {
		
		LoginBean user=new LoginBean();
		user.setUsername(username);

		// using try-with-resources to avoid closing resources (boiler plate code)
		// Step 1: Establishing a Connection
		try (Connection connection = JDBCUtils.getConnection()){
			PreparedStatement preparedStatement = null;
				// Step 2:Create a statement using connection object
			switch(tipo){
			case 1:
				preparedStatement = connection.
				prepareStatement("select id,nombre,apellidos from alumnos where dni=?");
				preparedStatement.setString(1, username);
				break;
			case 2:
				preparedStatement = connection.
				prepareStatement("select id,nombre,apellidos from docentes where dni=?");
				preparedStatement.setString(1, username);
				break;
			default:
			}
			
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String nombre = rs.getString("nombre");
				String apellidos = rs.getString("apellidos");
				user.setId(id);
				user.setNombre(nombre);
				user.setApellidos(apellidos);
			}
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		
		return user;
	}
}
