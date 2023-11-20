require "test_helper"

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get quizzes_show_url
    assert_response :success
  end

  test "should get submit_answer" do
    get quizzes_submit_answer_url
    assert_response :success
  end

  test "should get track_progress" do
    get quizzes_track_progress_url
    assert_response :success
  end

  test "should get reset_progress" do
    get quizzes_reset_progress_url
    assert_response :success
  end
end
