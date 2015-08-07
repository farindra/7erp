<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\TabView */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="tab-view-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'view_kd')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'view_nm')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'view_status')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
