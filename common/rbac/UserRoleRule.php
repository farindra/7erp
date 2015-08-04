<?php
/**
 * Created by maseka.
 * Date: 12/06/15
 * Time: 19:
 * REFF:
 * 1. http://www.fabioferreira.pt/rbac-with-yii2-user-quick-tutorial/
 *
 */

namespace common\rbac;
use Yii;
use yii\rbac\Rule;

/**
 * Checks if user group matches
 */
class UserRoleRule extends Rule
{
   public $name = 'userRole';

    public function execute($user, $item, $params)
    {
        if(isset(\Yii::$app->user->identity->role))
            $role = \Yii::$app->user->identity->role;
        else
            return false;

        if ($item->name === 'ADMIN') {
            return $role == 'ADMIN' ;
        } elseif ($item->name === 'EDITOR') {
            return $role == 'ADMIN' || $role == 'EDITOR';
        } elseif ($item->name === 'EDITOR') {
            return $role == 'ADMIN' || $role == 'EDITOR';
        } elseif ($item->name === 'USER') {
            return $role == 'ADMIN' || $role == 'EDITOR' || $role == 'USER' || $role == NULL;

            /*CEO ROLE
             *
             *
             */
        } elseif ($item->name === 'CEO') {
            return $role == 'ADMIN' || $role == 'EDITOR' || $role == 'USER' || $role == 'CEO';

            /*CEO ROLE
             *
             *
             */
        } elseif ($item->name === 'MANAGER') {
            return $role == 'ADMIN' || $role == 'EDITOR' || $role == 'USER' || $role == 'MANAGER';

            /*CEO ROLE
             *
             *
             */
        } elseif ($item->name === 'SUPERVISOR') {
            return $role == 'ADMIN' || $role == 'EDITOR' || $role == 'USER' || $role == 'SUPERVISOR';

            /*CEO ROLE
             *
             *
             */
        } elseif ($item->name === 'STAFF') {
            return $role == 'ADMIN' || $role == 'EDITOR' || $role == 'USER' || $role == 'STAFF';
        } else
            return false;
    }
}
