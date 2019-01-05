
class VendorPart < Sequel::Model
  many_to_one :vendor

  def full_part_number
    "#{vendor.part_number_prefix}-%s" % part_number
  end

end
