
review_modul = 15 # menit 
review_latihan = 5 # menit
review_penilaian = 5 # menit

estimasi_waktu_pengerjaan_per_orang = 120  

total_modul = 60 # modul
total_pelatihan = 60 # pelatihan
total_penilaian = 45 # penilaian
total_pertemuan = 15 # pertemuan

rasio_penilaian_konseptual = 1
rasio_penilaian_praktek = 2

penyusunan_modul = 30 # menit
penyusunan_latihan = 7 # menit
penyusunan_penilaian_konseptual = 10 # menit
penyusunan_penilaian_praktek = 15 # menit

# modul
total_jam_modul(){
    $penyusunan_modul * $review_modul * $total_modul
}

# function total modul per sesi 
total_modul_per_sesi () {
    $total_modul / $total_pertemuan
}

# function total jam modul reviewer
review_total_jam_modul()[
    $review_modul * $total_modul
]

# function total jam modul penyusunan
penyusunan_total_jam_modul(){
    $penyusunan_modul * $total_modul
}



# latihan
# function total jam latihan 
total_jam_latihan(){
    $penyusunan_latihan + $review_latihan * $total_pelatihan
}

# function total latihan per sesi 
total_latihan_per_sesi () {
    $total_pelatihan / $total_pertemuan
}

# function total jam latihan reviewer
review_total_jam_latihan(){
    $review_latihan * $total_pelatihan
}



#penilatian
# function total jam penilian
total_jam_penilaian(){
    $penyusunan_penilaian_konseptual + $penyusunan_penilaian_praktek + $review_penilaian * $total_penilaian
}


# function total penilaian konseptual
total_penilaian_konseptual(){

    total_ration = rasio_penilaian_konseptual + rasio_penilaian_praktek
    $rasio_penilaian_konseptual / $total_ration * $total_penialian
}

# function total penilaian praktek
total_penilaian_praktek(){
    total_ration = rasio_penilaian_konseptual + rasio_penilaian_praktek
    $rasio_penilaian_praktek / $total_ration * $total_penialian
}

# function total jam penyusunan penilaian konseptual
total_jam_penyusunan_penilaian_konseptual(){

    gibs = total_penilaian_konseptual
    $penyusunan_penilaian_konseptual * $gibs
}

# function total jam penyusunan penilaian praktek
total_jam_penyusunan_penilaian_praktek(){

    gibs = total_penilaian_praktek
    $penyusunan_penilaian_praktek * $gibs
}

# function total jam  penilaian penyusunan
penyusunan_total_jam_latihan(){
    $penyusunan_penilaian_konseptual + $penyusunan_penilaian_praktek
}

# function total jam penilaian reviewer
review_total_jam_penilaian(){
    $review_penilaian * $total_penilaian
}


# function total waktu paket konseptual
total_waktu_paket_konseptual_penyusunan(){
    $penyusunan_modul + $penyusunan_latihan + $penyusunan_penilaian_konseptual
}

# function total waktu paket praktek
total_waktu_paket_praktek_penyusunan(){
    $penyusunan_modul + $penyusunan_latihan + $penyusunan_penilaian_praktek
}


# function total waktu compiler per sesi
total_waktu_compiler_per_sesi(){

    total_module_persesi = total_modul_per_sesi
    total_waktu_module_persesi = $total_module_persesi *  $penyusunan_modul

    total_latihan_persesi = total_latihan_per_sesi 
    total_waktu_latihan_persesi = $total_latihan_persesi *  $penyusunan_latihan
    
    satuan_waktu_konseptual = total_waktu_paket_konseptual
    total_penilian_konseptual = $rasio_penilaian_konseptual * $satuan_waktu_konseptual


    satuan_waktu_praktikal = total_waktu_paket_praktek
    total_penilian_praktik = $rasio_penilaian_praktikal * $satuan_waktu_konseptual


    total_waktu_satu_sesi = $total_waktu_module_persesi +  $total_waktu_latihan_persesi + $total_penilian_praktik

}


total_waktu_compiler_per_course(){
    total_sesi = total_waktu_compiler_per_sesi
    $total_pertemuan * $total_sesi
}



