<?php

namespace common\models\menu;

use Yii;

/**
 * This is the model class for table "menu_sidenav".
 *
 * @property string $id
 * @property string $kd_menu
 * @property string $nm_menu
 * @property string $jval
 * @property string $note
 * @property string $created_by
 * @property string $created_at
 * @property string $updated_by
 * @property string $updated_at
 * @property integer $status
 */
class MenuSidenav extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'menu_sidenav';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['kd_menu', 'nm_menu'], 'required'],
            [['jval', 'note'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['status'], 'integer'],
            [['kd_menu'], 'string', 'max' => 50],
            [['nm_menu'], 'string', 'max' => 200],
            [['created_by', 'updated_by'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'kd_menu' => 'Kd Menu',
            'nm_menu' => 'Nm Menu',
            'jval' => 'Jval',
            'note' => 'Note',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'updated_by' => 'Updated By',
            'updated_at' => 'Updated At',
            'status' => 'Status',
        ];
    }

    /**
     * @inheritdoc
     * @return MenuSidenavQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MenuSidenavQuery(get_called_class());
    }
}
