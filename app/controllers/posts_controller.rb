class PostsController < ApplicationController
	before_action :get_author, only: [:new,:edit]
	before_action :set_author, only: [:create,:update]
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.author = @author
  	 respond_to do |format|
      if @post.save
        format.html { redirect_to @author, notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private

  def get_author
  	@student = Student.find(params[:sid]) if params[:sid]
  	@teacher = Teacher.find(params[:tid]) if params[:tid]
  end
  def set_author
    @author = Student.find(params[:post][:hidden_sid]) if params[:post][:hidden_sid].present? 
    @author = Teacher.find(params[:post][:hidden_tid]) if params[:post][:hidden_tid].present?  
  end

  def post_params
  	params.require(:post).permit(:title,:body)
  end
end
