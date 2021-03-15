<!-- Nav Item - Dashboard -->
<li class="nav-item {{ request()->is('dashboard') ? 'active':'' }}">
    <a class="nav-link" href="{{ route('dashboard')}}">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span></a>
</li>

<!-- Divider -->
<hr class="sidebar-divider">

<!-- Heading -->
<div class="sidebar-heading">
    Interface
</div>

<li class="nav-item {{ request()->is('comic') ? 'active':'' }}">
    <a class="nav-link" href="{{ route('comic') }}">
        <i class="fas fa-fw fa-cog"></i>
        <span>Comics</span></a>
</li>

<li class="nav-item {{ request()->is('genre') ? 'active':'' }}">
    <a class="nav-link" href="{{ route('genre') }}">
        <i class="fas fa-fw fa-wrench"></i>
        <span>Genre</span></a>
</li>

<!-- Divider -->
<hr class="sidebar-divider">

<!-- Heading -->
<div class="sidebar-heading">
    User Account
</div>

<li class="nav-item {{ request()->is('user') ? 'active':'' }}">
    <a class="nav-link" href="{{ route('user') }}">
        <i class="fas fa-fw fa-chart-area"></i>
        <span>Users</span></a>
</li>