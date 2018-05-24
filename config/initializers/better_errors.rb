#------------------------------------------------------------------------------
# config/initializers/better_errors.rb
#------------------------------------------------------------------------------

# Set textmate as the default editor for better_errors
if defined? BetterErrors
  BetterErrors.editor = :txmt
end