class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.text :password
      t.text :email
      t.integer :status
      t.boolean :admin
      t.integer :version
      t.datetime :create_on
      t.datetime :update_on

      t.timestamps
    end
  end
end
