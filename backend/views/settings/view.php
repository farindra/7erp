<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\modules\settings\models\SettingsModel */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Settings Models', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="settings-model-view">
    <section class="content-header">
        <h1>
           <?= Html::encode($this->title) ?>
        </h1>
        <ol class="breadcrumb">
            <!--<li><a href="../administrator/site/"><i class="fa fa-close"></i> Home</a></li>-->
           <!-- <li class="active">...</li>-->
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">


    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
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
            'setting_name',
            'setting_value',
            'status',
            'create_at',
            'create_by',
            'update_at',
            'update_by',
        ],
    ]) ?>

</div>
