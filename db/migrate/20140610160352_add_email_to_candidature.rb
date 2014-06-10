class AddEmailToCandidature < ActiveRecord::Migration
  def change
    add_column :candidatures, :email, :string
  end
end
