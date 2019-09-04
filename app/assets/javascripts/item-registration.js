$(function () {
   function buildHTML() {
       var html =
           `<li class="sell-upload-item">
              <figure class="sell-upload-figure landscape">
                <img class="prev-image">
                </figure>
              <div class="sell-upload-button">
                <a class="sell-upload-edit">編集</a>
                <a >削除</a>
                </div>  
             </li>`
       return html
   }

   var images = [];

   function readURl(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $(".prev-image").attr('src', e.target.result);
           };
           reader.readAsDataURL(input.files[0]);
       }
   }

   function changeHTML() {
       var elm = $(".sell-upload-items").attr("class").split(" ");
       var num = elm[1].match(/[0-10]+/);
       var intNum = parseInt(num[0],10);
       var newNum = intNum + 1;
       var newStrNum = String(newNum);

       $(".sell-upload-items").removeClass(`have-item-${num[0]}`);
       $(".sell-upload-items").addClass(`have-item-${newStrNum}`);
       $(".sell-upload-dropbox").removeClass(`have-item-${num[0]}`);
       $(".sell-upload-dropbox").addClass(`have-item-${newStrNum}`);
   }

   $(".sell-upload-drop-file-input").on('change', function () {
       var builtHTML = buildHTML();
       readURl(this);
       changeHTML();
       $(".sell-upload-items ul").append(builtHTML)
   });
});