package org.luna.quickapp.config

import org.noear.solon.annotation.Bean
import org.noear.solon.annotation.Configuration
import org.noear.solon.annotation.Inject
import org.noear.solon.cache.redisson.RedissonClientOriginalSupplier
import org.redisson.api.RedissonClient

@Configuration
class RedissonConfiguration {

  @Bean
  public RedissonClient redissonClient(@Inject("${redis.ds}") RedissonClientOriginalSupplier supplier) {
    return supplier.get()
  }

}
