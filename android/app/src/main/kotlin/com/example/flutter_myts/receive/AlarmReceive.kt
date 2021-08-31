package com.example.flutter_myts.receive

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.example.flutter_myts.services.AlarmService

class AlarmReceive: BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        //循环启动Service
        val i = Intent(context, AlarmService::class.java)
        context!!.startService(i)
    }
}