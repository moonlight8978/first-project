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

win = Vndb::Platform.create(platform: 'Windows')
linux = Vndb::Platform.create(platform: 'Linux')
ps = Vndb::Platform.create(platform: 'Playstations')
ios = Vndb::Platform.create(platform: 'iOS')
android = Vndb::Platform.create(platform: 'Android')
dvd = Vndb::Platform.create(platform: 'DVD Player')

novels = [
  Vndb::Novel.create(
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
  ),
  Vndb::Novel.create(
    title_en: 'Hime-sama Love Life! -Motto! Ichaicha ☆ Paradise!-',
    title: '姫様LOVEライフ！ -もーっと！イチャイチャ☆ぱらだいす！-',
    length: 2,
    image: 'https://s.vndb.org/cv/42/31642.jpg',
    image_nsfw: false
  )
]

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
    platform: win
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
    platform: win
  )
]

releases.each do |release|
  release.developers << company
  release.publishers << company
  release.save
end

novels[0].screenshots.create(image: 'https://s.vndb.org/st/93/99693.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99694.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99695.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99697.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99700.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99701.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99702.jpg', image_nsfw: false)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99703.jpg', image_nsfw: true)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99704.jpg', image_nsfw: true)
novels[0].screenshots.create(image: 'https://s.vndb.org/st/94/99705.jpg', image_nsfw: true)

tag = [
  Vndb::Tag.create(
    tag: '同じ屋根',
    tag_en: 'Same Roof',
    description_en:
      'The protagonist lives in the same building as one of the heroines/heroes '\
      'for an extended period.'
  ),
  Vndb::Tag.create(
    tag: 'ロリ',
    tag_en: 'Loli',
    description_en:
      'At least one of the heroines is a loli. She\'s either an underage girl or '\
      'has the looks of one.'
  )
]

novels[0].tags << tag[0] << tag[1]

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

characters = [
  Vndb::Character.create(
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
  ),
  Vndb::Character.create(
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
  ),
  Vndb::Character.create(
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
  ),
  Vndb::Character.create(
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
  ),
  Vndb::Character.create(
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
  ),
  Vndb::Character.create(
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
  ),
  Vndb::Character.create(
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
]

Vndb::VoiceActress.create(
  person_id: 1,
  character: characters[0],
  novel_id: 1
)

Vndb::VoiceActress.create(
  person_id: 2,
  character: characters[1],
  novel_id: 1
)

Vndb::VoiceActress.create(
  person_id: 3,
  character: characters[2],
  alias_en: 'Moka Choko',
  alias: '萌花ちょこ',
  novel_id: 1
)

Vndb::VoiceActress.create(
  person_id: 4,
  character: characters[3],
  novel_id: 1
)

Vndb::VoiceActress.create(
  person_id: 5,
  character: characters[4],
  alias_en: 'Kawashima Rino',
  alias: 'かわしまりの',
  novel_id: 1
)

Vndb::VoiceActress.create(
  person_id: 6,
  character: characters[5],
  novel_id: 1
)

nao = Vndb::Person.create(
  name_en: 'nao',
  name: 'なお',
  link: 'http://ameblo.jp/dg-naoblog/'
)

nao_vocal = novels[0].staffs.build(
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

Vndb::Person.create(
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

Vndb::Person.create(
  name_en: 'Naruse Mamoru',
  name: '成瀬守',
  link: 'http://theflyers.sakura.ne.jp/',
  twitter: 'https://twitter.com/mamo_su'
)

Vndb::Staff.create(
  person_id: 9,
  novel_id: 1,
  position: 'Artist'
)

Vndb::Person.create(
  name_en: 'Tsukishima Yuko',
  name: '月嶋ゆうこ',
  link: 'http://roritora.k-server.org/',
  twitter: 'https://twitter.com/yuko_tsukishima'
)

Vndb::Staff.create(
  person_id: 9,
  novel_id: 1,
  position: 'Artist'
)

Vndb::Person.create(
  name_en: 'Oumiya Yuu',
  name: '近江谷宥',
  link: 'http://oumiyayuu.blog.fc2.com/'
)

Vndb::Staff.create(
  person_id: 10,
  novel_id: 1,
  position: 'Scenario'
)

Vndb::Person.create(
  name_en: 'Dosei',
  name: 'どせい',
  link: 'http://www111.sakura.ne.jp/~hotaru/',
  twitter: 'https://twitter.com/dosei_s'
)

Vndb::Staff.create(
  person_id: 11,
  novel_id: 1,
  position: 'Staff',
  note: 'Movie'
)

Vndb::Person.create(
  name_en: 'Minami Makoto',
  name: '南誠',
  link: 'http://www.fsinet.or.jp/~makochin/',
  twitter: 'https://twitter.com/saburo_m'
)

Vndb::Staff.create(
  person_id: 12,
  novel_id: 1,
  position: 'Staff',
  note: 'Backgrounds'
)

Vndb::Person.create(
  name_en: 'Oumiya Yuu',
  name: '江谷宥',
  link: 'http://oumiyayuu.blog.fc2.com/'
)

Vndb::Staff.create(
  person_id: 13,
  novel_id: 1,
  position: 'Staff',
  note: 'Planning'
)

Vndb::Staff.create(
  person_id: 9,
  novel_id: 1,
  position: 'Staff',
  note: 'Planning'
)

Vndb::Person.create(
  name_en: 'Yamashita Shinichirou',
  name: '山下慎一狼',
  link: 'http://ameblo.jp/phoenrill/',
  twitter: 'https://twitter.com/oh_sama'
)

Vndb::Staff.create(
  person_id: 14,
  novel_id: 1,
  position: 'Staff',
  note: 'OP lyrics'
)

novels[1].voice_actresses.create(
  person_id: 1,
  character: characters[6],
  novel_id: 2
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

princess_sugar = Vndb::Company.create(
  name: 'Princess Sugar',
  name_en: 'Princess Sugar',
  link: 'http://www.s-digi.jp/princess-sugar/',
  country: country
)

[hmll.developers, hmll.publishers].each do |producers|
  producers << princess_sugar
end
