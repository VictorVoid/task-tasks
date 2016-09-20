# class Authenticator
#   def self.authenticate(credential, password)
#     user = find_by_credential(credential)
#    return user && user.password == password
#   end

#   def self.find_by_credential(credential)
#     User.where("email = :credential OR login = :credential", credential: credential).first
#   end
# end
