class CreateLogEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :log_events do |t|
      t.datetime :sign_in_time
      t.datetime :sign_out_time
      t.text :comments
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
