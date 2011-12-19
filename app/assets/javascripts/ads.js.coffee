$ ->
  $("#ad_category_id").focus ->
    $(".black_mamba, .ads .category_choice").show()
    $(".ads .category_choice").load('/categories?layout=minimalistic');
