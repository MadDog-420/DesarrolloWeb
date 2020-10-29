package mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

import mvc.model.classes.Alumno;
import mvc.model.utils.JDBCUtils;

public class AlumnoDao {
	public int registerAlumno(Alumno student) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "INSERT INTO users"
				+ "  (dni, nombre, apellidos, contrasena, nacimiento) VALUES "
				+ " (?, ?, ?, ?, ?);";

		int result = 0;
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, String.valueOf(student.getDni()));
			preparedStatement.setString(2, student.getNombre());
			preparedStatement.setString(3, student.getApellidos());
			preparedStatement.setString(4, student.getContrasena());
			preparedStatement.setDate(5, JDBCUtils.getSQLDate(student.getNacimiento()));

			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return result;
	}

}
