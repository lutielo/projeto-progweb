package br.unisul.progweb.bean;


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "cursoarquivo", schema = "public")
public class Cursoarquivo implements java.io.Serializable {

	private CursoarquivoId id;
	private Curso curso;

	public Cursoarquivo() {
	}

	public Cursoarquivo(CursoarquivoId id) {
		this.id = id;
	}

	public Cursoarquivo(CursoarquivoId id, Curso curso) {
		this.id = id;
		this.curso = curso;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "cdcurso", column = @Column(name = "cdcurso")),
			@AttributeOverride(name = "depatharquivo", column = @Column(name = "depatharquivo", nullable = false)) })
	public CursoarquivoId getId() {
		return this.id;
	}

	public void setId(CursoarquivoId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cdcurso", insertable = false, updatable = false)
	public Curso getCurso() {
		return this.curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

}
