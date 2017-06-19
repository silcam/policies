class AddUserColumnToPolicies < ActiveRecord::Migration[5.1]
  def change
    add_reference :policies, :user
  end
end
