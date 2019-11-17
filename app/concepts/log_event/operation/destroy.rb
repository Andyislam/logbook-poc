# frozen_string_literal: true

class LogEvent
  module Operation
    # Log Event Operation Delete
    class Destroy < Trailblazer::Operation

      step :find_model!
      step :persist!
      step :notify!

      def find_model!(options, params:, **)
        options['model'] = LogEvent.find(params[:id])
      end

      def persist!(_options, params:, model:, **)
        model.destroy
      end
      def notify!(options, model:, **)
        options['result.notify'] = Rails.logger.info("Log Event Deleted")
      end
    end
  end
end
