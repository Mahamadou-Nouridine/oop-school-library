require_relative 'baseDecorator'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
  end
  def correct_name
    if super.length <= 10
      super
    else
      super[0..3]
    end
  end
end
