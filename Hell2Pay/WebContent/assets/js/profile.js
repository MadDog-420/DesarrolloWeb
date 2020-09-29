$( document ).ready(function(){
    $('#editD').click(function(e){
        let parent=$(this).parentsUntil("form");

        if($("#nombre").prop("disabled")){
            parent.addClass("enable").siblings().addClass("enable");
            $("#nombre").prop("disabled",false);
			$("#apellido").prop("disabled",false);
            $("#pais").prop("disabled",false);
        } else {
            parent.removeClass("enable").siblings().removeClass("enable");
            $("#nombre").prop("disabled",true);
            $("#apellido").prop("disabled",true);
			$("#pais").prop("disabled",true);
        }
        //
    });

    $('#save').click(function(e){
        $("#nombre").prop("disabled",false);
		$("#apellido").prop("disabled",false);
        $("#pais").prop("disabled",false);
    })

    $("#fileInput").change(function () {
        filePreview(this);
      });

    function filePreview(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.readAsDataURL(input.files[0]);
          reader.onload = function (e) {
            $('#upload + img').remove();
            $('#upload').after('<img src="'+e.target.result+'" class="avatar"/>');
          }
        }
    }
})

