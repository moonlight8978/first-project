# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Security::User.create(
  user_name: 'admin',
  password: 'admin',
  email: 'admin@gmail.com',
  phone_number: '0999999999',
  address: '12　東京',
  activated: true,
  profile_image_url: 'https://40.media.tumblr.com/59ffcfc171694ffe29f5f3399e2b03c6/tumblr_nip773wOu31rhrl68o4_400.png',
  birthday: DateTime.parse('1997-12-18'),
  about: 'こんにちは！',
  signature: 'これは俺のシグネチャー。',
  country: '日本',
  first_name: 'ひろし',
  last_name: '鈴木'
)

moderator = Security::User.create(
  user_name: 'moderator',
  password: 'moderator',
  email: 'moderator@gmail.com',
  phone_number: '0977777777',
  address: '12　東京',
  activated: true,
  profile_image_url: 'https://40.media.tumblr.com/59ffcfc171694ffe29f5f3399e2b03c6/tumblr_nip773wOu31rhrl68o4_400.png',
  birthday: DateTime.parse('1997-12-18'),
  about: 'こんにちは！',
  signature: 'これは俺のシグネチャー。',
  country: '日本',
  first_name: 'ひろし',
  last_name: '鈴木'
)

user = Security::User.create(
  user_name: 'user',
  password: 'user',
  email: 'user@gmail.com',
  phone_number: '0988888888',
  address: '12　東京',
  activated: true,
  profile_image_url: 'https://40.media.tumblr.com/59ffcfc171694ffe29f5f3399e2b03c6/tumblr_nip773wOu31rhrl68o4_400.png',
  birthday: DateTime.parse('1997-12-18'),
  about: 'こんにちは！',
  signature: 'これは俺のシグネチャー。',
  country: '日本',
  first_name: 'ひろし',
  last_name: '鈴木'
)

Security::Role.create(role: 'ROLE_USER')
Security::Role.create(role: 'ROLE_MODERATOR')
Security::Role.create(role: 'ROLE_ADMIN')

Security::Authority.create(user_id: 1, role_id: 1)
Security::Authority.create(user_id: 1, role_id: 2)
Security::Authority.create(user_id: 1, role_id: 3)

Security::Authority.create(user_id: 2, role_id: 1)
Security::Authority.create(user_id: 2, role_id: 2)

Security::Authority.create(user_id: 3, role_id: 1)
