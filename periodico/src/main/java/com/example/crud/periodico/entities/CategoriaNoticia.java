package com.example.crud.periodico.entities;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="categoria_noticia")
public class CategoriaNoticia implements Serializable {
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private Integer id;
		@ManyToOne
		@JoinColumn(name="id_noticia")
		private Noticia noticia;
		@ManyToOne
		@JoinColumn(name="id_categoria")
		private Categoria categoria;
		private Integer ref;
		
}
