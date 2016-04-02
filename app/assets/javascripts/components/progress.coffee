@Progress = React.createClass

  getInitialState: ->
    info: {}

  getDefaultProps: ->
    id: null

  requestStats: ->
    @time = setTimeout @tick, 100

  componentDidMount: ->
    @requestStats()

  componentWillUnmount: ->
    clearInterval @timer

  tick: ->
    $.ajax
      method: 'GET'
      url: "/stats"
      dataType: 'JSON'
      data:
        jid: @props.id
      success: (data) =>
        @setState info: data
        @requestStats()

  render: ->
    React.DOM.div
      className: 'info'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-4'
          "Processed: #{ @state.info['processed'] || 0 }"
        React.DOM.div
          className: 'col-md-4'
          "Successful: #{ @state.info['successful'] || 0 }"
        React.DOM.div
          className: 'col-md-4'
          "Error: #{ @state.info['error'] || 0 }"
