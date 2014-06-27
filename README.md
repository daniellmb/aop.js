# AOP.js

0.17 kb Aspect Oriented Programming Micro Library

Adding functionality through aspect oriented programming (AOP) allows you to modify a classes behavior after it has been instantiated. New methods don't override the existing ones, but supplement them. Imagine the usefulness of having callbacks such as before, after and around every method in your class. This allows you to hook into classes dynamically without having to hack the original class definition. If you're not using the observer or mediator design patterns you could use aspect oriented programming to add in hooks to log user interactions with objects without having to modify the original code.

## Example

Run [live example](http://jsfiddle.net/daniellmb/H2rvF/)

### JavaScript
```JavaScript
// original object
Message = function() {};
Message.prototype = {
  show: function(text) {
    alert(text);
    return "closed";
  }
};

// extend object with AOP functionality
AOP(Message.prototype);

// around
Message.prototype.around("show", function(message) {
  console.log("Message '" + message + "' showing");
  // call the wrapped method
  return this.proceed(message);
});

// before
Message.prototype.before("show", function(message) {
  return console.log("Message '" + message + "' will show");
});

// after
Message.prototype.after("show", function(message) {
  return console.log("Message '" + message + "' shown and was " + this.result['show']);
});

// create an instance
messenger = new Message();

// call the show method
messenger.show("Hello World!");
```

### CoffeeScript
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
  # call the wrapped method
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
