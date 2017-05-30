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

role_user = Security::Role.create(role: 'ROLE_USER')
role_moderator = Security::Role.create(role: 'ROLE_MODERATOR')
role_admin = Security::Role.create(role: 'ROLE_ADMIN')

user.roles << role_user
moderator.roles << role_user << role_moderator
admin.roles << role_user << role_moderator << role_admin

novel = Vndb::Novel.create(
  title: 'Koi Suru Doll to Omoi no Kiseki ~Poupee de Souhaits~',
  original_title: '恋する少女と想いのキセキ～Poupee de souhaits～',
  aliases: 'Koisuru Shoujo to Omoi no Kiseki, 恋するドールと想いのキセキ',
  length: 2,
  description: 'When he was a young boy, Tomoki met the puppet master Asuha',
  image: 'https://s.vndb.org/cv/85/23185.jpg',
  image_nsfw: false
)

country = General::Country.create(
  name: 'Japan',
  original_name: '日本'
)

company = Vndb::Company.new(
  name: 'Sugar Pot',
  original_name: '',
  link: 'http://www.sugarpot-hp.com/'
)

company.country = country
company.save

novel.characters.create(
  name: 'Ena',
  original_name: 'エナ',
  birthday_day: 1,
  birthday_month: 11,
  gender: 'Female',
  height: 145,
  bust: 72,
  waist: 52,
  hip: 74
)

novel.characters.create(
  name: 'Himekawa Mitomo',
  original_name: '姫川 美朋',
  birthday_day: 10,
  birthday_month: 3,
  gender: 'Female',
  height: 160,
  bust: 93,
  waist: 59,
  hip: 91
)

novel.characters.create(
  name: 'Komakuri Amane',
  original_name: '駒久利 天音',
  birthday_day: 25,
  birthday_month: 8,
  gender: 'Female',
  height: 150,
  bust: 81,
  waist: 55,
  hip: 80
)

novel.characters.create(
  name: 'Shuri',
  original_name: '珠璃',
  birthday_day: 22,
  birthday_month: 2,
  gender: 'Female',
  height: 150,
  bust: 90,
  waist: 58,
  hip: 88
)

novel.characters.create(
  name: 'Towa',
  original_name: 'トワ',
  birthday_day: 8,
  birthday_month: 10,
  gender: 'Female',
  height: 156,
  bust: 88,
  waist: 56,
  hip: 85
)

novel.characters.create(
  name: 'Yoshino Sara',
  original_name: '吉野 紗良',
  birthday_day: 4,
  birthday_month: 6,
  gender: 'Female',
  height: 155,
  bust: 86,
  waist: 58,
  hip: 84
)
