class RefactorProjectOwnerColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :owner, :string
  end
end
