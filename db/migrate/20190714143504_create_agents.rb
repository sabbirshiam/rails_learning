class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :name
      t.binary :image
      t.date :disabled_at

      t.timestamps
    end
  end
end
