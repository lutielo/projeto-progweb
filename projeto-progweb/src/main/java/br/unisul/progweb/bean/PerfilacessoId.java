package br.unisul.progweb.bean;


import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class PerfilacessoId implements java.io.Serializable {

	private short cdperfil;
	private String deurl;

	public PerfilacessoId() {
	}

	public PerfilacessoId(short cdperfil, String deurl) {
		this.cdperfil = cdperfil;
		this.deurl = deurl;
	}

	@Column(name = "cdperfil", nullable = false)
	public short getCdperfil() {
		return this.cdperfil;
	}

	public void setCdperfil(short cdperfil) {
		this.cdperfil = cdperfil;
	}

	@Column(name = "deurl", nullable = false)
	public String getDeurl() {
		return this.deurl;
	}

	public void setDeurl(String deurl) {
		this.deurl = deurl;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof PerfilacessoId))
			return false;
		PerfilacessoId castOther = (PerfilacessoId) other;

		return (this.getCdperfil() == castOther.getCdperfil())
				&& ((this.getDeurl() == castOther.getDeurl()) || (this
						.getDeurl() != null && castOther.getDeurl() != null && this
						.getDeurl().equals(castOther.getDeurl())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getCdperfil();
		result = 37 * result
				+ (getDeurl() == null ? 0 : this.getDeurl().hashCode());
		return result;
	}

}
