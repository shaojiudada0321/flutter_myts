package com.example.flutter_myts

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.RequiresApi
import androidx.work.*
import com.example.flutter_myts.services.myWork
import com.example.flutter_myts.utils.Data.MIN_PERIODIC_INTERVAL_MILLIS
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.TimeUnit
import androidx.work.NetworkType




class MainActivity: FlutterActivity() {

    private var serviceIntent: Intent? = null

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine);//相当于GeneratedPluginRegistrant.registerWith(this)
        serviceIntent = Intent(this, MyService::class.java)
        MethodChannel(flutterEngine?.getDartExecutor(), "com.example.flutter_myts")
            .setMethodCallHandler { methodCall, result ->
                if (methodCall.method == "startService") {
                    startService()
                    //startWorkService()
                    result.success("workManager服务已启动")
                }
            }
    }

    override fun onDestroy() {
        super.onDestroy()
        stopService(serviceIntent)
    }

    @SuppressLint("RestrictedApi")
    private fun startWorkService(){
        // 单次请求任务
//        val request = OneTimeWorkRequest.Builder(myWork::class.java)
//            .addTag("simple")
//            //.setBackoffCriteria(BackoffPolicy.LINEAR,10, TimeUnit.MINUTES)
//            .build()

        // 周期性请求任务
//        val requestTime = PeriodicWorkRequest.Builder(myWork::class.java,5,
//            TimeUnit.SECONDS)
//            .setInputData(workDataOf(Pair("input_data","xu")))
//            .build()
//        WorkManager.getInstance(applicationContext).enqueue(requestTime)

        // 构造 Constraints 对象，用于指定任务触发的约束条件
        val constraints = Constraints.Builder()
            .setRequiresCharging(false) // 是否需要处于充电状态
            .setRequiredNetworkType(NetworkType.METERED) // 是否需要处于网络连接状态
            .setRequiresBatteryNotLow(false) // 是否需要处于非低电量状态
            //.setRequiresDeviceIdle(false) // 是否需要处于系统空闲状态（api level 23 或以上）
            .build()
//        if (android.os.Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
//            //constraints.setRequiresDeviceIdle(true) // 在待机状态下执行，需要 API 23
//        }else{ }
//        val workRequest =  PeriodicWorkRequest.Builder(myWork::class.java,15,TimeUnit.MINUTES)
//            .setConstraints(constraints)
//            .setInputData(workDataOf(Pair("input_data","xu")))
//            //.setInitialDelay(5,TimeUnit.SECONDS)
//            .build();
//        WorkManager.getInstance(applicationContext).enqueue(workRequest)
        //WorkManager.getInstance().enqueue(workRequest);

        val data=Data.Builder()
            .putInt("A",1)
            .putString("B","2")
            .build()
        if (android.os.Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            constraints.setRequiresDeviceIdle(true) // 在待机状态下执行，需要 API 23
        }else{ }
        val workRequest =  PeriodicWorkRequest.Builder(myWork::class.java,15,TimeUnit.MINUTES)
            .setConstraints(constraints)
            .setInputData(data)
            //.setInitialDelay(5,TimeUnit.SECONDS)
            .build();
//        val request2 = PeriodicWorkRequestBuilder<myWork>(15,TimeUnit.SECONDS)
//            .setInputData(data)
//            .build()
        WorkManager.getInstance(applicationContext).enqueue(workRequest)
    }

    private fun startService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(serviceIntent)
        } else {
            startService(serviceIntent)
        }
    }
}
