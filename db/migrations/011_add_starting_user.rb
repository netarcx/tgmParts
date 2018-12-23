require "pathological"

require_relative "../../models/user"

Sequel.migration do
  up do
    user = User.new(:email => "deleteme@team199.org", :first_name => "Delete", :last_name => "Me",
                    :permission => "admin", :enabled => 1, :theme => "classic")
    user.set_password("shark-tank")
    user.save
  end

  down do
    User[:email => "deleteme@team199.org"].delete rescue nil
  end
end
