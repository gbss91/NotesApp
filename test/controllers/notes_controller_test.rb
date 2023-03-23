require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @note = notes(:one)
  end

  test 'should get all notes when signed in' do
    sign_in @user
    get notes_url
    assert_response :success
  end

  test 'should not get other user note' do
    sign_in @user
    get note_path(notes(:two))
    assert_redirected_to notes_url

  end

  test 'should get new' do
    sign_in @user
    get new_note_url
    assert_response :success
  end

  test 'should create note' do
    sign_in @user
    assert_difference('Note.count') do
      post notes_url, params: { note: { body: @note.body, title: @note.title, user_id: @note.user_id } }
    end
    assert_redirected_to note_url(Note.last)
  end

  test 'should show note' do
    sign_in @user
    get note_url(@note)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_note_url(@note)
    assert_response :success
  end

  test 'should update note' do
    sign_in @user
    patch note_url(@note), params: { note: { body: @note.body, title: @note.title } }
    assert_redirected_to note_url(@note)
  end

  test 'should destroy note' do
    sign_in @user
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end
end
