
class VendorPart < Sequel::Model
  many_to_one :vendor

  def full_part_number
    "#{vendor.part_number_prefix}-%d" % part_number
  end

end
