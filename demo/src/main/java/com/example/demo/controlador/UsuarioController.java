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

import com.example.demo.modelo.Usuario;
import com.example.demo.repositorio.UsuarioRepository;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/usuarios")
public class UsuarioController {
    
    @Autowired
	UsuarioRepository usuarioRepository;
	
	@GetMapping("/listar")
	public List<Usuario> getUsuarioAll() {

		return usuarioRepository.findAll();
	}

    
	
	@GetMapping("/{id}")
	public Usuario getUsuariosbyId(@PathVariable Integer id) {
		
		Optional<Usuario> usuario = usuarioRepository.findById(id);
		
		if (usuario.isPresent()) {
			return usuario.get();
		}
		
		return null;

	}
	
	@PostMapping
	public Usuario postUsuarios(@RequestBody Usuario usuario) {
		
		usuarioRepository.save(usuario);
		
		return usuario;
		

	}
	
	
	@PutMapping("/{id}")
	public Usuario putUsuariosbyId(@PathVariable Integer id, @RequestBody Usuario usuario) {
		
		Optional<Usuario> usuarioCurrent = usuarioRepository.findById(id);
		
		if (usuarioCurrent.isPresent()) {
			
			Usuario usuarioReturn = usuarioCurrent.get();
			
			
			usuarioReturn.setNombre(usuario.getNombre());
            usuarioReturn.setApellido(usuario.getApellido());
            usuarioReturn.setCorreo(usuario.getCorreo());
			usuarioReturn.setContraseña(usuario.getContraseña());
			
			usuarioRepository.save(usuarioReturn);
			
			return usuarioReturn;
		}
		
		return null;

	}
	
	@DeleteMapping("/{id}")
	public Usuario deleteUsuariosbyId(@PathVariable Integer id) {
		
		Optional<Usuario> usuario = usuarioRepository.findById(id);
		
		if (usuario.isPresent()) {
			
			Usuario usuarioReturn = usuario.get();
			
			usuarioRepository.deleteById(id);
			
			return usuarioReturn;
		}
		
		return null;

	}
	
	
	
}

