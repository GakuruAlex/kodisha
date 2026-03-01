# script/fix_annotate.rb

require "bundler/setup"
require "fileutils"

annotate_spec = Gem.loaded_specs["annotate"]
unless annotate_spec
  abort("Annotate gem not found. Make sure it’s installed and run with `bundle exec`")
end

# Patch annotate.rb
annotate_rb = File.join(annotate_spec.full_gem_path, "lib/annotate.rb")
text = File.read(annotate_rb)
text.gsub!("File.exists?", "File.exist?")
File.write(annotate_rb, text)

# Patch annotate_models.rb (correct path)
annotate_models = File.join(annotate_spec.full_gem_path, "lib/annotate/annotate_models.rb")
if File.exist?(annotate_models)
  text_models = File.read(annotate_models)
  text_models.gsub!(/\bFixnum\b/, "Integer")
  File.write(annotate_models, text_models)
else
  puts "⚠ annotate_models.rb not found — skipping Fixnum patch"
end

puts "✅ Annotate patched for Ruby 3+ and Rails 8.1"
