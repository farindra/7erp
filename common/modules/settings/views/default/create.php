<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\modules\settings\models\SettingsModel */

$this->title = 'Create Settings Model';
$this->params['breadcrumbs'][] = ['label' => 'Settings Models', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="settings-model-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
