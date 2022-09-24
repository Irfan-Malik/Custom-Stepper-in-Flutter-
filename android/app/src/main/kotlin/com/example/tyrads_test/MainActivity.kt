package com.example.tyrads_test

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "going.native.for.stepper.data"
        ).setMethodCallHandler { call, result ->

            if(call.method == "get_stepper_data"){
                val myMap = mapOf(
                    "Select Compaign Settings" to "For each ad campaign that you create, you can control how much you're willing to spend on clicks and conversions, which networks and geographical locations you want your ads to show on, and more.",
                    "Create an ad group" to "Try to create a ad group with different ad text to see what brings in the most customers, and learn how to enhance your ads using features like ad extensions. If you run into any problems with your ads.",
                    "Create an ad" to "Try out different ad text to see what brings in the most customers, and learn how to enhance your ads using features like ad extensions. If you run into any problems with your ads, find out how to tell if they're running and how to resolve approval issues."
                )
                result.success(myMap)
            } else{
                result.notImplemented()
            }

        }
    }
}
