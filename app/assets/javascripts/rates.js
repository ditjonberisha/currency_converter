(function($){

    $(document).on('ready turbolinks:render',function(){
        $( ".datepicker" ).datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });

})(jQuery);
