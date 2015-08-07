<?php

namespace frontend\controllers;

use Yii;
use frontend\models\TabView;
use frontend\models\TabViewSearch;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;



/**
 * TabviewController implements the CRUD actions for TabView model.
 */
class TabviewController extends Controller
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
     * Lists all TabView models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TabViewSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single TabView model.
     * @param integer $id
     * @param string $view_kd
     * @return mixed
     */
    public function actionView($id, $view_kd)
    {
        return $this->render('view', [
            'model' => $this->findModel($id, $view_kd),
        ]);
    }

    /**
     * Creates a new TabView model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-tabview')){
            $model = new TabView();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id, 'view_kd' => $model->view_kd]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }else {
            throw new ForbiddenHttpException;
            //Yii::$app->getSession()->setFlash('error', 'Malliiingg..');
        }
    }

    /**
     * Updates an existing TabView model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @param string $view_kd
     * @return mixed
     */
    public function actionUpdate($id, $view_kd)
    {
        $model = $this->findModel($id, $view_kd);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id, 'view_kd' => $model->view_kd]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing TabView model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @param string $view_kd
     * @return mixed
     */
    public function actionDelete($id, $view_kd)
    {
        $this->findModel($id, $view_kd)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the TabView model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @param string $view_kd
     * @return TabView the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $view_kd)
    {
        if (($model = TabView::findOne(['id' => $id, 'view_kd' => $view_kd])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
