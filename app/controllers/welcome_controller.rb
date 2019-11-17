# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    redirect_to 'dashboard/index' if user_signed_in?
  end
end
