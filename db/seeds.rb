user = User.find_or_create_by(email: 'demo@blog.com.br', name: 'Demo User') do |user|
  user.password = 'Teste@1234'
  user.password_confirmation = 'Teste@1234'
end

10.times do
  FactoryBot.create(:post, user: user)
end
