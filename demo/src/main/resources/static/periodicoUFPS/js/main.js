var categoriasData=null;
function cargadoInicial(){

    const url = "http://localhost:8088/categoria/listar";
   
    fetch(url)
.then((resp) => resp.json())
.then(function(data) {
    var array = data;
    var elem = document.querySelector('#navCategoria');
    console.log(array);
    categoriasData=data;
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
    CKEDITOR.instances['idcontenidoNoticia'].setData('');
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
    var data = data;
    console.log(data);
    
    vaciarPecera();
        var elem = document.querySelector('#feedPricipal');
    for (var i = 0; i <data.length; i++) {
        
        var timeStamp= data[i].fecha;
        var dateFormat= new Date(timeStamp);
        const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio","Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
        var fecha= monthNames[dateFormat.getMonth()]+" "+dateFormat.getDay();
        elem.innerHTML='<div class="col-sm-6 col-lg-4 mb-4" style="position: absolute; left: 0%; top: 0px;"><div class="card" ><img src="'+data[i].url_imagen+'" class="card-img-top" alt="..."><div class="card-body"><strong class="d-inline-block mb-2 '+
        categoriasData[data[i].id_categoria-1].nombre+'">'+categoriasData[data[i].id_categoria-1].nombre+'</strong><h5 class="mb-0">'+
        split(data[i].titulo)+'</h5><div class="mb-1 text-muted">'+fecha+'</div><p class="card-text mb-auto">'+
        data[i].titulo+'</p><a href="javascript:cargarNoticia('+data[i].id+')" class="stretched-link">Leer más </a></div></div></div>'+elem.innerHTML;
    }
    
    llenarPeceraDos(data);
    var msnry = new Masonry( elem, { 
    });
    msnry.layout();
    setTimeout(() => {
        msnry.layout();
      }, 500)
   
    console.log("salioooooo");
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
    
    vaciarPecera();
        var elem = document.querySelector('#feedPricipal');
    for (var i = 0; i <data.length; i++) {
        var timeStamp= data[i].fecha;
        var dateFormat= new Date(timeStamp);
        const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio","Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
        var fecha= monthNames[dateFormat.getMonth()]+" "+dateFormat.getDay();
        elem.innerHTML='<div class="col-sm-6 col-lg-4 mb-4" style="position: absolute; left: 0%; top: 0px;"><div class="card" ><img src="'+data[i].url_imagen+'" class="card-img-top" alt="..."><div class="card-body"><strong class="d-inline-block mb-2 '+
        categoriasData[data[i].id_categoria-1].nombre+'">'+categoriasData[data[i].id_categoria-1].nombre+'</strong><h3 class="mb-0">'+
        split(data[i].titulo)+'</h3><div class="mb-1 text-muted">'+fecha+'</div><p class="card-text mb-auto">'+
        data[i].titulo+'</p><a href="javascript:cargarNoticia('+data[i].id+')" class="stretched-link">Leer más </a></div></div></div>'+elem.innerHTML;
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
        var timeStamp= data[i].fecha;
        var dateFormat= new Date(timeStamp);
        const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio","Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
        var fecha= monthNames[dateFormat.getMonth()]+" "+dateFormat.getDay();
       
        elem.innerHTML='<div class="card" style="margin-bottom: 1.5em;"><div class="card-body"><strong class="d-inline-block mb-2 '+categoriasData[data[i].id_categoria-1].nombre+'">'+categoriasData[data[i].id_categoria-1].nombre+'</strong><h5 class="card-title">'+split(data[i].titulo)+'</h5><p class="card-text">'+categoriasData[data[i].id_categoria-1].nombre+'</p><p class="card-text"><small class="text-muted">'+fecha+'</small></p><a href="javascript:cargarNoticia('+data[i].id+')" class="stretched-link">Leer más </a></div></div>'+elem.innerHTML;
    }
    
}

/*
function que limpiara el feed principal de noticias 
*/
function vaciarPeceraDos(){
    document.getElementById("feedSugerencias").innerHTML="";
    }




function cargarNoticia(it){
    console.log('http://localhost:8088/noticias/'+it);
    fetch('http://localhost:8088/noticias/'+it)
    .then(res => res.json()) // el método .json() analiza la respuesta JSON en un objeto literal JS
    .then(data =>cargarNoticiaFeed(data,it))
}

function cargarNoticiaFeed(data,it){
        var elem = document.querySelector('#feedPricipal');
        var timeStamp= data.fecha;
        var dateFormat= new Date(timeStamp);
        const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio","Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
        var fecha= monthNames[dateFormat.getMonth()]+" "+dateFormat.getDay();
       
            elem.innerHTML='<div class="col-md-12"><div class="text-center"><img src="'+
            data.url_imagen+'" class="img-fluid" alt="..."></div><article class="blog-post"><h2 class="blog-post-title mb-2">'+
            data.titulo+'</h2><p class="blog-post-meta">'+fecha+', 2022 por <a href="#">Jhony</a></p><p class="text-xl-start">'+
            data.contenido+'</p></article></div>';
            var msnry = new Masonry( elem, { 
            });
            msnry.layout();
        
        
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