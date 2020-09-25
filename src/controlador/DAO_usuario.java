package controlador;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conexion.Conexion;
import modelo.Usuario;

public class DAO_usuario {

	private Conexion con;

	public DAO_usuario(String jdbcURL, String jdbcUserName, String jdbcPassword) throws SQLException {
		con = new Conexion(jdbcURL, jdbcUserName, jdbcPassword);

	}

//registar un usuario
	public boolean registrar(Usuario u) {
		boolean estado = false;
		Statement stm;

		String sql = "INSERT INTO usuarios VALUES (NULL,'" + u.getNombre() + "','" + u.getApellidos() + "','"
				+ u.getEmail() + "','" + u.getNombreUsuario() + "','" + u.getContrasena() + "')";

		try {
			con.connection();
			stm = con.getJdbcConnection().createStatement();
			stm.executeUpdate(sql);
			estado = true;
			stm.close();
			con.discconect();
		} catch (SQLException e) {
			estado = false;
			e.printStackTrace();
		}
		return estado;
	}

	public boolean editar(Usuario u) {
		boolean estado = false;
		Statement stm;

		String sql = "UPDATE usuarios SET " + "nombre='" + u.getNombre() + "'," + "apellidos='" + u.getApellidos()
				+ "'," + "email='" + u.getEmail() + "'," + "usuario='" + u.getNombreUsuario() + "'," + "contrasena='"
				+ u.getContrasena() + "' WHERE id=" + u.getId();

		try {
			con.connection();
			stm = con.getJdbcConnection().createStatement();
			stm.execute(sql);
			estado = true;
			stm.close();
			con.discconect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			estado = false;
			e.printStackTrace();
		}
		return estado;
	}

	public boolean eliminar(int id) {
		boolean estado = false;
		Statement stm;

		String sql = "DELETE FROM  usuarios WHERE id=" + id;

		try {
			con.connection();
			stm = con.getJdbcConnection().createStatement();
			stm.executeUpdate(sql);
			estado = true;
			stm.close();
			con.discconect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			estado = false;
			e.printStackTrace();
		}
		return estado;
	}

	@SuppressWarnings("null")
	public List<Usuario> obtenerUsuarios() {
		List<Usuario> listaUsuarios = new ArrayList<Usuario>();
		Statement stm;
		ResultSet res = null;
		Usuario u;

		String sql = "SELECT * FROM  usuarios";

		try {
			con.connection();
			stm = con.getJdbcConnection().createStatement();
			res = stm.executeQuery(sql);

			while (res.next()) {
				u = new Usuario(res.getInt("id"), res.getString("nombre"), res.getString("apellidos"),
						res.getString("email"), res.getString("usuario"), res.getString("contrasena"));
				listaUsuarios.add(u);
			}

			stm.close();
			con.discconect();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return listaUsuarios ;
	}

	public void obtenerUsuario(int id) {
		Statement stm;
		ResultSet res = null;

		String sql = "SELECT * FROM  usuarios WHERE id=" + id;

		try {
			con.connection();
			stm = con.getJdbcConnection().createStatement();
			res = stm.executeQuery(sql);
			Usuario u;

			if (res.next()) {
				u = new Usuario(res.getInt("id"), res.getString("nombre"), res.getString("apellidos"),
						res.getString("email"), res.getString("usuario"), res.getString("contrasena"));
				System.out.println(u);
			}
			stm.close();
			con.discconect();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
}