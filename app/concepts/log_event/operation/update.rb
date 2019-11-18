# frozen_string_literal: true

class LogEvent
  module Operation
    # Log Event Operation Update
    class Update < Trailblazer::Operation
      step :find_model!
      step :persist!
      step :notify!

      def find_model!(options, params:, **)
        options['model'] = LogEvent.find(params[:id])
      end

      def persist!(_options, params:, model:, **)
        if params[:update_type] == 'stop_event'
          model.update_attribute(:sign_out_time, DateTime.now)
        else
          model.update_attributes(params[:log_event].permit!.to_h)
        end
        model.save
      end

      def notify!(options, model:, **)
        options['result.notify'] = Rails.logger.info("Log Event Updated #{model.inspect}.")
      end
    end
  end
end
