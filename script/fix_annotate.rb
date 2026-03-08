# script/fix_annotate.rb

require "bundler/setup"
require "fileutils"

annotate_spec = Gem.loaded_specs["annotate"]
unless annotate_spec
  abort("Annotate gem not found. Make sure it’s installed and run with `bundle exec`")
end

gem_path = annotate_spec.full_gem_path

def patch_file(path)
  return unless File.exist?(path)

  text = File.read(path)
  updated = text.gsub("File.exists?", "File.exist?")
                .gsub(/\bFixnum\b/, "Integer")

  File.write(path, updated)
  puts "✔ Patched: #{path}"
end

# Patch library files
patch_file(File.join(gem_path, "lib/annotate.rb"))
patch_file(File.join(gem_path, "lib/annotate/annotate_models.rb"))

# 🔥 Patch CLI executable (THIS fixes your current error)
patch_file(File.join(gem_path, "bin/annotate"))

puts "Annotate fully patched for Ruby 3.4+ and Rails 8.1"