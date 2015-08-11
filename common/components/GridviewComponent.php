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

    public $st;
    public $stl;
    public $stf;

   /* public function init()
    {
        parent::init();
        //$this->initDefaultButtons();
    }*/


    public function statusTipe1($status,$label,$format){
      /**
       * @var adalah isi dari list grid view dan default field_nya
       * GridView::widget([
       *    ...
       * '  columns' => [
       *       ...,
       *       Yii::$app->gridview->statusTipe1('namafield','namalabel','formatrow'),
       *        ...,
       *       ],
       * ]);
       *
       * akan memberikan nilai return :
       * 1. "Aktif" jika status = 1
       * 2. "Tidak aktif" jika status <> 1
       *
       **/

       $this->st=$status;
       $this->stl=$label;
       $this->stl=$format;

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

