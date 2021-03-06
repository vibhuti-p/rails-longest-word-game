require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }.join(' ')
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params['attempt']}"
    word = JSON.parse(open(url).read)
      if word['found'] == true
        @score = "Congratulations! #{params['attempt'].upcase} is a valid \n
        English word!"
      else
        @score = "Sorry, but #{params['attempt'].upcase} does not seem to be a\n
         valid English word..."
      end
    end
end
