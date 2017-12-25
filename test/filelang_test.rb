require "test_helper"

class FilelangTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Filelang::VERSION
  end

  def test_file_language_returns_correct_languages
    assert_equal [ :ruby ], Filelang.file_language("/path/file.rb")
    assert_equal [ :ruby ], Filelang.file_language("/file.rb")
    assert_equal [ :ruby ], Filelang.file_language("/path.java/file.rb")
    assert_equal [ :java ], Filelang.file_language("/file.java")
    assert_equal [ :python ], Filelang.file_language("/file.py")
    assert_equal [ :ejson ], Filelang.file_language("/file.ejson")
    assert_equal [ :json ], Filelang.file_language("/file.json")
    assert_equal [ :cplusplus ], Filelang.file_language("/file.cpp")
    assert_equal [ :cplusplus ], Filelang.file_language("/file.c++")
  end
end
