# frozen_string_literal: true
require "filelang/version"
require "filelang/language"

module Filelang
  class << self
    include Filelang::Language
  end
end
