package org.luna.quickapp

import org.noear.solon.Solon
import org.noear.solon.annotation.SolonMain

@SolonMain
class App {
    static void main(String[] args){
        Solon.start(App.class, args)
    }
}