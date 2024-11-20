<div class="card shadow mb-4 mx-auto" style="width: 50%;  ">
    <!-- /.card-header -->
    <div class="card-header py-3 d-sm-flex align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Profile</h6>
        <!-- Button trigger modal -->
        <a href="?menu=home" class="btn btn-secondary"><i class="fa fa-arrow-circle-left"></i> Kembali</a>
    </div>
    <div class="card-body">
        <div class="card mx-auto" style="width: 18rem;">
            <img src="assets/img/profil.png" class="card-img-top mx-auto my-2" alt="foto profile" style="width: 200px;">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Nama :
                    <?php echo $_SESSION['apriori_username']; ?>
                </li>
                <li class="list-group-item">Level :
                    <?php echo $_SESSION['apriori_level']; ?>
                </li>
            </ul>
        </div>
    </div>
</div>