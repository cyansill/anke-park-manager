package org.luna.quickapp

import org.noear.solon.annotation.Controller
import org.noear.solon.annotation.Mapping
import org.noear.solon.annotation.Param
import org.noear.solon.core.handle.ModelAndView

@Controller
class DemoController {
    @Mapping("/hello")
    String hello(@Param(defaultValue = "world") String name) {
        return String.format("Hello %s!", name)
    }
    
    @Mapping("/hello2")
    ModelAndView hello2(@Param(defaultValue = "world") String name) {
        return new ModelAndView("hello2.ftl").put("name", name)
    }
}