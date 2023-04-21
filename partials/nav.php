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
        <div class="menu">
            <li><a href="index.php">Home</a></li>
            <?php
            if (isset($_SESSION['username'])) {
                echo "<li><a href='login.php?logout'>Log out</a></li>";
            } else {
                echo "<li><a href='login.php'>Log in</a></li>";
            }
            ?>
            <!-- <li>
                <a href="/">Dropdown example</a>
                <ul class="dropdown">
                    <li><a href="/">Dropdown 1 </a></li>
                    <li><a href="/">Dropdown 2</a></li>
                    <li><a href="/">Dropdown 2</a></li>
                    <li><a href="/">Dropdown 3</a></li>
                    <li><a href="/">Dropdown 4</a></li>
                </ul>
            </li> -->
        </div>
    </ul>
</nav>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    a {
        text-decoration: none;
    }

    li {
        list-style: none;
    }


    /* NAVBAR STYLING STARTS */
    .navbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 20px;
        background-color: teal;
        color: #fff;
    }

    .nav-links a {
        color: #fff;
    }

    /* LOGO */
    .logo {
        font-size: 32px;
    }

    /* NAVBAR MENU */
    .menu {
        display: flex;
        gap: 1em;
        font-size: 18px;
    }

    .menu li:hover {
        background-color: #4c9e9e;
        border-radius: 5px;
        transition: 0.3s ease;
    }

    .menu li {
        padding: 5px 14px;
    }

    /* DROPDOWN MENU */
    .services {
        position: relative;
    }

    .dropdown {
        background-color: rgb(1, 139, 139);
        padding: 1em 0;
        position: absolute;
        /*WITH RESPECT TO PARENT*/
        display: none;
        border-radius: 8px;
        top: 35px;
    }

    .dropdown li+li {
        margin-top: 10px;
    }

    .dropdown li {
        padding: 0.5em 1em;
        width: 8em;
        text-align: center;
    }

    .dropdown li:hover {
        background-color: #4c9e9e;
    }

    .services:hover .dropdown {
        display: block;
    }
</style>