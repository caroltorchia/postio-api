
module AuthHelper
  include JwtAuthenticatable
  def auth_token(user = nil, attributes = {})
    user ||= FactoryBot.create(:user, **attributes)
    token = jwt_encode(user_id: user.id)
    "Bearer #{token}"
  end
end

RSpec.configure do |config|
  config.include AuthHelper
end
