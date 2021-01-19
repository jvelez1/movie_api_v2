class CreateActivityLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_logs do |t|
      t.string :path, null: false, index: true
      t.integer :counter, default: 0
      t.belongs_to :user, foreign_key: true, null: false
      t.timestamps
    end

    add_index :activity_logs, [:path, :user_id], unique: true
  end
end
