<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\TabView;

/**
 * TabViewSearch represents the model behind the search form about `frontend\models\TabView`.
 */
class TabViewSearch extends TabView
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'view_status'], 'integer'],
            [['view_kd', 'view_nm'], 'safe'],
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
        $query = TabView::find();

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
            'view_status' => $this->view_status,
        ]);

        $query->andFilterWhere(['like', 'view_kd', $this->view_kd])
            ->andFilterWhere(['like', 'view_nm', $this->view_nm]);

        return $dataProvider;
    }
}
