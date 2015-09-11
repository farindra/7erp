<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tester".
 *
 * @property integer $id
 * @property string $nama
 * @property integer $notlp
 */
class Tester extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tester';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['notlp'], 'integer'],
            [['nama'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nama' => 'Nama',
            'notlp' => 'Notlp',
        ];
    }
}
