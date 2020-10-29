package mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.model.classes.Aula;
import mvc.model.classes.Material;
import mvc.model.classes.TareaSet;
import mvc.model.classes.TareaUp;
import mvc.model.utils.JDBCUtils;

public class ClassroomDao {
	
	private static final String SELECT_SECTION_ID = "select cursos.nombre,aulas.descripcion from `aulas` INNER JOIN `cursos` ON aulas.curso = cursos.id WHERE aulas.id = ?";
	private static final String SELECT_MATERIAL = "select * from `materiales` WHERE aula = ?";
	private static final String SELECT_TASK = "select * from `tareasset` WHERE aula = ?";
	private static final String UP_TASK = "INSERT INTO `tareasup` (id,tareasset,alumno,url) VALUES (NULL, ?, ?, ?);";
	
	public ClassroomDao() {}
	
	public Aula selectAulaById(int id) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		Aula aula = new Aula();

		// Step 1: Establishing a Connection
		try (Connection connection = JDBCUtils.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SECTION_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String curso = rs.getString("cursos.nombre");
				String descripcion = rs.getString("aulas.descripcion");
				aula.setId(id);
				aula.setAsignatura(curso);
				aula.setDescripcion(descripcion);
			}
			
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		
		return aula;
	
	}
	
	public List<Material> selectMaterials(int id) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Material> materiales = new ArrayList<>();

		// Step 1: Establishing a Connection
		try (Connection connection = JDBCUtils.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MATERIAL);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id_material = rs.getInt("id");
				int id_aula = rs.getInt("aula");
				String titulo = rs.getString("titulo");
				String descripcion = rs.getString("descripcion");
				String url = rs.getString("url");
				materiales.add(new Material(id_material,id_aula,titulo,descripcion,url));
			}
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		
		return materiales;
	
	}
	
	public List<TareaSet> selectTasks(int id) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<TareaSet> tareas_set = new ArrayList<>();

		// Step 1: Establishing a Connection
		try (Connection connection = JDBCUtils.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TASK);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id_tarea = rs.getInt("id");
				int id_aula = rs.getInt("aula");
				String titulo = rs.getString("titulo");
				String descripcion = rs.getString("descripcion");
				tareas_set.add(new TareaSet(id_tarea,id_aula,titulo,descripcion));
			}
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		
		return tareas_set;
	}
	
	public int upTask(TareaUp tarea_al) throws ClassNotFoundException {

		int result = 0;
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(UP_TASK)) {
			preparedStatement.setInt(1, tarea_al.getTareasset());
			preparedStatement.setInt(2, tarea_al.getAlumno());
			preparedStatement.setString(3, tarea_al.getUrl());

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
