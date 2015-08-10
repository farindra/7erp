<?php
/**
 * create by : maseka
 * github.com/farindra
 **/
namespace common\modules\settings\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\modules\settings\models\SettingsModel;

/**
 * SettingsModuleSearch represents the model behind the search form about `common\modules\settings\models\SettingsModel`.
 */
class SettingsModuleSearch extends SettingsModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'status'], 'integer'],
            [['setting_name', 'setting_value', 'create_at', 'create_by', 'update_at', 'update_by', 'keterangan'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = SettingsModel::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'status' => $this->status,
            'create_at' => $this->create_at,
            'update_at' => $this->update_at,
            'keterangan' => $this->keterangan,
        ]);

        $query->andFilterWhere(['like', 'setting_name', $this->setting_name])
            ->andFilterWhere(['like', 'setting_value', $this->setting_value])
            ->andFilterWhere(['like', 'create_by', $this->create_by])
            ->andFilterWhere(['like', 'update_by', $this->update_by])
            ->andFilterWhere(['like', 'keterangan', $this->keterangan]);

        //print_r($dataProvider);
        return $dataProvider;
    }
}
