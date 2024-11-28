package org.luna.quickapp.model

import lombok.Data

@Data
class User {

  private String id

  private String name

  private String password

  private Date created

  private Date updated

  private int deleted

}
