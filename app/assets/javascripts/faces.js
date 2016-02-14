$(function(){
  $('[id*="_picture"]').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('Maximum file size is 5MB. Please choose a smaller file.');
    }else{
      var imgFile = this;
      if (imgFile.files && imgFile.files[0]) {
        var reader = new FileReader();
        reader.onload = function(event) {
          var dataUri = event.target.result;
          var img = new Image();
          img.src = dataUri;
          setTimeout(function(){resizeImage(img)},100);  // timeout?
        };
        reader.onerror = function(event) {
          console.error("File could not be read! Code " + event.target.error.code);
        };
        reader.readAsDataURL(imgFile.files[0]);
      };
    };
  });
  
  function resizeImage(img){
    var canvas = document.getElementById('canvas1');
    var ctx = canvas.getContext("2d");
    var isVisibleCross = false;
    var firstClick = {x: 100, y: 100};
    var isAdjust;
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    canvas.onclick = function(e){
      var coords = canvas.getBoundingClientRect();
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      ctx.drawImage(img,0,0);
      if(isVisibleCross){
        isVisibleCross = false;
        drawCircle(firstClick.x, firstClick.y);
        drawCircle(e.clientX-coords.left, e.clientY-coords.top);
        if(confirm("Are circles on eyes?")){
          if(firstClick.x < e.clientX-coords.left){
            $('[id*="_eye_right_x"]').val( Math.floor(firstClick.x));
            $('[id*="_eye_right_y"]').val( Math.floor(firstClick.y));
            $('[id*="_eye_left_x"]').val( Math.floor(e.clientX-coords.left));
            $('[id*="_eye_left_y"]').val( Math.floor(e.clientY-coords.top));
          } else {
            $('[id*="_eye_right_x"]').val( Math.floor(e.clientX-coords.left));
            $('[id*="_eye_right_y"]').val( Math.floor(e.clientY-coords.top));
            $('[id*="_eye_left_x"]').val( Math.floor(firstClick.x));
            $('[id*="_eye_left_y"]').val( Math.floor(firstClick.y));
          }
          // actor = img;
          // var cs = new CanvasState(document.getElementById('canvas1'));
          // cs.draw();
        } else {
          ctx.clearRect(0, 0, canvas.width, canvas.height);
          ctx.drawImage(img,0,0);
        };
      } else {
        isVisibleCross = true;
        firstClick.x = e.clientX-coords.left;
        firstClick.y = e.clientY-coords.top;
        drawCross(firstClick.x, firstClick.y);
      }
    };
    function drawCross(){
        ctx.beginPath();
        ctx.moveTo(firstClick.x-10, firstClick.y);
        ctx.lineTo(firstClick.x+10, firstClick.y);
        ctx.moveTo(firstClick.x, firstClick.y-10);
        ctx.lineTo(firstClick.x, firstClick.y+10);
        ctx.stroke();
    };
    function drawCircle(x, y){
      ctx.beginPath();
      ctx.arc(x,y,15,0,2*Math.PI);
      ctx.stroke();
    };
    ctx.drawImage(img,0,0);
  };
})    
