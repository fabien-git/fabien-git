class Router
  def initialize(controller)
    @controller =  controller
  end

  def run
    loop do
      display_action
      user_choice = gets.chomp.to_i
      routage(user_choice)
    end
  end

  def display_action
    puts "-----------------"
    puts "what do you want to do?"
    puts "01 -  Create a new task ?"
    puts "02 - List all tasks ?"
    puts "03 - Mark a task as done ? "
    puts  "04 - exit ?"
    print"> "
  end

  def routage(user_choice)
    case user_choice
    when 1 then @controller.create_a_task
    when 2 then @controller.list_all_tasks
    when 3 then @controller.mark_a_task
    when 4 then exit
    else puts "choisissez 1,2, 3 ou 4"
    end
  end
end
