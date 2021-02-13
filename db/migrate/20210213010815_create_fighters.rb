class CreateFighters < ActiveRecord::Migration[5.1]
  def change
    create_table :fighters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :bio

      t.timestamps
    end
  end
end
