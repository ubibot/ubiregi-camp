#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

toggleGrant = (event) ->
  checkbox = $(event.currentTarget)
  checkbox.attr("disabled", true)

  data =
    person_id: checkbox.data("person-id")
    project_id: checkbox.data("project-id")

  if checkbox.prop("checked")
    ajax = $.ajax
      method: "POST"
      url: "/accesses/grant"
      data: JSON.stringify(data)
  else
    ajax = $.ajax
      method: "POST"
      url: "/accesses/reject"
      data: JSON.stringify(data)

  ajax.then =>
    checkbox.attr("disabled", false)

$ ->
  $(document).on "click", "input[name=access][type=checkbox]", toggleGrant

$(document).on "turbolinks:request-start", ->
  $("body").css("opacity", 0.8)
  $("#logo").hide()
  $("#ajax-loader").show()

$(document).on "turbolinks:load", ->
  $("body").css("opacity", 1.0)
  $("#ajax-loader").hide()
  $("#logo").show()
