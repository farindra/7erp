<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\modules\settings\models\SettingsModel */
/* @var $form yii\widgets\ActiveForm */

$this->registerJs(
    '$("document").ready(function(){
         $("#new_settingsModel").on("pjax:end", function() {
             $.pjax.reload({container:"#settingsModel"});  //Reload GridView
         });
     });'
);
?>

<div class="settings-model-form">
    <?php yii\widgets\Pjax::begin(['id' => 'new_settingsModel']) ?>

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'setting_name')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'setting_value')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'status')->textInput() ?>

        <?= $form->field($model, 'create_at')->textInput(['type'=>'hidden'])->label(false) ?>

        <?= $form->field($model, 'create_by')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'update_at')->textInput() ?>

        <?= $form->field($model, 'update_by')->textInput(['maxlength' => true]) ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>



    <?php yii\widgets\Pjax::end() ?>
</div>
