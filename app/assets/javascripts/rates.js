(function($){

    function rates () {
        if (!$('#ratesContainer').length) {
            return;
        }

        $.ajax({
            type: 'GET',
            url: '/rates/results'
        });
    }

    $(document).on('ready turbolinks:render',function(){
        rates();
    });

})(jQuery);
