<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\menu\MenuSidenav */

$this->title = 'Update Menu Sidenav: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Menu Sidenavs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id, 'kd_menu' => $model->kd_menu]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="menu-sidenav-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
