<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\modules\ltenav\models\menu\MenuSidenav */

$this->title = 'Create Menu Sidenav';
$this->params['breadcrumbs'][] = ['label' => 'Menu Sidenavs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="menu-sidenav-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
