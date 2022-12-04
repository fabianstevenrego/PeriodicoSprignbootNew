package com.example.crud.periodico.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.crud.periodico.entities.Categoria;

public interface CategoriaRepository extends JpaRepository<Categoria, Integer>{

}
