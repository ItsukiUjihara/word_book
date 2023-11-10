class WordsController < ApplicationController

  def new 
    @word = Word.new
    @word.synonyms.build
  end
  
  
  def create 
    @word = current_user.words.build(word_params)
      if @word.save
        redirect_to word_path(@word)
      else
        render 'new'
      end    
  end

  def index
    @words = Word.all
  end

  def show
    find
  end

  def edit
    find
  end

  def update
    find
    if @word.update(word_params)
      redirect_to word_path(@word)
    else
      render 'edit'
    end
  end

  def destroy
    @word = current_user.words.find(params[:id])
    @word.destroy
    redirect_to words_path
  end
  
  private
  def word_params
    params.require(:word).permit(:title, :content,:synonym_name,
      synonyms_attributes: [:id,:word_id,:synonym_name,:_destroy])
  end

  def find
    @word = Word.find(params[:id])
  end
end
