<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'doc_id',
        'category',
        'patients',
        'experience',
        'bio_data',
        'status',
    ];

    public function doctor(){
        return $this->hasOne(Doctor::class, 'doc_id');
    }
    public function user_detail(){
        return $this->hasOne(Doctor::class, 'user_id');
    }


}
