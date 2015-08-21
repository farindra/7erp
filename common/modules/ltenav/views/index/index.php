<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\modules\ltenav\models\menu\MenuSidenavSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Menu Sidenavs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="menu-sidenav-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Menu Sidenav', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'kd_menu',
            'nm_menu',
            'jval:ntext',
            'note:ntext',
            // 'created_by',
            // 'created_at',
            // 'updated_by',
            // 'updated_at',
            // 'status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
