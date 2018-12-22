class TodosController < ApplicationController
  
  before_action :set_current_user_todo, only: [ :edit, :update, :destroy]


  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    # @todo = Todo.new
    @todo = current_user.todos.build

  end
  

  def create
    # @todo = Todo.new(todo_params)
    @todo = current_user.todos.build(todo_params)

    if @todo.save
        redirect_to @todo
    else
        render 'new'
    end
  end
  
  def edit
    # @todo = Todo.find(params[:id])
  end
  
  def update
    # @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
        # flash[:notice] = "Todo has been updated"
      redirect_to @todo
    else
        # flash[:alert] = "Todo is not updated"
      render 'edit'
    end
  end

  def destroy
    

    @todo.destroy
    flash.notice= "Todo has been deleted"
    redirect_to root_path
    
  end

  private
    def todo_params
      params.require(:todo).permit(:subject,:description,:is_completed,:user_id)
    end

    def set_current_user_todo
      @todo = current_user.todos.find(params[:id])
    end
end

