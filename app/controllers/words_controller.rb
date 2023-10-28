class WordsController < ApplicationController

  def new 
    @word = Word.new
    
  end
  
  def create 
    @word = current_user.words.build(word_params)
      if @word.save
        redirect_to words_path, notice: "登録完了"
      else
          # 保存に失敗した場合の処理
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
      redirect_to word_path(@word), notice: "更新完了"
    else
      render 'edit'
    end
  end

  def destroy
    @word = current_user.words.find(params[:id])
    @word.destroy
    redirect_to words_path, notice: "投稿が削除されました"
  end
  

  private
  def word_params 
    params.require(:word).permit(:title, :content) 
  end


end