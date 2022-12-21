package com.example.demo.modelo;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
@Data
@Entity
public class Noticia implements Serializable{
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
    @ManyToOne(optional = false, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Categoria categoria;
    
    private Integer id_categoria;
    
    
    public Noticia(Integer id, String titulo, String contenido, Integer id_usuario, String estado, String url_imagen,
            Timestamp fecha, Integer id_categoria, Categoria categoria) {
        this.id = id;
        this.titulo = titulo;
        this.contenido = contenido;
        this.id_usuario = id_usuario;
        this.estado = estado;
        this.url_imagen = url_imagen;
        this.fecha = fecha;
        this.id_categoria = id_categoria;
        this.categoria = categoria;
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
	public Integer getId_categoria() {
        return id_categoria;
    }
    public void setId_categoria(Integer id_categoria) {
        this.id_categoria = id_categoria;
    }
	


}
