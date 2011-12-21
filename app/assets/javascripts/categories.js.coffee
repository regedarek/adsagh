$ ->
  $(".category").not(".depth-0, .simple_form").hide()

  #Klikanie na roota
  $(".category.depth-0").click ->
    #$(".description").hide()                #ukrycie opisu
    $(".depth-0").css color: 'black'        #zmiana wszystkich root na czarny
    $(".category").not(".depth-0").hide()   #ukrycie wszystkich category tylko nie rootów


    $(this).css color: 'red'                                #zmiana roota na czerwony
    root = $(this).attr("class").split(" ")[2]              #pobranie wartości np. root-1
    $(".category.depth-1." + root).show()                            #pokazanie dzieci pierwszego rzędu
    $("input#category").val null                            #wyzerowanie pola wybranej kategori
    
  
  #Klikanie na kategorię pośredniom
  $(".category.children-yes").click ->
    root = $(this).attr("class").split(" ")[4]      # np root-1
    depth = $(this).attr("class").split(" ")[2]     # np depth-1
    depth = depth.split("-")[1]                     # np 1
    depth = parseInt(depth)                         # zamiana na int
    $(".category").not(".depth-0").hide()
    depth++
    parent = $(this).attr("id").split("-")[1]       # np 3
    parent = parseInt(parent)                       # zamiana na int
    $(".category."+root+".depth-"+depth+".parent-"+parent).slideDown()     # pokazanie dzieci


   #Klikanie na końcową kategorię
  $(".category.children-no").click ->
    $(".category.children-no").css color: 'black' 
    $(this).css color: 'red'  
    $("#ad_category_id").val ($(this).attr 'id') .split("-")[1]

   
