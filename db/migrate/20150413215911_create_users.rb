class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, presence: true
      t.string :last_name, presence: true
      t.string :email, uniqueness: true, presence: true
      t.string :password_digest, presence: true
      t.timestamps null: false
    end
  end
end
