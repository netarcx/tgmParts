Sequel.migration do
  change do
    alter_table(:parts) do
      add_column :mfg_method, String, :null => false
      add_column :finish, String, :null => false
      add_column :quantity, String, :null => false
      add_column :priority, Integer, :null => false
      add_column :drawing_created, Integer, :null => false
      add_column :rev, String, :null => false
      add_column :rev_history, String, :null => false
      add_column :trello_link, String, size: 5000, :null => false
    end
  end
end
