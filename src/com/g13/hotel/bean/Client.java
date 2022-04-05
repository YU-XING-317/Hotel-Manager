package com.g13.hotel.bean;


public class Client {

  private long id;
  private String name;
  private String tel;
  private String rtype;
  private long rid;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }


  public String getRtype() {
    return rtype;
  }

  public void setRtype(String rtype) {
    this.rtype = rtype;
  }


  public long getRid() {
    return rid;
  }

  public void setRid(long rid) {
    this.rid = rid;
  }

}
