<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\modules\ltenav\models\menu\MenuSidenav */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="menu-sidenav-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'kd_menu')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nm_menu')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'jval')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'note')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'status')->checkbox(['label'=>'Aktif']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?= $form->field($model, 'created_by')->textInput(['maxlength' => true,'type' => 'hidden'])->label('') ?>

    <?= $form->field($model, 'created_at')->textInput(['type' => 'hidden'])->label('') ?>

    <?= $form->field($model, 'updated_by')->textInput(['maxlength' => true,'type' => 'hidden'])->label('') ?>

    <?= $form->field($model, 'updated_at')->textInput(['type' => 'hidden'])->label('') ?>

    <?php ActiveForm::end(); ?>

</div>
