package com.example.crud.periodico.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.crud.periodico.entities.Categoria;
import com.example.crud.periodico.entities.CategoriaNoticia;
import com.example.crud.periodico.repository.CategoriaRepository;

@RestController
@RequestMapping("/categoria")
@CrossOrigin
public class CategoriaController {
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@GetMapping
	public List<Categoria>lista(){
		return categoriaRepository.findAll();
	}
	
	@GetMapping("/{id}/noticias")
	public List<CategoriaNoticia> noticas(@PathVariable Integer id){
		Optional<Categoria>categoria=categoriaRepository.findById(id);
		if(categoria.isPresent()) {
			return categoria.get().getNoticias();
		}
		return null;
	}
	
	
	

}
