// JavaScript Document
var $search = document.querySelector('#search');
var categories = [
	"K-8 STEM",
	"High School STEM",
	"Music",
	"Programming"	
];
var courses = [
	[1,"The Futures Channel"]
	[2,"Emusikids"]
];
var courseCategories = [
	[1,"K-8 STEM"],
	[2,"Music"]
];


const typeHandler = function(e) {
	 bySearchTerm(e.target.value);
}

function displayHome(){
	
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