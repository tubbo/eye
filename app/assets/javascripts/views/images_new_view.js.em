class Eye.ImagesNewView extends Em.Component
  tagName: 'form'
  attributeBindings: ['action', 'method']
  classNames: ['new_image_form']
  method: 'POST'
  action: '/images'

  # Create a new Image record with the data in the form.
  submit: ->
    @store.createRecord 'image', $(@).serializeHash()
    false

  didInsertElement: ->
    @_customFileUploadButton()
    @_imageSourceDropdown()

  _customFileUploadButton: ->
    $('#uploader').on 'change', ->
      $('#uploader-display').val $(@).val().split("C:\\fakepath\\").join('')
    $('#uploader-button').on 'click', ->
      $('#uploader').trigger 'click'
      false

  _imageSourceDropdown: ->
    $('select[name="image[source]"]').on 'change', (event) ->
      selectedChoice = $(@).val()
      submitButton = $('input[type=submit]')
      switch selectedChoice
        when 'url' then submitButton.val('Mirror new image')
        when 'file' then submitButton.val('Upload new image')
      $('.choice').hide().find('input').val('')
      $(".choice.#{selectedChoice}").fadeIn 250
