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
        </div>
    </ul>
</nav>
<style>
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

    .logo {
        font-size: 32px;
    }

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
</style>