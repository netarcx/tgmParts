Sequel.migration do
  change do
    execute "ALTER TABLE parts ADD ucode bit(1) GENERATED ALWAYS AS (case when (`type` = 'cots') then NULL else 0x01 end) VIRTUAL;"
    alter_table(:parts) do
      set_column_type :part_number, String
      drop_constraint :project_id_and_part_number, :type => :unique
      add_unique_constraint [:project_id, :part_number, :ucode], :name => :project_id_and_part_number
      add_column :vendor_part_id, Integer, :null => true
      add_column :vendor_id, Integer, :null => true
    end
  end
end
