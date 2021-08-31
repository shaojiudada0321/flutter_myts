package com.example.flutter_myts.utils

import android.media.AudioAttributes
import android.media.AudioManager
import android.media.MediaPlayer
import android.media.SoundPool
import android.os.Build
import android.os.Environment
import com.example.flutter_myts.R
import com.example.flutter_myts.app.MyApplication
import java.io.File
import java.lang.Exception

object MediaPlayerUtil {

    //lateinit var soundPool: SoundPool
    //lateinit var soundThread: SoundThread

    lateinit var mediaPlayer: MediaPlayer

    fun initMediaPlayer(mp3Name: String) {
        try {
            mediaPlayer = MediaPlayer.create(MyApplication.getContext(),R.raw.arrival)
            //val file = File(Environment.getExternalStorageDirectory(), mp3Name)
            //mediaPlayer.setDataSource(file.getPath()) //指定音频文件路径
            //mediaPlayer.setLooping(true) //设置为循环播放
            //mediaPlayer.prepare() //初始化播放器MediaPlayer
            mediaPlayer.start()

        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

//    fun init() {
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
//
//            //AudioAttributes是一个封装音频各种属性的类
//            val attrBuilder = AudioAttributes.Builder()
//            //设置音频流的合适属性
//            attrBuilder.setLegacyStreamType(AudioManager.STREAM_MUSIC)
//            this.soundPool = SoundPool
//                .Builder()
//                .setAudioAttributes(attrBuilder.build())
//                .setMaxStreams(10)
//                .build()
//        } else {
//            this.soundPool = SoundPool(1, AudioManager.STREAM_SYSTEM, 5)
//        }
//        soundList.forEach { key -> soundList[key.key] = loadRes(key.key) }
//        soundThread = SoundThread(soundPool)
//        soundThread.start()
//
//        this.soundPool.setOnLoadCompleteListener { soundPool, sampleId, status ->
//            isLoad = true
//        }
//
//    }
}