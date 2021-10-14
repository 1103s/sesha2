// JavaScript Document
var $search = document.querySelector('#search');
var categories = [
	"K-8 STEM",
	"High School STEM",
	"Music",
	"Programming"	
];
var courses = [
	[0,"The Futures Channel","This is a description of what this course is about"],
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
	[7,"Music"],
	[8,"K-8 STEM"],
	[9,"Music"],
	[10,"K-8 STEM"],
	[11,"Music"],
	[12,"K-8 STEM"],
	[13,"Music"]
];


const typeHandler = function(e) {
	 bySearchTerm(e.target.value);
}

function displayHome(){
	var mainHtml = document.getElementById("main");
	
	mainHtml.appendChild(createSection("K-8 STEM",4));
	mainHtml.appendChild(createSection("Music",4));
	
	document.getElementById("reset").style.visibility='hidden';
	document.getElementById("resetTag").style.visibility='hidden';
	document.getElementById("about").innerHTML = "";
	
	
}

function createSection(category,length){
	var categorySection = document.createElement('section');
	categorySection.className = "category";
	var tempString = "<h2 class=\"categoryTitle\">" + category + "</h2>";
	
	for(var i in courseCategories)
	{
		if(courseCategories[i][1] == category && length>0){
			length--;
			tempString += "<img class=\"thumb\" src=\"./resources/images/" + courseCategories[i][0] +" - thumbnail.png\">";
			tempString += "<div class=\"textInfo\"> <div class=\"title\">" +  courses[courseCategories[i][0]][1] + "</div>";
			tempString += "<div class=\"description\">" +  courses[courseCategories[i][0]][2] + "</div></div>";			
		}
	}
	categorySection.innerHTML = tempString;
	return categorySection;
}

function expandSection(section){
	
}

function bySearchTerm(term){
	
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
		tempString += "<div class = \"elementCategory\"><a class = \"button tag\"  onclick=\"byCategory(\'" + categories[j] + "\', \'\')\">" + categories[j] + "</a></div>";
	}
	outerDiv.innerHTML = tempString;
	
	//Appends the final div to the document itself
	document.getElementById("categories").appendChild(outerDiv);		
}

$search.addEventListener('input', typeHandler)