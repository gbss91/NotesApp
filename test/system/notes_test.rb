require 'application_system_test_case'

class NotesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @note = notes(:one)
  end

  test 'visiting the index when signed in' do
    sign_in @user
    visit notes_url
    assert_selector 'h1', text: 'Notes'
  end

  test 'visiting the index when not signed in' do
    visit notes_url
    assert_current_path new_user_session_path
  end

end
