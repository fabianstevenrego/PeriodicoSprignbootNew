package com.example.demo.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="categoria_noticia")
public class CategoriaNoticia {
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
        public CategoriaNoticia(Integer id, Noticia noticia, Categoria categoria, Integer ref) {
            this.id = id;
            this.noticia = noticia;
            this.categoria = categoria;
            this.ref = ref;
        }
        public CategoriaNoticia() {
        }
        public Integer getId() {
            return id;
        }
        public void setId(Integer id) {
            this.id = id;
        }
        public Noticia getNoticia() {
            return noticia;
        }
        public void setNoticia(Noticia noticia) {
            this.noticia = noticia;
        }
        public Categoria getCategoria() {
            return categoria;
        }
        public void setCategoria(Categoria categoria) {
            this.categoria = categoria;
        }
        public Integer getRef() {
            return ref;
        }
        public void setRef(Integer ref) {
            this.ref = ref;
        }
}
