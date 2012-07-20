Spine = require('spine')
Local = require('lib/Local')

class Task extends Spine.Model
	@configure 'Task', "name", "done"
	@extend Local
	@active: ->
		@select(item) -> not item.done
	@done: ->
		@select (item) -> not not item.done
	@destroyDone: ->
		record.destroy() for record in @done()
	
  
module.exports = Task
window.Task = Task