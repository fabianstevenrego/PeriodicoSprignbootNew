package com.example.demo.repositorio;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelo.Categoria;
@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Integer> {
    public Optional<Categoria> findByNombre(String nombre);
}
    

