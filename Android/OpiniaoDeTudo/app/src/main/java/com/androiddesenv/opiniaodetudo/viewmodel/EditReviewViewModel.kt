package com.androiddesenv.opiniaodetudo.viewmodel

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.androiddesenv.opiniaodetudo.model.Review

class EditReviewViewModel : ViewModel() {
    var data: MutableLiveData<Review> = MutableLiveData()
}