<nav class="navbar">
    <a href="index.php" class="logo-link">
        <div class="logo">OTDBMS</div>
    </a>
    <ul class="nav-links">
        <div class="menu">
            <li><a href="index.php">Home</a></li>
            <?php
            if (isset($_SESSION['userType']) && $_SESSION['userType'] == 'Admin') {
                echo "<li><a href='students.php'>Students</a></li>";
                echo "<li><a href='programs.php'>Overseas programs</a></li>";
                echo "<li><a href='records.php'>Travel records</a></li>";
            }
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
    .logo-link {
        color: #fff;
        text-decoration: none;
    }

    .logo-link:hover {
        background-color: #4c9e9e;
        border-radius: 5px;
        transition: 0.3s ease;
    }

    .logo {
        font-size: 32px;
        font-weight: bold;
        letter-spacing: 2px;
    }

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
        text-decoration: none;
        font-weight: bold;
    }

    .menu {
        display: flex;
        gap: 1em;
        font-size: 18px;
    }

    .menu li {
        padding: 0.3em 0.7em;
    }

    .menu li:hover {
        background-color: #4c9e9e;
        border-radius: 5px;
        transition: 0.3s ease;
    }
</style>