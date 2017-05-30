require 'nkf'

class NetworkKanjiFilter
  HIRAGANA_FLAGS = '--hiragana -w'
  KATAKANA_FLAGS = '--katakana -w'

  def self.to_hiragana(text)
    NKF.nkf(HIRAGANA_FLAGS, text)
  end

  def self.to_katakana(text)
    NKF.nkf(KATAKANA_FLAGS, text)
  end
end