class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.text :schedule
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.timestamps
    end
  end
end
