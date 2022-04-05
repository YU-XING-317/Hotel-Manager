package com.g13.hotel.bean;


public class Room {

  private long id;
  private String type;
  private long price;
  private long state;

  @Override
  public String toString() {
    return "Room{" +
            "id=" + id +
            ", type='" + type + '\'' +
            ", price=" + price +
            ", state=" + state +
            '}';
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }


  public long getPrice() {
    return price;
  }

  public void setPrice(long price) {
    this.price = price;
  }


  public long getState() {
    return state;
  }

  public void setState(long state) {
    this.state = state;
  }

}
