package com.example.lab9.daos;

import java.nio.file.DirectoryNotEmptyException;
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

    public void crear(String nombres, String apellidos, String correo, String dni,int idsede){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bicicentro";
        String username = "root";
        String password = "root";

        String sql = "insert into trabajadores (nombres, apellidos, correo, DNI, idsede) values (?,?,?,?,?)";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,nombres);
            pstmt.setString(2,apellidos);
            pstmt.setString(3,correo);
            pstmt.setString(4, dni);
            pstmt.setInt(5,idsede);

            pstmt.executeUpdate();
        }catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

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

    public void actualizar(trabajadores trabajadores){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bicicentro";
        String username = "root";
        String password = "root";

        String sql = "update trabajadores set nombres = ?, apellidos = ?, correo = ?, dni = ?, idsede = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,trabajadores.getNombres());
            pstmt.setString(2,trabajadores.getApellidos());
            pstmt.setString(3,trabajadores.getCorreo());
            pstmt.setString(4, trabajadores.getDni());
            pstmt.setInt(5,trabajadores.getIdsede());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public void borrar (String dni) throws SQLException{

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bicicentro";
        String username = "root";
        String password = "root";

        String sql = "delete from trabajadores where dni = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,dni);
            pstmt.executeUpdate();
        }


    }

}
