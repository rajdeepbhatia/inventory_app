var App = (function(){
    return {
        blockUI: function(el) {
            el.block({
                message: '',
                css: {
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: '#FFFFFF',
                    backgroundImage: "url('/assets/loading.gif')",
                    backgroundRepeat: 'no-repeat',
                    backgroundPosition: 'center',
                    opacity: 0.67
                }
            });
        },
        unBlockUI: function(el) {
            el.unblock();
        },
        initDatepicker: function(){
            $('.datepicker').datepicker({format: "yyyy-mm-dd"});
        },
        showCommonModal: function(){
            $('#commonModal').modal('show');
        },
        hideModal: function(){
            $('.modal').modal('hide');
        }
    }
})();