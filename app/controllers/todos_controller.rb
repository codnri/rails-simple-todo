class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
        redirect_to @todo
    else
        render 'new'
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:subject,:description,:is_completed)
    end

end


# def task_params
#   params.require(:task).permit(
#     :title,:description,:done,:registration_date,
#     :first_reminder_date,:second_reminder_date,:third_reminder_date,:subject_id,:first_check,:second_check,:third_check)
# end