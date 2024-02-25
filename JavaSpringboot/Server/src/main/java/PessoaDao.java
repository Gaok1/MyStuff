/**
 * PessoaDao
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;




public class PessoaDao {

    private static Connection conn;

    PessoaDao() {
        iniciar();
    }


    public static void iniciar(){
        try {
            // Estabelece a conexão com o banco de dados
            conn = getConnection();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void finalizar(){
        try{
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    private static Connection getConnection() throws SQLException {

		String url = "jdbc:postgresql://" + "localhost" + ":" + "5432" +"/" + "PessoaDataBase";
		String username = "ti2cc";
		String password = "ti@cc";

		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("Conexão efetuada com o postgres!");
		} catch (ClassNotFoundException e) { 
			System.err.println("Conexão NÃO efetuada com o postgres -- Driver não encontrado -- " + e.getMessage());
		} catch (SQLException e) {
			System.err.println("Conexão NÃO efetuada com o postgres -- " + e.getMessage());
		}
        
        return conn;
    }


    public static boolean inserir(Pessoa p) {
        String sql = "INSERT INTO pessoa (id, nome, foto, email) VALUES (?, ?, ?, ?)";
        try {
            // Preparando a instrução SQL
            PreparedStatement ps = conn.prepareStatement(sql);
            
            // Definindo os valores para os parâmetros
            ps.setInt(1, p.getId());
            ps.setString(2, p.getNome());
            ps.setBytes(3, p.getFoto());
            ps.setString(4, p.getEmail());
            
            // Verificando se a inserção foi bem-sucedida
            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean delete(int id){
        String sql = "DELETE FROM pessoa WHERE id = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            if(ps.executeUpdate() > 0){
              return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
        
    }

    public static boolean update(int ModId, Pessoa newInfo){
        String sql = "UPDATE pessoa nome = ?, foto = ?, email = ? WHERE id = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newInfo.getNome());
            ps.setBytes(2, newInfo.getFoto());
            ps.setString(3, newInfo.getEmail());
            ps.setInt(4, ModId);
            if(ps.executeUpdate() > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }

    public static ArrayList<Pessoa> listar(){
        ArrayList<Pessoa> pessoas = new ArrayList<>();
        String sql = "SELECT * FROM pessoa";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                pessoas.add(new Pessoa(rs.getInt("id"), rs.getString("nome"), rs.getBytes("foto"), rs.getString("email")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pessoas;
    }

    public static Pessoa buscar(int id){
        Pessoa pessoa = null;
        String sql = "SELECT * FROM pessoa WHERE id = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                pessoa = new Pessoa(rs.getInt("id"), rs.getString("nome"), rs.getBytes("foto"), rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pessoa;
    }

    
}

