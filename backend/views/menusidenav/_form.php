<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\menu\MenuSidenav */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="menu-sidenav-form">
    <?php yii\widgets\Pjax::begin(['id' => 'new_settingsModel']) ?>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'kd_menu')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nm_menu')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'jval')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'note')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'created_by')->textInput(['maxlength' => true,'visible' => 'false']) ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

    <?php yii\widgets\Pjax::end() ?>
</div>
