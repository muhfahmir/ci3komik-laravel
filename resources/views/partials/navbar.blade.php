 <!-- START NAVBAR -->
 <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 bg-white">
     <div class="container">
         <a class="navbar-brand" href="{{ url('/') }}">BacaBersama</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
             <form class="form-inline my-2 my-lg-0">
                 <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
             </form>
             <ul class="navbar-nav ml-auto d-flex align-items-center">
                 <li class="nav-item {{ request()->is('/') ? 'active':'' }}">
                     <a class="nav-link" href="{{ url('/') }}">Home</a>
                 </li>
                 <li class="nav-item {{ request()->is('all-comic') ? 'active' : '' }}">
                     <a class="nav-link" href="{{ url('all-comic') }}">All Komik</a>
                 </li>
                 <li class="nav-item {{ request()->is('login') ? 'active' : '' }}">
                     <a class="nav-link btn-green btn" href="{{ url('login') }}">Login</a>
                 </li>
             </ul>
         </div>
     </div>
 </nav>
 <!-- END NAVBAR -->