package com.androiddesenv.opiniaodetudo.dialog

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import androidx.fragment.app.DialogFragment
import androidx.fragment.app.FragmentActivity
import androidx.lifecycle.ViewModelProviders
import com.androiddesenv.opiniaodetudo.R
import com.androiddesenv.opiniaodetudo.model.Review
import com.androiddesenv.opiniaodetudo.model.repository.ReviewRepository
import com.androiddesenv.opiniaodetudo.viewmodel.EditReviewViewModel

class EditDialogFragment : DialogFragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
//        setStyle(DialogFragment.STYLE_NORMAL, R.style.CustiomDialog)
        val view = inflater.inflate(R.layout.new_review_form_layout, null)
        populateView(view, activity!!)
        configureSaveButton(view, activity!!)
        return view
    }
    override fun onResume() {
        val params = dialog.window.attributes.apply {
            width = ViewGroup.LayoutParams.MATCH_PARENT
            height = ViewGroup.LayoutParams.MATCH_PARENT
        }
        dialog.window.attributes = params
        super.onResume()
    }

    private fun configureSaveButton(view: View, activity: FragmentActivity) {
        val textName = view.findViewById<EditText>(R.id.input_nome)
        val textReview = view.findViewById<EditText>(R.id.input_review)
        val button = view.findViewById<Button>(R.id.button_save)
        val viewModel = ViewModelProviders.of(activity).get(EditReviewViewModel::class.java)
        var review = viewModel.data.value!!
        button.setOnClickListener {
            val review = Review(review.id, textName.text.toString(), textReview.text.toString())
            ReviewRepository(activity.applicationContext).update(review)
            viewModel.data.value = review
        }
    }

    private fun populateView(view: View, activity: FragmentActivity?) {
        val review = ViewModelProviders.of(activity!!).get(EditReviewViewModel::class.java).data.value
        view.findViewById<EditText>(R.id.input_nome).setText(review!!.name)
        view.findViewById<EditText>(R.id.input_review).setText(review!!.review)
    }
}