require 'yaml'

def load_library(file_path)
  library_hash = YAML.load_file(file_path)

  result_hash = {}

  get_meaning = {}
  get_emoticon = {}

  library_hash.keys.each {|meaning|
    emoticon = library_hash[meaning][0]
    japanese_emoticon = library_hash[meaning][1]

    get_meaning[japanese_emoticon] = meaning
    get_emoticon[emoticon] = japanese_emoticon
  }

result_hash[:get_meaning] = get_meaning
result_hash[:get_emoticon] = get_emoticon

result_hash

end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)

  if lib[:get_emoticon][emoticon]
    lib[:get_emoticon][emoticon]
  else
    "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)

  if lib[:get_meaning][emoticon]
    lib[:get_meaning][emoticon]
  else
    "Sorry, that emoticon was not found"  
  end
end
