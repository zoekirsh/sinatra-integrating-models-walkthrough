require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @most_used_letter = @analyzed_text.most_used_letter.keys
    @most_used_times = @analyzed_text.most_used_letter.values
    erb :results
  end
end
