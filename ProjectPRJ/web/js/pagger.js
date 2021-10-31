/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function createPagger(div, pageindex, gap, totalpage,url) {

    var container = document.getElementById(div);
//    container.innerHTML=pageindex+ ' ' + gap + ' ' + totalpage;

    if (pageindex - gap > 1)
        container.innerHTML += '<a href="'+url+'?page=1">First</a>';
    
    for (var i = pageindex-gap; i < pageindex;i++) {
        if(i>0)
        container.innerHTML += '<a href="'+url+'?page='+i+'">'+i+'</a>';
    }
    
    container.innerHTML += '<span>'+pageindex+'</span>';
    
     for (var i = pageindex+1; i <= pageindex + gap ;i++) {
        if(i<=totalpage)
        container.innerHTML += '<a href="'+url+'?page='+i+'">'+i+'</a>';
    }
    
    if (pageindex + gap < totalpage)
        container.innerHTML += '<a href="'+url+'?page='+totalpage+'">Last</a>';
    
}

