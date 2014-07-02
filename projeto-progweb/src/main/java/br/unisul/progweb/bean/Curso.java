package br.unisul.progweb.bean;


import java.io.File;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "curso", schema = "public")
public class Curso implements Serializable {

	private Integer cdcurso;
	private Usuario usuario;
	private String decurso;
	private String deementa;
	private Date dtinicio;
	private Date dtfim;
	private Set<Cursoaluno> cursoalunos = new HashSet<Cursoaluno>(0);
	private Set<Cursoarquivo> cursoarquivos = new HashSet<Cursoarquivo>(0);

	public Curso() {
	}

	public Curso(Integer cdcurso, Usuario usuario, String decurso, String deementa,
			Date dtinicio, Date dtfim, Set<Cursoaluno> cursoalunos, Set<Cursoarquivo> cursoarquivos) {
		this.cdcurso = cdcurso;
		this.usuario = usuario;
		this.decurso = decurso;
		this.deementa = deementa;
		this.dtinicio = dtinicio;
		this.dtfim = dtfim;
		this.cursoalunos = cursoalunos;
		this.cursoarquivos = cursoarquivos;
	}

	public Curso(Integer cdcurso, Usuario usuario, String decurso, String deementa, Date dtinicio, Date dtfim) {
		this.cdcurso = cdcurso;
		this.usuario = usuario;
		this.decurso = decurso;
		this.deementa = deementa;
		this.dtinicio = dtinicio;
		this.dtfim = dtfim;
	}
	
	public Curso(Usuario usuario, String decurso, String deementa, Date dtinicio, Date dtfim) {
		this.usuario = usuario;
		this.decurso = decurso;
		this.deementa = deementa;
		this.dtinicio = dtinicio;
		this.dtfim = dtfim;
	}
	
	@Id
	@Column(name = "cdcurso", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	public Integer getCdcurso() {
		return this.cdcurso;
	}

	public void setCdcurso(Integer cdcurso) {
		this.cdcurso = cdcurso;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cdusuarioprof")
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Column(name = "decurso", nullable = false, length = 100)
	public String getDecurso() {
		return this.decurso;
	}

	public void setDecurso(String decurso) {
		this.decurso = decurso;
	}

	@Column(name = "deementa", columnDefinition="TEXT", nullable = false)
	public String getDeementa() {
		return this.deementa;
	}

	public void setDeementa(String deementa) {
		this.deementa = deementa;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "dtinicio", length = 13)
	public Date getDtinicio() {
		return this.dtinicio;
	}

	public void setDtinicio(Date dtinicio) {
		this.dtinicio = dtinicio;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "dtfim", length = 13)
	public Date getDtfim() {
		return this.dtfim;
	}

	public void setDtfim(Date dtfim) {
		this.dtfim = dtfim;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "curso")
	public Set<Cursoaluno> getCursoalunos() {
		return this.cursoalunos;
	}

	public void setCursoalunos(Set<Cursoaluno> cursoalunos) {
		this.cursoalunos = cursoalunos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "curso")
	public Set<Cursoarquivo> getCursoarquivos() {
		return this.cursoarquivos;
	}

	public void setCursoarquivos(Set<Cursoarquivo> cursoarquivos) {
		this.cursoarquivos = cursoarquivos;
	}

}
