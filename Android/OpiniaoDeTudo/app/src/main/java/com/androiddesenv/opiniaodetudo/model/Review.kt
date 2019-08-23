package com.androiddesenv.opiniaodetudo.model

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Ignore
import androidx.room.PrimaryKey
import java.io.Serializable


@Entity
data class Review(@PrimaryKey val id: String,
                  val name: String,
                  val review: String?,
                  @ColumnInfo(name="photo_path")
                  val photoPath: String?,
                  @ColumnInfo(typeAffinity = ColumnInfo.BLOB)
                  val thumbnail: ByteArray?
) : Serializable{
    @Ignore
    constructor(id: String, name: String, review:String): this(id, name, review, null, null)
}