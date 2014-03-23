@Eye = Ember.Application.create()
jQuery ->
  $(document).foundation()
  csrf_token = $('meta[name="csrf-token"]').attr('content')
  $.ajaxPrefilter (options, originalOptions, xhr) ->
    xhr.setRequestHeader 'X-CSRF-Token', csrf_token
