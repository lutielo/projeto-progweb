package br.unisul.progweb.bean;


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



@Entity
@Table(name = "usuario", schema = "public")
public class Usuario implements java.io.Serializable {

	private Integer cdusuario;
	private Perfil perfil;
	private String nmusuario;
	private String delogin;
	private String desenha;
	private String deemail;
	private Set<Cursoaluno> cursoalunos = new HashSet<Cursoaluno>(0);
	private Set<Curso> cursos = new HashSet<Curso>(0);

	public Usuario() {
	}

	public Usuario(Integer cdusuario, Perfil perfil, String nmusuario,
			String delogin, String desenha, String deemail) {
		this.cdusuario = cdusuario;
		this.perfil = perfil;
		this.nmusuario = nmusuario;
		this.delogin = delogin;
		this.desenha = desenha;
		this.deemail = deemail;
	}
	
	public Usuario(Perfil perfil, String nmusuario,
			String delogin, String desenha, String deemail) {
		this.perfil = perfil;
		this.nmusuario = nmusuario;
		this.delogin = delogin;
		this.desenha = desenha;
		this.deemail = deemail;
	}

	public Usuario(int cdusuario, Perfil perfil, String nmusuario,
			String delogin, String desenha, String deemail, Set<Cursoaluno> cursoalunos,
			Set<Curso> cursos) {
		this.cdusuario = cdusuario;
		this.perfil = perfil;
		this.nmusuario = nmusuario;
		this.delogin = delogin;
		this.desenha = desenha;
		this.deemail = deemail;
		this.cursoalunos = cursoalunos;
		this.cursos = cursos;
	}

	@Id
	@Column(name = "cdusuario", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getCdusuario() {
		return this.cdusuario;
	}

	public void setCdusuario(Integer cdusuario) {
		this.cdusuario = cdusuario;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cdperfil", nullable = false)
	public Perfil getPerfil() {
		return this.perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	@Column(name = "nmusuario", nullable = false, length = 80)
	public String getNmusuario() {
		return this.nmusuario;
	}

	public void setNmusuario(String nmusuario) {
		this.nmusuario = nmusuario;
	}

	@Column(name = "delogin", nullable = false, length = 30)
	public String getDelogin() {
		return this.delogin;
	}

	public void setDelogin(String delogin) {
		this.delogin = delogin;
	}

	@Column(name = "desenha", nullable = false, length = 30)
	public String getDesenha() {
		return this.desenha;
	}

	public void setDesenha(String desenha) {
		this.desenha = desenha;
	}

	@Column(name = "deemail", nullable = false, length = 50)
	public String getDeemail() {
		return this.deemail;
	}

	public void setDeemail(String deemail) {
		this.deemail = deemail;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Cursoaluno> getCursoalunos() {
		return this.cursoalunos;
	}

	public void setCursoalunos(Set<Cursoaluno> cursoalunos) {
		this.cursoalunos = cursoalunos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Curso> getCursos() {
		return this.cursos;
	}

	public void setCursos(Set<Curso> cursos) {
		this.cursos = cursos;
	}
}