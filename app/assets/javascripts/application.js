// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require materialize/extras/nouislider



var ready;
ready = function() {
    $(".button-collapse").sideNav();
    $("#top-link").on("click", function() {
        $("#links-body > .link-holder:first-child").toggleClass("add-border");
    });

    var clickCounter = 0;
    $(".container").on("click", "#page-header", function() {
        clickCounter ++ ;
        console.log("Clicked header " + clickCounter + " times");
    });

    var getHTML = (function(link) {

      return '<div class="link-holder card-panel hoverable collection" >' +
          '<span class="vote-count badge center-align teal lighten-3">' +
            link.net_votes   +
          '</span>' +
          '<div class="link-title flow-text">' +
            '<a class="url" href="' + link.url + '">' +
              link.title +
            '</a>' +
          '</div>' +
        '<a href="/users/' + link.user_id + '">' +
          '<small class="user-name-time blue-grey-text text-lighten-2">' +
              link.user_name + '|' + link.time +
          '</small>' +
        '</a>' +
        '<div class="right">' +
          '<a data-remote="true" rel="nofollow" data-method="post" href="/links/' + link.id + '/vote?value=-1">' +
            '<small class="vote-icon right on-link red-text text-lighten-2">' +
              '<i class="material-icons downvote">thumb_down</i>' +
            '</small>' +
          '</a>' +
          '<a data-remote="true" rel="nofollow" data-method="post" href="/links/' + link.id + '/vote?value=1">' +
            '<small class="vote-icon right on-link green-text text-lighten-2">' +
              '<i class="material-icons upvote">thumb_up</i>' +
            '</small>' +
          '</a>' +
          '<a href="/links/' + link.id + '">' +
            '<small class="comments right on-link blue-grey-text text-lighten-2">' +
              '(' + link.total_comments + ') Comments' +
            '</small>' +
          '</a>' +
          '<a href="/b/' + link.board_name + '">' +
            '<small class="comments right on-link blue-grey-text text-lighten-2">' +
              '/b/' + link.board_name +
            '</small>' +
          '</a>' +
        '</div>' +
      '</div>'

    });

    // $("#links-body").on("click", ".vote-icon", function() {
    $("#links-body").on("ajax:success", "a[data-remote]", function (e, data, status, xhr){
        var url = document.URL;

        console.log("hi1")
        $.getJSON(url, function(response){
            console.log("hi2");
            console.log(response);
            $("#links-body").html("");
            response.forEach(function(link) {
                $("#links-body").append(getHTML(link));
            });
        });
    });


};

$(document).ready(ready);
$(document).on('page:load', ready);

//= require_tree .
