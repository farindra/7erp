<?php
/**
 * By: Maseka
 * (C) 2015
 */

namespace common\widgets\ltenav;

use Yii;
use yii\base\InvalidConfigException;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;

/**
 * Nav renders a nav HTML component.
 *
 * For example:
 *
 * echo LteNav::widget([
 *       'userpanel' => ['image' => '../img/user2-160x160.jpg','username'=>'Joko','status'=>true],
 *       'encodeLabels' => false,
 *       'items' => [
 *           [
 *               'label' => 'Home',
 *               'fa_icon' => 'fa-dashboard',
 *               'url' => ['site/index'],
 *               'options' => ['class'=>'active treeview'],
 *
 *           ],
 *           [
 *               'label' => 'Detail',
 *               'items' => [
 *                       ['label' => 'Level 1 - Dropdown A', 'url' => '#'],
 *                       ['label' => 'Level 1 - Dropdown B', 'url' => '#'],
 *                   ],
 *               ],
 *           ],
 *       'options' => ['class' =>'sidebar-menu'], // set this to nav-tab to get tab-styled navigation
 *       ]);
 *
 * Note: Multilevel dropdowns beyond Level 1 are not supported in Bootstrap 3.
 *
  */
class LteNav extends Widget
{
    /**
     * @var array list of items in the nav widget. Each array element represents a single
     * menu item which can be either a string or an array with the following structure:
     *
     * - label: string, required, the nav item label.
     * - url: optional, the item's URL. Defaults to "#".
     * - visible: boolean, optional, whether this menu item is visible. Defaults to true.
     * - linkOptions: array, optional, the HTML attributes of the item's link.
     * - options: array, optional, the HTML attributes of the item container (LI).
     * - active: boolean, optional, whether the item should be on active state or not.
     * - items: array|string, optional, the configuration array for creating a [[Dropdown]] widget,
     *   or a string representing the dropdown menu. Note that Bootstrap does not support sub-dropdown menus.
     *
     * If a menu item is a string, it will be rendered directly without HTML encoding.
     */
    public $items = [];
    /**
     * @var boolean whether the nav items labels should be HTML-encoded.
     */
    public $userpanel = [];public $fa_icon = []; // <---- new one
    /**
     * @var boolean whether the nav items labels should be HTML-encoded.
     */

    public $encodeLabels = true;
    /**
     * @var boolean whether to automatically activate items according to whether their route setting
     * matches the currently requested route.
     * @see isItemActive
     */
    public $activateItems = true;
    /**
     * @var boolean whether to activate parent menu items when one of the corresponding child menu items is active.
     */
    public $activateParents = false;
    /**
     * @var string the route used to determine if a menu item is active or not.
     * If not set, it will use the route of the current request.
     * @see params
     * @see isItemActive
     */
    public $route;
    /**
     * @var array the parameters used to determine if a menu item is active or not.
     * If not set, it will use `$_GET`.
     * @see route
     * @see isItemActive
     */
    public $params;
    /**
     * @var string this property allows you to customize the HTML which is used to generate the drop down caret symbol,
     * which is displayed next to the button text to indicate the drop down functionality.
     * Defaults to `null` which means `<b class="caret"></b>` will be used. To disable the caret, set this property to be an empty string.
     */
    public $dropDownCaret;


    /**
     * Initializes the widget.
     */
    public function init()
    {
        parent::init();
        if ($this->route === null && Yii::$app->controller !== null) {
            $this->route = Yii::$app->controller->getRoute();
        }
        if ($this->params === null) {
            $this->params = Yii::$app->request->getQueryParams();
        }
        if ($this->dropDownCaret === null) {
            //$this->dropDownCaret = Html::tag('b', '', ['class' => 'caret']);
        }
        Html::addCssClass($this->options, null);
    }

    /**
     * Renders the widget.
     */
    public function run()
    {
        BootstrapAsset::register($this->getView());
        //return $this->renderItems(); //<----original
        //var_dump( $this->renderUserpanel());
        return '<aside class="main-sidebar"><section class="sidebar">'.$this->renderUserpanel().$this->renderItems().'</section></aside>';
    }

    /**
     * Renders user panel Lte costum.
     * By : maseka
     *
     * <div class="user-panel">
     *    <div class="pull-left image">
     *      <img src="../img/user2-160x160.jpg" class="img-circle" alt="User Image" />
     *    </div>
     *    <div class="pull-left info">
     *      <p>Alexander Pierce</p>
     *      <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
     *    </div>
     * </div>
     */
    public function renderUserpanel()
    {
       $de_array = $this->userpanel;
        if ($de_array!== null) {
            if ($de_array['status'] = true) {
                $de_status = '<span id="user-status"><i  class="fa fa-circle text-success"></i> Online</span>';}
                    else {
                        $de_status = '<span id="user-status"><i  class="fa fa-circle text-danger"></i> Offline</span>';}

            $de_user=
                '<div class="user-panel">
                    <div class="pull-left image">'.
                        '<img src="'.$de_array['image'].'" class="img-circle" alt="User Image" />'.
                    '</div>'.
                    '<div class="pull-left info">'.
                        '<p>'.$de_array['username'].'</p>'.
                        $de_status.
                    '</div>'.
                '</div>';

        }

        return $de_user;
    }

    /**
     * Renders widget items.
     */
    public function renderItems()
    {
        $items = [];
        foreach ($this->items as $i => $item) {
            if (isset($item['visible']) && !$item['visible']) {
                continue;
            }
            $items[] = $this->renderItem($item);
        }

        return Html::tag('ul', implode("\n", $items), $this->options);
    }

    /**
     * Renders a widget's item.
     * @param string|array $item the item to render.
     * @return string the rendering result.
     * @throws InvalidConfigException
     */
    public function renderItem($item)
    {
        if (is_string($item)) {
            return $item;
        }
        if (!isset($item['label'])) {
            throw new InvalidConfigException("The 'label' option is required.");
        }
        $encodeLabel = isset($item['encode']) ? $item['encode'] : $this->encodeLabels;
        $label = $encodeLabel ? '<span>'.Html::encode($item['label']).'</span><i class="fa fa-angle-left pull-right"></i>' : '<span>'.$item['label'].'</span><i class="fa fa-angle-left pull-right"></i>';
        $options = ArrayHelper::getValue($item, 'options', []);
        $items = ArrayHelper::getValue($item, 'items');
        $url = ArrayHelper::getValue($item, 'url', '#');
        $fa_icon = '<i class="fa '.ArrayHelper::getValue($item, 'fa_icon', 'fa-square-o').'"></i>';
        $linkOptions = ArrayHelper::getValue($item, 'linkOptions', []);

        if (isset($item['active'])) {
            $active = ArrayHelper::remove($item, 'active', false);
        } else {
            $active = $this->isItemActive($item);
        }

        if ($items !== null) {
            //$linkOptions['data-toggle'] = 'dropdown';
            //Html::addCssClass($options, 'dropdown'); <--- original
            Html::addCssClass($options, 'treeview');
            //Html::addCssClass($linkOptions, 'dropdown-toggle');
            if ($this->dropDownCaret !== '') {
                $label .= ' ' . $this->dropDownCaret;
            }
            if (is_array($items)) {
                if ($this->activateItems) {
                    $items = $this->isChildActive($items, $active);
                }
                $items = $this->renderDropdown($items, $item);
            }
        }

        if ($this->activateItems && $active) {
            Html::addCssClass($options, 'active');
        }

        return Html::tag('li', Html::a($fa_icon.$label, $url, $linkOptions) . $items, $options);
    }

    /**
     * Renders the given items as a dropdown.
     * This method is called to create sub-menus.
     * @param array $items the given items. Please refer to [[Dropdown::items]] for the array structure.
     * @param array $parentItem the parent item information. Please refer to [[items]] for the structure of this array.
     * @return string the rendering result.
     * @since 2.0.1
     */
    protected function renderDropdown($items, $parentItem)
    {
        return Dropdown::widget([
            'items' => $items,
            'encodeLabels' => $this->encodeLabels,
            'clientOptions' => false,
            'view' => $this->getView(),
        ]);
    }

    /**
     * Check to see if a child item is active optionally activating the parent.
     * @param array $items @see items
     * @param boolean $active should the parent be active too
     * @return array @see items
     */
    protected function isChildActive($items, &$active)
    {
        foreach ($items as $i => $child) {
            if (ArrayHelper::remove($items[$i], 'active', false) || $this->isItemActive($child)) {
                Html::addCssClass($items[$i]['options'], 'active');
                if ($this->activateParents) {
                    $active = true;
                }
            }
        }
        return $items;
    }

    /**
     * Checks whether a menu item is active.
     * This is done by checking if [[route]] and [[params]] match that specified in the `url` option of the menu item.
     * When the `url` option of a menu item is specified in terms of an array, its first element is treated
     * as the route for the item and the rest of the elements are the associated parameters.
     * Only when its route and parameters match [[route]] and [[params]], respectively, will a menu item
     * be considered active.
     * @param array $item the menu item to be checked
     * @return boolean whether the menu item is active
     */
    protected function isItemActive($item)
    {
        if (isset($item['url']) && is_array($item['url']) && isset($item['url'][0])) {
            $route = $item['url'][0];
            if ($route[0] !== '/' && Yii::$app->controller) {
                $route = Yii::$app->controller->module->getUniqueId() . '/' . $route;
            }
            if (ltrim($route, '/') !== $this->route) {
                return false;
            }
            unset($item['url']['#']);
            if (count($item['url']) > 1) {
                $params = $item['url'];
                unset($params[0]);
                foreach ($params as $name => $value) {
                    if ($value !== null && (!isset($this->params[$name]) || $this->params[$name] != $value)) {
                        return false;
                    }
                }
            }

            return true;
        }

        return false;
    }
}
