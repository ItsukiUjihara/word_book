class QuizzesController < ApplicationController

  def generate_random_quiz
    word = Word.all.sample
    synonyms = word.synonyms
  
    correct_synonym = synonyms.sample
    other_synonyms = Synonym.where.not(id: correct_synonym.id).sample(3)
  
    choices = [correct_synonym.synonym_name] + other_synonyms.pluck(:synonym_name)
    choices.shuffle
  
    {
      question: word.title,
      choices: choices,
      answer: correct_synonym.synonym_name
    }
  end
  
  def show
    @answered_count = session[:answered_count].to_i
    @correct_count = session[:correct_count].to_i
  
    session[:quiz_data] ||= generate_random_quiz
  
    @quiz = session[:quiz_data]
  end
  
  def submit_answer
    user_answer = params[:choice]
    correct_answer = session[:quiz_data][:answer]
  
    if user_answer == correct_answer
      flash[:success] = "正解です！"
      session[:correct_count] ||= 0
      session[:correct_count] += 1
    else
      flash[:error] = "不正解です。正解は #{correct_answer} です。"
    end
  
    session[:answered_count] ||= 0
    session[:answered_count] += 1
  
    # 回答後、セッション内のクイズ情報をクリア
    session.delete(:quiz_data)
  
    # 新しいクイズを生成してセッションに保存
    session[:quiz_data] = generate_random_quiz
  
    redirect_to quiz_path
  end

  def track_progress
    @answered_count = session[:answered_count].to_i
    @correct_count = session[:correct_count].to_i
  end

  def reset_progress
    flash[:notice] = "進捗がリセットされました。"
    session[:answered_count] = 0
    session[:correct_count] = 0
    redirect_to quizzes_path
  end
end
