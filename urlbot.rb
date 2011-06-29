#!/usr/bin/env ruby

require 'cinch'
require 'hpricot'
require 'htmlentities'
require 'net/http'
require 'open-uri'
require 'uri'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick     = ENV["NICK"]
    c.server   = ENV["SERVER"]
    c.channels = Array(ENV["CHANNEL"])
  end
  
  on :channel do |m|
    URI.extract(m.message, "http").each do |url|
      m.reply HTMLEntities.new.decode(get_title(url)) if is_html?(url)
    end
  end
  
  helpers do
    def get_title(url)
      doc = Hpricot(open(url))
      return (doc/'title').text.strip.split.join(" ")
    end
    
    def content_type_from_head(raw_uri)
      uri = URI.parse(raw_uri)
      http = Net::HTTP.new(uri.host, uri.port)
      response, data = http.head((uri.path == "" ? "/" : uri.path), nil)
      return response.content_type
    end
    
    def is_html?(url)
      content_type_from_head(url) =~ /text\/html/
    end
  end
  
end

bot.start
