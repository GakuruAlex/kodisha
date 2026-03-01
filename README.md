# README

# Annotate
add annotate in Gemfile
```ruby
group :development do
  gem "annotate"
end
```
Then install
```bash
bundle install
```
Install annotate configuration
```bash
bin/rails generate annotate:install
```
Add annotate to existing models 
```bash
bundle exec annotate
```
If you run into File.exists?('./Rakefile')  error when running bundle exec annotate, then
Run 
```bash
bundle exec ruby script/fix_annotate.rb
```
to patch annotate when using latest version of rails and ruby.