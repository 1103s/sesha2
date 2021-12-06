// JavaScript Document
var $search = document.querySelector('#search');
function modiifyHeader(){
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

/*function displayHome(){
	var mainHtml = document.getElementById("bigContent");
	for(var i = 0; i < 5;i++)
	{
		mainHtml.appendChild(createSection(featuredCategories[i][0],featuredCategories[i][1]));
	}
	
	document.getElementById("reset").style.visibility='hidden';
	//document.getElementById("resetTag").style.visibility='hidden';
	document.getElementById("about").innerHTML = "";
	
	
}

function createSection(categoryID,length){
	var categorySection = document.createElement('section');
	categorySection.className = "category";
	var categoryName = categories[categoryID][1];	
	categorySection.id = "category" + categoryID;
	var tempString = "<h2 class=\"categoryTitle\">" + categoryName + "</h2>";
	
	for(var i in courseCategories)
	{
		if(courseCategories[i][1] == categoryName && length>0){
			length--;
			tempString += "<a href=\"./resources/courses/" + courseCategories[i][0] + "/coursePreview.html \"class=\"coursePreview\"> <img class=\"thumb\" src=\"./resources/images/" + courseCategories[i][0] +"-thumbnail.png\">";
			tempString += "<div class=\"textInfo\"> <h4 class=\"title\">" +  courses[courseCategories[i][0]][1] + "</h4>";
			tempString += "<div class=\"description\">" +  courses[courseCategories[i][0]][2] + "</div></div></a>";			
		}
	}
	if (length == 0)
	{
		tempString += "<div class = \"button categoryExpander\" onClick=\"expandSection("+ categoryID + ")\"><img class = \"triangle\" src=\"./resources/images/divider.svg\"></div>";			
	}
	else
	{
		tempString += "<div class = \"categoryExpander\"></div>";		
	}
		categorySection.innerHTML = tempString;
	return categorySection;
}

function expandSection(categoryID){
	var index;
	for(index in featuredCategories){
		if(featuredCategories[index][0] == categoryID){
			featuredCategories[index][1]+=2;
			break;
		}
	}
	document.getElementById("category" + categoryID).innerHTML = createSection(categoryID,featuredCategories[index][1]).innerHTML;
	
}

function bySearchTerm(term){
	
}

function byCategory(categoryID){	
	var mainHtml = document.getElementById("bigContent");
	mainHtml.innerHTML = "";
	
	mainHtml.appendChild(createSection(categoryID,20));
}


function displayCategories()
{
	//Creates the outermost div for each element
	document.getElementById("categories").innerHTML = "";
	
	//creates the bar divider
	outerDiv = document.createElement('div');
	outerDiv.className = "categoryDivider";	
	document.getElementById("categories").appendChild(outerDiv);	
	
	//Creates the categories
	outerDiv = document.createElement('div');
	outerDiv.className = "categoryList";
	
	tempString = "<h3>Categories</h3>";
	
	//itterates through the categories
	for(var j in categories){
		tempString += "<div class = \"elementCategory\"><a class = \"button tag\"  onclick=\"byCategory(\'" + categories[j][0] + "\')\">" + categories[j][1] + "</a></div>";
	}
	outerDiv.innerHTML = tempString;
	
	//Appends the final div to the document itself
	document.getElementById("categories").appendChild(outerDiv);		
}

function displayEnterCode(){
	document.getElementById("codeEntryOverlay").style.visibility = "visible";
	
}
function hideEnterCode(){	
	document.getElementById("codeEntryOverlay").style.visibility = "hidden";
}*/

$search.addEventListener('input', typeHandler)