class ytable {
  constructor(tbl,cols,cjoins,additionals,dplacement,clauses,errorLog=false) {
  this.table = tbl;
  this.colnames=cols;
  this.joins=cjoins;
  this.additionalCols=additionals;
  this.placement=dplacement;
  this.allClause = clauses;
  this.debug = errorLog;
  this.pageLimit=10;
  this.uniqueCol='id';
  this.page=1;
  this._result = [];
  this.currentData=[];
  this._webbase = document.getElementById('web_base_url')?document.getElementById('web_base_url'):document.getElementById('base_url');
  this.route='';
  this.base_url = _uri(this._webbase.value);
  this.img_url = _uri(this.base_url('public/Uploads'));
  this.dimg_url = _uri(this.base_url('public/images'));
  this.actionHeading='Action';
  this.q='';
  this.searchStop;
  this.selectedRows = [];
  this.autoCallbacksonBuild = [];
  this.buildtable();
  this.bindSearch();
  }
  get debug() {
    return this._debug;
  }
  set debug(value) {
    this._debug = value;
  }
  get route() {
    return this._route;
  }
  set route(value) {
    this._route = value;
  }
  get placement() {
    return this._placement;
  }
  set placement(value) {
    this._placement = value;
  }
  get table() {
    return this._table;
  }
  set table(value) {
    this._table = value;
  }
  get pageLimit() {
    return this._pageLimit;
  }
  set pageLimit(value) {
    this._pageLimit = value;
  }
  get uniqueCol() {
    return this._uniqueCol;
  }
  set uniqueCol(value) {
    this._uniqueCol = value;
  }
  get actionHeading() {
    return this._actionHeading;
  }
  set actionHeading(value) {
    this._actionHeading = value;
  }
  
  get additionalCols() {
    return this._additionalCols;
  }
  set additionalCols(value) {
    this._additionalCols = value;
  }
  ytdebuger(_cc,type=''){
    if(this.debug){
      if(type==''){
        console.log(_cc);
      } else {
        console.warn(_cc);
      }
    }
  }
  bindEvent(eventName,data){
    var evt = new CustomEvent(eventName, {detail:data});
    window.dispatchEvent(evt);
  }
  buildtable(){
    var tbl = this.table;
    var joins = this.joins;
    var limit = this.pageLimit;
    var cols = this.colnames;
    var page = this.page;
    var clauses = this.allClause;
    var searchQuery = this.q;
    var uniqueCol = this.uniqueCol;
    this.ytdebuger(['parameters 1:table,2:joins,3:limit,4:columns',tbl,joins,limit,cols]);
    var _ytdata = {
      "table":tbl,
      "cols":cols,
      "clauses":clauses,
      "joins":joins,
      "limit":limit,
      "page":page,
      "q":searchQuery,
      "uniqueCol":uniqueCol
    }
    this.ytdebuger(_ytdata);
    this.buildtableheader();
    return this.fetchyData(_ytdata);
  }
  fetchyData(_ytdata){
    //yruxifyA.abort();
    var totalTds = this.colnames.length;
    this.ytdebuger('table empty');
    this.emptyYtable();
    var _fetchyDataajax=ajaxify(_ytdata,'POST',this.base_url('adminiy/ytable')).then(res=>{
      this.ytdebuger(res.data);
      this.currentData =res.data;
      this._result =res;
      this.buldTableTr();
      this.buildPagination();
      this.autoCallbacksonBuild.forEach(q=>{
        this.ytdebuger('patched event '+q);
        window[q]();
      });
    }).catch((ex)=>{
      this.ytdebuger(ex,'warn');
    });
    return _fetchyDataajax;
  }
  buildPagination(){
    document.getElementById('ytablepaginateli').innerHTML='';
    document.getElementById('ytablepaginateli').innerHTML='<li class="page-item pagination-first"><a class="page-link ytable-first" href="javascript:void(0)"></a></li>';
    document.getElementById('ytablepaginateli').innerHTML+='<li class="page-item pagination-prev"><a class="page-link ytable-prev" href="javascript:void(0)"></a></li>';
    var totalRecords = this._result.count;;
    var recordsPerPage = this.pageLimit;
    var currentPage = this._result.currentPage;
    var totalPages = this._result.totalPages;
    var _f = 0;
    for(let i=(currentPage-3);i<currentPage;i++){
      if(i>0){
        let _cls = 'ytablepage-'+i;
        document.getElementById('ytablepaginateli').innerHTML+='<li class="page-item"><a ytable-page="'+i+'" class="page-link ytablepage-'+i+'" href="javascript:void(0)">'+(i)+'</a></li>';
      }
    }
    var cc = 0;
    for(let i=(currentPage-1);i<(currentPage+3);i++){
      cc++;
      if(cc>4){
        break;
      }
      if(totalPages==(i)){
          break;
        }
        let _cls = 'ytablepage-'+(i+1);
        document.getElementById('ytablepaginateli').innerHTML+='<li class="page-item '+((i+1)==currentPage?"active":"")+'"><a ytable-page="'+(i+1)+'" class="page-link ytablepage-'+(i+1)+'" href="javascript:void(0)">'+(i+1)+'</a></li>';
    }
    document.getElementById('ytablepaginateli').innerHTML+='<li class="page-item pagination-next"><a class="page-link ytable-next" href="javascript:void(0)"></a></li>';
    document.getElementById('ytablepaginateli').innerHTML+='<li class="page-item pagination-last"><a class="page-link ytable-last" href="javascript:void(0)"></a></li>';
    document.getElementsByClassName('ytable-first')[0].addEventListener('click',()=>{
      this.gotoPage(1);
    },false);
    document.getElementsByClassName('ytable-prev')[0].addEventListener('click',()=>{
      if(this.page>1){
        this.gotoPage((this.page-1));
      }
    },false);
    document.getElementsByClassName('ytable-next')[0].addEventListener('click',()=>{
      if(this.page<this._result.totalPages){
        this.gotoPage((this.page+1));
      }
    },false);
    document.getElementsByClassName('ytable-last')[0].addEventListener('click',()=>{
      this.gotoPage(this._result.totalPages);
    },false);
    var allpaginationTags = document.querySelectorAll('[ytable-page]');
    for(let q=0;q<allpaginationTags.length;q++){
      allpaginationTags[q].addEventListener('click',(e)=>{
        var page = e.target.getAttribute('ytable-page');
        this.gotoPage(page);
      },false);
    }
  }
  considerEmpty(value){
    if(typeof value != 'undefined'){
      return true;
    }
  }
  buldTableTr(){
    this.ytdebuger('Row Append Start');
    this.appendInTable('<tbody class="ytableBody"></tbody>',this.placement);
    var _tc=0;
    this.currentData.forEach((dd,di)=>{
      this.ytdebuger('Event Fired ytable_beforeRow');
      this.bindEvent('ytable_beforeRow',{data:dd,dataIndex:di});
      dd = this.currentData[di];
      _tc++;
      var _inSelected='';
      if(this.inSelectedRow(dd[this.uniqueCol])){
        _inSelected='ytable-marktedDeleted';
      }
      var tr = '<tr class="'+_inSelected+'" data-ytablerowid="'+dd[this.uniqueCol]+'" data-ytrcount="'+_tc+'">';
      this.colnames.forEach((a,b)=>{
        var _rlc = a.column;
        if(a.column.indexOf('.')>=0){
          a.column = a.column.split('.')[1];
        }
        this.ytdebuger('Tr column added Data : '+dd[a.column]+'. And column : '+a.column);
        this.bindEvent('ytable_columnAdded_'+a.column,{data:dd[a.column],dataIndex:di});
        if(!a.hiddenInList){
          var _col = a.column;
          if(a.alias){
            _col = a.alias;
          }
          if(this.considerEmpty(dd[_col])){
            if(a.callback){
              let cb = a.callback;
              let cbparameters = [_col,dd,dd[_col],this];
              if ( eval("typeof "+cb+" === 'function'") ){
                let _val = window[cb](cbparameters);
                tr += '<td>'+_val+'</td>';
              }
            } else {
              tr += '<td>'+dd[_col]+'</td>';
            }
          } else {
            tr += '<td></td>';
          }
        }
        a.column = _rlc;
      })
      if(this.additionalCols.length>0){
        tr+='<td>';
        this.additionalCols.forEach((additionalColumns)=>{
          if(additionalColumns=='delete'){
            tr+='<button data-toggle="tooltip" data-deleteytable="true" id="delete_'+dd[this.uniqueCol]+'" data-record="'+dd[this.uniqueCol]+'" data-table="'+this.table+'" data-col="'+this.uniqueCol+'" class="btn btn-outline-danger btn--icon" data-placement="top" title="Delete Record"><i class="zmdi zmdi-delete zmdi-hc-fw"></i></button>';
          } else if(additionalColumns=='editFast'){
            tr+='<button data-toggle="tooltip" data-fasteditytable="true" data-col="id" data-record="'+dd[this.uniqueCol]+'" data-table="'+this.table+'"  id="edit_fast_'+dd[this.uniqueCol]+'" class="btn btn-outline-success btn--icon" data-placement="top" title="Edit Record"><i class="zmdi zmdi-edit zmdi-hc-fw"></i></button>';
          }else if(additionalColumns=='viewFast'){
            tr+='<button data-toggle="tooltip" data-fastviewytable="true" data-col="id" data-record="'+dd[this.uniqueCol]+'" data-table="'+this.table+'"  id="view_fast_'+dd[this.uniqueCol]+'" class="btn btn-outline-info btn--icon" data-placement="top" title="View Record"><i class="zmdi zmdi-eye zmdi-hc-fw"></i></button>';
          } else {
            tr+=additionalColumns;
          }
        })
        tr+='</td>';
      }
      tr += '</tr>';
      this.appendInTable(tr,'.ytableBody');
      this.bindEvent('ytable_afterRow',{data:dd,dataIndex:di,trCounter:_tc});
      this.ytdebuger('Event Fired ytable_afterRow');
      /*Binding Delete Event with Swal , you can change it to your needs*/
      bindyTableDelete();
      bindyTableFastEdit();
      bindyTableFastView();
      /*Binding Delete End*/
    })
  }
  appendInTable(html,target){
    var rp = target.substr(1,target.length);
    if(target[0]=='.'){
      for(var q=0;q<document.getElementsByClassName(rp).length;q++){
        document.getElementsByClassName(rp)[q].innerHTML+=html;
      }
    } else if(target[0]=='#') {
      document.getElementById(rp).innerHTML+=html;
    }
  }
  emptyYtable(){
    if(document.getElementsByClassName('ytableBody')[0]){
      document.getElementsByClassName('ytableBody')[0].remove();
    }
    return;
    var rp = this.placement.substr(1,'.ytableBody'.length);
    if('.ytableBody'[0]=='.'){
      for(var q=0;q<document.getElementsByClassName(rp).length;q++){
        document.getElementsByClassName(rp)[q].innerHTML = '';
      }
    } else if(this.placement[0]=='#') {
      document.getElementById(rp).innerHTML='';
    }
  }
  buildtableheader(){
    var rp = this.placement.substr(1,this.placement.length);
    if(this.placement[0]=='.'){
      for(var q=0;q<document.getElementsByClassName(rp).length;q++){
        document.getElementsByClassName(rp)[q].innerHTML = '';
        document.getElementsByClassName(rp)[q].innerHTML = this.buildheaderTr();
      }
    } else if(this.placement[0]=='#') {
      document.getElementById(rp).innerHTML='';
      document.getElementById(rp).innerHTML=this.buildheaderTr();
    }
  }
  buildheaderTr(){
    var tr = '<thead><tr>';
    this.colnames.forEach(a=>{
      if(!a.hiddenInList){
        tr+='<th>'+a.name+'</th>';
      }
    })
    if(this.additionalCols.length>0){
      tr+='<th>Action</th>';
    }
    tr+='</tr></thead>';
    return tr;
  }
  resetyTable(_limit=10){
    clearInterval(this.searchStop);
    this.searchStop = setInterval((_limit)=>{
      this.resetyTableBuffer(_limit);
      clearInterval(this.searchStop);
    },250,_limit);
  }
  resetyTableBuffer(_limit,__page=0){
    this.page=__page;
    this.pageLimit=_limit;
    var que = this;
    return new Promise(function(resolve, reject) {
      que.buildtable().then(()=>{
        resolve(que);
        return que;
      }).then((que)=>{
        que.bindingCtrlClickTr();
      });
    });
  }
  gotoPage(pageNo){
    this.page=pageNo;
    this.buildtable().then((que)=>{
        this.bindingCtrlClickTr();
    });
  }
  bindSearch(){
    document.getElementById('ytableSearch').addEventListener("keypress", (e)=>{
      this.q = e.target.value;
      this.searchTable();
    });
    document.getElementById('ytableSearch').addEventListener("change", (e)=>{
      this.q = e.target.value;
      this.searchTable();
    });
    document.getElementById('ytableSearch').addEventListener("keydown", (e)=>{
      this.q = e.target.value;
      this.searchTable();
    });
    document.getElementById('ytableSearch').addEventListener("keyup", (e)=>{
      this.q = e.target.value;
      this.searchTable();
    });
  }
  searchTable(){
    clearInterval(this.searchStop);
    this.searchStop = setInterval(()=>{
      this.resetyTableBuffer(this.pageLimit);
      clearInterval(this.searchStop);
    },250);
  }
  _uri(base_url){
    return (appender='')=>{
      return base_url+'/'+appender;
    }
  }
  bindingCtrlClickTr(){
    var elems = document.querySelectorAll('[data-ytrcount]');
    for(var i =0;i<elems.length;i++){
      var eve = elems[i];
      eve.addEventListener('click',(e)=>{
        if(e.ctrlKey){
          for(var qq=0;qq<e.path.length;qq++){
            if(e.path[qq].tagName){
              if(e.path[qq].tagName.toLowerCase()=='tr'){
                e.path[qq].classList.value='ytable-marktedDeleted';
                this.selectRow(e.path[qq].getAttribute('data-ytablerowid'));
                break;
              }
            }
          }
        } else {
          for(var qq=0;qq<e.path.length;qq++){
            if(e.path[qq].tagName){
              if(e.path[qq].tagName.toLowerCase()=='tr'){
                e.path[qq].classList.value='';
                this.unselectRow(e.path[qq].getAttribute('data-ytablerowid'));
                break;
              }
            }
          }
        }
      })
    }
  }
  selectRow(_ytrow){
    this.selectedRows.push(_ytrow)
  }
  inSelectedRow(_ytrow){
    if(this.selectedRows.indexOf(String(_ytrow))>=0){
      return true;
    } else {
      return false;
    }
  }
  selectedCount(){
    return this.selectedRows.length;
  }
  unselectRow(_ytrow){
    for (var key in this.selectedRows) {
        if (this.selectedRows[key] == _ytrow) {
            this.selectedRows.splice(key, 1);
        }
    }
  }
  destroy(){
    this.emptyYtable();
  }
}