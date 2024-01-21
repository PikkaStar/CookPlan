module Users
extend ActiveSupport::Concern

def get_users
  @users = User.all
end

end