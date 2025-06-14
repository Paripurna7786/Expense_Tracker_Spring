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

    public void AddClient(clientEntity client) {
        stmt.update("INSERT INTO clients (fname, lname, email, pass, gender, role, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)",
            client.getFname(),
            client.getLname(),
            client.getEmail(),
            client.getPass(),
            client.getGender(),
            client.getRole(),
            client.getCreatedAt() != null ? client.getCreatedAt() : LocalDate.now()
        );
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
