package com.androiddesenv.opiniaodetudo.fragment

import android.content.Intent
import android.os.Bundle
import android.preference.Preference
import android.widget.Toast
import androidx.preference.PreferenceFragmentCompat
import com.androiddesenv.opiniaodetudo.AboutActivity
import com.androiddesenv.opiniaodetudo.MainActivity
import com.androiddesenv.opiniaodetudo.R

class SettingsFragment : PreferenceFragmentCompat() {
    companion object {
        const val NIGHT_MODE_PREF = "night_mode_pref"
        const val ABOUT = "about"
    }
    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        setPreferencesFromResource(R.xml.preferences, rootKey)
        configNightMode()
        configAbout()
    }
    private fun configNightMode() {
        val preference = preferenceManager.findPreference(NIGHT_MODE_PREF)
        preference.setOnPreferenceChangeListener { preference, newValue ->
            (activity as MainActivity).setNightMode()
            true
        }
    }

    private fun configAbout() {
        val preference = preferenceManager.findPreference(ABOUT)
        preference.setOnPreferenceClickListener {
            val intent = Intent(activity!!, AboutActivity::class.java)
            startActivity(intent)
            true
        }
    }
}