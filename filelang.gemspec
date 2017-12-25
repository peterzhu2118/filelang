
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "filelang/version"

Gem::Specification.new do |spec|
  spec.name          = "filelang"
  spec.version       = Filelang::VERSION
  spec.licenses      = ['MIT']
  spec.authors       = ["Peter Zhu"]
  spec.email         = ["peter@peterzhu.ca"]

  spec.summary       = %q{Detects language of files through its path}
  spec.description   = %q{Simple library to detect the programming language of a file through the extension of the file.}
  spec.homepage      = "https://github.com/peterzhu2118/filelang"

  spec.files         = Dir['lib/**/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "byebug", "~> 9.1"
end
