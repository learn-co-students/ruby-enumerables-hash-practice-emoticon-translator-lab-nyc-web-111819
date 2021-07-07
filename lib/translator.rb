# require modules here
require "yaml"
require "pry"

def load_library(file)
  emoticons = {}
  emoticons["get_meaning"] = {}
  emoticons["get_emoticon"] = {}
   emoticon_file = YAML.load_file("lib/emoticons.yml")
   emoticon_file.each do |meaning, emoticon|
     emoticons["get_meaning"][emoticon[1]] = meaning
     emoticons["get_emoticon"][emoticon[0]] = emoticon[1]
   end 
   emoticons
end

def get_japanese_emoticon(file, emoticon)
  emoticon_library = load_library(file)
  
  result = ""
  if emoticon_library["get_emoticon"].key?(emoticon) == true
    
    result = emoticon_library["get_emoticon"][emoticon]
  else 
    result = "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning (file, emoticon)
  emoticon_library = load_library(file)
  result = ""

  if emoticon_library["get_meaning"].key?(emoticon) == true 
    result = emoticon_library["get_meaning"][emoticon]
  else 
    result = "Sorry, that emoticon was not found"
  end 
end