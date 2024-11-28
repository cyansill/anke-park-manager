package org.luna.quickapp.model

import com.alibaba.fastjson.JSON

class Message {

  private Integer code

  private Map data

  Message() {}

  Message(Integer code, Map data) {
    this.code = code
    this.data = data
  }

  @Override
  String toString() {
    return "Message[code='${code}';data='${JSON.toJSONString(data)}']"
  }

}
