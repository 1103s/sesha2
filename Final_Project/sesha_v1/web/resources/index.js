// JavaScript Document
function modifyHeader(){
    document.getElementById("storeButton").classList.add("active");
}

const typeHandler = function(e) {
	 bySearchTerm(e.target.value);
}

function expandSection(sectionID){
    var currentSection = document.getElementById(sectionID);
    var invisibleElements = currentSection.getElementsByClassName("dispNone");
    var len = invisibleElements.length;
    for(let i = 0; i<=len;i++){
        invisibleElements[0].classList.remove("dispNone");
        if(i>=2){
            break;
        }
        
        if(i===len-1){
            currentSection.getElementsByClassName("expander")[0].innerHTML = "";
        }
    }
}
