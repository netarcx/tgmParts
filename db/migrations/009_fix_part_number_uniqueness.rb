Sequel.migration do
  execute "ALTER TABLE parts ADD ucode bit(1) GENERATED ALWAYS AS (case when (`type` = 'cots') then NULL else 0x01 end) VIRTUAL;"
  up do

    alter_table(:parts) do
      drop_constraint :part_number, :type => :unique
      add_unique_constraint [:project_id, :part_number, :ucode], :name => :project_id_and_part_number
    end
  end
  down do
    raise ActiveRecord::IrreversibleMigration
    alter_table(:parts) do
      drop_constraint :project_id_and_part_number, :type => :unique
      add_unique_constraint :part_number
    end
  end
end
