source 'https://rubygems.org'

%w[ars-terra].each do |lib|
  lib_path = ::File.expand_path("../../#{lib}", __FILE__)
  lib_path = false unless ::File.exists? lib_path
  if lib_path
    gem lib, :path => lib_path
  end
end

# Specify your gem's dependencies in ars-rot.gemspec
gemspec
