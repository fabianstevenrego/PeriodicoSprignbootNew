package com.example.demo.controlador;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.modelo.Noticia;
import com.example.demo.repositorio.NoticiaRepository;

@RestController
@RequestMapping("/noticias")
@CrossOrigin
public class NoticiaController {
    @Autowired
    private NoticiaRepository noticiaRepository;

    @GetMapping("/listar")
    public List<Noticia> getNoticiaAll() {

        return noticiaRepository.findAll();
    }

    @GetMapping("/{id}")
    public Noticia getNoticiabyId(@PathVariable Integer id) {

        Optional<Noticia> noticia = noticiaRepository.findById(id);

        if (noticia.isPresent()) {
            return noticia.get();
        }

        return null;

    }
    @PostMapping("/postNoticia")
	public Noticia postProductos(@RequestBody Noticia noticia) {
		
		noticiaRepository.save(noticia);
		
		return noticia;
    }
    @PostMapping("/postNoticiaImg")
	public void postNoticiaImg( @RequestParam("file") MultipartFile imagen) {
		if(!imagen.isEmpty()){
            Path directorio = Paths.get("demo//src//main//resources//static/periodicoUFPS/data");
            String RutaAbs = directorio.toFile().getAbsolutePath();
            try {
                byte[] bytesImg = imagen.getBytes();
                Path rutaCompleta = Paths.get(RutaAbs+"//"+imagen.getOriginalFilename());
                Files.write(rutaCompleta, bytesImg);
                //noticia.setUrl_imagen(imagen.getOriginalFilename());

            } catch (IOException e) {
                
                e.printStackTrace();
            }
        }
		
    }
    /*@PostMapping("/postNoticia")
	public Noticia postProductos(@RequestParam("titulo")String titulo,
    @RequestParam("contenido")String contenido,
    @RequestParam("id_usuario")String id_usuario,
    @RequestParam("url_imagen")String url_imagen,
    @RequestParam("id_categoria")String id_categoria,
    @RequestParam("file") MultipartFile imagen) {
		Noticia noticia = new Noticia();
        noticia.setTitulo(titulo);
        noticia.setContenido(contenido);
        noticia.setUrl_imagen(url_imagen);
        noticia.setId_categoria(Integer.parseInt(id_categoria));
        noticia.setId_usuario(Integer.parseInt(id_usuario));
        System.out.println(noticia);
		if(!imagen.isEmpty()){
            Path directorio = Paths.get("demo//src//main//resources//static/periodicoUFPS/data");
            String RutaAbs = directorio.toFile().getAbsolutePath();
            try {
                byte[] bytesImg = imagen.getBytes();
                Path rutaCompleta = Paths.get(RutaAbs+"//"+imagen.getOriginalFilename());
                Files.write(rutaCompleta, bytesImg);
                //noticia.setUrl_imagen(imagen.getOriginalFilename());

            } catch (IOException e) {
                
                e.printStackTrace();
            }
        }
        noticiaRepository.save(noticia);
		return null;//

	}*/
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
