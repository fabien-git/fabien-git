require_relative 'view'
require_relative 'task'

class Controller
  def initialize(tasks)
    @tasks = tasks
    @view = View.new
  end

  def create_a_task
    ask_task = @view.ask_a_task
    task = Task.new(ask_task)
    @tasks.add(task)
    list_all_tasks
  end

  def mark_a_task
    @view.display_list(@tasks.all)
    index = @view.get_index
    task = @tasks.find(index)
    if task == nil
      @view.wrong_index
    else
      task.mark_as_read
      @view.display_list(@tasks.all)
    end
  end

  def list_all_tasks
    @view.display_list(@tasks.all)
  end
end
