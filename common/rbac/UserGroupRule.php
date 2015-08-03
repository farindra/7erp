<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 12/05/15
 * Time: 19:49
 */

namespace common\rbac;
use Yii;
use yii\rbac\Rule;

/**
 * Checks if user group matches
 */
class UserGroupRule extends Rule
{
   // public $name = 'userGroup';

    public function execute($user, $item, $params)
    {
        if (!Yii::$app->user->isGuest) {
            $group = Yii::$app->user->identity->group;
            if ($item->name === 'OWNER') {
                return $group == 1 ;
            } elseif ($item->name === 'KOMISARIS') {
                return $group == 1 || $group == 2; 
			} 
			elseif ($item->name === 'CEO') {
                return $group == 1 || $group == 2 || $group == 3; 
			} elseif ($item->name === 'GM') {
                return $group == 1 || $group == 2 || $group == 3 || $group == 4; 
			} elseif ($item->name === 'MANAGER') {
                return $group == 1 || $group == 2 || $group == 3 || $group == 4 || $group == 5; 
			} elseif ($item->name === 'SUVERVISOR') {
                return $group == 5 || $group == 6; 
			} elseif ($item->name === 'DM') {
                return $group == 5 || $group == 6 || $group == 7; 
			} elseif ($item->name === 'STAFF') {
                return $group == 5 || $group == 6 || $group == 7 || $group == 8; 
			} elseif ($item->name === 'OPS') {
                return  $group == 5 ||$group == 6 ||$group == 7 ||$group == 8 || $group == 9;
            }
        }
        return false;
    }
}
//CHAILD ptr.nov

if (\Yii::$app->user->can('createPost')) {
	$auth = Yii::$app->authManager;

	$rule = new \yii\rbac\UserGroupRule;
    echo $rule;
	$auth->add($rule);

		$OPS = $auth->createRole('OPS');
		$OPS->ruleName = $rule->name;
		$auth->add($OPS);
		// ... add permissions as children of $author ...
		
		$STAFF = $auth->createRole('STAFF');
		$STAFF->ruleName = $rule->name;
		$auth->add($STAFF);
		$auth->addChild($STAFF, $OPS);
		// ... add permissions as children of $author ...
		
		$DM = $auth->createRole('DM');
		$DM->ruleName = $rule->name;
		$auth->add($DM);
		$auth->addChild($STAFF, $OPS, $DM);
		// ... add permissions as children of $author ...
		
		$SUVERVISOR = $auth->createRole('SUVERVISOR');
		$SUVERVISOR->ruleName = $rule->name;
		$auth->add($SUVERVISOR);
		$auth->addChild($STAFF, $OPS, $DM, $SUVERVISOR);
		// ... add permissions as children of $author ...
		
		$MANAGER = $auth->createRole('MANAGER');
		$MANAGER->ruleName = $rule->name;
		$auth->add($MANAGER);
		$auth->addChild($STAFF, $OPS, $DM, $SUVERVISOR, $MANAGER);
		// ... add permissions as children of $author ...
		
		$GM = $auth->createRole('GM');
		$GM->ruleName = $rule->name;
		$auth->add($GM);
		$auth->addChild($STAFF, $OPS, $DM, $SUVERVISOR, $MANAGER, $GM);
		// ... add permissions as children of $author ...
		
		$CEO = $auth->createRole('CEO');
		$CEO->ruleName = $rule->name;
		$auth->add($CEO);
		$auth->addChild($STAFF, $OPS, $DM, $SUVERVISOR, $MANAGER, $GM, $CEO);
		// ... add permissions as children of $author ...
		
		$KOMISARIS = $auth->createRole('KOMISARIS');
		$KOMISARIS->ruleName = $rule->name;
		$auth->add($KOMISARIS);
		$auth->addChild($STAFF, $OPS, $DM, $SUVERVISOR, $MANAGER, $GM, $CEO, $KOMISARIS);
		// ... add permissions as children of $author ...

		$OWNER = $auth->createRole('OWNER');
		$OWNER->ruleName = $rule->name;
		$auth->add($OWNER);
		$auth->addChild($STAFF, $OPS, $DM, $SUVERVISOR, $MANAGER, $GM, $CEO, $KOMISARIS, $OWNER);
		// ... add permissions as children of $admin ...
}