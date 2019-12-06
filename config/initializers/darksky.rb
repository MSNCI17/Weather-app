require 'darksky-api'
DarkSky.config(key: 'c1a83c400c774757eae9c09a71e5abc1')
CITIES_DICTIONARY = YAML.load_file("#{Rails.root}/config/cities.yml")
