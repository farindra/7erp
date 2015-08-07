<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model frontend\models\TabView */

$this->title = 'Update Tab View: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Tab Views', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id, 'view_kd' => $model->view_kd]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="tab-view-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
