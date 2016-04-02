@Filter = React.createClass

  getInitialState: ->
    filter: ''

  applyFilter: (e) ->
    e.preventDefault()
    filter = React.findDOMNode(@refs.filter).value
    @setState filter: filter
    @props.update filter

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @applyFilter
      React.DOM.div
        className: 'filter form-group'
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-4'
            React.DOM.input
              type: 'text'
              ref: 'filter'
              className: 'form-control'
              placeholder: 'filter'
              name: 'filter'
              defaultValue: @state.filter
              onChange: @applyFilter
