package br.unisul.progweb.modelo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="usuario")
public class UsuarioBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_usuario")
	private Integer id;
	
	@Column(name="tipo_usuario")
	private Perfil acesso;
	
	@Column(name="tx_nome")
	private String nmCompleto;
	
	@Column(name="tx_apelido")
	private String apelido;
	
	@Column(name="tx_email")
	private String eMail;
	
	@Column(name="tx_senha")
	private String senha;
	
	@Column(name="dt_criacao")
	private Date criado;
	
	@Column(name="dt_ultimoAcesso")
	private Date ultimoAcesso;
	
	@Column(name="dt_nascimento")
	private Date dtNascimento;
	
	@Column(name="fl_ativo")
	private Boolean ativo;
	
	public UsuarioBean() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Perfil getNvlAcesso() {
		return acesso;
	}

	public void setNvlAcesso(Perfil nvlAcesso) {
		this.acesso = nvlAcesso;
	}

	public String getNmCompleto() {
		return nmCompleto;
	}

	public void setNmCompleto(String nmCompleto) {
		this.nmCompleto = nmCompleto;
	}

	public String getApelido() {
		return apelido;
	}

	public void setApelido(String apelido) {
		this.apelido = apelido;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Date getCriado() {
		return criado;
	}

	public void setCriado(Date criado) {
		this.criado = criado;
	}

	public Date getUltimoAcesso() {
		return ultimoAcesso;
	}

	public void setUltimoAcesso(Date ultimoLogin) {
		this.ultimoAcesso = ultimoLogin;
	}

	public Date getDtNascimento() {
		return dtNascimento;
	}

	public void setDtNascimento(Date dtNascimento) {
		this.dtNascimento = dtNascimento;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

}
