$(function () {
    function calculate_fee() {
        var set_price = $('#input-price').val();
        var fee = Math.ceil(set_price * 0.1);
        return fee.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
    }
    function calculate_profit() {
        var set_price = $('#input-price').val();
        var profit = Math.ceil(set_price * 0.9);
        return profit.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
    }
    //金額を入力したら計算するメソッド
    $('.input-default').on('keyup',function () {
            var fee = calculate_fee();
            var profit = calculate_profit();
            $('.sell-fee').text(`¥ ${fee}`);
            $('.sell-profit').text(`¥ ${profit}`);
    });
});