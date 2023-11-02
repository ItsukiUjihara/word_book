class WordsController < ApplicationController

  def new 
    @word = Word.new
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
    @word = Word.find(params[:id])
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
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
    params.require(:word).permit(:title, :content, synonyms_attributes: [:word_id,:word])
  end
end
