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

ena = novel.characters.create(
  name: 'Ena',
  original_name: 'エナ',
  birthday_day: 1,
  birthday_month: 11,
  gender: 'Female',
  height: 145,
  bust: 72,
  waist: 52,
  hip: 74,
  role: 1
)

novel.characters.create(
  name: 'Himekawa Mitomo',
  original_name: '姫川美朋',
  birthday_day: 10,
  birthday_month: 3,
  gender: 'Female',
  height: 160,
  bust: 93,
  waist: 59,
  hip: 91,
  role: 1
)

novel.characters.create(
  name: 'Komakuri Amane',
  original_name: '駒久利天音',
  birthday_day: 25,
  birthday_month: 8,
  gender: 'Female',
  height: 150,
  bust: 81,
  waist: 55,
  hip: 80,
  role: 1
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
  hip: 88,
  role: 1
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
  hip: 85,
  role: 1
)

novel.characters.create(
  name: 'Yoshino Sara',
  original_name: '吉野紗良',
  birthday_day: 4,
  birthday_month: 6,
  gender: 'Female',
  height: 155,
  bust: 86,
  waist: 58,
  hip: 84,
  role: 2
)

release = novel.releases.build(
  voiced: 2,
  animation_story: 0,
  animation_ero: 0,
  released: Date.new(2014, 06, 06)
)

release.save

release.developers << company

release.publishers << company

tag = Vndb::Tag.create(tag: 'Same Roof')

novel.tags << tag

Vndb::Person.create(
  name: 'Aoba Ringo',
  original_name: '青葉りんご',
  link: 'http://ameblo.jp/aobaringorongoronstundup/'
)

Vndb::Person.create(
  name: 'Ogura Yui',
  original_name: '小倉結衣',
  link: 'https://twitter.com/ogurayui1017'
)

Vndb::Person.create(
  name: 'Miruno Jun',
  original_name: 'ミルノ純',
  link: 'https://twitter.com/mirumirumiruno'
)

Vndb::Person.create(
  name: 'Sakata Yuki',
  original_name: '坂田有希',
  link: 'http://ameblo.jp/snow11snow22/'
)

Vndb::Person.create(
  name: 'Mizusawa Kei',
  original_name: '瑞沢渓',
  link: 'http://y-tail.jp/profile/mizusawa.html'
)

Vndb::Person.create(
  name: 'Hayase Yayoi',
  original_name: '早瀬ゃょぃ',
  link: 'https://twitter.com/hayaseyayoi'
)

Vndb::VoiceActress.create(
  person_id: 1,
  character_id: 1
)

Vndb::VoiceActress.create(
  person_id: 2,
  character_id: 2
)

Vndb::VoiceActress.create(
  person_id: 3,
  character_id: 3,
  alias: 'Moka Choko',
  original_alias: '萌花ちょこ'
)

Vndb::VoiceActress.create(
  person_id: 4,
  character_id: 4
)

Vndb::VoiceActress.create(
  person_id: 5,
  character_id: 5,
  alias: 'Kawashima Rino',
  original_alias: 'かわしまりの'
)

Vndb::VoiceActress.create(
  person_id: 6,
  character_id: 6
)

nao = Vndb::Person.create(
  name: 'nao',
  original_name: 'なお',
  link: 'http://ameblo.jp/dg-naoblog/'
)

nao_vocal = novel.staffs.build(
  position: 'Vocals',
  note: 'オープニング「永遠なる絆と思いのキセキ'
)

nao_vocal.person = nao

nao_vocal.save

Vndb::Staff.create(
  person_id: 3,
  novel_id: 1,
  position: 'Vocals',
  note: 'エンディング「茜色の奇跡」'
)

nao = Vndb::Person.create(
  name: 'Arai Kenji',
  original_name: '新井健史',
  link: 'http://hemuri.com/',
  twitter_url: 'https://twitter.com/arakeso'
)

Vndb::Staff.create(
  person_id: 8,
  novel_id: 1,
  position: 'Composer',
  note: 'BGM'
)
