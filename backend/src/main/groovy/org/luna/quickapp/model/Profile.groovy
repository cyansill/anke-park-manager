package org.luna.quickapp.model;

import lombok.Data;

@Data
class Profile {

  private String id

  private String user_id

  private String name

  private String phone

  private String email

  private String avatar

  private String address 

  private int gender

  private Date birthday

}