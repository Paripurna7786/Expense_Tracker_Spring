package com.controller.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.clientEntity;

import java.time.LocalDate;
import java.util.List;

@Repository
public class ClientDao {

    @Autowired
    JdbcTemplate stmt;

    public clientEntity AddClient(clientEntity client) {
        stmt.update("INSERT INTO clients (fname, lname, email, pass, gender, role, created_at, profilepicpath) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
            client.getFname(),
            client.getLname(),
            client.getEmail(),
            client.getPass(),
            client.getGender(),
            client.getRole(),
            client.getCreatedAt() != null ? client.getCreatedAt() : LocalDate.now(),
            client.getProfilepicpath()
        );

   
        return findByEmail(client.getEmail());
    }

    
    public void updatePassword(String email, String newPassword) {
        stmt.update("UPDATE clients SET pass = ? WHERE email = ?", newPassword, email);
    }


    public clientEntity findByEmail(String email) {
        List<clientEntity> clients = stmt.query(
            "SELECT * FROM clients WHERE email = ?",
            new BeanPropertyRowMapper<>(clientEntity.class),
            email
        );
        return clients.isEmpty() ? null : clients.get(0);
    }
}
