package cn.edu.nyist.springboot09_jsp_hbi.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Size;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
/*
 * model实体类和数据库对应
 * Vo是进行数据层之间交流，
 *    vcode应该放在vo中
 */
//动态更新
@DynamicUpdate
@Entity
@Table(name="t_book")
public class Book implements Serializable {

	private static final long serialVersionUID = 1L;
	@Size(min=3,max=10,message="{book.name}")
	private String name;
	@Length(max=100,message="{book.descri}")
	private String descri;
	@DecimalMin(value="10",message="{book.price}")
	private double price;
	@NotEmpty(message="{book.author}")
	private String author;
	private String photo;
	private int tid;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pubdate;
	@Id
	@GeneratedValue
	private int id;
	//数据库没有此列，vcode应该放VO中s
	@Transient      //忽略，透明化
	private String vcode;
	public Book() {}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescri() {
		return descri;
	}
	public void setDescri(String descri) {
		this.descri = descri;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public Date getPubdate() {
		return pubdate;
	}
	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
	public String getVcode() {
		return vcode;
	}
	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	@Override
	public String toString() {
		return "Book [name=" + name + ", descri=" + descri + ", price=" + price + ", author=" + author + ", photo="
				+ photo + ", tid=" + tid + ", pubdate=" + pubdate + ", id=" + id + "]";
	};
}
