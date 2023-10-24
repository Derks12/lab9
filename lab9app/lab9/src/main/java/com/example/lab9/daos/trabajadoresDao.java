package com.example.lab9.daos;

import java.sql.*;
import java.util.ArrayList;

import com.example.lab9.beans.trabajadores;

public class trabajadoresDao {
    public ArrayList<trabajadores> listar(){
        ArrayList<trabajadores> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bicicentro";
        String username = "root";
        String password = "root";

        String sql = "select * from trabajadores";
        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                trabajadores trabajadores = new trabajadores();
                trabajadores.setNombres(rs.getString(1));
                trabajadores.setApellidos(rs.getString(2));
                trabajadores.setCorreo(rs.getString(3));
                trabajadores.setDni(rs.getString(4));

                lista.add(trabajadores);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public void crear(String nombres, String apellidos, String correo, String dni,String idSede){}

    public trabajadores buscarPorDni(String dni){
        trabajadores trabajadores = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bicicentro";
        String username = "root";
        String password = "root";

        String sql = "select * from trabajadores where dni = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(4,dni);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    trabajadores = new trabajadores();
                    trabajadores.setNombres(rs.getString(1));
                    trabajadores.setApellidos(rs.getString(2));
                    trabajadores.setCorreo(rs.getString(3));
                    trabajadores.setDni(rs.getString(4));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return trabajadores;

    }


}
