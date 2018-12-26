# Represents a vendor that provides COTS parts

class Vendor < Sequel::Model
  one_to_many :vendor_parts
end
