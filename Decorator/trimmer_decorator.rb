require_relative './decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.length > 9 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end
