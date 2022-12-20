package com.example.demo.servicio;
import java.util.List;
import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.example.demo.controlador.dto.UsuarioRegistroDTO;
import com.example.demo.modelo.Usuario;




public interface UsuarioServicio extends UserDetailsService{

	public Usuario guardar(UsuarioRegistroDTO registroDTO);
	
	public List<Usuario> listarUsuarios();

	public Optional<Usuario> listarId(long id);

	public int save(Usuario p);

	public void delete(long id);
	
}
