require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test 'should not save note without title' do
    note = Note.new
    note.body = 'This is the note body'
    assert_not note.save, 'Saved the note without a title'
  end

end
