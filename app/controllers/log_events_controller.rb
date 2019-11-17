class LogEventsController < ApplicationController
	before_action :authenticate_user!
	def index
		run LogEvent::Operation::Index, params: {current_user: current_user}
        render json: result.success? ? { log_events: result['model'] } : result['result.contract.default'].errors
	end

	def create
		run LogEvent::Operation::Create, params: {current_user: current_user}
        render json: result.success? ? { log_event: result['model'] } : result['result.contract.default'].errors
	end
end
