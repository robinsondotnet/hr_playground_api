class CreateNewOwnerColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :owner, index: true, foreign_key: true
  end
end
