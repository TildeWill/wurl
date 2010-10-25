var Whurl = {
    computePermalink: function() {

    },
    addHeader: function() {
        var $headerFields = $('.header_pair:last').clone();
        $headerFields.children('input').val("");
        $headerFields.appendTo('#headers');

    },
    deleteHeader: function() {

    },
    addParam: function() {
        var $paramFields = $('.param_pair:last').clone();
        $paramFields.children('input').val("");
        $paramFields.appendTo('#params');
    },
    deleteParam: function() {

    }
};

$(document).ready(function() {
    $('#add_header').click(function() {
        Whurl.addHeader();
    });

    $('#add_param').click(function() {
        Whurl.addParam();
    });

    $('#permalink').click(function() {
        Whurl.generatePermalink();
    });
});