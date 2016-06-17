

$(document).ready(function () {
  console.log('---- ui.js loaded ----');

  var tblInterval = {};


  function generateHeaderActiveProject() {
    return $('<div class="row">'+
              '<div class="col-sm-6">'+
                   '<span class="logo-runtime">' +
                   '<img src="optimahublogo.png" width="140" height="40">'+
                   '</span>' +
                   '<ul>' +
                   '<li class="brand-selection"><a class="dropdown-toggle ink-reaction option-selected-toggle-link" data-toggle="dropdown" href="javascript:void(0);"><i class="fa fa-angle-down"></i></a><ul class="dropdown-menu platform-selection clearfix animation-expand"><li><span class="header">Select a Platform</span></li><li class="parent"><a href="#" class="btn-block"><img src="platform_tm.png" alt=""></a></li><li class="parent"><a href="#" class="btn-block"><img src="platform_dc.png" alt=""></a></li><li class="parent"><a href="#" class="btn-block"><img src="platform_de.png" alt=""></a></li><li class="parent"><a href="#" class="btn-block"><img src="platform_oh.png" alt=""></a></li></ul></li>' +
                   '</ul>' +
                   '<div style="padding: .3em;' +
                      'margin-left: 3em;' +
                      'font-weight: 600;' +
                      'font-size: 16px;">' +
                      '<span class="icon-layers" style="' +
                               'font-size: 25px !important;' +
                               'margin-right: .4em;">' +
                      '</span> TELSTRA' +
                   '</div>'+
               '</div>'+ // col-sm-6
               '<div class="col-sm-6">' +
                 '<ul class="pull-right header-side-nav">'+
                 '<li class="dropdown text-center">' +
                  '<a class="dropdown-toggle ink-reaction option-selected-toggle-link margin-right">' +
                    '<span class="icon-search"></span> Search ' +
                    '</a>' +
                 '</li>' +
                 '<li class="dropdown text-center">' +
                  '<a class="dropdown-toggle ink-reaction option-selected-toggle-link margin-right">' +
                    '<span class="icon-help"></span> Help' +
                    '</a>' +
                 '</li>' +
                 '<li class="dropdown text-center">' +
                  '<button class="btn btn-default action-button btn btn-raised" id="logout" type="button">' +
                    '<span class="icon-cog"></span> Log Out' + '</button>' +
                 '</li>' +
                 '</ul>' +
               '</div>'+ // col-sm-6
              '</div>'
             )
  }



  //function adjustDataTable_0_Header() {
    //// console.log('adjustDataTable_0_Header called ');
    //if ($('table#DataTables_Table_0 thead th').length < 1) return;
    //console.log("$('table#DataTables_Table_0 thead th') ", $('table#DataTables_Table_0 thead th'));
    // tables
    //var _channel  = $('table#DataTables_Table_0 thead th')[0],
    //       _cost  = $('table#DataTables_Table_0 thead th')[1],
    //       _clicks  = $('table#DataTables_Table_0 thead th')[2],
    //       _impression  = $('table#DataTables_Table_0 thead th')[3],
    //       _rev  = $('table#DataTables_Table_0 thead th')[4],
    //       _roi  = $('table#DataTables_Table_0 thead th')[5];

    //$(_channel).html('<i class="fa fa-circle-o" style="margin-right:.5em; font-size:14px;"></i> Channel');
    //$(_cost).html('<i class="fa fa-dollar" style="margin-right:.5em; font-size:14px;"></i>Cost');
    //$(_clicks).html('<i class="fa fa-location-arrow" style="margin-right:.5em; font-size:14px;"></i>Clicks');
    //$(_impression).html('<i class="fa fa-share-alt" style="margin-right:.5em; font-size:14px;"></i>Impression');
    //$(_rev).html('<i class="fa fa-line-chart" style="font-size:14px;"></i>Overall Revenue');
    //$(_roi).html('<i class="fa fa-refresh" style="margin-right:.5em; font-size:14px;"></i>ROI_O');
    ////clearInterval(tblInterval);
  //}


   $('.sidebar-toggle').after(generateHeaderActiveProject());

   // remove elements
   $('.sidebar-toggle').remove();
   $('.logo').remove();

  //  tblInterval = setInterval(adjustDataTable_0_Header, 1500);

});

//console.log('$', $);
