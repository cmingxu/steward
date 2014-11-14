# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('.node-type .btn input').change (e) ->
    if $(e.currentTarget).val() == 'kpi'
      $('#kpi-params-block').show()
    else
      $('#kpi-params-block').hide()

   $('#test_run_btn').on 'click', ->
     $.ajax(
       url: $(this).data('url'),
       method: 'GET',
       dataType: 'JSON',
     ).done (resp)->
       $('#test_run_info_area').text(resp.msg)


$(document).ready(ready)
$(document).on('page:load', ready)
