<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Layout\Content;
use App\Models\News;

class NewsController extends AdminController
{
   
    /**
     * Title for current resource.
     *
     * @var string
     */
    // protected $title = 'Example controller';

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('admin.News_title'))
            ->description(trans('admin.News_index_description'))
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
            ->header(trans('admin.News_title'))
            ->description(trans('admin.News_detail_description'))
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
            ->header(trans('admin.News_title'))
            ->description(trans('admin.News_edit_description'))
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
            ->header(trans('admin.News_title'))
            ->description(trans('admin.News_create_description'))
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new News);

        $grid->id(trans('admin.news_id'))->sortable();
        $grid->news_title(trans('admin.news_title'));
        $grid->year(trans('admin.news_year'));
        $grid->category_id(trans('admin.category_id'));
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
        $show = new Show(News::findOrFail($id));

        $show->id(trans('admin.news_id'));
        $show->news_title(trans('admin.news_title'));
        $show->year(trans('admin.news_year'));
        $show->category_id(trans('admin.category_id'))->as(function ($category_id) {
            $category = Category::find($category_id);
            return $category->name;
        });
        $show->content(trans('admin.content'));
        $show->img_path(trans('admin.news_img'));
        $show->is_show(trans('admin.is_show'));
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
        $form = new Form(new News);

        $options = [1 => 'Yes', 0 => 'No'];

        $form->text('news_title',trans('admin.news_title'));
        $form->text('year', trans('admin.news_year'));
        $form->select('category_id',trans('admin.category_name'))->options('/admin/getAllName');
        $form->textarea('content',trans('admin.content'));
        
        $form->radio('is_show',trans('admin.is_show'))->options($options)->stacked();
        // $form->file('img_path', '精選圖片')->rules('mimes:jpg,jpeg,png');
        $form->image('img_path', trans('admin.news_img'));
        $form->display('id', trans('admin.news_id'));
        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));

        return $form;
    }
}
