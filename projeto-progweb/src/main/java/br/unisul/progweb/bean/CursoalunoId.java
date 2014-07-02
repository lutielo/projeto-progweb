package br.unisul.progweb.bean;


import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class CursoalunoId implements java.io.Serializable {

	private Short cdcurso;
	private Short cdusuario;

	public CursoalunoId() {
	}

	public CursoalunoId(Short cdcurso, Short cdusuario) {
		this.cdcurso = cdcurso;
		this.cdusuario = cdusuario;
	}

	@Column(name = "cdcurso")
	public Short getCdcurso() {
		return this.cdcurso;
	}

	public void setCdcurso(Short cdcurso) {
		this.cdcurso = cdcurso;
	}

	@Column(name = "cdusuario")
	public Short getCdusuario() {
		return this.cdusuario;
	}

	public void setCdusuario(Short cdusuario) {
		this.cdusuario = cdusuario;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CursoalunoId))
			return false;
		CursoalunoId castOther = (CursoalunoId) other;

		return ((this.getCdcurso() == castOther.getCdcurso()) || (this
				.getCdcurso() != null && castOther.getCdcurso() != null && this
				.getCdcurso().equals(castOther.getCdcurso())))
				&& ((this.getCdusuario() == castOther.getCdusuario()) || (this
						.getCdusuario() != null
						&& castOther.getCdusuario() != null && this
						.getCdusuario().equals(castOther.getCdusuario())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getCdcurso() == null ? 0 : this.getCdcurso().hashCode());
		result = 37 * result
				+ (getCdusuario() == null ? 0 : this.getCdusuario().hashCode());
		return result;
	}

}
