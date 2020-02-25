$(document).ready(function() {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
  const html = `<div data-index="${index}" class="js-file_group card" >
                  <i class="fas fa-times-circle js-remove"></i>
                  <img src="https://jp.images-monotaro.com/Monotaro3/pi/full/mono_image_na.jpg" width="100%" height="100%" class="default btn img-btn">
                  <input class="js-file" type="file"
                  name="machine[images_attributes][${index}][image]"
                  id="machine_images_attributes_${index}_image">
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="50%" height="50%" class="btn img-btn w-100 h-100">`;
    return html;
  }


  $('.custom-file-input').on('change',function(){
    $(this).next('.custom-file-label').html($(this)[0].files[0].name);
    });
  $('.custom-file-input').on('change',function(){
    $(this).next('.custom-file-label').html($(this)[0].files[0].name);
  });

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy');
  $(document).on("click", ".img-btn", function(){
    console.log('click');
    let index = $(this).data('index');
    console.log(index);
    $(this).next('input').click();
  });
  
  $(document).on("change", ".js-file", function(e){
    console.log('change');
    const targetIndex = $(this).prev().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0] ) {
      console.log('true')
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      console.log('else');
      $(this).prev('.default').remove();
      $(this).parent().append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    console.log(targetIndex);
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});