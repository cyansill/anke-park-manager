package org.luna.quickapp.mapper

import com.baomidou.mybatisplus.core.mapper.BaseMapper
import org.apache.ibatis.annotations.Mapper
import org.luna.quickapp.model.User

@Mapper
interface UserMapper extends BaseMapper<User> {
}
