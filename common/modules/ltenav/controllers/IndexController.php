<?php

namespace common\modules\ltenav\controllers;

use Yii;
use common\modules\ltenav\models\menu\MenuSidenav;
use common\modules\ltenav\models\menu\MenuSidenavSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * LtenavController implements the CRUD actions for MenuSidenav model.
 */
class IndexController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all MenuSidenav models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new MenuSidenavSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single MenuSidenav model.
     * @param string $id
     * @param string $kd_menu
     * @return mixed
     */
    public function actionView($id, $kd_menu)
    {
        return $this->render('view', [
            'model' => $this->findModel($id, $kd_menu),
        ]);
    }

    /**
     * Creates a new MenuSidenav model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new MenuSidenav();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id, 'kd_menu' => $model->kd_menu]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing MenuSidenav model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @param string $kd_menu
     * @return mixed
     */
    public function actionUpdate($id, $kd_menu)
    {
        $model = $this->findModel($id, $kd_menu);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id, 'kd_menu' => $model->kd_menu]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing MenuSidenav model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @param string $kd_menu
     * @return mixed
     */
    public function actionDelete($id, $kd_menu)
    {
        $this->findModel($id, $kd_menu)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the MenuSidenav model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @param string $kd_menu
     * @return MenuSidenav the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $kd_menu)
    {
        if (($model = MenuSidenav::findOne(['id' => $id, 'kd_menu' => $kd_menu])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
