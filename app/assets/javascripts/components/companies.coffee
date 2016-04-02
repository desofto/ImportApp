@Companies = React.createClass

  getInitialState: ->
    companies: @props.data

  getDefaultProps: ->
    data: []

  render: ->
    React.DOM.div
      className: 'companies'
      React.DOM.h2
        className: 'title'
        'Companies'
      React.DOM.div
        for company in @state.companies
          React.createElement Company, key: company.id, company: company
