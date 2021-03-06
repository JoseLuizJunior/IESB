package com.androiddesenv.opiniaodetudo.infra.dao

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

class ReviewDBHelper(context: Context) : SQLiteOpenHelper(context, DATABASE_NAME, null, DATABSE_VERSION) {

    companion object {
        const val DATABASE_NAME = "review_database"
        const val DATABSE_VERSION = 1
    }


    override fun onCreate(db: SQLiteDatabase?) {
        db?.execSQL("CREATE TABLE ${ReviewTableInfo.TABLE_NAME} (" +
                "${ReviewTableInfo.COLUMN_ID} TEXT PRIMARY KEY, " +
                "${ReviewTableInfo.COLUMN_NAME} TEXTE NOT NULL, " +
                "${ReviewTableInfo.COLUMN_REVIEW} TEXT" +
                ")"
        )
    }

    override fun onUpgrade(db: SQLiteDatabase?, oldVersion: Int, newVersion: Int) {
        onCreate(db)
    }

}

