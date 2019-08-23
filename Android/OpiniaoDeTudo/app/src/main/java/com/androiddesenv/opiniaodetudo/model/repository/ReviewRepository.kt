package com.androiddesenv.opiniaodetudo.model.repository

import android.content.Context
import androidx.room.Delete
import com.androiddesenv.opiniaodetudo.infra.dao.ReviewDAO
import com.androiddesenv.opiniaodetudo.infra.dao.ReviewDatabase
import com.androiddesenv.opiniaodetudo.model.Review
import java.util.*

class ReviewRepository{

    private val reviewDAO: ReviewDAO

    constructor(context: Context){
        val reviewDatabase = ReviewDatabase.getInstance(context)
        reviewDAO = reviewDatabase.reviewDao()
    }

    fun save(name: String, review: String, photoPath: String?, thumbnailBytes: ByteArray?) {
        reviewDAO.save(Review(UUID.randomUUID().toString(), name, review, photoPath, thumbnailBytes))
    }

    fun listAll(): List<Review> {
        return reviewDAO.listAll()
    }

    @Delete
    fun delete(item: Review) {
        reviewDAO.delete(item)
    }

    fun update(id: String, name: String, review: String, photoPath: String?, thumbnailBytes: ByteArray?) {
        reviewDAO.update(Review(id, name, review, photoPath, thumbnailBytes))
    }
}