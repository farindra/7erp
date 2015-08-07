<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "tab_view".
 *
 * @property integer $id
 * @property string $view_kd
 * @property string $view_nm
 * @property integer $view_status
 */
class TabView extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tab_view';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['view_kd'], 'required'],
            [['view_status'], 'integer'],
            [['view_kd', 'view_nm'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'view_kd' => 'View Kd',
            'view_nm' => 'View Nm',
            'view_status' => 'View Status',
        ];
    }
}
