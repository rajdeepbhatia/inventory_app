var ready = function(){
    App.initDatepicker();
    TableManager.initDataTable();
    Dropzone.discover();

    $('body').on('click', '.blockui', function(){
        var $this = $(this);
        if ($this.closest("form")[0].checkValidity()){
            App.blockUI($('.blockable'));
        }
    });

    $('body').on('click', '.common-modal', function(){
        App.showCommonModal();
        App.blockUI($('#commonModal > .modal-dialog'));
        $('#commonModal > .modal-dialog').removeClass('modal-lg');
    });

    $('#commonModal').on('hidden.bs.modal', function () {
        $('#commonModalTitle').html('');
        $('#commonModalBody').html('');
    });
}

$(document).on('turbolinks:load', ready);
