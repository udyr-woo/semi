console.log("Review Module");
var xhr = new XMLHttpRequest();
var reviewService = (function () {
  // 리뷰 추가
  function add(review, callback, error) {
     console.log("add() :: " + review);
     console.log(review);
      $.ajax({
      url :  cp + "/review/new",
      method: 'post',
      dataType : 'json',
      data : JSON.stringify(review),
      contentType : "application/json; charset=utf-8"
    })
    .done(function(data){
      if(callback) {
        callback(data);
      }
    })
  }
  // 댓글 단일 조회
  function get(reviewNo, callback) {
    // var url = "/replies/list/" + param.bno + "/" + (param.rno ? param.rno : "");
    var url = cp + "/review/" + reviewNo + "/forMovie";
    // nullish
    // var url = "/replies/list/" + param.bno + "/" + (param.rno ?? "");
    console.log(url);
    $.getJSON(url)
    .done(function(data) {
      if(callback) {
        callback(data);
      }
    })
  }
  // 댓글 목록 조회
  function getList(param, callback, error) {
    // var url = "/replies/list/" + param.bno + "/" + (param.rno ? param.rno : "");
    var url = cp + "/review/reviewList/" + param.movieNum + "/" + (param.reviewNo || "");
    // nullish
    // var url = "/replies/list/" + param.bno + "/" + (param.rno ?? "");
    console.log(url);
    $.getJSON(url)
    .done(function(data) {
        if(callback) {
          callback(data);
        }
    })
    .fail(function(xhr) {
      if(error) {
        error(xhr);
      }
    })
  }
  // 댓글 수정
  function modify(reply, callback, error) {
    console.log(reply);
    $.ajax({
      url : cp + "/review/" + review.rno,
      method: 'put',
      data : JSON.stringify(review),
      dataType : "json",
      contentType : "application/json; charset=utf-8"
    })
    .done(function(data){
      if(callback) {
        callback(data);
      }
    })
  }
  // 댓글 삭제
  function remove(reviewNo, callback, error) {
    $.ajax({
      url : cp + "/review/" + reviewNo,
      method: 'delete',
      dataType : 'json'
    })
    .done(function(data){
      if(callback) {
        callback(data);
      }
    })
    .fail(function(xhr){
      console.log(xhr);
    })
  }
  return {
    name:"AAAA",
    add:add,
    getList:getList,
    get:get,
    remove:remove,
    modify:modify
  }
})();