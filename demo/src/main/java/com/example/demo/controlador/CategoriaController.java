package com.example.demo.controlador;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Categoria;
import com.example.demo.modelo.CategoriaNoticia;
import com.example.demo.modelo.Noticia;
import com.example.demo.repositorio.CategoriaNoticiaRepository;
import com.example.demo.repositorio.CategoriaRepository;

@RestController
@RequestMapping("/categoria")
@CrossOrigin
public class CategoriaController {
    @Autowired
	CategoriaRepository categoriaRepository;
	
	@GetMapping("/listar")
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

    @GetMapping("/{nombre}/listNoticias")
	public List<CategoriaNoticia> getNoticiasbyNombre(@PathVariable String nombre) {
		
		Optional<Categoria> categoria = categoriaRepository.findByNombre(nombre);
		
		if(categoria.isPresent()) {
			return categoria.get().getNoticias();
		}
		return null;
	}
	
	
}
