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
        # model.update_attributes(params[:recipient][:journey].permit!)
        # model.save
        # model.update_attribute(:updated_by, 'API')
      end

      def notify!(options, model:, **)
        options['result.notify'] = Rails.logger.info("Log Event Updated #{model.inspect}.")
      end
    end
  end
end
