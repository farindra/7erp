<?php

use yii\helpers\Html;
use yii\grid\GridView;


/* @var $this yii\web\View */
/* @var $searchModel frontend\models\TabViewSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Tab Views';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tab-view-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php $btn_create=' disabled' // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Tab View', ['create'], ['class' => 'btn btn-success'.$btn_create]) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'view_kd',
            'view_nm',
            'view_status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); $testcode= Yii::$app->testcode; $testcode->belajar()?>

    <?= '</br>'?>
</div>
