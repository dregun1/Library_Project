console.log("Ratings Module......");

var replyService = (function() {
    
    function add(ratings, callback, error) {
        console.log("ratings add ....................");
        $.ajax({
            type : "post",
            url: "/ratings/new",
            data : JSON.stringify(ratings),  // java 객체를 json으로 변환
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if(callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {
            	console.error('등록안되는이유:', status, error);
                if(error){
                    error(er);
                }
            }
        });
    
    }  // end add

    function getList(param, callback, error) {
        var isbn = param.isbn;
        var page = param.page || 1;
        $.ajax({
            type : 'get',
            url: "/ratings/pages/" + isbn + "/" + page + ".json",
            success : function(data) {
                if(callback) {
                    callback(data.ratingsCnt, data.list);
                }
            },
            error : function(xhr, status, er) {
                if(error){
                    error(er);
                }
            }
        });
    } // end getList

    function remove(ratingsid, memberid, callback, error) {
        
        $.ajax({
            type : 'delete',
            url: "/ratings/" + ratingsid,
            data: JSON.stringify({ratingsid:ratingsid, memberid:memberid }),
            contentType: "application/json; charset=utf-8",
            success : function(result, status, xhr) {
            	console.error("성공은 함?", result);
                if(callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {
            console.error('삭제 오류 이유:', status, error);
                if(error){
                    error(er);
                }
            }
        });
    } // end remove

    function update(ratings, callback, error) {
        console.log("ratingsid: " + ratings.ratingsid);
        $.ajax({
            type : "put",
            url: "/ratings/" + ratings.ratingsid ,
            data : JSON.stringify(ratings),  // java 객체를 json으로 변환
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if(callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {
                if(error){
                    error(er);
                }
            }
        });
    } // end update

    function get(ratingsid, callback, error) {
        console.log("get >>> " + ratingsid);
        $.ajax({
            type : 'get',
            url: "/ratings/" + ratingsid,
            cache: false,
            success: function(result, status, xhr) {
                if(callback) {
                    callback(result);
                }
            },
            error: function(xhr, status, er) {
                console.error('Error:', status, error);
                if(error){
                    error(er);
                }
            }
        })

    } // end get

    function displayTime(timeValue){

		var today = new Date();

		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);

		var str="";

		if(gap < (1000*60*60*24)){ //24시간(하루)
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh >9 ? '' : '0') + hh, ":" , (mi > 9? '' : '0') + mi , ":" , (ss > 9? '' : '0') + ss].join("") ;

		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() +1;
			var dd = dateObj.getDate();

			return [ yy, "/", (mm > 9? '' : "0")+ mm , "/" , (dd > 9? '' : '0')+dd].join("");
		}

	} //end displayTime

    return {
        add : add,
        getList : getList,
        remove: remove,
        update: update,
        get: get,
        displayTime : displayTime 
    };
})();