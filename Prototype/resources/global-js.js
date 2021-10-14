// JavaScript Document
var $search = document.querySelector('#search');
var categories = [
	[0,"K-8 STEM"],
	[1,"High School STEM"],
	[2,"Music"],
	[3,"Programming"],
	[4,"Math"]	
];
var courses = [
	[0,"The Futures Channel","This is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is aboutThis is a description of what this course is about"],
	[1,"Emusikids","This is a description of what this course is about"],
	[2,"The Futures Channel","This is a description of what this course is about"],
	[3,"Emusikids","This is a description of what this course is about"],
	[4,"The Futures Channel","This is a description of what this course is about"],
	[5,"Emusikids","This is a description of what this course is about"],
	[6,"The Futures Channel","This is a description of what this course is about"],
	[7,"Emusikids","This is a description of what this course is about"],
	[8,"The Futures Channel","This is a description of what this course is about"],
	[9,"Emusikids","This is a description of what this course is about"],
	[10,"The Futures Channel","This is a description of what this course is about"],
	[11,"Emusikids","This is a description of what this course is about"],
	[12,"The Futures Channel","This is a description of what this course is about"],
	[13,"Emusikids","This is a description of what this course is about"]
];
var courseCategories = [
	[0,"K-8 STEM"],
	[1,"Music"],
	[2,"K-8 STEM"],
	[3,"Music"],
	[4,"K-8 STEM"],
	[4,"Programming"],
	[5,"Music"],
	[6,"K-8 STEM"],
	[6,"Math"],
	[6,"Programming"],
	[7,"Music"],
	[8,"K-8 STEM"],
	[8,"Programming"],
	[8,"Math"],
	[9,"Music"],
	[10,"K-8 STEM"],
	[10,"High School STEM"],
	[11,"Music"],
	[12,"K-8 STEM"],
	[13,"Music"]
];
var featuredCategories = [
	[0,4],
	[2,4],
	[4,4],
	[3,4],
	[1,4],
];

const typeHandler = function(e) {
	 bySearchTerm(e.target.value);
}

function displayHome(){
	var mainHtml = document.getElementById("exampleCourses");
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
			tempString += "<div class=\"coursePreview\"> <img class=\"thumb\" src=\"./resources/images/" + courseCategories[i][0] +"-thumbnail.png\">";
			tempString += "<div class=\"textInfo\"> <h4 class=\"title\">" +  courses[courseCategories[i][0]][1] + "</h4>";
			tempString += "<div class=\"description\">" +  courses[courseCategories[i][0]][2] + "</div></div></div>";			
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
	var mainHtml = document.getElementById("exampleCourses");
	mainHtml.innerHTML = "";
	
	mainHtml.appendChild(createSection(categoryID,20));
}


function displayCategories()
{
	//Creates the outermost div for each element
	document.getElementById("categories").innerHTML = "";
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

$search.addEventListener('input', typeHandler)