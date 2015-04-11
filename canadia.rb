# -*- coding: utf-8 -*-
require "sinatra"
require "haml"

def random_sentence
  [{k: "text", c: "Chuck Norris once visited and described it as lukewarm."},
   {k: "text", c: "Sean Bean will never visit it."},
   {k: "text", c: "pinguins moved away."},
   {k: "text", c: "every drink is on the rocks."},
   {k: "text", c: "they call icehockey, hockey."},
   {k: "text", c: "they don't call it skiing, they call it walking."},
   {k: "text", c: "they call icefishing, fishing."},
   {k: "text", c: "every bear in canada is an icebear."},
   {k: "text", c: "they don't have mountains, they have icebergs."},
   {k: "text", c: "Angelina Jolie went jogging there and almost lost an eye."},
   {k: "text", c: "they don't have central heating, they just open a fridge in every room."},
   {k: "text", c: "they believe global warming would be a good start."},
   {k: "text", c: "Ron Jeremy once visited and was described as 'petite'."},
   {k: "text", c: "Fargo was filmed in summertime."},
   {k: "text", c: "a yeti won't go there."},
   {k: "text", c: "they laughed at Superman's icecastle."},
   {k: "text", c: "when you flush the toilet, it sounds like an icecube maker."},
   {k: "text", c: "people come for the hospitality, but stay because they're frozen."},
   {k: "text", c: "Thomas Lipton got the idea for icetea while drinking tea in Canadia."},
   {k: "text", c: "the Snickers ice bar is just called Snickers."},
   {k: "text", c: "every coffee is an iced coffee."},
   {k: "text", c: "Kelvin was invented to give Canadia temperatures above 0."},
   {k: "text", c: "'The Day After Tomorrow' was filmed there on a hot summer afternoon."},
   {k: "text", c: "a fire once froze over."},
   {k: "text", c: "it's not that cold, you hoser!"},
   {k: "text", c: "they add 'eh' add the end of each sentence to stop their lips from freezing."},
   {k: "text", c: "a duck does have an echo."},
   {k: "video", c: "https://mtc.cdn.vine.co/r/videos/ECE477F7011143396093686628352_3facab04e7c.0.1.17958842360645696189.mp4?versionId=Zqk9zvRupx7fYRK3i8rxn7mzi0YTnR9c"},
   {k: "video", c: "https://pile.pjaspers.com/CArAgYWW8AEmCQP.mp4"},
   {k: "image", c: "http://static.boredpanda.com/blog/wp-content/uploads/2015/03/icy-hair-freezing-contest-takhini-hot-springs-16.jpg", s: "http://www.boredpanda.com/icy-hair-freezing-contest-takhini-hot-springs/"}
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

%div.illustration
  - if @content[:k] == "text"
    %p= @content[:c]
  - elsif @content[:k] == "image"
    %p
      %img{src: @content[:c], style: "max-width:100%;height:auto;"}
  - elsif @content[:k] == "video"
    %video{controls: "controls"}
      %source{src: @content[:c], type: "video/mp4"}

  - if source = @content[:s]
    %a.source{href: source}= "More info"

%h2.longjohns= "You should probably wear long johns."

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
