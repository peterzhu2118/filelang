require "test_helper"

class LanguageTest < Minitest::Test
  def test_extension_mapping_initialized
    refute (Filelang::Language.class_variable_get :@@extension_mapping).nil?
    refute (Filelang::Language.class_variable_get :@@extension_mapping).empty?
  end

  def test_get_extensions_for_paths
    path = "/test/file.rb"
    assert_equal [ ".rb" ], Filelang::Language.send(:get_extensions, path)

    path = "/test/file.html.erb"
    assert_equal [ ".erb", ".html.erb" ], Filelang::Language.send(:get_extensions, path)

    path = "/test.help/file.rb"
    assert_equal [ ".rb" ], Filelang::Language.send(:get_extensions, path)
  end

  def test_check_format_of_extensions_does_not_raise_for_valid_extensions_format
    extensions = [ ".java", ".py", ".html.erb", ".rb" ]

    Filelang::Language.send :check_format_of_extensions!, extensions
  end

  def test_check_format_of_extensions_raises_for_invalid_extensions_format
    extensions = [ ".java", ".py", ".html.erb", "c", ".rb" ]

    assert_raises ArgumentError do
      Filelang::Language.send :check_format_of_extensions!, extensions
    end
  end

  def test_check_format_of_language_does_not_raise_for_valid_language_format
    Filelang::Language.send :check_format_of_language!, "java"
    Filelang::Language.send :check_format_of_language!, "cpp"
    Filelang::Language.send :check_format_of_language!, "python"
  end

  def test_check_format_of_language_raises_for_invalid_language_format
    assert_raises ArgumentError do
      Filelang::Language.send :check_format_of_language!, " java"
    end

    assert_raises ArgumentError do
      Filelang::Language.send :check_format_of_language!, "c plus plus"
    end
  end
end
