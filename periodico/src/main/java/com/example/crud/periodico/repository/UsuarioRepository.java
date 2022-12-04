package com.example.crud.periodico.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.crud.periodico.entities.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

}
