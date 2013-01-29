SETminton.dk
============

SETminton | IT-løsning til de danske badmintonklubber/-foreninger

Style guide
-----------

> Det kan være I er uenige, men her er mine 5 cent omkring hvordan kode skal se ud.
> ... more to come
>
> -- Mads


### HTML ###
##### Doctype #####

Vi bruger HTML 5 i alle filer.

Det betyder at alle html filer (views) skal have (hvis de selv leverer header) HTML 5 doctypen:

     <!DOCTYPE html>

##### Protokol #####

Når der loades scripts og stylesheets sker dette altid med relative protokoler.

Følgende er **forkert**:

    <script src="http://www.setminton.dk/js/jquery.js"></script>

Her vil man slette `http:` og blot have:

    <script src="//www.setminton.dk/js/jquery.js"></script>

##### UTF-8 #####

Alle filer skal være i UTF-8 (uden BOM) og vi sender `<meta charset="utf-8">` med som meta-tag.

##### Type attributter #####

`type` kan undlades på både `script`- og `link`-tags, da browsere i dag kan gætte dem.

    <link rel="stylesheet" href="//www.setminton.dk/css/bootstrap.css">

##### CDN #####

Kan javascript og css loades via andre sider, som f.eks. Google, skal dette ske.

F.eks. kan jquery hentes fra [Google CDN](https://developers.google.com/speed/libraries/devguide) (Content Delivery Network), hvilket øger hastigheden på siden, da brugerne kan have denne cached fra andre sider:

     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>

##### Egne CSS-, JS- og Billedefiler #####

Vores egne CSS-, JS- og billedefiler skal ligge i `app/assets/stylesheets`, `app/assets/javascripts` og `app/assets/images`.

