
# One of the problems with JWT token authentication is logoff. In order to enable logoff, we have to invalidate the token, and one means of doing that is to create a list of revoked tokens.
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end
