if ENV["GEM_TEST"]
  gem "dls_template", path: "../."
else
  gem "dls_template"
end

gem_group :development, :test do
  gem "bixby"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 5.0.0"
end

generate "dls_template:install", "-f"

# Remove unneeded dls_template gem from Gemfile.
gemfile = File.expand_path("Gemfile")
File.write(gemfile, File.open(gemfile) do |f|
                      text = f.read
                      text.gsub(/^gem "dls_template".*$/, "")
                    end)
