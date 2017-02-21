require 'sinatra'
require 'haml'
require './dict'

CAR_DIR = 'public/car-images'

class CZlang
  attr_accessor :translate
  def initialize
    self.translate = CZ_LANG
  end
end

class ENlang
  attr_accessor :translate
  def initialize
    self.translate = EN_LANG
  end
end

get '/' do
  @url = request.fullpath
  url_id = @url.split('?')
  lang_id = url_id.last
  if lang_id == 'en'
    word_list = ENlang.new
    @phrase = word_list.translate
  else
    word_list = CZlang.new
    @phrase = word_list.translate
  end
  @images = Dir.foreach(CAR_DIR).select { |x| File.file?(File.join(CAR_DIR, x)) }
  haml :index
end

get '/about' do
  @url = request.fullpath
  url_id = @url.split('?')
  lang_id = url_id.last
  if lang_id == 'en'
    word_list = ENlang.new
    @phrase = word_list.translate
  else
    word_list = CZlang.new
    @phrase = word_list.translate
  end
  haml :about
end

get '/products' do
  @url = request.fullpath
  url_id = @url.split('?')
  lang_id = url_id.last
  if lang_id == 'en'
    word_list = ENlang.new
    @phrase = word_list.translate
  else
    word_list = CZlang.new
    @phrase = word_list.translate
  end
  haml :products
end
