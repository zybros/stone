//回到顶部及意见反馈
$(function(){
    $.extend({
        survey:function(options){
            
            //获取IE版本
            if ($.browser.msie) {
                var ieVersion = parseInt($.browser.version);
            }

            //绑定事件
            var __initEvent = function() {

                $(window).resize(function(){
                    var winW = $(this).width();
                    if (winW <= 1124){
                        $('#pubFeedBack').hide();
                    } else {
                        $('#pubFeedBack').show();
                    }
                })
                $(window).bind('scroll',function(){
                    //console.log($(this).scrollTop());                    
                    if($(this).scrollTop() > 50) {
                        $("#backTop").fadeIn().css({'display':'block'})
                    } else {
                        $("#backTop").fadeOut().css({'display':''})
                    }
                })

                //返回顶部
                $("#backTop").bind('click',function(e) {
                    e.preventDefault();
                    $('html,body').scrollTop(0);
                })

            }


            //IE6 定位到底部
            var __ie6Fixed = function() {
                if (ieVersion !== 6) return;
                var surveyBox = $("#D_SurveyBox");
                var pubFeedBack = $("#pubFeedBack");
                if (!surveyBox || !pubFeedBack) return;
                $(window).bind("scroll", function() {                    
                    var h = $(window).height(), st = $(window).scrollTop(), _top = h + st - options.height;
                    var _top1 = h + st - pubFeedBack.height() - 15;
                    surveyBox.css("top", _top + "px")
                    pubFeedBack.css("top", _top1 + "px")

                })
            }

            if(screen.width>=1280){
                (function() {
                    __initEvent();
                })();
            }
        }
    });
});