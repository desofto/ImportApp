@Company = React.createClass

  getInitialState: ->
    open: false
    operations: []

  handleToggle: (e) ->
    e.preventDefault()
    if @state.open
      @setState open: false
    else
      $.ajax
        method: 'GET'
        url: "/companies/#{ @props.company.id }/operations"
        dataType: 'JSON'
        success: (data) =>
          @setState operations: data, open: true

  render: ->
    React.DOM.div
      className: 'company'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-3'
          React.DOM.h4
            className: 'name'
            onClick: @handleToggle
            @props.company.name
        React.DOM.div
          className: 'col-md-2'
          "Operations: #{ @props.company.operations }"
        React.DOM.div
          className: 'col-md-2'
          "Avg: #{ @props.company.average_amount }"
        React.DOM.div
          className: 'col-md-2'
          "Highest: #{ @props.company.highest_operation }"
        React.DOM.div
          className: 'col-md-2'
          "Accepted: #{ @props.company.accepted }"
      if @state.open
        React.createElement Operations, operations: @state.operations
