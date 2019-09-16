$(function () {
    function calculate_fee() {
        var set_price = $('#input-price').val();
        var fee = set_price * 0.1;
        return fee
    }
    function calculate_profit() {
        var set_price = $('#input-price').val();
        var profit = set_price * 0.9;
        return profit
    }
    $('.input-default').change(function () {
        $('.sell-fee').text(calculate_fee());
        $('.sell-profit').text(calculate_profit());
    })
});