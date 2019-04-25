<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class yTableinquiryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'inquiries_phone'=>'required|max:255',
            'inquiries_email'=>'required|email',
            'inquiries_name'=>'required|max:255',
            'inquiries_lname'=>'required|max:255',
        ];
    }
}
