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