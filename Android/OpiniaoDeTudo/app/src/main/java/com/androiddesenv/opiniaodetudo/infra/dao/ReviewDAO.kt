package com.androiddesenv.opiniaodetudo.infra.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query
import com.androiddesenv.opiniaodetudo.model.Review

@Dao
interface ReviewDAO {

    @Insert
    fun save(review:Review)

    @Query("SELECT * from ${ReviewTableInfo.TABLE_NAME}")
    fun listAll():List<Review>

    @Delete
    fun delete(item: Review)
}
