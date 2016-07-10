class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :number
      t.string :location

      t.timestamps null: false
    end
  end
end
