class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :job_opening, index: true, foreign_key: true
      t.integer :aasm_state

      t.timestamps null: false
    end
  end
end
