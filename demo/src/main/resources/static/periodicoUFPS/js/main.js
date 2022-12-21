
function cargadoInicial(){

    const url = "http://localhost:8088/categoria/listar";
   
    fetch(url)
.then((resp) => resp.json())
.then(function(data) {
    var array = data;
    var elem = document.querySelector('#navCategoria');
    console.log(array);
    
    for (var i = 0; i <data.length; i++) {
        let urlP="http://localhost:8088/categoria/"+array[i].id_categoria+"/noticias";
        let a = document.createElement("a");
        a.setAttribute("href","javascript:obtenernoticias('"+urlP+"');");
        let aTexto = document.createTextNode(array[i].nombre);
        a.appendChild(aTexto);
        a.classList.add("text-reset");
        a.classList.add("p-2");
        elem.appendChild(a);
     }
})
.catch(function(error) {
  console.log(error);
});
    
}

function postNoticia(){
    var array=document.getElementById("idImagen").files; 
    
    console.log("aqui->"+array);
    var url = 'http://localhost:8088/noticias/postNoticia';
    postImagen();
    var contenido = CKEDITOR.instances['idcontenidoNoticia'].getData();
    console.log("contenido"+contenido)
    const fecha = new Date();
const timestamp = fecha.getTime();
    var data = {
        id: "",
        titulo: document.getElementById("idTituloNoticia").value,
        contenido:contenido,//document.getElementById("idcontenidoNoticia").value,
        id_usuario:"1",
        estado: "espera",
        url_imagen: "../data/"+array[0].name,
        fecha:timestamp,
        id_categoria:document.getElementById("SelectCategoria").value
    };
    post(url,data);
    document.getElementById("miForm").reset();
}


function post(url,data){

    fetch(url, {
        method: 'POST', // or 'PUT'
        body: JSON.stringify(data), // data can be `string` or {object}!
        headers:{
          'Content-Type': 'application/json'
        }
      }).then(res => res.json())
      .catch(error => console.error('Error:', error))
      .then(response => console.log('Success:', response));
}

function postImagen(){
    var input = document.querySelector('input[type="file"]')
    var data = new FormData()
    data.append('file', input.files[0])
    fetch('http://localhost:8088/noticias/postNoticiaImg', {
        method: 'POST',
        body: data
    })
    .then(response => Promise.all([response.status, response.json()]))
    .then(function([status, myJson]) {
        if (status == 200) {
            console.log("succeed!");
        } else {
            console.log("failed!");
        }
    })
    .catch(error => console.log(error.message));
}

function obtenernoticias(ruta){
    fetch(ruta)
.then((resp) => resp.json())
.then(function(data) {
    console.log("entrooooo");
    var data = data;
    console.log(data);
   
    console.log("aqui"+data[1].id);
    vaciarPecera();
        var elem = document.querySelector('#feedPricipal');
    for (var i = 3; i <data.length-3; i++) {
        elem.innerHTML='<div class="col-sm-6 col-lg-4 mb-4" style="position: absolute; left: 0%; top: 0px;"><div class="card" ><img src="'+data[i].noticia.url_imagen+'" class="card-img-top" alt="..."><div class="card-body"><strong class="d-inline-block mb-2 '+
        data[i].categoria.nombre+'">'+data[i].categoria.nombre+'</strong><h3 class="mb-0">'+
        split(data[i].noticia.titulo)+'</h3><div class="mb-1 text-muted">Dec 23</div><p class="card-text mb-auto">'+
        data[i].noticia.titulo+'</p><a href="javascript:cargarNoticia('+data[i].id+')" class="stretched-link">Continue reading</a></div></div></div>'+elem.innerHTML;
    }
    
    llenarPeceraDos(data);
    var msnry = new Masonry( elem, { 
    });
    msnry.layout();
})
.catch(function(error) {
  console.log(error);
});
}
/*
function que llenara el feed principal de noticias 
*/
function llenarPecera(dataTwo){
    var data = dataTwo;
    
    console.log("aqui"+data[1]);
    vaciarPecera();
        var elem = document.querySelector('#feedPricipal');
    for (var i = 3; i <data.length-3; i++) {
        elem.innerHTML='<div class="col-sm-6 col-lg-4 mb-4" style="position: absolute; left: 0%; top: 0px;"><div class="card" ><img src="'+data[i].noticia.url_imagen+'" class="card-img-top" alt="..."><div class="card-body"><strong class="d-inline-block mb-2 '+
        data[i].categoria.nombre+'">'+data[i].categoria.nombre+'</strong><h3 class="mb-0">'+
        split(data[i].noticia.titulo)+'</h3><div class="mb-1 text-muted">Dec 23</div><p class="card-text mb-auto">'+
        data[i].noticia.titulo+'</p><a href="javascript:cargarNoticia('+data[i].id+')" class="stretched-link">Continue reading</a></div></div></div>'+elem.innerHTML;
    }
    
    llenarPeceraDos(data);
    var msnry = new Masonry( elem, { 
    });
    msnry.layout();
}

function split(titulo){
    var array = titulo.split(" ");
    return array[0]+" "+array[1];
}
/*
function que limpiara el feed principal de noticias 
*/
function vaciarPecera(){
    document.getElementById("feedPricipal").remove();
    //<div class='row' id='feedPricipal' data-masonry='{&quot;percentPosition&quot;: true }' style='position: relative; '></div>
    //const div = document.createElement("div");
    document.getElementById("feedNoticias").innerHTML="<div class='row' id='feedPricipal' data-masonry='{&quot;percentPosition&quot;: true }' style='position: relative; '></div>";
}

/*
function que llenara el feed principal de noticias 
*/
function llenarPeceraDos(data){
    vaciarPeceraDos();
    var elem = document.querySelector('#feedSugerencias');
    for (var i = 0; i <3; i++) {
        elem.innerHTML='<div class="card" style="margin-bottom: 1.5em;"><div class="card-body"><strong class="d-inline-block mb-2 '+data[i].categoria.nombre+'">'+data[i].categoria.nombre+'</strong><h5 class="card-title">'+split(data[i].noticia.titulo)+'</h5><p class="card-text">'+data[i].noticia.titulo+'</p><p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p><a href="javascript:cargarNoticia('+data[i].id+')" class="stretched-link">Continue reading</a></div></div>'+elem.innerHTML;
    }
    
}

/*
function que limpiara el feed principal de noticias 
*/
function vaciarPeceraDos(){
    document.getElementById("feedSugerencias").innerHTML="";
    }


/*
function que retorna un diseño cualquiera de noticia  
*/
function diseñoRamdom(){
    const diseño = new Array("", 
    //este diseño si sale de primero limita los otros'<div class="col-sm-6 col-md-6 col-lg-8" style="position: absolute; left: 0%; top: 0px;"><div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-200 position-relative"><div class="col-auto d-none d-lg-block"><img src="../data/4H3H07Gh_400x400.jpg" class="icard-img-top" alt="..."></div><div class="col p-4 d-flex flex-column position-static"><strong class="d-inline-block mb-2 text-success">Finanzas</strong><h3 class="mb-0">Caida Nequi</h3><div class="mb-1 text-muted">Dec 3</div><p class="mb-auto">Se cayo nequi, sin importar  cuando sea leida esta Noticia</p><a href="#" class="stretched-link">Continue reading</a></div></div></div>',
    '<div class="col-sm-6 col-lg-4 mb-4" style="position: absolute; left: 0%; top: 0px;"><div class="card" ><img src="../data/petro.jpg" class="card-img-top" alt="..."><div class="card-body"><strong class="d-inline-block mb-2 text-primary">Politica</strong><h3 class="mb-0">Petro</h3><div class="mb-1 text-muted">Dec 1</div><p class="card-text mb-auto">Presindente petro tiene un viru</p><a href="#" class="stretched-link">Continue reading</a></div></div></div>'
   );
   return diseño[Math.floor(Math.random() * 2)];
}

function imagenRandom(){

    const imagenes= new Array("../data/J_1.jpg","../data/petro.jpg","../data/news.jpg","../data/aula.jpg","../data/presentacio.jpg");
    return imagenes[Math.floor(Math.random() * 5)];
}

function tituloRandom(){

    const titulo = new Array("UFPS realizó evaluación en competencias genéricas a estudiantes de pregrado",
    "UFPS da inicio a la IX Semana Internacional de Ciencia, Tecnología e Innovación",
    "Consultorio Jurídico UFPS firma convenio con la Fiscalía General");

    return titulo[Math.floor(Math.random() * 3)]

}

function categoriaRandom(){

    const categoria = new Array("politica","tecnologia","deportes","ciencia","economia","arte","educacion")

    return categoria[Math.floor(Math.random() * 7)]
}

function descripcionRandom(){

    const descripcion = new Array("La Universidad Francisco de Paula Santander a través de la Vicerrectoría Asistente de Estudios y dando cumplimiento a la Resolución 270 de 2022, realizó la primera Prueba de Seguimiento en Competencias Genéricas a 3112 estudiantes de 3°, 5° y 7° semestre de los programas académicos de pregrado modalidad presencial y a distancia.",
    "La IX Semana Internacional de Ciencia, Tecnología e Innovación que se desarrolla del 29 noviembre al 2 de diciembre de 2022, tiene como propósito la presentación de los avances en investigación y extensión de la Universidad Francisco de Paula Santander Cúcuta y seccional Ocaña, a través de los Grupos y Semilleros de investigación, además del intercambio de experiencias con investigadores del ámbito nacional e internacional.",
    "La Universidad Francisco de Paula Santander firmó convenio de cooperación interinstitucional con la Fiscalía General de la Nación, con el fin de facultar el Consultorio Jurídico UFPS en la implementación y funcionamiento de la Justicia Restaurativa en procesos penales y materializar el programa de Mediación Penal.",
    "El Gobernador del Departamento y presidente del Consejo Superior Universitario, Silvano Serrano Guerrero, formalizó la",);

    return categoria[Math.floor(Math.random() * 4)]
}

function cargarNoticia(it){
    console.log(it);
    fetch('../data/noticias.json')
    .then(res => res.json()) // el método .json() analiza la respuesta JSON en un objeto literal JS
    .then(data =>cargarNoticiaFeed(data,it))
    }

function cargarNoticiaFeed(data,it){
        var elem = document.querySelector('#feedPricipal');
        for (var i = 0; i <data.length; i++) {
            console.log(i+" "+data[i].id);
        if(it==data[i].id){
            console.log("encontro"+it)
            elem.innerHTML='<div class="col-md-12"><div class="text-center"><img src="'+
            data[i].noticia.url_imagen+'" class="img-fluid" alt="..."></div><article class="blog-post"><h2 class="blog-post-title mb-2">'+
            data[i].noticia.titulo+'</h2><p class="blog-post-meta">December 2, 2022 by <a href="#">Jhony</a></p><p class="text-xl-start">'+
            data[i].noticia.contenido+'</p></article></div>';
            var msnry = new Masonry( elem, { 
            });
            msnry.layout();
        }
        }
}


function cargadoCategorias(){

    const url = "http://localhost:8088/categoria/listar";
   
    fetch(url)
.then((resp) => resp.json())
.then(function(data) {
    var array = data;
    var elem = document.querySelector('#SelectCategoria');
    console.log(array);
    
    for (var i = 0; i <data.length; i++) {
        elem.innerHTML=elem.innerHTML+"<option value='"+array[i].id_categoria+"'>"+array[i].nombre+"</option>";
       
     }
})
.catch(function(error) {
  console.log(error);
});
    
}