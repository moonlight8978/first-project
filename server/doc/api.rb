novel = {

}

character = {
  url: {
    create: [:novel_id],
    update: [:character_id]
    [:add_char_to_novel, :destroy] => [:novel_id, :character_id]
  },
  body: {
    [:create, :update] => [
      :name, :name_en, :birthday_day, :birthday_month, :gender,
      :weight, :height, :bust, :waist, :hips, :blood_type, :image, :role,
      :description, :description_en
    ]
  }
}

voice_actress = {
  url: {
    create: [:novel_id, :character_id, :person_id]
    [:update, :destroy] => [:voice_actress_id]
  },
  body: {
    [:create, :update] => [:alias, :alias_en]
  }
}

release = {
  url: {
    create: [:novel_id]
    update: [:release_id]
    [:add_release_to_novel, :destroy] => [:novel_id, :release_id]
  },
  body: {
    [:create, :update] => [
      :PLATFORM_ID, :title, :title_en, :status, :voiced, :animation_ero,
      :animation_story, :jan_num, :released, :age_rating
    ]
  }
}
