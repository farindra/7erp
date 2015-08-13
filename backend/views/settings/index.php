<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
/* @var $this yii\web\View */
/* @var $searchModel common\modules\settings\models\SettingsModuleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Settings';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="settings-model-index">
    <section class="content-header">
        <h1>
            Settings
            <small>Variable</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="../administrator/site/"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Settings</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <h1><?= Html::encode($this->title) ?></h1>
        <?php // echo $this->render('_search', ['model' => $searchModel]);
          //  print_r ($searchModel);
        ?>

        <p>
            <?= Html::a('Create Settings Model', ['create'], ['class' => 'btn btn-success']) ?>
        </p>
        <!-- Render create form -->
        <?= $this->render('_form', [
            'model' => $model,
        ]) ?>


        <?php Pjax::begin(['id' => 'settingsModel']) ?>
        <?= GridView::widget([
            'id'=> 'training-grid',
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],

                //'id',
                'setting_name',
                'setting_value',
                 [
                    'attribute' => 'status',
                    'format' => 'raw',
                    'value' => function ($model, $index, $widget) {
                            return Html::checkbox('foo[]', $model->status, ['value' => $index, 'disabled' => true]);
                        },
                ],
                Yii::$app->gridview->statusTipe1('status','Status','raw'),
                [
                    'header' => 'Jumlah Employee',
                    'format'=>'raw',
                    'value' => function ($data){
                                return  Html::a('detail',['view','id'=>$data->id],[
                                'data-toggle'=>"modal",
                                'data-target'=>"#myModal",
                                'data-title'=>"Detail Data",
                            ]); // ubah ini
                            }
                ],
                //'create_at',
                // 'create_by',
                // 'update_at',
                // 'update_by',

                ['class' => 'yii\grid\ActionColumn','template' => '{view} {update} {delete}'],
            ],
        ]);
            /*$this->registerJs('refreshGridView', "
                setInterval(\"$.fn.yiiGridView.update('training-grid')\",5000);
            ");*/



            /*Yii::app()->clientScript->registerScript('autoRefreshGridView', "
             var totalPage=".$pageCount.";
             var currentPage = 1;
             setInterval(
             function(){
             currentPage=currentPage+1;
             if(currentPage>totalPage) currentPage=1;
             $.fn.yiiGridView.update('training-grid',{url:'".$this->createUrl('training/index')."&Training_page='+currentPage+'&ajax=training-grid'}); },
             5000);
            ");*/


        ?>
        <?php Pjax::end();



        ?>


    </section>   
    
</div>
<?php
$this->registerJs("
    $('#myModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var modal = $(this)
        var title = button.data('title')
        var href = button.attr('href')

        modal.find('.modal-title').html(title)
        modal.find('.modal-body').html('<i class=\"fa fa-spinner fa-spin\"></i>')

        $.post(href)
        .done(function( data ) {
            modal.find('.modal-body').html(data+'bapa')

        });
    })
");
?>