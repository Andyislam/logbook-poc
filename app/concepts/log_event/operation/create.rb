# frozen_string_literal: true

class LogEvent
  module Operation
    # Log Event Operation Create
    class Create < Trailblazer::Operation
      step Model(LogEvent, :new)
      step :notify!

      def notify!(options, model:, **)
        options['result.notify'] = Rails.logger.info("New Journey #{model.inspect}.")
      end
    end
  end
end
