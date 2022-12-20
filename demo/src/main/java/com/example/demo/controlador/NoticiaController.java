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

import com.example.demo.modelo.CategoriaNoticia;
import com.example.demo.modelo.Noticia;
import com.example.demo.repositorio.CategoriaNoticiaRepository;
import com.example.demo.repositorio.NoticiaRepository;

@RestController
@RequestMapping("/noticias")
@CrossOrigin
public class NoticiaController {
    @Autowired
    private NoticiaRepository noticiaRepository;
    private CategoriaNoticiaRepository categoriaNoticiaRepository;

    @GetMapping("/listar")
    public List<Noticia> getNoticiaAll() {

        return noticiaRepository.findAll();
    }

    @GetMapping("/{id}/cat")
	public List<CategoriaNoticia> noticas(@PathVariable Integer id){
		Optional<Noticia>noticia=noticiaRepository.findById(id);
		if(noticia.isPresent()) {
			return noticia.get().getCategorias();
		}
		return null;
	}


    @GetMapping("/{id}/categorias")
    public List<CategoriaNoticia> categorias(@PathVariable Integer id) {
        Optional<Noticia> noticia = noticiaRepository.findById(id);
        if (noticia.isPresent()) {
            return noticia.get().getCategorias();
        }
        return null;
    }

    @GetMapping("/{id}")
    public Noticia getNoticiabyId(@PathVariable Integer id) {

        Optional<Noticia> noticia = noticiaRepository.findById(id);

        if (noticia.isPresent()) {
            return noticia.get();
        }

        return null;

    }

    @PostMapping
	public Noticia postProductos(@RequestBody Noticia noticia) {
		
		noticiaRepository.save(noticia);
		
		return noticia;
		

	}
    @PutMapping("/{id}")
	public Noticia putProductosbyId(@PathVariable Integer id, @RequestBody Noticia noticia) {
		
		Optional<Noticia> noticiaCurrent = noticiaRepository.findById(id);
		
		if (noticiaCurrent.isPresent()) {
			
			Noticia noticiaReturn = noticiaCurrent.get();
			
			
			noticiaReturn.setTitulo(noticia.getTitulo());
            noticiaReturn.setContenido(noticia.getContenido());
            noticiaReturn.setEstado(noticia.getEstado());
            noticiaReturn.setUrl_imagen(noticia.getUrl_imagen());
            
			
			
			noticiaRepository.save(noticiaReturn);
			
			return noticiaReturn;
		}
		
		return null;

	}

    @DeleteMapping("/{id}")
	public Noticia deleteNoticiasbyId(@PathVariable Integer id) {
		
		Optional<Noticia> noticia = noticiaRepository.findById(id);
		
		if (noticia.isPresent()) {
			
			Noticia noticiaReturn = noticia.get();
			
			noticiaRepository.deleteById(id);
			
			return noticiaReturn;
		}
		
		return null;

	}


}
