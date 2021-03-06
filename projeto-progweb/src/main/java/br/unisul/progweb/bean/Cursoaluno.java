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
@Table(name = "cursoaluno", schema = "public")
public class Cursoaluno implements java.io.Serializable {

	private CursoalunoId id;
	private Curso curso;
	private Usuario usuario;

	public Cursoaluno() {
	}

	public Cursoaluno(CursoalunoId id) {
		this.id = id;
	}

	public Cursoaluno(CursoalunoId id, Curso curso, Usuario usuario) {
		this.id = id;
		this.curso = curso;
		this.usuario = usuario;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "cdcurso", column = @Column(name = "cdcurso")),
			@AttributeOverride(name = "cdusuario", column = @Column(name = "cdusuario")) })
	public CursoalunoId getId() {
		return this.id;
	}

	public void setId(CursoalunoId id) {
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cdusuario", insertable = false, updatable = false)
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
