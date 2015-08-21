<?php

namespace common\modules\ltenav\models\menu;

/**
 * This is the ActiveQuery class for [[MenuSidenav]].
 *
 * @see MenuSidenav
 */
class MenuSidenavQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return MenuSidenav[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return MenuSidenav|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}