<?php

/**
 * @copyright maseka 2015
 */

namespace common\widgets\ltenav;


class LtenavAsset extends AssetBundle
{

    public function init()
    {
        $this->setSourcePath(__DIR__ . '/assets');
        $this->setupAssets('css', ['css/kv-sortable']);
        $this->setupAssets('js', ['js/html.sortable']);
        parent::init();
    }

}