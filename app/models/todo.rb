class Todo < ApplicationRecord
  belongs_to :user

  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

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
end
