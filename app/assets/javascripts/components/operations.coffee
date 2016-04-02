@Operations = React.createClass

  getInitialState: ->
    operations: @props.operations

  getDefaultProps: ->
    operations: []

  render: ->
    filter = @props.filter.toLowerCase()
    operations = @state.operations
    if filter.length > 0
      operations = operations.filter (o) ->
        o.status.toLowerCase().match(filter) ||
          o.categories.toLowerCase().match(filter) ||
          o.invoice_num.toLowerCase().match(filter) ||
          o.reporter.toLowerCase().match(filter)
    React.DOM.div
      className: 'operations'
      React.DOM.div
        for operation in operations
          React.createElement Operation, key: operation.id, operation: operation
