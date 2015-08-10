<?php
return [
    'modules' => [
        'admin' => [
                'class' => 'mdm\admin\Module',
                'layout' => 'left-menu',
                'controllerMap' => [
                    'assignment' => [
                        'class' => 'mdm\admin\controllers\AssignmentController',
                        /* 'userClassName' => 'app\models\User', */ // fully qualified class name of your User model
                        // Usually you don't need to specify it explicitly, since the module will detect it automatically
                        'idField' => 'id',        // id field of your User model that corresponds to Yii::$app->user->id
                        'usernameField' => 'username', // username field of your User model
                        //'searchClass' => 'app\models\UserSearch'    // fully qualified class name of your User model for searching
                    ]
                ],
            'menus' => [
                'assignment' => [
                    'label' => 'Grand Access' // change label
                ],
                //'route' => null, // disable menu route
            ]
        ],
        'settings' => [
            'class' => 'common\modules\settings\SettingsModule',
        ],
     ],
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
            'defaultRoles' => ['Guest']
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'formatter' => [
            'locale' => 'id-ID',
            'timeZone' => 'Asia/Jakarta',
            'dateFormat' => 'yyyy-MM-d',
            'decimalSeparator' => ',',
            'thousandSeparator' => '.',
            'currencyCode' => 'Rp ',
        ],
        'as access' => [
            'class' => 'mdm\admin\components\AccessControl',
            'allowActions' => [
                //'*',
                'site/*',
                'admin/*',
                //'some-controller/some-action',
                // The actions listed here will be allowed to everyone including guests.
                // So, 'admin/*' should not appear here in the production, of course.
                // But in the earlier stages of your development, you may probably want to
                // add a lot of actions here until you finally completed setting up rbac,
                // otherwise you may not even take a first step.
            ]
        ],
        'testcode' => [
            'class' =>'common\components\TestcodeComponent'

        ],
        'cekbau' => [
            'class' =>'common\components\CeksessionComponent'

        ]
    ],

    'aliases' => [
        '@mdm/admin' => '@vendor/mdmsoft/yii2-admin',
        ],


];
