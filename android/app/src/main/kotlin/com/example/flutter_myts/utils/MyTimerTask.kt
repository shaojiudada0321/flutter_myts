package com.example.flutter_myts.utils

import android.media.MediaPlayer
import java.util.*

class MyTimerTask(val str:String) : TimerTask() {
    override fun run() {
        println(str)
        MediaPlayerUtil.initMediaPlayer("arrival.mp3")
    }
}
