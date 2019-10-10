# frozen_string_literal: true

# Store player info
class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end
end
