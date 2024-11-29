package org.luna.quickapp.controller

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper
import org.luna.quickapp.model.Message
import org.luna.quickapp.model.User
import org.luna.quickapp.service.UserService
import org.noear.solon.annotation.Body
import org.noear.solon.annotation.Controller
import org.noear.solon.annotation.Inject
import org.noear.solon.annotation.Mapping
import org.noear.solon.core.handle.MethodType
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
    Message message = new Message(code: 200, data: map)
    return message
  }

  @Mapping(method = [ MethodType.POST ], value = "/auth")
  Message auth(@Body Map reqBody) {
    log.debug("the request body is ${reqBody}")
    if (!reqBody.containsKey("name") || !reqBody.containsKey("password")) {
      return new Message(code: 400, data: Collections.singletonMap("cause", "name or password is required"))
    }
    String name = reqBody.get("name")
    String password = reqBody.get("password")
    QueryWrapper wrapper = new QueryWrapper()
    wrapper.eq("name", name)
    wrapper.eq("password", password)
    Optional<User> user = userService.list(wrapper).stream().findAny()
    if (!user.isPresent()) {
      return new Message(code: 401, data: Collections.singletonMap("cause", "user not found or password is wrong"))
    }
    
    return new Message(code: 200, data: null)
  }

  @Mapping(method = [ MethodType.POST ], value = "/register")
  Message register() {

  }

}
