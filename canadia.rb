# -*- coding: utf-8 -*-
require "sinatra"
require "yaml"
require "shack"

Mickey = Struct.new(:slug, :kind, :content, :source, keyword_init: true)
class Mickey
  def text_eh?
    kind == "text"
  end

  def image_eh?
    kind == "image"
  end

  def video_eh?
    kind == "video"
  end

  def has_source_eh?
    !!source
  end
end

def mickeys
  YAML.load_file("mounties.yml").collect do |data|
    Mickey.new(data)
  end
end

class OhCanada < Sinatra::Base
  set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 365]

  get "/" do
    @title = "It's so cold,"
    @mickey = mickeys.sample
    erb :show
  end

  get "/:slug" do |slug|
    @title = "It's so cold,"
    if (mickey = mickeys.detect {|mickey| mickey.slug == slug.downcase})
      @mickey = mickey
    else
      @mickey = Mickey.new(kind: "text", content: "Not sure what you mean. You hoser! Let's assume cold.")
    end
    erb :show
  end

  run! if app_file == $0
end
