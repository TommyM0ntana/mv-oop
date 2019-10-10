# frozen_string_literal: true

# Store player info #TODO: Probably we can add more info to player, for example total win score if multigame case
class Player
  attr_reader :name, :sign
  def initialize(name, sign)
    @name = name
    @sign = sign
  end
end
