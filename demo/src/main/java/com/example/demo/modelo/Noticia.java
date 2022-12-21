package com.example.demo.modelo;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
    private Timestamp fecha;
    
    


    @JsonIgnore
	

    
    
    public Noticia(Integer id, String titulo, String contenido, Integer id_usuario, String estado, String url_imagen,
            Timestamp fecha) {
        this.id = id;
        this.titulo = titulo;
        this.contenido = contenido;
        this.id_usuario = id_usuario;
        this.estado = estado;
        this.url_imagen = url_imagen;
        this.fecha = fecha;
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
    public Timestamp getFecha() {
        return fecha;
    }
    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }
	
	


}
