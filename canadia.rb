# -*- coding: utf-8 -*-
require "sinatra"
require "haml"

# Remaining slugs:
# morissette
# north
# page
# polley
# reeves
# short
# tilly
# twain
# tweed
# warren
# young
def all_content
  [{slug: "levy", k: "text", c: "Chuck Norris once visited and described it as lukewarm."},
   {slug: "anderson", k: "text", c: "Sean Bean will never visit it."},
   {slug: "dallaire", k: "text", c: "pinguins moved away."},
   {slug: "twain", k: "text", c: "every drink is on the rocks."},
   {slug: "mclachlan", k: "text", c: "they call icehockey, hockey."},
   {slug: "warren", k: "text", c: "they don't call it skiing, they call it walking."},
   {slug: "tweed", k: "text", c: "they call icefishing, fishing."},
   {slug: "reeves", k: "text", c: "every bear in canada is an icebear."},
   {slug: "adams", k: "text", c: "they don't have mountains, they have icebergs."},
   {slug: "anderson", k: "text", c: "Angelina Jolie went jogging there and almost lost an eye."},
   {slug: "anka", k: "text", c: "they don't have central heating, they just open a fridge in every room."},
   {slug: "arnett", k: "text", c: "they believe global warming would be a good start."},
   {slug: "aykroyd", k: "text", c: "Ron Jeremy once visited and was described as 'petite'."},
   {slug: "baruchel", k: "text", c: "Fargo was filmed in summertime."},
   {slug: "beach", k: "text", c: "a yeti won't go there."},
   {slug: "candy", k: "text", c: "they laughed at Superman's icecastle."},
   {slug: "carrey", k: "text", c: "when you flush the toilet, it sounds like an icecube maker."},
   {slug: "cattrall", k: "text", c: "people come for the hospitality, but stay because they're frozen."},
   {slug: "cera", k: "text", c: "Thomas Lipton got the idea for icetea while drinking tea in Canadia."},
   {slug: "chong", k: "text", c: "the Snickers ice bar is just called Snickers."},
   {slug: "christensen", k: "text", c: "every coffee is an iced coffee."},
   {slug: "coates", k: "text", c: "Kelvin was invented to give Canadia temperatures above 0."},
   {slug: "cohen", k: "text", c: "'The Day After Tomorrow' was filmed there on a hot summer afternoon."},
   {slug: "cuthbert", k: "text", c: "a fire once froze over."},
   {slug: "dallaire", k: "text", c: "it's not that cold, you hoser!"},
   {slug: "dion", k: "text", c: "they add 'eh' add the end of each sentence to stop their lips from freezing."},
   {slug: "dobrev", k: "text", c: "a duck does have an echo."},
   {slug: "furtado", k: "video", c: "https://mtc.cdn.vine.co/r/videos/ECE477F7011143396093686628352_3facab04e7c.0.1.17958842360645696189.mp4?versionId=Zqk9zvRupx7fYRK3i8rxn7mzi0YTnR9c"},
   {slug: "henstridge", k: "video", c: "https://pile.pjaspers.com/CArAgYWW8AEmCQP.mp4"},
   {slug: "lavigne", k: "image", c: "http://static.boredpanda.com/blog/wp-content/uploads/2015/03/icy-hair-freezing-contest-takhini-hot-springs-16.jpg", s: "http://www.boredpanda.com/icy-hair-freezing-contest-takhini-hot-springs/"}
  ].freeze
end

get "/" do
  content = all_content.sample
  redirect to("/#{content[:slug]}")
end

get "/:slug" do |slug|
  @title = "It's so cold,"
  if content = all_content.detect {|d| d[:slug] == slug.downcase}
    @content = content
  else
    @content = {k: "text", c: "Not sure what you mean. You hoser! Let's assume cold." }
  end
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

  %div.metadata
    %a.slug{href: @content[:id]}= "#"
    - if source = @content[:s]
      %a.source{href: source}= "More info"

%h2.longjohns="You should probably wear long johns."
%h2.seriously
  %a{href: "/"}= "No seriously, how cold is it?"

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
