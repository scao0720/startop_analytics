package scao.startstop;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity(name = "Bullets")
@Table(name = "bullets")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bullets.findAll", query = "SELECT b FROM Bullets b"),
    @NamedQuery(name = "Bullets.findById", query = "SELECT b FROM Bullets b WHERE b.id = :id"),
    @NamedQuery(name = "Bullets.findBySessionId", query = "SELECT b FROM Bullets b WHERE b.sessionId = :sessionId"),
    @NamedQuery(name = "Bullets.findByCreated", query = "SELECT b FROM Bullets b WHERE b.created = :created")})
public class Bullet implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "session_id")
    private int sessionId;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "body")
    private String body;
    @Basic(optional = false)
    @NotNull
    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;

    public Bullet() {
    }

    public Bullet(Integer id) {
        this.id = id;
    }

    public Bullet(Integer id, int sessionId, String body, Date created) {
        this.id = id;
        this.sessionId = sessionId;
        this.body = body;
        this.created = created;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bullet)) {
            return false;
        }
        Bullet other = (Bullet) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "scao.startstop.Bullets[ id=" + id + " ]";
    }
    
}
