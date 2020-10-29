package mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mvc.model.classes.Asignatura;
import mvc.model.classes.Aula;
import mvc.model.classes.Aula_Alumno;
import mvc.model.utils.JDBCUtils;

public class AsignaturaDAO {
	private static final String SELECT_JOINED_COURSES = "select cursos.nombre from `cursos` INNER JOIN `aulas` ON aulas.curso = cursos.id INNER JOIN `aula_alumno` ON aula_alumno.aula = aulas.id WHERE aula_alumno.alumno=?";
	private static final String SELECT_JOINED_CLASSES = "select aula from `aula_alumno` WHERE alumno=?";
	private static final String SELECT_ALL_COURSES = "SELECT aulas.id,cursos.id,cursos.nombre,aulas.descripcion,docentes.nombre,docentes.apellidos FROM `aulas` INNER JOIN `cursos` ON aulas.curso = cursos.id INNER JOIN `docentes` ON docentes.id = aulas.docente";
	private static final String OUT_COURSE = "delete from `aula_alumno` where alumno = ? and aula = ?;";
	private static final String JOIN_COURSE = "INSERT INTO aula_alumno (alumno, aula) VALUES (?, ?);";
	
	public AsignaturaDAO() {}
	
	
	public List<Aula> selectAllCursos(int Alumnoid) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Aula> asignaturas = new ArrayList<>();
		List<Integer> asignacion = selectJoinedClasses(Alumnoid);

		// Step 1: Establishing a Connection
		try (Connection connection = JDBCUtils.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COURSES);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("aulas.id");
				String descripcion = rs.getString("aulas.descripcion");
				String docente = rs.getString("docentes.nombre")+" "+rs.getString("docentes.apellidos");
				String asignatura = rs.getString("cursos.nombre");
				if(!asignacion.isEmpty()) {
					for(int i=0; i<asignacion.size(); i++) {
						if(id == asignacion.get(i)) {
							asignaturas.add(new Aula(id, descripcion, docente, asignatura));
						}
					}
				} else {
					
				}
			}
			
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return asignaturas;
	}
	
	public List<Aula> selectNoCursos(int Alumnoid) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Aula> asignaturas = new ArrayList<>();
		List<String> asignacion = selectJoinedCourses(Alumnoid);

		// Step 1: Establishing a Connection
		try (Connection connection = JDBCUtils.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COURSES);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("aulas.id");
				String descripcion = rs.getString("aulas.descripcion");
				String docente = rs.getString("docentes.nombre")+" "+rs.getString("docentes.apellidos");
				String asignatura = rs.getString("cursos.nombre");
				asignaturas.add(new Aula(id, descripcion, docente, asignatura));
			}
			
			if(!asignacion.isEmpty()) {
				for(int i=0; i<asignacion.size(); i++) {
					Iterator itr = asignaturas.iterator();
					String curso = asignacion.get(i);
					while (itr.hasNext())
			        {
			            Aula x = (Aula)itr.next();
			            if (x.getAsignatura().equalsIgnoreCase(curso)) {
			            	System.out.println(x.getAsignatura()+" es igual a "+curso);
			            	itr.remove();
			            }   
			        } 
				}
			}
			
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return asignaturas;
	}
	
	public List<String> selectJoinedCourses(int id) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<String> asignacion = new ArrayList<>();

		// Step 1: Establishing a Connection
		try (Connection connection = JDBCUtils.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_JOINED_COURSES);) {
			preparedStatement.setString(1, String.valueOf(id));
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String course = rs.getString("cursos.nombre");
				asignacion.add(course);
			}
			
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return asignacion;
	}
	
	public List<Integer> selectJoinedClasses(int id) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Integer> asignacion = new ArrayList<>();

		// Step 1: Establishing a Connection
		try (Connection connection = JDBCUtils.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_JOINED_CLASSES);) {
			preparedStatement.setString(1, String.valueOf(id));
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id_class = rs.getInt("aula");
				asignacion.add(id_class);
			}
			
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return asignacion;
	}
	
	public void joinAula(int id_alumno, int id_aula) throws SQLException{
		System.out.println(JOIN_COURSE);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(JOIN_COURSE)) {
			preparedStatement.setInt(1, id_alumno);
			preparedStatement.setInt(2, id_aula);
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}
	
	public boolean outAula(int id_alumno, int id_aula) throws SQLException{
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(OUT_COURSE);) {
			statement.setInt(1, id_alumno);
			statement.setInt(2, id_aula);
			System.out.println(statement);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
}
