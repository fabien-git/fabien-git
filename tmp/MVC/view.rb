class View
  def ask_a_task
    puts "Quelle est votre nouvelle tache?"
    print "> "
    gets.chomp
  end

  def display_list(tasks)
    puts " "
    puts " "
    puts "---------Liste-----------"
    tasks.each_with_index do|task, idx|
      mark = task.read? ? "[x]" : "[]"
      puts "#{idx + 1}: #{mark} #{task.description}"
    end
    puts "---------------------------"
    puts " "
    puts " "
  end

  def get_index
    puts "votre index ?"
    print "> "
    gets.chomp.to_i - 1
  end

  def wrong_index
    puts " mauvais index!"
  end
end
