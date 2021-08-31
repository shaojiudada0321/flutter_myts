package com.example.flutter_myts

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.os.Build
import android.os.IBinder
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat
import android.os.Environment
import java.io.File
import java.lang.Exception
import android.media.MediaPlayer
import com.example.flutter_myts.app.MyApplication
import com.example.flutter_myts.utils.MyTimerTask
import java.util.*


class MyService : Service() {


    override fun onCreate() {
        super.onCreate()
        val channelId =
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                createNotificationChannel("my_service", "My Background Service")
            } else {
                // If earlier version channel ID is not used
                // https://developer.android.com/reference/android/support/v4/app/NotificationCompat.Builder.html#NotificationCompat.Builder(android.content.Context)
                ""
            }

        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            val builder = NotificationCompat.Builder(this, channelId)
                .setContentText("正在后台运行")
                .setContentTitle("Flutter后台")
                .setSmallIcon(R.drawable.launch_background);
            val channel = NotificationChannel(
                "Messages",
                "Messages",
                NotificationManager.IMPORTANCE_LOW)
            val manager = getSystemService(
                NotificationManager::class.java
            )
            manager.createNotificationChannel(channel)
            startForeground(101,builder.build())
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun createNotificationChannel(channelId: String, channelName: String): String{
        val chan = NotificationChannel(channelId,
            channelName, NotificationManager.IMPORTANCE_NONE)
        chan.lightColor = Color.BLUE
        chan.lockscreenVisibility = Notification.VISIBILITY_PRIVATE
        val service = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        service.createNotificationChannel(chan)
        return channelId
    }

    override fun onBind(intent: Intent): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val period = (24 * 60 * 60 * 1000).toLong() //24小时一个周期
        //val delay = intent!!.getIntExtra("delayTime", 0)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelId = "default"
            val channel = NotificationChannel(channelId, channelId, NotificationManager.IMPORTANCE_DEFAULT)
            val nm = getSystemService(Context.NOTIFICATION_SERVICE) as? NotificationManager
            nm?.let {
                if (it.getNotificationChannel(channelId) == null) {//没有创建
                    it.createNotificationChannel(channel)//则先创建
                }
            }
            val notification: Notification
            val builder = Notification.Builder(this, channelId)
                .setContentTitle("")
                .setContentText("")
            notification = builder.build()
            startForeground(1, notification)
        }
        //startForeground(1, Notification())
        val task = MyTimerTask("Hello World!")
        Timer().schedule(task, Date(), 7000)
        return super.onStartCommand(intent, flags, startId)
    }

    @RequiresApi(Build.VERSION_CODES.O)
    fun createNotificationChannel(manager: NotificationManager){
        if (manager.getNotificationChannel("default") == null) {
            var notificationChannel =
            NotificationChannel("default",
            "notification_channel",
            NotificationManager.IMPORTANCE_LOW);

            notificationChannel.setDescription(
                "notification_channel_description");

            manager.createNotificationChannel(notificationChannel);
        }
    }

}