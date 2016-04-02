@Companies = React.createClass

  getInitialState: ->
    companies: @props.data
    filter: ''

  getDefaultProps: ->
    data: []

  filterUpdated: (filter) ->
    @setState filter: filter

  render: ->
    React.DOM.div
      className: 'companies'
      React.createElement Filter, update: @filterUpdated
      React.DOM.h2
        className: 'title'
        'Companies'
      React.DOM.div
        for company in @state.companies
          React.createElement Company, key: company.id, company: company, filter: @state.filter
