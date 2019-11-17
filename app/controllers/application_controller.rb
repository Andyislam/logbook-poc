# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base
  include Trailblazer::Rails::Controller

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(_resource_or_scope)
    '/dashboard/index'
  end
end
