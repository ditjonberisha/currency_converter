(function($){

    function delay(fn, ms) {
        let timer = 0;
        return function(...args) {
            clearTimeout(timer);
            timer = setTimeout(fn.bind(this, ...args), ms || 0)
        }
    }

    function convert_value(is_from = true) {
        let from = $('#from_currency option:selected').val();
        let to = $('#to_currency option:selected').val();
        let value = is_from ? $('#from_input').val() : $('#to_input').val();

        $.ajax({
            type: 'POST',
            url: '/converter',
            data: { from: from, to: to, value: value, is_from: is_from },
        });
    }

    $('body').on('keyup', '#from_input', delay(function (e) {
        convert_value();
    }, 500));

    $('body').on('keyup', '#to_input', delay(function (e) {
        convert_value(false);
    }, 500));

    $('body').on('change', '#from_currency', delay(function (e) {
        convert_value();
    }, 100));

    $('body').on('change', '#to_currency', delay(function (e) {
        convert_value();
    }, 100));

})(jQuery);
