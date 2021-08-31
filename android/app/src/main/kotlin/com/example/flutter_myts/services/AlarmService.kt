package com.example.flutter_myts.services

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.app.AlarmManager

import android.app.PendingIntent

import android.os.SystemClock
import android.util.Log
import com.example.flutter_myts.receive.AlarmReceive
import java.lang.UnsupportedOperationException


class AlarmService: Service() {
    /**
     * 每1分钟更新一次数据
     */
    private val ONE_Miniute = 60 * 1000
    private val PENDING_REQUEST = 0

    fun AlarmService() {}

    /**
     * 调用Service都会执行到该方法
     */
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {

        //这里模拟后台操作
        Thread { Log.e("wj", "循环执行了，哈哈." + System.currentTimeMillis()) }.start()

        //通过AlarmManager定时启动广播
        val alarmManager = getSystemService(ALARM_SERVICE) as AlarmManager
        val triggerAtTime =
            SystemClock.elapsedRealtime() + ONE_Miniute //从开机到现在的毫秒书（手机睡眠(sleep)的时间也包括在内
        val i = Intent(this, AlarmReceive::class.java)
        val pIntent = PendingIntent.getBroadcast(this, PENDING_REQUEST, i, PENDING_REQUEST)
        alarmManager[AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAtTime] = pIntent
        return super.onStartCommand(intent, flags, startId)
    }

    override fun onBind(intent: Intent?): IBinder? {
        // TODO: Return the communication channel to the service.
        throw UnsupportedOperationException("Not yet implemented")
    }
}