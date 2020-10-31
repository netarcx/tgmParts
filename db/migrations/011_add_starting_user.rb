require "pathological"

require "base64"
require "openssl"
require "securerandom"

PBKDF2_ITERATIONS = 1000
HASH_BYTES = 24
SALT_BYTES = 24

Sequel.migration do
  up do
    salt = SecureRandom.base64(SALT_BYTES)
    password = Base64.encode64(OpenSSL::PKCS5::pbkdf2_hmac_sha1("shark-tank", salt, PBKDF2_ITERATIONS, HASH_BYTES))    
    from(:users).insert(:email => "deleteme@team199.org", :first_name => "Delete", :last_name => "Me",
                    :permission => "admin", :enabled => 1, :theme => "classic", :password => password, :salt => salt)
  end

  down do
    from(:users).delete(:email => "deleteme@team199.org")
  end
end
