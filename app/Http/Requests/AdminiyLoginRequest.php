<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Model\Adminiy;

class AdminiyLoginRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function messages()
    {
        return [
            'email.exists'=>'Email does not exist',
        ];
    }
    public function rules()
    {
        return [
            'email' => 'email|required|exists:adminiy',
        ];
    }
}
