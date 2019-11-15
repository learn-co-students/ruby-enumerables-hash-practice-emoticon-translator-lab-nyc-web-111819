# require modules here
require "pry"
require "yaml"
def load_library(file_path)
emoticons = YAML.load_file(file_path)
new_hash = {
  "get_meaning" => {},
  "get_emoticon" => {}
}
emoticons.each do |k, v|
jap_emoticon = v[1]
eng_emoticon = v[0]
new_hash["get_meaning"][jap_emoticon] = k
new_hash["get_emoticon"][eng_emoticon] = jap_emoticon 
end 
return new_hash 
end

def get_japanese_emoticon(file_path, emoticon)
  data = load_library(file_path)
  if data["get_emoticon"][emoticon]
  return data["get_emoticon"][emoticon]
else 
  return "Sorry, that emoticon was not found"
end
end

def get_english_meaning(file_path, emoticon)
 data = load_library(file_path)
  if data["get_meaning"][emoticon]
  return data["get_meaning"][emoticon]
else 
  return "Sorry, that emoticon was not found"
end 
end