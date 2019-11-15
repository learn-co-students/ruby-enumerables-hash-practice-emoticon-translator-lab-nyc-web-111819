# require modules here
require 'yaml'

def load_library(fp)
  emoticons = YAML.load_file(fp)
  new_hash = {}
  new_hash[:get_meaning] = {}
  new_hash[:get_emoticon] = {}

  emoticons.map {|ele, ele2|
    new_hash[:get_meaning][ele2[1]] = ele
    new_hash[:get_emoticon][ele2[0]] = ele2[1]
  }
  new_hash
end

def get_japanese_emoticon(file, emoticon)
  if !!load_library(file)[:get_emoticon][emoticon]
    return load_library(file)[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(file, emoticon)
    if !!load_library(file)[:get_meaning][emoticon]
      return load_library(file)[:get_meaning][emoticon]
    else
      return "Sorry, that emoticon was not found"
  end
end

