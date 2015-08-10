<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace backend\assets;

use yii\web\AssetBundle;
use yii\web\View;

class Lte_dashboardAsset extends AssetBundle
{
   public $sourcePath = '@bower/';
   public $baseUrl = '@web';
    public $css =
        [

        ];
    public $js =
        [
            'admin-lte/dist/js/pages/dashboard.js',
        ];
    public $jsOptions =
        ['position' => View::POS_END,];
    public $depends = [

    ];
}
