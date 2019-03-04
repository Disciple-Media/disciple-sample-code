<?php

$input = fgets(STDIN);
$key = hex2bin($argv[1]);

function verify($signed_data, $key) {
    $pieces = explode('--', $signed_data);
    $data = $pieces[0];
    $digest = $pieces[1];

    if (hash_equals(hash_hmac('sha1', $data, $key), $digest)) {
        return $data;
    } else {
        return false;
    }
}

function decrypt($encrypted_data, $key) {
    $pieces = explode("--", base64_decode($encrypted_data));
    $data = $pieces[0];
    $iv = base64_decode($pieces[1], true);

    return openssl_decrypt($data, "AES-256-CBC", $key, 0, $iv);
}

function decrypt_and_verify($encrypted_data, $key) {
    $encrypted_data = verify($encrypted_data, $key);

    if ($encrypted_data) {
        return decrypt($encrypted_data, $key);
    } else {
        return false;
    }
}

print decrypt_and_verify($input, $key);
?>
