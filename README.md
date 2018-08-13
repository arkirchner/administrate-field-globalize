# Administrate::Field::Globalize

## Warning
This gem is under early development and overrides Administrate search functions.

This Administrate plugin adds support for string fields that use the Globalize gem to hold
translated values. 

Requirements in Globalize
----------------------

You need to install the accessors for easy access to the translations.

```ruby
gem "globalize-accessors"
```

Add the helper to your translated models.

```ruby
  globalize_accessors locales: I18n.available_locales
```

Getting Started
----------------------

Add Administrate::Field::Globalize gems to your Gemfile:

```ruby
gem "administrate-field-globalize", "0.0.1.alpha3"
```

Add the Administrate Globalize Field to your dashboard.

```ruby
  ATTRIBUTE_TYPES = {
    created_at: Field::DateTime,
    update_at: Field::DateTime,
    name: Field::Globalize::String,
    description: Field::Globalize::Text,
  }.freeze
```
