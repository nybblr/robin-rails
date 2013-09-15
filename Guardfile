guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^bin/(.+)$})         { |m| [ "spec/bin/#{m[1]}_spec.rb" ] }
  watch(%r{^lib/(.+)\.rb$})     { |m| [ "spec" ] }

  watch('spec/spec_helper.rb')  { "spec" }
end
