puts 'Starting seed execution ...'

# Create Admin
admin = Admin.where(email: 'admin@admin.com.br').first_or_create(password: '12345678', name: 'Admin')

# Create Users Admin
user_admin_1 = User.where(email: 'user.admin1@animelist.com.br').first_or_create(name: 'User Admin 1', password: '12345678', status: :active, profile: :admin)
user_admin_1.confirm

# Create Users Otaku
user_otaku_1 = User.where(email: 'user.otaku1@animelist.com.br').first_or_create(name: 'User Otaku 1', password: '12345678', status: :active)
user_otaku_1.confirm

puts 'Finishing seed execution.'
