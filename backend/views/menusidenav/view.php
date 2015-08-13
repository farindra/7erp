<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\menu\MenuSidenav */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Menu Sidenavs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="menu-sidenav-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id, 'kd_menu' => $model->kd_menu], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id, 'kd_menu' => $model->kd_menu], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'kd_menu',
            'nm_menu',
            'jval:ntext',
            'note:ntext',
            'created_by',
            'created_at',
            'updated_by',
            'updated_at',
            'status',
        ],
    ]) ?>

</div>
