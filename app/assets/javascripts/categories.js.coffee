$ ->
  $(".nested_categories").hide()
  $(".depth-0").click ->
    $(".description").hide()
    $(".nested_categories").hide()
    $(".depth-0").css color: 'black'

    $(this).css color: 'red'
    root = $(this).attr("class").split(" ")[2]
    $("." + root).show()
    $("input#category").val null
   
   $(".category.category_children-no").click ->
     $("#ad_category_id").val ($(this).attr 'id') .split("-")[1]
     $(".black_mamba, .ads .category_choice").hide()

