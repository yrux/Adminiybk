<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class yTabletable_notesRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function messages()
    {
        return [
            
        ];
    }
    public function rules()
    {
        return [
            
        ];
    }
}