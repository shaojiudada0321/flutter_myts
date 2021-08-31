package com.example.flutter_myts.app

import android.app.Application
import android.content.Context

public class MyApplication: Application() {
    companion object {
        var  _context:Application? = null
        fun getContext():Context{
            return _context!!
        }

    }

    override fun onCreate() {
        super.onCreate()
        _context = this
    }

}