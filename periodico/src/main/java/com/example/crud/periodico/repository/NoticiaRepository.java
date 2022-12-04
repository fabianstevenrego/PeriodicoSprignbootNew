package com.example.crud.periodico.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.crud.periodico.entities.Noticia;

public interface NoticiaRepository  extends JpaRepository<Noticia, Integer>{

}
