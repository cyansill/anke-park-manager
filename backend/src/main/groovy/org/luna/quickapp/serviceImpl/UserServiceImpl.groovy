package org.luna.quickapp.serviceImpl

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl
import org.luna.quickapp.mapper.UserMapper
import org.luna.quickapp.model.User
import org.luna.quickapp.service.UserService
import org.noear.solon.annotation.Component

@Component(name = "userService")
class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
