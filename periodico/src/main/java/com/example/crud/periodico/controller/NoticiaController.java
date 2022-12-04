package com.example.crud.periodico.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.crud.periodico.entities.CategoriaNoticia;
import com.example.crud.periodico.entities.Noticia;
import com.example.crud.periodico.repository.NoticiaRepository;

@RestController
@RequestMapping("/noticias")
@CrossOrigin
public class NoticiaController {
	@Autowired
	private NoticiaRepository noticiaRepository;

	@GetMapping
	public List<Noticia> getNoticiaAll() {

		return noticiaRepository.findAll();
	}
	
	@GetMapping("/{id}/categorias")
	public List<CategoriaNoticia>categorias(@PathVariable Integer id){
		Optional<Noticia>noticia=noticiaRepository.findById(id);
		if(noticia.isPresent()) {
			return noticia.get().getCategorias();
		}
		return null;
	}
}

	

	


