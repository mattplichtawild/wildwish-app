class CreateKeepers < ActiveRecord::Migration[5.2]
  def change
    create_table :keepers do |t|

      t.timestamps
    end
  end
end
