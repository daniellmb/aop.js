# DI.js

0.17 kb Aspect Oriented Programming Micro Library

## Example

Run [live example](http://jsfiddle.net/daniellmb/H2rvF/)

```CoffeeScript
# original object
Message = ->
Message:: = show: (text) ->
  alert text
  "closed"

# extend object with AOP functionality
AOP Message::

# around
Message::around "show", (message) ->
  console.log "Message '#{message}' showing"
  #call the wrapped method
  @proceed message

# before
Message::before "show", (message) ->
  console.log "Message '#{message}' will show"

# after
Message::after "show", (message) ->
  console.log "Message '#{message}' shown and was #{@result['show']}"

# create an instance
messenger = new Message()

# call the show method
messenger.show "Hello World!"
```

## License 

(The MIT License)

Copyright (c) 2014 Daniel Lamb <daniellmb.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
