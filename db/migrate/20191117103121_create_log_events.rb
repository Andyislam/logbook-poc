# frozen_string_literal: true

class CreateLogEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :log_events do |t|
      t.datetime :sign_in_time
      t.datetime :sign_out_time
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
