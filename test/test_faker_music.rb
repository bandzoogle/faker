require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMusic < Test::Unit::TestCase

  def setup
    @tester = Faker::Music
  end
  
  def test_band_name
    assert @tester.band_name.match(/[A-Z][a-z]+\.?/)
  end
  def test_album_name
    assert @tester.album_name.match(/[A-Z][a-z]+\.?/)
  end
end
