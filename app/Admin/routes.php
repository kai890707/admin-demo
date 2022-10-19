<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('/news', NewsController::class);
    $router->resource('/category', CategoryController::class);
    $router->get('/getAllName', 'CategoryController@getAllName');

    $router->resource('/carousel', CarouselController::class);
    $router->post('/addToCarousel', 'CarouselController@addToCarousel');
});
