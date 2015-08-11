<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\modules\settings\models\SettingsModuleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Settings';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="settings-model-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]);
      //  print_r ($searchModel);
    ?>

    <p>
        <?= Html::a('Create Settings Model', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'setting_name',
            'setting_value',
            Yii::$app->gridview->statusTipe1('status','Status','raw'),
            //'create_at',
            // 'create_by',
            // 'update_at',
            // 'update_by',

            ['class' => 'yii\grid\ActionColumn','template' => '{view} {update} {delete}'],
        ],
    ]); ?>

</div>
