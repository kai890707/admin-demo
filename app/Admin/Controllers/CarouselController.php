<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Grid;

use Encore\Admin\Show;
use Encore\Admin\Form;
use App\Models\Carousel;
use Illuminate\Http\Request;
class CarouselController extends AdminController
{
    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('輪播圖片管理')
            ->description('首頁')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed   $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('輪播圖片管理')
            ->description('檢視')
            ->body($this->detail($id));
    }


    /**
     * Edit interface.
     *
     * @param mixed   $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(trans('admin.Category_title'))
            ->description(trans('admin.Category_edit_description'))
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('輪播圖片管理')
            ->description('新增')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Carousel);
        $grid->id('圖片ID')->sortable();
        $grid->path('圖片路徑');
        $grid->order('圖片排序');
        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed   $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Carousel::findOrFail($id));

        $show->id('圖片ID');
        $show->path('圖片路徑');
        $show->order('圖片排序');
        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Carousel);



        $form->text('order', trans('admin.category_name'));
        $form->display('id', trans('admin.category_id'));
        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));

        return $form;
    }

    public function addToCarousel(Request $request)
    {
        $path = $request->get('path');

      
        $order = Carousel::orderBy('order', 'desc')->get();
        $carousel = new Carousel();
        $carousel->path = $path;
        $carousel->order = $order[0]['order']+1;
        if($carousel->save()){
            return  response(["status" => 'success'],200);
        }else{
            return  response(["status" => 'fail'], 400);
        }
    }


    
}
