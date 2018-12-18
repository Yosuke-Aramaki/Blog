class BlogsController < ApplicationController
   before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end
  
  def edit
  end
    
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
    
  end
    
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end  
    
  def new 
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end 
  end
  
  def create
    @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to blogs_path, notice: "ブログを作成しました！"
      else
        render 'new'
      end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  
  def show
  end
  
  def contact
  end
  
  def contact_create
    redirect_to blogs_path, notice:"お問い合わせを送信しました。"
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
