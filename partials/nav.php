<!-- <nav>
    <ul>
        <li><a href="index.php">Home</a></li>
        <?php
        if (isset($_SESSION['username'])) {
            echo "<li><a href='login.php?logout'>Log out</a></li>";
        } else {
            echo "<li><a href='login.php'>Log in</a></li>";
        }
        ?>
    </ul>
</nav> -->

<nav class="navbar">
    <div class="logo">OTDBMS</div>
    <ul class="nav-links">
        <!-- USING CHECKBOX HACK -->
        <input type="checkbox" id="checkbox_toggle" />
        <label for="checkbox_toggle" class="hamburger">&#9776;</label>

        <!-- NAVIGATION MENUS -->
        <div class="menu">

            <li><a href="/">Home</a></li>
            <li><a href="/">Login</a></li>

            <li class="services">
                <a href="/">Services</a>

                <!-- DROPDOWN MENU -->
                <ul class="dropdown">
                    <li><a href="/">Dropdown 1 </a></li>
                    <li><a href="/">Dropdown 2</a></li>
                    <li><a href="/">Dropdown 2</a></li>
                    <li><a href="/">Dropdown 3</a></li>
                    <li><a href="/">Dropdown 4</a></li>
                </ul>
            </li>

            <li><a href="/">Pricing</a></li>
            <li><a href="/">Contact</a></li>
        </div>
    </ul>
</nav>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: cursive;
    }

    a {
        text-decoration: none;
    }

    li {
        list-style: none;
    }
</style>