<?php

use App\Setting;
use Illuminate\Support\Facades\Artisan;

if (!function_exists('get_item_slug')) {
    function get_item_slug()
    {
        $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_';
        $item_slug  = '';

        $item_slug_found = true;

        while ($item_slug_found) {
            for ($i = 0; $i < 11; $i++) {
                $item_slug .= $characters[mt_rand(0, 63)];
            }

            $item_exist = \App\Item::where('item_slug', $item_slug)->count();
            if (0 == $item_exist) {
                $item_slug_found = false;
            }
        }

        return $item_slug;
    }
}

if (!function_exists('site_already_installed')) {
    function site_already_installed()
    {
        return file_exists(storage_path('installed'));
    }
}

if (!function_exists('generate_symlink')) {
    function generate_symlink()
    {
        // create a storage symbolic link in public folder and website root before run installer
        $target         = storage_path('app' . DIRECTORY_SEPARATOR . 'public');
        $link           = public_path('storage');
        $blog_link      = $_SERVER["DOCUMENT_ROOT"] . DIRECTORY_SEPARATOR . 'storage';
        $public_storage = $link;
        $root_storage   = $blog_link;

        $vendor_target  = $_SERVER["DOCUMENT_ROOT"] . DIRECTORY_SEPARATOR . 'vendor';
        $vendor_link    = public_path('vendor');
        $vendor_symlink = $vendor_link;

        if (file_exists($public_storage)) {
            unlink($public_storage);
        }
        if (file_exists($root_storage)) {
            unlink($root_storage);
        }
        if (file_exists($vendor_symlink)) {
            unlink($vendor_symlink);
        }

        symlink($target, $link);
        symlink($target, $blog_link);
        symlink($vendor_target, $vendor_link);
    }
}

if (!function_exists('is_demo_mode')) {
    function is_demo_mode()
    {
        return env("DEMO_MODE", false);
    }
}

if (!function_exists('config_smtp')) {
    function config_smtp($from_name, $from_email, $smtp_host, $smtp_port, $smtp_encryption, $smtp_username, $smtp_password)
    {
        $encryption = null;
        if (Setting::SITE_SMTP_ENCRYPTION_SSL == $smtp_encryption) {
            $encryption = Setting::SITE_SMTP_ENCRYPTION_SSL_STR;
        } elseif (Setting::SITE_SMTP_ENCRYPTION_TLS == $smtp_encryption) {
            $encryption = Setting::SITE_SMTP_ENCRYPTION_TLS_STR;
        }

        config([
            'mail.host'       => $smtp_host,
            'mail.port'       => $smtp_port,
            'mail.from'       => ['address' => $from_email, 'name' => $from_name],
            'mail.encryption' => $encryption,
            'mail.username'   => $smtp_username,
            'mail.password'   => $smtp_password,
        ]);
    }
}

if (!function_exists('config_re_captcha')) {
    function config_re_captcha($recaptcha_site_key, $recaptcha_secret_key)
    {
        config([
            'recaptcha.api_site_key'   => $recaptcha_site_key,
            'recaptcha.api_secret_key' => $recaptcha_secret_key,
        ]);
    }
}

if (!function_exists('generate_website_route_cache')) {
    function generate_website_route_cache()
    {
        Artisan::call('route:cache');
    }
}

if (!function_exists('generate_website_view_cache')) {
    function generate_website_view_cache()
    {
        Artisan::call('view:cache');
    }
}

if (!function_exists('clear_website_cache')) {
    function clear_website_cache()
    {
        Artisan::call('optimize:clear');
    }
}

function generateEmailAddress($maxLenLocal = 64, $maxLenDomain = 255)
{
    $numeric       = '0123456789';
    $alphabetic    = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    $extras        = '.-_';
    $all           = $numeric . $alphabetic . $extras;
    $alphaNumeric  = $alphabetic . $numeric;
    $alphaNumericP = $alphabetic . $numeric . "-";
    $randomString  = '';

    // GENERATE 1ST 4 CHARACTERS OF THE LOCAL-PART
    for ($i = 0; $i < 4; $i++) {
        $randomString .= $alphabetic[rand(0, strlen($alphabetic) - 1)];
    }
    // GENERATE A NUMBER BETWEEN 20 & 60
    $rndNum = rand(20, $maxLenLocal - 4);

    for ($i = 0; $i < $rndNum; $i++) {
        $randomString .= $all[rand(0, strlen($all) - 1)];
    }

    // ADD AN @ SYMBOL...
    $randomString .= "@";

    // GENERATE DOMAIN NAME - INITIAL 3 CHARS:
    for ($i = 0; $i < 3; $i++) {
        $randomString .= $alphabetic[rand(0, strlen($alphabetic) - 1)];
    }

    // GENERATE A NUMBER BETWEEN 15 & $maxLenDomain-7
    $rndNum2 = rand(15, $maxLenDomain - 7);
    for ($i = 0; $i < $rndNum2; $i++) {
        $randomString .= $all[rand(0, strlen($all) - 1)];
    }
    // ADD AN DOT . SYMBOL...
    $randomString .= ".";

    // GENERATE TLD: 4
    for ($i = 0; $i < 4; $i++) {
        $randomString .= $alphaNumeric[rand(0, strlen($alphaNumeric) - 1)];
    }

    return $randomString;

}
