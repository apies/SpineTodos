Spine = require('spine')
Task = require('models/Task')

class Tasks extends Spine.Controller
	events:
		'change input[type=checkbox]': "toggle"
		'click .destroy': 'destroyItem'
		
	constructor: ->
		super
		@item.bind('update', @render)
		@item.bind('destroy', @release)
	render: =>
		@html require('views/TaskView')(@item)
		@
	toggle: ->
		@item.done = not @item.done
		@item.save()
	destroyItem: ->
		@item.destroy()
		
		
    
module.exports = Tasks
window.Tasks = Tasks