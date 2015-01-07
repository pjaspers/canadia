# -*- coding: utf-8 -*-
require 'sinatra'
require 'haml'
require 'sass'

class Maverick

  before do
  end

  configure do
  end

  helpers do
    def random_sentence
      ["Chuck Norris once visited and described it as lukewarm.",
       "Sean Bean will never visit it.",
       "pinguins moved away.",
       "every drink is on the rocks.",
       "they call icehockey, hockey.",
       "they don't call it skiing, they call it walking.",
       "they call icefishing, fishing.",
       "every bear in canada is an icebear.",
       "they don't have mountains, they have icebergs.",
       "Angelina Jolie went jogging there and almost lost an eye.",
       "they don't have central heating, they just open a fridge in every room.",
       "they believe global warming would be a good start.",
       "Ron Jeremy once visited and was described as 'petite'.",
       "Fargo was filmed in summertime.",
       "a yeti won't go there.",
       "they laughed at Superman's icecastle.",
       "when you flush the toilet, it sounds like an icecube maker."].sample
    end
  end

  get '/' do
    @title = "It's so cold,"
    @content = random_sentence
    haml :index
  end
end

__END__

@@ layout
%html
  %head
    %title= "What's the weather like in Canadia?"
    %link(rel="stylesheet" type="text/css" href="/stylesheet.css")
    %link(href="http://fonts.googleapis.com/css?family=Vollkorn:regular,italic,bold,bolditalic" rel="stylesheet" type="text/css")

  %body
  = yield

@@ index
%h1= @title
%p= @content
