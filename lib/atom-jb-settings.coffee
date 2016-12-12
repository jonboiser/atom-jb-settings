AtomJbSettingsView = require './atom-jb-settings-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomJbSettings =
  atomJbSettingsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomJbSettingsView = new AtomJbSettingsView(state.atomJbSettingsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomJbSettingsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-jb-settings:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomJbSettingsView.destroy()

  serialize: ->
    atomJbSettingsViewState: @atomJbSettingsView.serialize()

  toggle: ->
    console.log 'AtomJbSettings was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
