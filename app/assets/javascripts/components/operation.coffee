@Operation = React.createClass

  getInitialState: ->
    operation: @props.operation

  getDefaultProps: ->
    operation: []

  render: ->
    React.DOM.div
      className: 'operation'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-1'
          @state.operation.invoice_num
        React.DOM.div
          className: 'col-md-2'
          @state.operation.invoice_date
        React.DOM.div
          className: 'col-md-2'
          @state.operation.operation_date
        React.DOM.div
          className: 'col-md-1'
          @state.operation.amount
        React.DOM.div
          className: 'col-md-2'
          @state.operation.reporter
        React.DOM.div
          className: 'col-md-1'
          @state.operation.status
        React.DOM.div
          className: 'col-md-3'
          @state.operation.categories
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-12'
          @state.operation.notes
