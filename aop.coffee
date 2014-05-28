###*
@file 0.17 kb Aspect Oriented Programming Micro Library
@author Daniel Lamb <dlamb.open.source@gmail.com>
###
AOP = (obj) ->
  obj.proceed = null
  obj.result = {}

  obj.before = (method, f) ->
    org = @[method]
    @[method] = ->
      f.apply @, arguments
      org.apply @, arguments

  obj.after = (method, f) ->
    org = @[method]
    @[method] = ->
      @result[method] = org.apply(@, arguments)
      f.apply @, arguments

  obj.around = (method, f) ->
    org = @[method]
    @[method] = ->
      @proceed = org
      f.apply @, arguments