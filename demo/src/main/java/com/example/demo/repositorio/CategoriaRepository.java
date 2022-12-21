package com.example.demo.repositorio;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelo.Categoria;
@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Integer> {
    public List<Categoria> findByNombre(String nombre);
}
    

