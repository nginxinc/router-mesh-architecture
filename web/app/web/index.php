<?php
/**
 * Created by IntelliJ.
 * User: Chris Stetson
 * Date: 8/2/16
 * Time: 3:04 PM
 */

// web/index.php
require_once __DIR__.'/../vendor/autoload.php';
require 'classes/ContentService.php';

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Symfony\Component\Serializer\Encoder\JsonDecode;
use Silex\Provider\TwigServiceProvider;

$app = new Silex\Application();

$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/views',
));

$app->get('/', function () use ($app) {
    $contentService = new ContentService();
    $content = $contentService->getContent();
    return $app['twig']->render('index.html.twig', array(
        'content' => $content
    ));
});

$app->run();