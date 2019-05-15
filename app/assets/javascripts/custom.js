<script type="text/javascript">
    $('.save').click(function(){
    var id = $(this).val();
    var project_id = $(".project").attr('value');
    var payment_activity = document.getElementById("payment-activity-"+id).innerHTML;
    var fit = document.getElementById("fit-"+id).innerHTML;
    var time = document.getElementById("time-"+id).innerHTML;
    var phase = document.getElementById("phase-"+id).innerHTML;
    
        // console.log(payment);
        $.ajaxSetup({
          headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') }
        });
        $.ajax({
         type:'POST',
         url:'http://127.0.0.1:8000/admin/suggestions/save',
           // dataType:'json',
           data:{
                project_id : project_id,
                payment_activity : payment_activity,
                fit : fit,
                time : time,
                phase : phase,                  
                _token: '{{csrf_token()}}'
          },
          success:function(data){
            console.log(data);
            $(':button[value="' +id+'"]').removeClass('btn-success');
            $(':button[value="' +id+'"] span').removeClass('glyphicon-save');
            $(':button[value="' +id+'"] span').addClass('glyphicon-saved');
            $(':button[value="' +id+'"]').prop('disabled', true);

        }, error:function(){
        //alert("errr");
    }
});
    });
</script>
