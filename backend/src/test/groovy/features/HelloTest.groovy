package features

import org.luna.quickapp.App

import org.junit.jupiter.api.Test

import org.noear.solon.test.HttpTester
import org.noear.solon.test.SolonTest

@SolonTest(App.class)
class HelloTest extends HttpTester {
    @Test
    void hello() throws IOException {
        assert path("/hello?name=world").get().contains("world")
        assert path("/hello?name=solon").get().contains("solon")
    }
}