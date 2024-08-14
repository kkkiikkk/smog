# frozen_string_literal: true

class Command
  def perform
    raise NotImplementedError, "#{self.class} has not implemented method 'perform'"
  end
end
