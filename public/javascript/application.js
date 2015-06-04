$(function() {
  var mixHandlers = {
    $list: $("#mix-list"),
    load: function() {
      mixHandlers.$list.children().remove;
      $.ajax({
        url: 'http://api.mixcloud.com/popular/hot/',
        dataType: 'json',
        success: mixHandlers.process
      });
    },
    process: function(mixes) {
      console.log(mixes);
      $.each(mixes.data, mixHandlers.iterator);
    },
    iterator: function(idx, mix) {
    $('<li>').addClass( "mix list-group-item" ).append(mix.name).data('mix', mix).appendTo(mixHandlers.$list);
    }
  };

  //Loads all mixes
  $("#load_mixes").on('click', mixHandlers.load);

  mixHandlers.$list.on('click', ".mix", function(evt) {
    // Grab the .mix that was clicked
    var $mix = $(evt.target);
    $(".active").toggleClass("active");
    $($mix).toggleClass("active");
    var mixData = $mix.data('mix');
    // console.log(mixData);
    $(".welcome").hide();
    mixImage = $("#mix-image").attr("src", mixData.pictures.extra_large);
    mixImage.parent().attr("href", mixData.url);
  });
});
