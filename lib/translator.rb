require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  translation = {:get_meaning => {},:get_emoticon => {} }

  emoticons.reduce(translation) do |item, (key,value)|
    item[:get_meaning][value[1]] = key
    item[:get_emoticon][value[0]] = value[1]
    item
  end

  translation
end

def get_japanese_emoticon(filepath, emoticon)
  library = load_library(filepath)
  library.each do |get, translation_hash|
    translation_hash.each do |emote, translation|
      if emote == emoticon
        return translation
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, emoticon)
  library = load_library(filepath)
  library.each do |get, translation_hash|
    translation_hash.each do |emote, translation|
      if emote == emoticon
        return translation
      end
    end
  end
  "Sorry, that emoticon was not found"
end