@Operations = React.createClass

  getInitialState: ->
    operations: @props.operations

  getDefaultProps: ->
    operations: []

  render: ->
    React.DOM.div
      className: 'operations'
      React.DOM.div
        for operation in @state.operations
          React.createElement Operation, key: operation.id, operation: operation
