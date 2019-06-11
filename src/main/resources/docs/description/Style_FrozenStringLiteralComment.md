
This cop is designed to help upgrade to after Ruby 3.0. It will add the
comment `# frozen_string_literal: true` to the top of files to
enable frozen string literals. Frozen string literals may be default
after Ruby 3.0. The comment will be added below a shebang and encoding
comment. The frozen string literal comment is only valid in Ruby 2.3+.

# Examples

```ruby
# The `always` style will always add the frozen string literal comment
# to a file, regardless of the Ruby version or if `freeze` or `<<` are
# called on a string literal.
# bad
module Bar
  # ...
end

# good
# frozen_string_literal: true

module Bar
  # ...
end# The `never` will enforce that the frozen string literal comment does
# not exist in a file.
# bad
# frozen_string_literal: true

module Baz
  # ...
end

# good
module Baz
  # ...
end
```

[Source](http://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Style/FrozenStringLiteralComment)