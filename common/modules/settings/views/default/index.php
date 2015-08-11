<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\modules\settings\models\SettingsModuleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Settings';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="settings-model-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]);
      //  print_r ($searchModel);
    ?>

    <p>
        <?= Html::a('Create Settings Model', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'setting_name',
            'setting_value',
            'status'=>
            //'keterangan',
            [
                'label' => "Status",
                'format' => 'raw',
                'value' => function($status)
                    {
                        if($status->status==1) {
                            $statusnya='<span class="label label-info">'.'Aktif'.'</span>';
                        }else{
                            $statusnya='<span class="label label-danger">'.'Tidak Aktif'.'</span>';
                        }
                        return $statusnya;//Html::label($statusnya,['class'=>'label label-info']);//. $statusnya; //Html::checkbox('chk1', true, ["page/update", "id" => $data->id]);

                    },
            ],



            //'create_at',
            // 'create_by',
            // 'update_at',
            // 'update_by',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
