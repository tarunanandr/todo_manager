class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:short)} #{todo_text} #{is_completed}"
  end

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end

  def self.duetoday
    where("due_date = ?", Date.today)
  end

  def self.duelater
    where("due_date > ?", Date.today)
  end

  def due_today?
    due_date == Date.today ? true : false
  end

  def self.completed
    where("completed = ?", true)
  end

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Today\n"
    puts duetoday.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Later\n"
    puts duelater.map { |todo| todo.to_displayable_string }
    puts "\n\n"
  end

  def self.add_task(h)
    create!(todo_text: h[h.keys[0]], due_date: Date.today + h[h.keys[1]], completed: false)
  end

  def self.mark_as_complete!(todo_id)
    todo = find(todo_id)
    todo.completed = true
    todo.save
    return todo
  end
end
