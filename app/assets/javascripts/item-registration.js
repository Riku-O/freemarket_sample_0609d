$(function () {
   function buildHTML(item_image) {
       var prev = item_image.image.url ? `<img src= ${ item_image.image.url }>` : false;
       var html =
           `<li class="sell-upload-item">
              <figure class="sell-upload-figure landscape">
                ${ prev }
                </figure>
              <div class="sell-upload-button">
                <a class="sell-upload-edit">編集</a>
                <a >削除</a>
                </div>  
             </li>`
       return html
   } 
   function readURl(input) {
       var file = input.files[0];
       var reader = new FileReader();
       reader.onload = function (e) {
           $(".sell-upload-drop-file-input").attr("src", e.target.result);
       };
       reader.readAsDataURL(file);
   }
   $(".sell-upload-drop-file-input").on('change', function () {
       var builtHTML = buildHTML(readURl(this));
       $(".sell-upload-items ul").append(builtHTML)
   });
});