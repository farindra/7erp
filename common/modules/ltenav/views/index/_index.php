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
<style type="text/css">
    <?= $this->render('sortable.css');?>
</style>


<div class="menu-sidenav-index">
    <section class="content-header">
        <h1><?= Html::encode($this->title) ?></h1>
        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

        <p>
            <?= Html::a('Create Menu Sidenav', ['create'], ['class' => 'btn btn-success']) ?>
        </p>
    </section>



    <section class="content">

       <!-- <h1>Nestable</h1>

        <p>Drag &amp; drop hierarchical list with mouse and touch compatibility (jQuery plugin)</p>

        <p><strong><a href="https://github.com/dbushell/Nestable">Code on GitHub</a></strong></p>

        <p><strong>PLEASE NOTE: I cannot provide any support or guidance beyond this README. If this code helps you that's great but I have no plans to develop Nestable beyond this demo (it's not a final product and has limited functionality). I cannot reply to any requests for help.</strong></p>

    -->
      <!-- --><?php/* echo LteNavEdit::widget([
           'type' => LteNavEdit::TYPE_LIST,
           'showHandle' => true,
            'items' => [
                ['content' => 'Item # 1',
                ],
                ['content' => 'Item # 2'],
                ['content' => 'Item # 3'],
            ]
        ]);*/?>
        <menu id="nestable-menu">
            <button type="button" data-action="expand-all">Expand All</button>
            <button type="button" data-action="collapse-all">Collapse All</button>
        </menu>

        <div class="cf nestable-lists">

            <div class="dd" id="nestable">
                <ol class="dd-list">
                    <?php $x = 1;while ($x <=5){?>
                    
                    <li id="l<?=$x?>" class="dd-item" data-label="<?=$x?>" data-icon="camera-retro">
                        <div class="dd-handle"><i data-eee="monyong" id="l<?=$x?>-i<?=$x?>" class="fa fa-camera-retro fa-1x"></i><span>&nbsp;&nbsp;</span><input id="<?=$x?>" class="dd-nodrag" value="menu<?=$x?>">&nbsp;&nbsp; Link :&nbsp;&nbsp;<input id="<?=$x?>" class="dd-nodrag" value="link">

                        </div>

                    </li>
                    <?php $x++; } ?>

                    <!--<li class="dd-item" data-id="2">
                        <div class="dd-handle">Item 2</div>
                        <ol class="dd-list">
                            <li class="dd-item" data-id="3"><div class="dd-handle">Item 3</div></li>
                            <li class="dd-item" data-id="4"><div class="dd-handle">Item 4</div></li>
                            <li class="dd-item" data-id="5">
                                <div class="dd-handle">Item 5</div>
                                <ol class="dd-list">
                                    <li class="dd-item" data-id="6"><div class="dd-handle">Item 6</div></li>
                                    <li class="dd-item" data-id="7"><div class="dd-handle">Item 7</div></li>
                                    <li class="dd-item" data-id="8"><div class="dd-handle">Item 8</div></li>
                                </ol>
                            </li>
                            <li class="dd-item" data-id="9"><div class="dd-handle">Item 9</div></li>
                            <li class="dd-item" data-id="10"><div class="dd-handle">Item 10</div></li>
                        </ol>
                    </li>
                    <li class="dd-item" data-id="11">
                        <div class="dd-handle">Item 11</div>
                    </li>
                    <li class="dd-item" data-id="12">
                        <div class="dd-handle">Item 12</div>
                    </li>-->
                </ol>
            </div>

            <div class="dd hidden" id="nestable2">
                <ol class="dd-list">
                    <li class="dd-item" data-id="13">
                        <div class="dd-handle">Item 13</div>
                    </li>
                    <li class="dd-item" data-id="14">
                        <div class="dd-handle">Item 14</div>
                    </li>
                    <li class="dd-item" data-id="15">
                        <div class="dd-handle">Item 15</div>
                        <ol class="dd-list">
                            <li class="dd-item" data-id="16"><div class="dd-handle">Item 16</div></li>
                            <li class="dd-item" data-id="17"><div class="dd-handle">Item 17</div></li>
                            <li class="dd-item" data-id="18"><div class="dd-handle">Item 18</div></li>
                        </ol>
                    </li>
                </ol>
            </div>

        </div>



        <div class="cf nestable-lists hidden">

            <p><strong>Draggable Handles</strong></p>

            <p>If you're clever with your CSS and markup this can be achieved without any JavaScript changes.</p>

            <div class="dd" id="nestable3">
                <ol class="dd-list">

                    <li class="dd-item dd3-item" data-id="13">
                        <div class="dd-handle dd3-handle">Drag</div><div class="dd3-content">Item 13</div>
                    </li>
                    <li class="dd-item dd3-item" data-id="14">
                        <div class="dd-handle dd3-handle">Drag</div><div class="dd3-content">Item 14</div>
                    </li>
                    <li class="dd-item dd3-item" data-id="15">
                        <div class="dd-handle dd3-handle">Drag</div><div class="dd3-content">Item 15</div>
                        <ol class="dd-list">
                            <li class="dd-item dd3-item" data-id="16">
                                <div class="dd-handle dd3-handle">Drag</div><div class="dd3-content">Item 16</div>
                            </li>
                            <li class="dd-item dd3-item" data-id="17">
                                <div class="dd-handle dd3-handle">Drag</div><div class="dd3-content">Item 17</div>
                            </li>
                            <li class="dd-item dd3-item" data-id="18">
                                <div class="dd-handle dd3-handle">Drag</div><div class="dd3-content">Item 18</div>
                            </li>
                        </ol>
                    </li>
                </ol>
            </div>

        </div>


        <div class="cf nestable-lists">
            <p><strong>Serialised Output (per list)</strong></p>

            <textarea id="nestable-output"></textarea>
            <textarea id="nestable2-output"></textarea>
            <textarea id="nestable3-output"></textarea>

            <p>&nbsp;</p>
        </div>
        <?php /*echo GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'kd_menu',
            'nm_menu',
            'jval:ntext',
            'note:ntext',
            // 'created_by',            // 'created_at',
            // 'updated_by',
            // 'updated_at',
             'status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); */

    /*$this->registerJs("
                        $(\"ol.nav\").sortable({
                      group: 'nav',
                      nested: false,
                      vertical: false,
                      exclude: '.divider-vertical',
                      onDragStart: function($item, container, _super) {
                        $item.find('ol.dropdown-menu').sortable('disable');
                        _super($item, container);
                      },
                      onDrop: function($item, container, _super) {
                        $item.find('ol.dropdown-menu').sortable('enable');
                        _super($item, container);
                      }
                    });

                    $(\"ol.dropdown-menu\").sortable({
                      group: 'nav'
                    });", yii\web\View::POS_END, 'my-options');
    */?>

        <script type="text/javascript">
            <?= $this->render('jquery-sortable.js');?>
            sadayana();
            $(document).ready(function()
            {
                var updateOutput = function(e)
                {
                    var list   = e.length ? e : $(e.target),
                        output = list.data('output');
                    if (window.JSON) {
                        output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
                    } else {
                        output.val('JSON browser support required for this demo.');
                    }
                };

                // activate Nestable for list 1
                $('#nestable').nestable({
                    group: 1
                })
                    .on('change', updateOutput);
                // activate Nestable for list 2
                $('#nestable2').nestable({
                    group: 1
                })
                    .on('change', updateOutput);
                // activate Nestable for list 3
                $('#nestable3').nestable({
                    group: 1
                })
                    .on('change', updateOutput);
                // output initial serialised data
                updateOutput($('#nestable').data('output', $('#nestable-output')));
                updateOutput($('#nestable2').data('output', $('#nestable2-output')));
                updateOutput($('#nestable3').data('output', $('#nestable3-output')));

                $('#nestable-menu').on('click', function(e)
                {
                    var target = $(e.target),
                        action = target.data('action');
                    if (action === 'expand-all') {
                        $('.dd').nestable('expandAll');
                    }
                    if (action === 'collapse-all') {
                        $('.dd').nestable('collapseAll');
                    }
                });

                //$('#nestable3').nestable();
                var listItem = $("#l3").attr('data-icon');
                //alert( "Index: " + $( "li" ).index( listItem ) );
                alert( "Index: " + (listItem));
                $("#l3-i3").attr('class','fa fa-mobile fa-1x');




            });

            function sadayani(){


                $("#l3").attr('data-icon','fa fa-mobile fa-1x');

                var updateOutput = function(e)
                {
                    var list   = e.length ? e : $(e.target),
                        output = list.data('output');
                    if (window.JSON) {
                        output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
                        console.log(window.JSON.stringify(list.nestable('serialize')));
                    } else {
                        output.val('JSON browser support required for this demo.');
                    }
                };



                $("#l3").on('change', updateOutput);

                updateOutput($('#nestable').data('output', $('#nestable-output')));
            }
        </script>
    <button onclick=sadayani() type="button" >mantab</button>
    </section>
</div>

