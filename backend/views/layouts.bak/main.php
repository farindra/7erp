<?php
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use backend\assets\LteAsset;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
LteAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <link rel="shortcut icon" href="<?= '../common/image/'.'favicon.ico';?>" type="image/x-icon" />
    <?php $this->head() ?>
    
</head>
<body class="skin-blue sidebar-mini">
    <?php $this->beginBody() ?>
    <?= $content ?>


    <footer class="footer">
        <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>
        <p class="pull-right"><?= Yii::powered() ?></p>
        </div>
    </footer>

    <?php $this->endBody() ?>
</body>
<!--<script type="text/javascript">
    $( document ).ready(function() {
        $.widget.bridge('uibutton', $.ui.button);
    });
</script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>-->
</html>
<?php $this->endPage() ?>
