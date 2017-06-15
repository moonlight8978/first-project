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
  profile_image: 'https://40.media.tumblr.com/59ffcfc171694ffe29f5f3399e2b03c6/tumblr_nip773wOu31rhrl68o4_400.png',
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
  profile_image: 'https://40.media.tumblr.com/59ffcfc171694ffe29f5f3399e2b03c6/tumblr_nip773wOu31rhrl68o4_400.png',
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
  profile_image: 'https://40.media.tumblr.com/59ffcfc171694ffe29f5f3399e2b03c6/tumblr_nip773wOu31rhrl68o4_400.png',
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
  title_en: 'Koi Suru Doll to Omoi no Kiseki ~Poupee de Souhaits~',
  title: '恋する少女と想いのキセキ～Poupee de souhaits～',
  length: 2,
  description:
    '主人公・深作友紀は幼い頃、自らを人形遣いと名乗る、「阿須葉」という女性の屋敷に出入りし、'\
    '彼女が持つ人形達とたくさんの言葉を交わしていた。',
  description_en:
    'When he was a young boy, Tomoki met the puppet master Asuha who didn’t ‘use’ '\
    'the dolls, but cherished them like people. He doesn’t remember those times '\
    'clearly, but he felt like the dolls there were alive when he snuck into her '\
    'mansion and talked with them. Those days were his most distant and happiest memories.',
  image: 'https://s.vndb.org/cv/85/23185.jpg',
  image_nsfw: false
)

country = General::Country.create(
  name_en: 'Japan',
  name: '日本'
)

company = Vndb::Company.new(
  name: 'Sugar Pot',
  name_en: 'Sugar Pot',
  link: 'http://www.sugarpot-hp.com/'
)

company.country = country
company.save

ena = novel.characters.create(
  name_en: 'Ena',
  name: 'エナ',
  birthday_day: 1,
  birthday_month: 11,
  gender: 0,
  height: 145,
  bust: 72,
  waist: 52,
  hip: 74,
  role: 1
)

novel.characters.create(
  name_en: 'Himekawa Mitomo',
  name: '姫川美朋',
  birthday_day: 10,
  birthday_month: 3,
  gender: 0,
  height: 160,
  bust: 93,
  waist: 59,
  hip: 91,
  role: 1
)

novel.characters.create(
  name_en: 'Komakuri Amane',
  name: '駒久利天音',
  birthday_day: 25,
  birthday_month: 8,
  gender: 0,
  height: 150,
  bust: 81,
  waist: 55,
  hip: 80,
  role: 1
)

novel.characters.create(
  name_en: 'Shuri',
  name: '珠璃',
  birthday_day: 22,
  birthday_month: 2,
  gender: 0,
  height: 150,
  bust: 90,
  waist: 58,
  hip: 88,
  role: 1
)

novel.characters.create(
  name_en: 'Towa',
  name: 'トワ',
  birthday_day: 8,
  birthday_month: 10,
  gender: 0,
  height: 156,
  bust: 88,
  waist: 56,
  hip: 85,
  role: 1
)

novel.characters.create(
  name_en: 'Yoshino Sara',
  name: '吉野紗良',
  birthday_day: 4,
  birthday_month: 6,
  gender: 0,
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
  released: Date.new(2014, 06, 06),
  title: '恋する少女（ドール）と想いのキセキ～Poupee de souhaits～ パッケージ版',
  title_en: 'Koisuru Doll to Omoi no Kiseki ~Poupee de Souhaits~ Package Edition',
  status: 1,
  age_rating: 1
)

release.save

release.developers << company

release.publishers << company

release2 = novel.releases.build(
  voiced: 2,
  animation_story: 0,
  animation_ero: 0,
  released: Date.new(2013, 12, 20),
  title: '恋する少女（ドール）と想いのキセキ～Poupee de souhaits～ web体験版01',
  title_en: 'Koisuru Doll to Omoi no Kiseki ~Poupee de Souhaits~ Web Trial Edition 01',
  status: 0,
  age_rating: 1
)

release2.save

release2.developers << company

release2.publishers << company

tag = Vndb::Tag.create(
  tag: '同じ屋根',
  tag_en: 'Same Roof',
  description_en:
    'The protagonist lives in the same building as one of the heroines/heroes '\
    'for an extended period.'
)

novel.tags << tag

Vndb::Person.create(
  name_en: 'Aoba Ringo',
  name: '青葉りんご',
  link: 'http://ameblo.jp/aobaringorongoronstundup/',
  twitter: 'https://twitter.com/aobaringo'
)

Vndb::Person.create(
  name_en: 'Ogura Yui',
  name: '小倉結衣',
  link: 'http://ameblo.jp/bisyouzyoge-mu-seiyuu/',
  twitter: 'https://twitter.com/ogurayui1017'
)

Vndb::Person.create(
  name_en: 'Miruno Jun',
  name: 'ミルノ純',
  link: 'http://synchronist.net/',
  twitter: 'https://twitter.com/mirumirumiruno'
)

Vndb::Person.create(
  name_en: 'Sakata Yuki',
  name: '坂田有希',
  link: 'http://ameblo.jp/snow11snow22/'
)

Vndb::Person.create(
  name_en: 'Mizusawa Kei',
  name: '瑞沢渓',
  link: 'http://y-tail.jp/profile/mizusawa.html'
)

Vndb::Person.create(
  name_en: 'Hayase Yayoi',
  name: '早瀬ゃょぃ',
  link: 'http://ameblo.jp/hayase-yayoi/',
  twitter: 'https://twitter.com/hayaseyayoi'
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
  alias_en: 'Moka Choko',
  alias: '萌花ちょこ'
)

Vndb::VoiceActress.create(
  person_id: 4,
  character_id: 4
)

Vndb::VoiceActress.create(
  person_id: 5,
  character_id: 5,
  alias_en: 'Kawashima Rino',
  alias: 'かわしまりの'
)

Vndb::VoiceActress.create(
  person_id: 6,
  character_id: 6
)

nao = Vndb::Person.create(
  name_en: 'nao',
  name: 'なお',
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
  note: 'エンディング「茜色の奇跡」',
  alias: 'miru',
  alias_en: 'miru'
)

nao = Vndb::Person.create(
  name_en: 'Arai Kenji',
  name: '新井健史',
  link: 'http://hemuri.com/',
  twitter: 'https://twitter.com/arakeso'
)

Vndb::Staff.create(
  person_id: 8,
  novel_id: 1,
  position: 'Composer',
  note: 'BGM'
)

Vndb::Novel.create(
  title_en: 'Hime-sama Love Life! -Motto! Ichaicha ☆ Paradise!-',
  title: '姫様LOVEライフ！ -もーっと！イチャイチャ☆ぱらだいす！-',
  length: 2,
  image: 'https://s.vndb.org/cv/42/31642.jpg',
  image_nsfw: false
).characters.create(
  name_en: 'Ou Maika',
  name: '王舞華',
  birthday_day: 3,
  birthday_month: 8,
  gender: 0,
  height: 148,
  bust: 80,
  waist: 51,
  hip: 82,
  role: 1
)

Vndb::VoiceActress.create(
  person_id: 1,
  character_id: 7
)