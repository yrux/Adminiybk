<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class yTableadminiyRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function messages()
    {
        return [
            'email.required' => 'Email is Required',
            'email.email' => 'Email should be a valid email address',
            'name.required' => 'Name is Required',
        ];
    }
    public function rules()
    {
        return [
            'email' => 'required|email|max:255',
            'name'=>'required|max:255',
        ];
    }
}
