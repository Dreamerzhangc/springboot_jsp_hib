
$("#themeSel").change(function(){
              var obj=URIUtil.parse(location.search);
             obj.theme=$(this).val();
             window.location.href =location.pathname+"?"+URIUtil.stringify(obj)+"#"+location.hash;
			});