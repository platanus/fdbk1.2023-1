class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :feedback_session, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
