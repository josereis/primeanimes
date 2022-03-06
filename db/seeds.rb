puts 'Starting seed execution ...'

# Create Admin
admin = Admin.where(email: 'admin@admin.com.br').first_or_create(password: '12345678', name: 'Admin')

# Create Users Admin
user_admin_1 = User.where(email: 'user.admin1@primeanimes.com.br').first_or_create(name: 'User Admin 1', password: '12345678', status: :active, profile: :admin)
user_admin_1.confirm
user_admin_2 = User.where(email: 'user.admin2@primeanimes.com.br').first_or_create(name: 'User Admin 2', password: '12345678', status: :inactive, profile: :admin)
user_admin_2.confirm
user_admin_3 = User.where(email: 'user.admin3@primeanimes.com.br').first_or_create(name: 'User Admin 3', password: '12345678', status: :active, profile: :admin)
user_admin_3.confirm

# Create Users Otaku
user_otaku_1 = User.where(email: 'user.otaku1@primeanimes.com.br').first_or_create(name: 'User Otaku 1', password: '12345678', status: :active)
user_otaku_1.confirm
user_otaku_2 = User.where(email: 'user.otaku2@primeanimes.com.br').first_or_create(name: 'User Otaku 2', password: '12345678', status: :active)
user_otaku_2.confirm
user_otaku_3 = User.where(email: 'user.otaku3@primeanimes.com.br').first_or_create(name: 'User Otaku 3', password: '12345678', status: :active)
user_otaku_3.confirm
user_otaku_4 = User.where(email: 'user.otaku4@primeanimes.com.br').first_or_create(name: 'User Otaku 4', password: '12345678', status: :inactive)
user_otaku_4.confirm
user_otaku_5 = User.where(email: 'user.otaku5@primeanimes.com.br').first_or_create(name: 'User Otaku 5', password: '12345678', status: :suspended)
user_otaku_5.confirm

puts 'Finishing seed execution.'
