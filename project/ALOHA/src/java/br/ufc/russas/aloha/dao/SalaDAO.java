
package br.ufc.russas.aloha.dao;

import br.ufc.russas.aloha.model.Sala;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class SalaDAO {
    
    
    
    public SalaDAO() {
        
    }
    public boolean insert(Sala sala) {
        sala.setId(this.gerarIdSala());
        sala.setCodigoModelo(sala.geraCodigo());
        Connection con = null;
        try {
            con = ConexaoFactory.getConnection();
            String sql = "INSERT INTO sala (codigo_modelo, nome, tipo, capacidade, bloco ) VALUES (?, ?, ?, ?, ?)" ; 
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sala.getCodigoModelo());
            ps.setString(2, sala.getNome());
            ps.setString(3, sala.getTipo());
            ps.setInt(4, sala.getCapacidade());
            ps.setString(5, sala.getBloco());
            
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            throw new DAOException("Operação não realizada com sucesso.", e);
            
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                throw new DAOException("Não foi possível fechar a conexão.", e);
            }
            
        }
    }
    /*
    public boolean insert(Sala sala) throws SQLException{
        
        PreparedStatement ps = super.getConexao().prepareStatement(sql);
        
        ps.setString(1, sala.getCodigoModelo());
        ps.setString(2, sala.getNome());
        ps.setString(3, sala.getTipo());
        ps.setInt(4, sala.getCapacidade());
        ps.setString(5, sala.getBloco());
        
        return ps.executeUpdate() == 1;
    }
*/
    public ArrayList<Sala> selectALL(){
        //int id, String codigoModelo, String nome, String tipo, int capacidade, String bloco
        Connection con = null;
        ArrayList<Sala> salas = new ArrayList<>();
        try {
            con = ConexaoFactory.getConnection();
            String sql = "SELECT * from sala";
            PreparedStatement pst = con.prepareStatement(sql);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                salas.add(map(rs));
            }
        } catch (SQLException e) {
            throw new DAOException("Operação não realizada com sucesso.", e);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                throw new DAOException("Não foi possível fechar a conexão.", e);
            }
        }
        return salas;
    }
    
    private Sala map(ResultSet rs) throws SQLException {
        Sala u = new Sala(rs.getInt("id"), rs.getString("codigo_modelo"), rs.getString("nome"), rs.getString("tipo"), rs.getInt("capacidade"), rs.getString("bloco"));
        return u;
    }
    
     public int gerarIdSala() {
        Connection con = null;
        int numero = 0;
        try {
            con = ConexaoFactory.getConnection();
            String sql = "select count(*) from sala";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                numero = rs.getInt("count(*)") + 1;
            }
        } catch (SQLException e) {
            throw new DAOException("Operação não realizada com sucesso.", e);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                throw new DAOException("Não foi possível fechar a conexão.", e);
            }
        }
        return numero;
    }

}
