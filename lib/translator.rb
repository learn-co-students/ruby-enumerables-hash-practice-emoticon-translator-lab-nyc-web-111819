require "yaml"

def load_library(library)
  file = File.read(library)
  emoticons = YAML.load(file)
  newFile = {}
  newFile[:get_meaning] = {}
  newFile[:get_emoticon] = {}
  emoticons.each do |key, value|
    newFile[:get_meaning][value[1]] = key
    newFile[:get_emoticon][value[0]] = value[1]
  end
  newFile
end

def get_japanese_emoticon(yaaml, emoticon)
  file = load_library(yaaml)
  if file[:get_emoticon].include? emoticon
    return file[:get_emoticon][emoticon]
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(yaaml, emoticon)
  file = load_library(yaaml)
  if file[:get_meaning].include? emoticon
    return file[:get_meaning][emoticon]
  end
  return "Sorry, that emoticon was not found"
end