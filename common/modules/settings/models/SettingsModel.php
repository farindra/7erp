<?php
/**
 * create by : maseka
 * github.com/farindra
 **/
namespace common\modules\settings\models;

use Yii;

/**
 * This is the model class for table "settings".
 *
 * @property integer $id
 * @property string $setting_name
 * @property string $setting_value
 * @property integer $status
 * @property string $create_at
 * @property string $create_by
 * @property string $update_at
 * @property string $update_by
 */
class SettingsModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $keterangan;
    public static function tableName()
    {
        return 'settings';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['setting_name', 'setting_value'], 'required'],
            [['status'], 'integer'],
            [['create_at', 'update_at'], 'safe'],
            [['setting_name', 'setting_value', 'create_by', 'update_by','keterangan'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'setting_name' => 'Setting Name',
            'setting_value' => 'Setting Value',
            'status' => 'Status',
            'create_at' => 'Create At',
            'create_by' => 'Create By',
            'update_at' => 'Update At',
            'update_by' => 'Update By',
        ];
    }
}
