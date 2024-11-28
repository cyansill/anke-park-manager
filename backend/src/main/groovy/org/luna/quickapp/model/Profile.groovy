package org.luna.quickapp.model

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("profile")
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