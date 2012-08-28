# Usage: log('inside cool func', this, arguments);
# paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = ->
  log.history = log.history || []
  log.history.push arguments
  if this.console then console.log Array.prototype.slice.call(arguments)
