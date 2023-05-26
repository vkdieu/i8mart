<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use PHPUnit\TextUI\XmlConfiguration\Group;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('layouts.client');
// });

Auth::routes();


Route::prefix('admin')->middleware('auth')->group(function ()
 {
        // các route trong group admin
Route::get('/dashboard', [App\Http\Controllers\AdminDashboardController::class, 'index'])->name('dashboard.index');

    $resource = [
        'product' => 'Product',
        'page' => 'Page',
        'product/cat' => 'Category',
        'post' => 'Post',
        'post/cat' => 'Post_cat',
        'order' => 'Order',
        'user' => 'User',
        'role' => 'Role',
        'permission' => 'Permission',

    ];
    foreach ($resource as $key => $value) {
        $controller = 'App\Http\Controllers\Admin' . $value . 'Controller';
        Route::get('/' . $key . '/add', [$controller, 'add'])->name($value . '.add');
        Route::get('/' . $key . '/add', [$controller, 'add'])->name($value . '.add');
        Route::get('/' . $key . '/edit/{id}', [$controller, 'edit'])->name($value . '.edit');
        Route::get('/' . $key . '/delete/{id}', [$controller, 'delete'])->name($value . '.delete');
        Route::get('/' . $key . '/list', [$controller, 'list'])->name($value . '.list');
        Route::post('/' . $key . '/store', [$controller, 'store'])->name($value . '.store');
        Route::post('/' . $key . '/action', [$controller, 'action'])->name($value . '.action');
        Route::post('/' . $key . '/update/{id}', [$controller, 'update'])->name($value . '.update');
        Route::post('/' . $key . '/status', [$controller, 'status'])->name($value . '.status');
        Route::post('/' . $key . '/search', [$controller, 'search'])->name($value . '.search');
        Route::post('/' . $key . '/destroys/{id}', [$controller, 'destroys'])->name($value . '.destroys');
        Route::get('/' . $key . '/detail/{id}', [$controller, 'detail'])->name($value . '.detail');
        Route::post('/' . $key . '/action_detai/{id}', [$controller, 'action_detai'])->name($value . '.action_detai');



    }

//slide admin
// Route::get('/slide/list', [App\Http\Controllers\SlideController::class, 'slide'])->name('Slice.index');
Route::get('/slide/add', [App\Http\Controllers\SlideController::class, 'slide'])->name('Slide.add')->can('role.add');

Route::post('/slide/store', [App\Http\Controllers\SlideController::class, 'store'])->name('Slide.store')->can('role.store');
Route::get('/slide/eidt/{id}', [App\Http\Controllers\SlideController::class, 'edit'])->name('Slide.edit');
Route::get('/slide/delete/{id}', [App\Http\Controllers\SlideController::class, 'delete'])->name('Slide.delete');
Route::post('/slide/update/{id}', [App\Http\Controllers\SlideController::class, 'update'])->name('Slide.update');

//pageadmin
Route::get('/page/edit/{id}', [App\Http\Controllers\AdminPageController::class, 'edit'])->name('Page.edit');
Route::get('/page/update/{id}', [App\Http\Controllers\AdminPageController::class, 'update'])->name('Page.update');









    });





   //index
    Route::prefix('/')->group(function () {
      
       $resource =([
        '/'=>'Home',
        // 'san-pham'=>'Product',

        'bai-viet.html'=> 'Post',
        'gioi-thieu.html'=>'Introduce',
        // 'blog.html'=>'Page',
        'contact.html'=>'Contact',
        'gio-hang.html'=>'Cart',

        'checkout.html'=>'Checkout',

       ]);
       foreach( $resource as $key=>$value)
       
       {
        $controller = 'App\Http\Controllers\\'.$value. 'Controller';

        Route::get('/'.$key, [$controller, 'index'])->name($value.'.index');
        Route::get('/'.$key.'-{slug}', [$controller, 'detail'])->name($value.'.detail');

       
       }

  
    });
// sản phẩm 
Route::get('/san-pham.html', [App\Http\Controllers\ProductController::class, 'list'])->name('Product.index');
Route::get('/san-pham/{slug}', [App\Http\Controllers\ProductController::class, 'index'])->name('Product_slug.index');
Route::get('/san-pham/chi-tiet/{slug}', [App\Http\Controllers\ProductController::class, 'detail'])->name('Product.detail');

//blog
Route::get('/danh-sach.html', [App\Http\Controllers\PostController::class, 'index'])->name('Post.index');
Route::get('/danh-sach-{slug}', [App\Http\Controllers\PostController::class, 'detail'])->name('Post.detail');

//Page
Route::get('/{slug}', [App\Http\Controllers\PageController::class, 'index'])->name('Page.index');







    //add
    Route::prefix('/')->group(function () {
        $resource =([
            'card/add/{id}'=>'Cart',
            'card/add'=>'Ckeckout',

        ]);
        foreach( $resource as $key=>$value) {
            $controller = 'App\Http\Controllers\\'.$value. 'Controller';
            Route::get('/'.$key, [$controller, 'add'])->name($value.'.add');
        }
    });
    Route::post('/card/add', [App\Http\Controllers\CheckoutController::class, 'add'])->name('Checkout.add');
    Route::post('/card/update', [App\Http\Controllers\CartController::class, 'update'])->name('Cart.update');








    Route::prefix('/')->group(function () {
        $resource =([
            'card/delete/{rowId}'=>'Cart',
        ]);
        foreach( $resource as $key=>$value) {
            $controller = 'App\Http\Controllers\\'.$value. 'Controller';
            Route::get('/'.$key, [$controller, 'delete'])->name($value.'.delete');

        }
    });

    Route::prefix('/')->group(function () {
        $resource =([
            'card/destroy'=>'Cart',
        ]);
        foreach( $resource as $key=>$value) {
            $controller = 'App\Http\Controllers\\'.$value. 'Controller';
            Route::get('/'.$key, [$controller, 'destroy'])->name($value.'.destroy');

        }
    });

    //client






    Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {

        \UniSharp\LaravelFilemanager\Lfm::routes();
    });
    