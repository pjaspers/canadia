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

  def meta_attributes(base_url:)
    attributes = [
      {name: "description", content: og_description},
      {property: "og:type", content: "website"},
      {property: "og:title", content: OhCanada::TITLE},
      {name: "twitter:card", content: "summary"},
      {name: "twitter:site", content: OhCanada::TITLE},
      {name: "twitter:creator", content: "@pjaspers"},
      {property: "og:description", content: og_description}
    ]
    if base_url
      attributes << {property: "og:url", content: base_url}
      attributes << {property: "og:image", content: [base_url, "og_image.png"].join("/")}
    end

    attributes.map do |data|
      data.map do |k,v|
        "#{k}='#{v}'"
      end.join(" ")
    end
  end

  def og_description
    return content.gsub("'", '"') if text_eh?

    "Really cold"
  end
end

def mickeys
  YAML.load_file("mounties.yml").collect do |data|
    Mickey.new(data)
  end
end

class OhCanada < Sinatra::Base
  TITLE = "Canadia Weather Report"
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

  get "/robots.txt" do
    <<~ROBOTS
# Just don't be evil, mkay?
# User-Agent: *
# Allow: /
ROBOTS
  end

  get "/humans.txt" do
    <<~HUMANS
Congratulations/condolences! You're my kind of people!

--
@pjaspers
HUMANS
  end

  get "/robots.txt" do
    <<~ROBOTS
# Just don't be evil, mkay?
User-Agent: *
Allow: /
ROBOTS
  end

  run! if app_file == $0
end
