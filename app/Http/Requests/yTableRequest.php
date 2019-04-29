<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class yTableRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function messages()
    {
        return [
            'table.required' => 'Table is required',
            'cols.required'  => "Column array is required Sample </br>[
                {
                    column:'id', //required
                    name:'ID', //optional
                },
                {
                    column:'name',  //required
                    alias:'user_name', //optional
                    name:'Name', //optional
                }
            ]",
        ];
    }
    public function rules()
    {
        return [
            'table' => 'required',
            'cols'=>'required',
            'uniqueCol'=>'required'
        ];
    }
}
