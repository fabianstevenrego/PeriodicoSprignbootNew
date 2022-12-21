package com.example.demo.controlador;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.modelo.Categoria;
import com.example.demo.modelo.Noticia;
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
	public List<Noticia> noticias(@PathVariable Integer id){
		Optional<Categoria>categoria=categoriaRepository.findById(id);
		if(categoria.isPresent()) {
			return categoria.get().getNoticias();
		}
		return null;
	}

    @GetMapping("/{nombre}/listNoticias")
	public List<Noticia> getNoticiasbyNombre(@PathVariable String nombre) {
		
		List<Categoria> categoria = categoriaRepository.findByNombre(nombre);
		
		
		if (!categoria.isEmpty()) {
			return categoria.get(0).getNoticias();
		}
		
		return null;

	}

	@PostMapping("/postCategoria")
	public Categoria postCategorias(@RequestBody Categoria categoria) {
		
		categoriaRepository.save(categoria);
		
		return categoria;
	}
	

	@PutMapping("/{id}")
	public Categoria putCategoriasbyId(@PathVariable Integer id, @RequestBody Categoria categoria) {
		
		Optional<Categoria> categoriaCurrent = categoriaRepository.findById(id);
		
		if (categoriaCurrent.isPresent()) {
			
			Categoria categoriaReturn = categoriaCurrent.get();
			
			
			categoriaReturn.setNombre(categoria.getNombre());
			
			
			
			categoriaRepository.save(categoriaReturn);
			
			return categoriaReturn;
		}
		
		return null;

	}

	@DeleteMapping("/{id}")
	public Categoria deleteCategoriasbyId(@PathVariable Integer id) {
		
		Optional<Categoria> categoria = categoriaRepository.findById(id);
		
		if (categoria.isPresent()) {
			
			Categoria categoriaReturn = categoria.get();
			
			categoriaRepository.deleteById(id);
			
			return categoriaReturn;
		}
		
		return null ;

	}
	

	
}
