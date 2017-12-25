# frozen_string_literal: true
require 'yaml'
require 'set'

module Filelang::Language
  @@extension_mapping = Hash.new { |k, v| k[v] = Set.new }

  def file_language(path)
    extensions = Filelang::Language.send :get_extensions, path

    languages = []

    extensions.each do |ext|
      languages |= @@extension_mapping[ext.to_sym].to_a unless @@extension_mapping[ext.to_sym].nil?
    end

    languages
  end

  class << self
    private
    def get_extensions(path)
      *_, filename = path.split("/")

      _, *extensions = filename.downcase.split(".")

      extensions.map!.with_index do |segment, index|
        "." + extensions[index..-1].join(".")
      end

      extensions.sort_by(&:length)
    end


    def load_languages
      languages = YAML.load_file(File.expand_path("../language.yml", __FILE__))

      languages.each do |lang, extensions|
        check_format_of_language! lang
        check_format_of_extensions! extensions

        extensions.each do |ext|
          @@extension_mapping[ext.to_sym] << lang.to_sym
        end
      end
    end

    def check_format_of_extensions!(extensions)
      extensions.each do |ext|
        raise ArgumentError, "Extension '#{ext}' is missing '.'" if ext !~ /^\./
      end
    end

    def check_format_of_language!(language)
      raise ArgumentError, "Language '#{language}' has whitespace" if language.match(/\s/)
    end
  end

  self.send :load_languages
end
