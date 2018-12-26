Sequel.migration do
  change do
    create_table(:vendors) do
      primary_key :id
      String :name, :null => false, :unique => true
      Varchar :part_number_prefix, :size => 3, :null => false, :unique => true
    end
  end
end
