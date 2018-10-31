class TodoItemsController < ApplicationController
	#before_action :authenticate_user!, except: [:index]
  	#before_action :Correct_user, only: [:complete, :destroy, :create]
	before_action :set_todo_list
	before_action :set_todo_item , except: [:create]

def create

	#@todo_list = TodoList.find(params[:todo_list_id])
	@todo_item = @todo_list.todo_items.create(todo_item_params)
  	if @todo_item.save
  		redirect_to @todo_list
  	else
  		flash.now[:danger] = "error"
 	end
end

def destroy
	if @todo_item.destroy
		flash[:success] = "item deleted successfully."
	else
		flash[:error]	="item isn't deleted."
	end
	redirect_to @todo_list
end

def complete
	@todo_item.update_attribute(:completed_at, Time.now)
	redirect_to @todo_list, notice: "Todo item completed"
end

def incomplete
	@todo_item.update_attribute(:incompleted_at, Time.now)
	redirect_to @todo_list, notice: "Todo item incompleted"
end
	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def set_todo_item
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

	def todo_item_params
		params.require(:todo_item).permit(:content)
	end

end



