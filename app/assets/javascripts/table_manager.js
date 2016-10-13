var TableManager = (function(){
    var _dataTable = function(){
        return $('.data-table').DataTable({
            processing: true,
            responsive: true,
            stateSave: true
        });
    }

    var _commonTable = function(){
        $('.common-table').DataTable({
            processing: true,
            responsive: true,
            iDisplayLength: 5,
            aLengthMenu: [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, 'All']]
        });
    }

    return {
        initDataTable: _dataTable,
        initCommonTable: _commonTable
    }
})();