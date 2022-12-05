package com.example.demo.modelo;

import java.util.List;


import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Noticia {
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String titulo;
	private String contenido;
	
	
	private Integer id_usuario;
	
	private String estado;
	private String url_imagen;
	@JsonIgnore
	@OneToMany(mappedBy = "noticia")
	private List<CategoriaNoticia>categorias;
    public Noticia(Integer id, String titulo, String contenido, Integer id_usuario, String estado, String url_imagen,
            List<CategoriaNoticia> categorias) {
        this.id = id;
        this.titulo = titulo;
        this.contenido = contenido;
        this.id_usuario = id_usuario;
        this.estado = estado;
        this.url_imagen = url_imagen;
        this.categorias = categorias;
    }
    public Noticia() {
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getContenido() {
        return contenido;
    }
    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
    public Integer getId_usuario() {
        return id_usuario;
    }
    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }
    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public String getUrl_imagen() {
        return url_imagen;
    }
    public void setUrl_imagen(String url_imagen) {
        this.url_imagen = url_imagen;
    }
    public List<CategoriaNoticia> getCategorias() {
        return categorias;
    }
    public void setCategorias(List<CategoriaNoticia> categorias) {
        this.categorias = categorias;
    }
	
	


}
