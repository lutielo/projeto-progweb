package br.unisul.progweb.bean;


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "perfil", schema = "public")
public class Perfil implements java.io.Serializable {

	private Integer cdperfil;
	private String deperfil;
	private Set<Perfilacesso> perfilacessos = new HashSet<Perfilacesso>(0);
	private Set<Usuario> usuarios = new HashSet<Usuario>(0);

	public Perfil() {
	}

	public Perfil(String deperfil) {
		this.deperfil = deperfil;
	}
	
	public Perfil(Integer cdperfil, String deperfil) {
		this.deperfil = deperfil;
	}

	public Perfil(Integer cdperfil, String deperfil, Set<Perfilacesso> perfilacessos, Set<Usuario> usuarios) {
		this.cdperfil = cdperfil;
		this.deperfil = deperfil;
		this.perfilacessos = perfilacessos;
		this.usuarios = usuarios;
	}

	@Id
	@Column(name = "cdperfil", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getCdperfil() {
		return this.cdperfil;
	}

	public void setCdperfil(Integer cdperfil) {
		this.cdperfil = cdperfil;
	}

	@Column(name = "deperfil", nullable = false, length = 50)
	public String getDeperfil() {
		return this.deperfil;
	}

	public void setDeperfil(String deperfil) {
		this.deperfil = deperfil;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "perfil")
	public Set<Perfilacesso> getPerfilacessos() {
		return this.perfilacessos;
	}

	public void setPerfilacessos(Set<Perfilacesso> perfilacessos) {
			this.perfilacessos = perfilacessos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "perfil")
	public Set<Usuario> getUsuarios() {
		return this.usuarios;
	}

	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

}
