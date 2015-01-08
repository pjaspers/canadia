# -*- coding: utf-8 -*-
require "sinatra"
require "haml"

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
   "when you flush the toilet, it sounds like an icecube maker.",
   "people come from the hospitality, but stay because they're frozen.",
   "Thomas Lipton got the idea for icetea while drinking tea in Canadia.",
   "the Snickers ice bar is just called Snickers.",
   "every coffee is an iced coffee.",
   "Kelvin was invented to give Canadia temperatures above 0.",
   "'The Day After Tomorrow' was filmed there on a hot summer afternoon.",
   "a fire once froze over.",
   "it's not that cold, you hoser!",
   "they add 'eh' add the end of each sentence to stop their lips from freezing.",
   "a duck does have an echo."
  ].sample
end

get "/" do
  @title = "It's so cold,"
  @content = random_sentence
  haml :index
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
%h1= "What's the weather like in Canadia?"
%h2= @title
%p= @content
%h2= "You should probably wear long johns."

:javascript
  var _gauges = _gauges || [];
  (function() {
    var t   = document.createElement('script');
    t.type  = 'text/javascript';
    t.async = true;
    t.id    = 'gauges-tracker';
    t.setAttribute('data-site-id', '54af0aa9e32bb40ae6051a58');
    t.src = '//secure.gaug.es/track.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(t, s);
  })();
