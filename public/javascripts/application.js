var Whurl = {
    computePermalink: function() {

    },
    addHeader: function() {
        $('.header_pair:last').clone().appendTo('#headers');
    },
    deleteHeader: function() {

    },
    addParam: function() {
        $('.param_pair:last').clone().appendTo('#params');

    },
    deleteParam: function() {

    }
};

$(document).ready(function() {
    $('#add_header').click(function(){
        Whurl.addHeader();
    });

    $('#add_param').click(function(){
        Whurl.addParam();
    });
});