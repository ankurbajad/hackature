class AddPhoneNumberToCandidature < ActiveRecord::Migration
  def change
    add_column :candidatures, :phone_number, :string
  end
end
