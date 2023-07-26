require_relative 'baseDecorator'

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
  end
  def correct_name
    super.capitalize()
  end
end
