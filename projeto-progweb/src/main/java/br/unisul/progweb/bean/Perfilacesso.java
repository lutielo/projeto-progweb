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
@Table(name = "perfilacesso", schema = "public")
public class Perfilacesso implements java.io.Serializable {

	private PerfilacessoId id;
	private Perfil perfil;

	public Perfilacesso() {
	}

	public Perfilacesso(PerfilacessoId id, Perfil perfil) {
		this.id = id;
		this.perfil = perfil;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "cdperfil", column = @Column(name = "cdperfil", nullable = false)),
			@AttributeOverride(name = "deurl", column = @Column(name = "deurl", nullable = false)) })
	public PerfilacessoId getId() {
		return this.id;
	}

	public void setId(PerfilacessoId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cdperfil", nullable = false, insertable = false, updatable = false)
	public Perfil getPerfil() {
		return this.perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

}
