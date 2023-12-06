class Task
  attr_reader :description

  def initialize(description)
    @description = description
    @read = false
  end

  def read?
    @read
  end

  def mark_as_read
    @read = true
  end
end
