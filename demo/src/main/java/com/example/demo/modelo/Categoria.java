package com.example.demo.modelo;

import java.io.Serializable;
import java.util.List;


import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Categoria implements Serializable {
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id_categoria;
	private String nombre;
	@JsonIgnore
	@OneToMany(mappedBy = "categoria")
	private List<CategoriaNoticia>noticias;
    public Categoria(Integer id_categoria, String nombre, List<CategoriaNoticia> noticias) {
        this.id_categoria = id_categoria;
        this.nombre = nombre;
        this.noticias = noticias;
    }
    public Categoria() {
    }
    public Integer getId_categoria() {
        return id_categoria;
    }
    public void setId_categoria(Integer id_categoria) {
        this.id_categoria = id_categoria;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public List<CategoriaNoticia> getNoticias() {
        return noticias;
    }
    public void setNoticias(List<CategoriaNoticia> noticias) {
        this.noticias = noticias;
    }
}
