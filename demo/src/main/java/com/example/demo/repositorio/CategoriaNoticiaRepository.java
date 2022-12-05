package com.example.demo.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelo.CategoriaNoticia;
@Repository
public interface CategoriaNoticiaRepository extends JpaRepository<CategoriaNoticia, Integer> {
    
}
