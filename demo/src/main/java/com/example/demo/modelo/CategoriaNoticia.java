package com.example.demo.modelo;



import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


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
