# frozen_string_literal: true

class LogEventsController < ApplicationController
  before_action :authenticate_user!
  def index
    run LogEvent::Operation::Index, params: { current_user: current_user }
    render json: { log_events: result['model'], active_event: result['model'].where(sign_out_time: nil).first }
  end

  def create
    run LogEvent::Operation::Create, params: { current_user: current_user }
    render json: { log_event: result['model'] }
  end

  def update
    run LogEvent::Operation::Update
    render json: { log_event: result['model'] }
  end

  def destroy
    run LogEvent::Operation::Destroy
    render json: { log_event: result['model'] }
  end
end
