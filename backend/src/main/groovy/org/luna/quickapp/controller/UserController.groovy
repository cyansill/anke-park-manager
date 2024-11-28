package org.luna.quickapp.controller

import org.luna.quickapp.model.Message
import org.luna.quickapp.service.UserService
import org.noear.solon.annotation.Controller
import org.noear.solon.annotation.Inject
import org.noear.solon.annotation.Mapping
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Controller
@Mapping("/user")
class UserController {

  static Logger log = LoggerFactory.getLogger(UserController.class)

  @Inject("userService")
  UserService userService

  @Mapping("/")
  Message all() {
    List list = userService.list()
    Map map = Collections.singletonMap("list", list)
    Message message = new Message()
    message.setProperty("code", 200)
    message.setProperty("data", map)
    return message
  }

}
