package com.example.demo.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelo.Categoria;


@Repository
public interface CategoriaNoticiaRepository extends JpaRepository<Categoria, Integer> {
    
}
