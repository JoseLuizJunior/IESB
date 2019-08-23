package com.androiddesenv.opiniaodetudo

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.androiddesenv.opiniaodetudo.fragment.ListFragment


class AboutActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.about_activity)
    }


    override fun onSupportNavigateUp(): Boolean {
        finish()
        return true
    }

}

