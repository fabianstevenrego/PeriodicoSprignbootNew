
package com.example.demo.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
@Data
@Entity
public class Categoria implements Serializable {
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id_categoria;
	private String nombre;
	@JsonIgnore

	@OneToMany(mappedBy = "id_categoria", fetch = FetchType.LAZY)
	private List<Noticia> noticias;

    public List<Noticia> getNoticias() {
        return noticias;
    }

    public void setNoticias(List<Noticia> noticias) {
        this.noticias = noticias;
    }

    public Categoria() {
    }

    public Categoria(Integer id_categoria, String nombre, List<Noticia> noticias) {
        this.id_categoria = id_categoria;
        this.nombre = nombre;
        this.noticias = noticias;
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

  
   
   
}
