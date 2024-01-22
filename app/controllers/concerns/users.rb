# 正しい例
module Users
    extend ActiveSupport::Concern

    included do
      before_action :get_users,only: [:index]
    end

    def get_users
        @users = User.all
    end

end

# 悪い例
# module Users
#     extend ActiveSupport::Concern

#     included do
#       before_action :get_users,only: [:index]
#       def get_users
#         @users = User.all
#       end
#     end
# end