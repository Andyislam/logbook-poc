# frozen_string_literal: true

class LogEvent
  module Operation
    # Log Event Operation Index
    class Index < Trailblazer::Operation
      step :find_model!
      def find_model!(options, params:, **)
        options['model'] = params[:current_user].log_events
      end
    end
  end
end
