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
  last_name: '鈴木',
  name_pronounce: 'すずきひろし'
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
  last_name: '鈴木',
  name_pronounce: 'すずきひろし'
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
  last_name: '鈴木',
  name_pronounce: 'すずきひろし'
)

role_user = Security::User::Role.create(role: 'ROLE_USER')
role_moderator = Security::User::Role.create(role: 'ROLE_MODERATOR')
role_admin = Security::User::Role.create(role: 'ROLE_ADMIN')

user.roles << role_user
moderator.roles << role_user << role_moderator
admin.roles << role_user << role_moderator << role_admin

win = Db::Novel::Release::Platform.create(platform: 'Windows')
linux = Db::Novel::Release::Platform.create(platform: 'Linux')
ps = Db::Novel::Release::Platform.create(platform: 'Playstations')
ios = Db::Novel::Release::Platform.create(platform: 'iOS')
android = Db::Novel::Release::Platform.create(platform: 'Android')
dvd = Db::Novel::Release::Platform.create(platform: 'DVD Player')

novels = [
  Db::Novel.create(
    title_en: 'Koi Suru Doll to Omoi no Kiseki ~Poupee de Souhaits~',
    title: '恋する少女と想いのキセキ～Poupee de souhaits～',
    title_pronounce: 'こいするドールとおもいのきせき～Poupee de souhaits～',
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
  ),
  Db::Novel.create(
    title_en: 'Hime-sama Love Life! -Motto! Ichaicha ☆ Paradise!-',
    title: '姫様LOVEライフ！ -もーっと！イチャイチャ☆ぱらだいす！-',
    title_pronounce: 'ひめさまLOVEライフ！ -もーっと！イチャイチャ☆ぱらだいす！-',
    length: 2,
    image: 'https://s.vndb.org/cv/42/31642.jpg',
    image_nsfw: false
  )
]

country = Country.create(
  name_en: 'Japan',
  name: '日本',
  code: 'jp'
)

company = Db::Company.new(
  name: 'Sugar Pot',
  name_en: 'Sugar Pot',
  name_pronounce: 'Sugar Pot',
  link: 'http://www.sugarpot-hp.com/'
)

company.country = country
company.save

releases = [
  novels[0].releases.create(
    voiced: 2,
    animation_story: 0,
    animation_ero: 0,
    released: Date.new(2014, 06, 06),
    title: '恋する少女（ドール）と想いのキセキ～Poupee de souhaits～ ダウンロード版',
    title_en: 'Koisuru Doll to Omoi no Kiseki ~Poupee de Souhaits~ Download Edition',
    status: 1,
    age_rating: 3,
    platform: win
  ),
  novels[0].releases.create(
    voiced: 2,
    animation_story: 0,
    animation_ero: 0,
    released: Date.new(2014, 02, 07),
    title: '恋する少女（ドール）と想いのキセキ～Poupee de souhaits～ web体験版０２.５',
    title_en: 'Koisuru Doll to Omoi no Kiseki ~Poupee de Souhaits~ Web Trial Edition 02.5',
    status: 0,
    age_rating: 3,
    platform: win
  ),
  novels[0].releases.create(
    voiced: 2,
    animation_story: 0,
    animation_ero: 0,
    released: Date.new(2014, 02, 28),
    title: '恋する少女（ドール）と想いのキセキ～Poupee de souhaits～ パッケージ版',
    title_en: 'Koisuru Doll to Omoi no Kiseki ~Poupee de Souhaits~ Package Edition',
    status: 1,
    age_rating: 3,
    platform: win,
    jan_num: '4571346000116'
  ),
  novels[0].releases.create(
    voiced: 2,
    animation_story: 0,
    animation_ero: 0,
    released: Date.new(2013, 12, 30),
    title: '恋する少女（ドール）と想いのキセキ～Poupee de souhaits～ web体験版01',
    title_en: 'Koisuru Doll to Omoi no Kiseki ~Poupee de Souhaits~ Web Trial Edition 01',
    status: 0,
    age_rating: 3,
    platform: win
  ),
  novels[0].releases.create(
    voiced: 2,
    animation_story: 0,
    animation_ero: 0,
    released: Date.new(2014, 01, 30),
    title: '恋する少女（ドール）と想いのキセキ～Poupee de souhaits～ web体験版02',
    title_en: 'Koisuru Doll to Omoi no Kiseki ~Poupee de Souhaits~ Web Trial Edition 02',
    status: 0,
    age_rating: 3,
    platform: win
  ),
  novels[0].releases.create(
    voiced: 2,
    animation_story: 0,
    animation_ero: 0,
    released: Date.new(2016, 04, 28),
    title: 'しゅがぽ☆Best Selection!!',
    title_en: 'Shugapo ☆ Best Selection!!',
    status: 1,
    age_rating: 3,
    platform: win,
    jan_num: '4571346000161'
  )
]

releases.each do |release|
  release.developers << company
  release.publishers << company
  release.save
end

novels[0].screenshots.create(image: 'https://s.vndb.org/sf/93/99693.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/94/99694.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/95/99695.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/97/99697.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/00/99700.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/01/99701.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/02/99702.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/03/99703.jpg', image_nsfw: true)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/04/99704.jpg', image_nsfw: true)
novels[0].screenshots.create(image: 'https://s.vndb.org/sf/05/99705.jpg', image_nsfw: true)

tag = [
  Db::Novel::Tag.create(
    tag: '同棲',
    tag_en: 'Same Roof',
    description_en:
      'The protagonist lives in the same building as one of the heroines/heroes '\
      'for an extended period.'
  ),
  Db::Novel::Tag.create(
    tag: 'ロリ',
    tag_en: 'Loli',
    description_en:
      'At least one of the heroines is a loli. She\'s either an underage girl or '\
      'has the looks of one.'
  )
]

novels[0].tags << tag[0]
novels[0].tags << tag[1]

Db::Person.create(
  name_en: 'Aoba Ringo',
  name_pronounce: 'あおばりんご',
  name: '青葉りんご',
  link: 'http://ameblo.jp/aobaringorongoronstundup/',
  twitter: 'https://twitter.com/aobaringo'
)

Db::Person.create(
  name_en: 'Ogura Yui',
  name_pronounce: 'おぐらゆい',
  name: '小倉結衣',
  link: 'http://ameblo.jp/bisyouzyoge-mu-seiyuu/',
  twitter: 'https://twitter.com/ogurayui1017'
)

Db::Person.create(
  name_en: 'Miruno Jun',
  name_pronounce: 'みるのじゅん',
  name: 'ミルノ純',
  link: 'http://synchronist.net/',
  twitter: 'https://twitter.com/mirumirumiruno'
)

Db::Person.create(
  name_en: 'Sakata Yuki',
  name_pronounce: 'さかたゆき',
  name: '坂田有希',
  link: 'http://ameblo.jp/snow11snow22/'
)

Db::Person.create(
  name_en: 'Mizusawa Kei',
  name_pronounce: 'みずさわけい',
  name: '瑞沢渓',
  link: 'http://y-tail.jp/profile/mizusawa.html'
)

Db::Person.create(
  name_en: 'Hayase Yayoi',
  name_pronounce: 'はやせやよい',
  name: '早瀬やよい',
  link: 'http://ameblo.jp/hayase-yayoi/',
  twitter: 'https://twitter.com/hayaseyayoi'
)

characters = [
  Db::Novel::Character.create(
    name_en: 'Ena',
    name_pronounce: 'えな',
    name: 'エナ',
    birthday_day: 1,
    birthday_month: 11,
    gender: 0,
    height: 145,
    bust: 72,
    waist: 52,
    hips: 74,
    role: 1
  ),
  Db::Novel::Character.create(
    name_en: 'Himekawa Mitomo',
    name_pronounce: 'ひめかわみとも',
    name: '姫川美朋',
    birthday_day: 10,
    birthday_month: 3,
    gender: 0,
    height: 160,
    bust: 93,
    waist: 59,
    hips: 91,
    role: 1
  ),
  Db::Novel::Character.create(
    name_en: 'Komakuri Amane',
    name_pronounce: 'こまくりあまね',
    name: '駒久利天音',
    birthday_day: 25,
    birthday_month: 8,
    gender: 0,
    height: 150,
    bust: 81,
    waist: 55,
    hips: 80,
    role: 1
  ),
  Db::Novel::Character.create(
    name_en: 'Shuri',
    name_pronounce: 'しゅり',
    name: '珠璃',
    birthday_day: 22,
    birthday_month: 2,
    gender: 0,
    height: 150,
    bust: 90,
    waist: 58,
    hips: 88,
    role: 1
  ),
  Db::Novel::Character.create(
    name_en: 'Towa',
    name_pronounce: 'とわ',
    name: 'トワ',
    birthday_day: 8,
    birthday_month: 10,
    gender: 0,
    height: 156,
    bust: 88,
    waist: 56,
    hips: 85,
    role: 1
  ),
  Db::Novel::Character.create(
    name_en: 'Yoshino Sara',
    name_pronounce: 'よしのさら',
    name: '吉野紗良',
    birthday_day: 4,
    birthday_month: 6,
    gender: 0,
    height: 155,
    bust: 86,
    waist: 58,
    hips: 84,
    role: 2
  ),
  Db::Novel::Character.create(
    name_en: 'Ou Maika',
    name_pronounce: 'おうまいか',
    name: '王舞華',
    birthday_day: 3,
    birthday_month: 8,
    gender: 0,
    height: 148,
    bust: 80,
    waist: 51,
    hips: 82,
    role: 1
  )
]

x_1 = Db::Novel::CharacterNovel.create(
  character: characters[0],
  novel_id: 1
)
x_1.voice_actresses.create(
  person_id: 1
)

x_2 = Db::Novel::CharacterNovel.create(
  character: characters[1],
  novel_id: 1
)
x_2.voice_actresses.create(
  person_id: 2
)

x_3 = Db::Novel::CharacterNovel.create(
  character: characters[2],
  novel_id: 1
)
x_3.voice_actresses.create(
  person_id: 3,
  alias_en: 'Moka Choko',
  alias: '萌花ちょこ'
)

x_4 = Db::Novel::CharacterNovel.create(
  character: characters[3],
  novel_id: 1
)
x_4.voice_actresses.create(
  person_id: 4
)

x_5 = Db::Novel::CharacterNovel.create(
  character: characters[4],
  novel_id: 1
)
x_5.voice_actresses.create(
  person_id: 5,
  alias_en: 'Kawashima Rino',
  alias: 'かわしまりの'
)

x_6 = Db::Novel::CharacterNovel.create(
  character: characters[5],
  novel_id: 1
)
x_6.voice_actresses.create(
  person_id: 6
)

nao = Db::Person.create(
  name_en: 'nao',
  name: 'なお',
  name_pronounce: 'なお',
  link: 'http://ameblo.jp/dg-naoblog/'
)

nao_vocal = novels[0].staffs.build(
  position: 'vocals',
  note: 'オープニング「永遠なる絆と思いのキセキ'
)

nao_vocal.person = nao

nao_vocal.save

Db::Novel::Staff.create(
  person_id: 3,
  novel_id: 1,
  position: 'vocals',
  note: 'エンディング「茜色の奇跡」',
  alias: 'miru',
  alias_en: 'miru'
)

Db::Person.create(
  name_en: 'Arai Kenji',
  name_pronounce: 'あらいけんじ',
  name: '新井健史',
  link: 'http://hemuri.com/',
  twitter: 'https://twitter.com/arakeso'
)

Db::Novel::Staff.create(
  person_id: 8,
  novel_id: 1,
  position: 'composer',
  note: 'BGM'
)

Db::Person.create(
  name_en: 'Naruse Mamoru',
  name_pronounce: 'なるせまもる',
  name: '成瀬守',
  link: 'http://theflyers.sakura.ne.jp/',
  twitter: 'https://twitter.com/mamo_su'
)

Db::Novel::Staff.create(
  person_id: 9,
  novel_id: 1,
  position: 'artist'
)

Db::Person.create(
  name_en: 'Tsukishima Yuko',
  name_pronounce: 'つきしまゆこ',
  name: '月嶋ゆうこ',
  link: 'http://roritora.k-server.org/',
  twitter: 'https://twitter.com/yuko_tsukishima'
)

Db::Novel::Staff.create(
  person_id: 10,
  novel_id: 1,
  position: 'artist'
)

Db::Person.create(
  name_en: 'Oumiya Yuu',
  name_pronounce: 'おうみやゆう',
  name: '近江谷宥',
  link: 'http://oumiyayuu.blog.fc2.com/'
)

Db::Novel::Staff.create(
  person_id: 11,
  novel_id: 1,
  position: 'scenario'
)

Db::Person.create(
  name_en: 'Dosei',
  name_pronounce: 'どせい',
  name: 'どせい',
  link: 'http://www111.sakura.ne.jp/~hotaru/',
  twitter: 'https://twitter.com/dosei_s'
)

Db::Novel::Staff.create(
  person_id: 12,
  novel_id: 1,
  position: 'staff',
  note: 'Movie'
)

Db::Person.create(
  name_en: 'Minami Makoto',
  name_pronounce: 'みなみまこと',
  name: '南誠',
  link: 'http://www.fsinet.or.jp/~makochin/',
  twitter: 'https://twitter.com/saburo_m'
)

Db::Novel::Staff.create(
  person_id: 13,
  novel_id: 1,
  position: 'staff',
  note: 'Backgrounds'
)

Db::Person.create(
  name_en: 'Oumiya Yuu',
  name_pronounce: 'おうみやゆう',
  name: '江谷宥',
  link: 'http://oumiyayuu.blog.fc2.com/'
)

Db::Novel::Staff.create(
  person_id: 14,
  novel_id: 1,
  position: 'staff',
  note: 'Planning'
)

Db::Novel::Staff.create(
  person_id: 10,
  novel_id: 1,
  position: 'staff',
  note: 'Planning'
)

Db::Person.create(
  name_en: 'Yamashita Shinichirou',
  name_pronounce: 'やましたしんいちろう',
  name: '山下慎一狼',
  link: 'http://ameblo.jp/phoenrill/',
  twitter: 'https://twitter.com/oh_sama'
)

Db::Novel::Staff.create(
  person_id: 15,
  novel_id: 1,
  position: 'staff',
  note: 'OP lyrics'
)

x_6 = Db::Novel::CharacterNovel.create(
  character: characters[6],
  novel_id: 2
)
x_6.voice_actresses.create(
  person_id: 1
)

hmll = novels[1].releases.create(
  voiced: 2,
  animation_story: 0,
  animation_ero: 0,
  released: Date.new(2017, 05, 26),
  title: '姫様LOVEライフ！ -もーっと！イチャイチャ☆ぱらだいす！- 通常版',
  title_en: ' Hime-sama Love Life! -Motto! Ichaicha ☆ Paradise!- Regular Edition',
  status: 1,
  age_rating: 3,
  platform: win
)

princess_sugar = Db::Company.create(
  name: 'Princess Sugar',
  name_en: 'Princess Sugar',
  link: 'http://www.s-digi.jp/princess-sugar/',
  country: country
)

[hmll.developers, hmll.publishers].each do |producers|
  producers << princess_sugar
end
