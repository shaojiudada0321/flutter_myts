package com.example.flutter_myts.services

import android.content.Context
import android.util.Log
import androidx.work.Worker
import androidx.work.WorkerParameters
import com.example.flutter_myts.utils.MediaPlayerUtil
import com.example.flutter_myts.utils.MyTimerTask
import java.util.*

class myWork(context: Context, workerParams: WorkerParameters) : Worker(context, workerParams) {

    val TAG = javaClass.simpleName

    override fun doWork(): Result {
        //val name = inputData.getString("input_data")
        //Log.d("myWork","myWorK Success Name:$name")
        MediaPlayerUtil.initMediaPlayer("arrival.mp3")
//        val task = MyTimerTask("Hello World!$name")
//        Timer().schedule(task, Date(), 7000)
        val A = inputData.getInt("A",0)
        val B = inputData.getString("B")
        Log.d("myWork","A:$A,B:$B")
        return Result.success()
    }

    
}