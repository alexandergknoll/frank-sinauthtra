class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, uniqueness: true, presence: true
      t.string :password_digest, presence: true
      t.string :first_name, presence: true
      t.string :last_name, presence: true
      t.timestamps
    end
  end
end
