package org.luna.quickapp.model

import com.baomidou.mybatisplus.annotation.TableName

@TableName("user")
class User {

  private String id

  private String name

  private String password

  private Date created

  private Date updated

  private int deleted

  void removePassword() {
    password = null
  }

  @Override
  String toString() {
    return "User[id=${id};name=${name}]"
  }

}
