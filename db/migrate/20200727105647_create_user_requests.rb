class CreateUserRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_requests do |t|
      t.string :state
      t.string :time_interval
      t.boolean :status

      t.timestamps
    end
  end
end
