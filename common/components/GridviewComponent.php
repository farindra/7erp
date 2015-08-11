<?php
/**
 * Created by Maseka.
 * Date: 8/7/15
 * Time: 3:44 PM
 */

namespace common\components;


use yii\base\Component;
use yii\helpers\Html;

class GridviewComponent extends Component {
    /**
     * @var adalah isi dari list grid view dan default field_nya
     * ON MAIN CONFIG
     * ============================================================================
     * 'components' => [
     *       ...,
     *      'gridview' => [
     *                        'class' =>'common\components\GridviewComponent'
     *                    ],
     *
     **/

    public $st;
   
   /* public function init()
    {
        parent::init();
        //$this->initDefaultButtons();
    }*/


    public function statusTipe1($field,$label,$format){
      /**
       * @var $field=target field, $label=label grid, $format=tipe data output
       *
       * ON VIEW
       * ============================================================================
       * GridView::widget([
       *    ...
       * '  columns' => [
       *       ...,
       *       Yii::$app->gridview->statusTipe1('namafield','namalabel','formatraw'),
       *        ...,
       *       ],
       * ]);
       *
       * akan memberikan nilai return :
       * 1. "Aktif" jika status = 1
       * 2. "Tidak aktif" jika status <> 1
       *
       **/

       $this->st=$field;
       
        $de_array=['label' => $label,'format' => $format,'value' =>
            function ($data){
                $sts=$this->st;
                if($data->$sts ==1) {
                    $statusnya=Html::label('Aktif', null, ['class' => 'label label-info']);
                }else{
                    $statusnya=Html::label('Tidak Aktif', null, ['class' => 'label label-danger']);
                }
                return $statusnya;
            } ];

        return $de_array;
    }


}

