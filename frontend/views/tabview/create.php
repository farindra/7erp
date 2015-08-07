<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\TabView */

$this->title = 'Create Tab View';
$this->params['breadcrumbs'][] = ['label' => 'Tab Views', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tab-view-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
