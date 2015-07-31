<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace backend\assets;

use yii\web\AssetBundle;
use yii\web\View;

class LteAsset extends AssetBundle
{
    public $sourcePath = '@bower/';
    public $css =
        [
            'admin-lte/dist/css/AdminLTE.min.css',
            'admin-lte/bootstrap/css/bootstrap.min.css',
            'https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css',
            'admin-lte/dist/css/skins/_all-skins.min.css',
            'admin-lte/plugins/iCheck/flat/blue.css',
            'admin-lte/plugins/morris/morris.css',
            'admin-lte/plugins/jvectormap/jquery-jvectormap-1.2.2.css',
            'admin-lte/plugins/datepicker/datepicker3.css',
            'admin-lte/plugins/daterangepicker/daterangepicker-bs3.css',
            'admin-lte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css',

        ];
    public $js =
        [
            'admin-lte/plugins/jQuery/jQuery-2.1.4.min.js',
            'https://code.jquery.com/ui/1.11.4/jquery-ui.min.js',
            //'admin-lte/dist/js/app.js',
            'admin-lte/bootstrap/js/bootstrap.min.js',
            'https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js',
            'admin-lte/plugins/morris/morris.min.js',
            'admin-lte/plugins/sparkline/jquery.sparkline.min.js',
            'admin-lte/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js',
            'admin-lte/plugins/jvectormap/jquery-jvectormap-world-mill-en.js',
            'admin-lte/plugins/knob/jquery.knob.js',
            'https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js',
            'admin-lte/plugins/daterangepicker/daterangepicker.js',
            'admin-lte/plugins/datepicker/bootstrap-datepicker.js',
            'admin-lte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js',
            'admin-lte/plugins/slimScroll/jquery.slimscroll.min.js',
            'admin-lte/plugins/fastclick/fastclick.min.js',
            'admin-lte/dist/js/app.min.js',
            'admin-lte/dist/js/pages/dashboard.js',
            'admin-lte/dist/js/demo.js',
        ];
    public $jsOptions =
        ['position' => View::POS_END,];
    public $depends = [
        'yii\web\YiiAsset',
        //'yii\bootstrap\BootstrapAsset',
        //'yii\bootstrap\BootstrapPluginAsset',
    ];
}
