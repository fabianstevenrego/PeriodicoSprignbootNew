package com.example.demo.controlador;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.modelo.Usuario;
import com.example.demo.servicio.UsuarioServicioImpl;


@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	
	@Autowired
	private UsuarioServicioImpl service;
	
	@GetMapping("/listar")
	public String listar(Model model) {
		model.addAttribute("usuario", service.listarUsuarios());
		return "periodicoUFPS/HTML/paginaPrincipal.html";
	}
	@GetMapping("listar/{id}")
	public String listarId(@PathVariable long id,Model model) {
		model.addAttribute("usuario", service.listarId(id));
		return "form";
	}
	
	@GetMapping("/new")
	public String nuevo(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "form";
	}
	
	@PostMapping("/save")
	public String save(@Valid Usuario p,Model model) {
		int id=service.save(p);
		if(id==0) {
			return "form";
		}
		return "redirect:/usuario/listar";
	}
	
	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable long id,Model model) {
		service.delete(id);
		return "redirect:/listar";
	}
}
