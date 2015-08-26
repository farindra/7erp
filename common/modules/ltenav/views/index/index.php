<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\widgets\ltenav\LteNav;
use  common\widgets\ltenav\LteNavEdit;

/* @var $this yii\web\View */
/* @var $searchModel common\modules\ltenav\models\menu\MenuSidenavSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Menu Sidenavs';

$this->params['breadcrumbs'][] = $this->title;
//$this->registerJsFile('@webroot/jquery-sortable.js');
?>

<div class="menu-sidenav-index">
    <section class="content-header">
        <h1><?= Html::encode($this->title) ?></h1>
        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

        <p>
            <?= Html::a('Create Menu Sidenav', ['create'], ['class' => 'btn btn-success']) ?>
        </p>
    </section>

    <?= $de_path;?>
    <img src="<?=$de_path;?>">
    <section class="content">

    </section>

</div>


