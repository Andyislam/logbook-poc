# frozen_string_literal: true

class LogEvent
  module Operation
    # Log Event Operation Create
    class Create < Trailblazer::Operation
      step Model(LogEvent, :new)
      step :set_values!
      step :notify!

      def set_values!(options, params:, **)
        options['model'].user = params[:current_user]
        options['model'].sign_in_time = DateTime.now
        options['model'].save
      end

      def notify!(options, model:, **)
        options['result.notify'] = Rails.logger.info("New Log Event Created #{model.inspect}.")
      end
    end
  end
end
