class Eye.LoginView extends Em.View
  tagName: 'form'
  attributeBindings: ['action', 'method']
  classNames: ['login_form']
  action: '/users/sign_in'
  method: 'POST'
  submit: (event) ->
    @_submitForm event
    false
  _submitForm: (event) ->
    $.ajax(
      url: @action
      type: @method
      data: $('.login_form').serialize()
      success: -> debugger
      error: (response) ->
        errorMessage = switch response.status
          when 401
            "Invalid username or password"
          else
            "Server error"
        alert "Error logging in: #{errorMessage}"
    )
