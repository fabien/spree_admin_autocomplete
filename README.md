# Spree Admin Autocomplete extension

Adds autocompletion to ProductProperty values, from previously used values.

If the SpreeProductTranslations extension is installed, it will be aware of localized values.

**WORK IN PROGRESS**

## Installation

1. Add the following to your Gemfile
  gem 'spree\_admin_autocomplete', :git => 'git://github.com/fabien/spree__admin__autocomplete.git'

2. Run `bundle install`

3. To setup the asset pipeline includes and copy migrations run: `rails g spree_admin_autocomplete:install`

