<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        'ltenav' => [
            'class' => 'common\modules\ltenav\LtenavModules',
            ],
    ],
    'homeUrl' => '/7erp/administrator',

    'components' => [
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'request' => [
            'baseUrl' => '/7erp/administrator',
        ],
        'urlManager' => [
            'showScriptName' => false,	// Disable index.php
            'enablePrettyUrl' => true,	// Disable r= routes
            //'enableStrictParsing' => true,

        ],

    ],
    'params' => $params,
];
