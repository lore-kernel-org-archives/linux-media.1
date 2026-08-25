Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6988338A706
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787691913; cv=pass; b=Of66FNOcqF/ippgLJs+oJSYeMJWnd1ejioWpl1yEK84rvEf6iUDYTlOdfxJVxkEDKQ0If/DONqXfT2PbEj/fPFeWBPYQKzwFT/UTdASBnkeliw/meUyI/IOMvP5FLL7Qv+8DX93NjNB4r/LD0VNxlr6QG5z/RkODVTCF4k1sW1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787691913; c=relaxed/simple;
	bh=tIHycO/GI6MLlaki9fgjnmTXBN6r13RpIqRLp+IZuVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdsYAuZaRT/0BMEzgvB78oQY8wXj95z46ZQYjzw0rGD0YkcDc8pElEpQ7zBs//SZH1qJ63R744IwrXsjfD34Xpw6LhQu5nN8TTecS2cME71qhccebby0EcI4lY/v3sZaLSRBThtQWRZcuhCabQL6fDog9rYtLyJojqDPaakfl+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwnvLDqs; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwnvLDqs"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b21f71613fso262621b6e.2
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 14:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787691910; cv=none;
        d=google.com; s=arc-20260327;
        b=J3c/X7rQsPscMbK24aPB6VcNxkrpa6wD4MbWrmDVIV43I90B0qyCrBztfXO8DXbBVo
         NntWHOVOcoZ2anQPF6U2jKHpU+LCORDK4LqbiqdJVxyYiIGU9BKLnT1+S6dVM9/dS3b2
         c93nx54WaeseAbme8TwxqKCA/y1KBgYw5e92Il1UbM17JHGl3JMp8M1AwJs+iaeywJfO
         nUW0/aRWNODNAkV2NI8flyDLZ3bFaDCQqljzek0rZUw2k5jothRcnf4jNuE24VLMIpB3
         edE4/Ghi7gCJuQ4YzPUbbRult2m3/HCY8xrCeArFzmwjggY4lPdrLrgQoX62ANDit+OL
         QUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DrFC6uOzO3NeHI9ggPwFw1lwVA1Ud0+9aZIxH+l/DVU=;
        fh=xjk/1bfO1+d6P1w5rFSoDozYorwQgBXpA/HxdA81jCI=;
        b=AE13gti2haPCzeBbZKdCNEwA8w00CvKjr6ifSUIi07iYCSddsvHPqXhzXWPnOIYNVY
         ixVl0DClt4qlqYPs8jte5sjyBghQHMcXvirrE460Dp1r656EEaZZlgr+zOsrlLstWYb7
         47L/yJp+MA4ftF8uEx4h412H+vWP2Sb1Whg9LvU7UGrN31ZMLN3DancL38QAhx7jQe2h
         wTUZML1aCG19FOZPAH5SJqoFHO/Z0JwXXc3T2BLabK+yN/22YNkmCITOnwlcZySxYsX2
         rnjtZhhcy2WKkQxOH6baD1PKOIXBol5iBSiSqPJ1WmfgTO7nrvlKNkvb3jJ0/AkPTP1U
         MIQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691910; x=1788296710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DrFC6uOzO3NeHI9ggPwFw1lwVA1Ud0+9aZIxH+l/DVU=;
        b=KwnvLDqsomebZYgAc81dx61hOoDQW9QOZFTUvArz5CI4po+NbhObPljHjlftDV+cn3
         E2sZOhp0NTEKWdXKzaAt3uRd+1RB8V4M9uIJvODOJxY68ku9CVCWTXzVh2d/SC1mWfZz
         jqqqva1qeDuGCPCixRGAXmQrytP4G3NtSRsmXfSFKcQVdyn+GHWpTMvs2HjIPwy84Wjb
         7Mdj6bWgjoe5qIdbIcA8vQpoqAzcRWLpKqZNZHXA9c0W304O8vlvOPq5/lsbS7sGWGUc
         duFzw9jvj/ImOrRln95DCrnY0pUFek+PmMXWD7XCpwtazrVlJnVRYWlvh4s/Ps1NaIry
         pCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691910; x=1788296710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrFC6uOzO3NeHI9ggPwFw1lwVA1Ud0+9aZIxH+l/DVU=;
        b=Nysfj6AFqCT8+y3uM6fN/MqpIjIeVlsa3g3yJnOuvMjCnZ1o3vF7ScHVCSno+3QtIE
         o4aDdGkTSjiXKNHSALC3Bdac3oQMCmGm8zqKb2OBoB1MixFJo+zoOUtceqKxPEjWlg3o
         +i3gHzp3qItQUFzOy6NrWiTmsxXmDGVxwqPeAy1nnJeURe0zMMNZ0yd+swhYBb0H+F1m
         Acx0mqIWXWpUI2klpKcayUORTUa9PP34lqWRqlVQ1chiMI4iGp912llvRCVdqGzHXWA7
         sddBg8LF9Xzjv/sTmz7pt6JDli6d5QdnmMM0N3LojclRoEBi5S7zlD/U2F6GR7L/dx+H
         hc8w==
X-Gm-Message-State: AFuF++kMB3eko34sFyKYfVRhf9VeEyKBmIYTRhYQJVQxKEeHL0waAUNF
	h1lOUDlMO9Y2YBd0LGhTa9n7eALyu6oqNGGdlGB+teSGx3buijRJcjFsNIZT/BVu1e1b8PkmJ1a
	o50s3bqDsb90+2Ot+QaLthpPAuzxPVBo=
X-Gm-Gg: AR+sD12M+LPm1FGPN1npDhCWB0x6KaUzT9/1Yr6rw6NpoQhtJ/khcDS/D0xOxSbnBpu
	u2T4EBr6/ay7lb7wGdhyrXrpzMUyJj1HHCl3LkCmfRN2m6LWSUAu/sTn8yAAwOT+ZHLNcdOHLEe
	UV+NohLIoix/q5Y/pC9a8jO7pV+iiPThYYtc4ERsPKxbHJqd9qOGTfayIuHK/kwAdpjBDvwWfgF
	o+UeT8EpRrY1bpPEnk4SGQZX9iu9gc+qkSCIGYghvhBHbtTp1u9GL+nyMy05gdgLaQ9VQ8d3mzG
	Sz3W7wmv3ZqBHwRLvfOS2ocQjQ/WsZtTcCVo4GLCrnpOiEuHsTUUDuZ7IXUwgR9fgLhcrHN0XJI
	=
X-Received: by 2002:a05:6808:1b11:b0:497:e7e2:756e with SMTP id
 5614622812f47-4b366aa6fc7mr2621143b6e.13.1787691910243; Tue, 25 Aug 2026
 14:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825203553.3725132-1-sakari.ailus@linux.intel.com> <20260825203553.3725132-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20260825203553.3725132-3-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 25 Aug 2026 23:04:51 +0200
X-Gm-Features: AcwNN1VGU9Qwk5_fHeJYNkRopBcA7EiO0dUKi7oyW0GavJGXv0cEQiH0jbLRPpg
Message-ID: <CAPybu_1J4z2Z0Xv1PyHZa2U+PFsTWPVyifJr2p8DgkQRTJm6YQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] platform/x86: int3472: Fix uninitialised variable warning
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

nits:

It would be nice to have the error message that it is fixed in the
commit message (also for 1/3)

Would you consider adding a Fixes? This patch fixes a compilation
error (with the right kernel config)

On Tue, Aug 25, 2026 at 10:36=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Fix a smatch warning about uninitialised err_msg variable, by printing th=
e
> error where it is handled.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 25 +++++++++++--------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index 6c729fcfce5d..9cd4f78875ab 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -329,7 +329,6 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>         unsigned long gpio_flags;
>         union acpi_object *obj;
>         struct gpio_desc *gpio;
> -       const char *err_msg;
>         const char *con_id;
>         int ret;
>
> @@ -375,7 +374,8 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>         case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>                 ret =3D skl_int3472_map_gpio_to_sensor(int3472, agpio, co=
n_id, gpio_flags);
>                 if (ret)
> -                       err_msg =3D "Failed to map GPIO pin to sensor\n";
> +                       dev_err_probe(int3472->dev, ret,
> +                                     "Failed to map GPIO pin to sensor\n=
");
>
>                 break;
>         case INT3472_GPIO_TYPE_CLK_ENABLE:
> @@ -387,7 +387,7 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>                 gpio =3D skl_int3472_gpiod_get_from_temp_lookup(int3472, =
agpio, con_id, gpio_flags);
>                 if (IS_ERR(gpio)) {
>                         ret =3D PTR_ERR(gpio);
> -                       err_msg =3D "Failed to get GPIO\n";
> +                       dev_err_probe(int3472->dev, ret, "Failed to get G=
PIO\n");
>                         break;
>                 }
>
> @@ -395,14 +395,16 @@ static int skl_int3472_handle_gpio_resources(struct=
 acpi_resource *ares,
>                 case INT3472_GPIO_TYPE_CLK_ENABLE:
>                         ret =3D skl_int3472_register_gpio_clock(int3472, =
gpio);
>                         if (ret)
> -                               err_msg =3D "Failed to register clock\n";
> +                               dev_err_probe(int3472->dev, ret,
> +                                             "Failed to register clock\n=
");
>
>                         break;
>                 case INT3472_GPIO_TYPE_PRIVACY_LED:
>                 case INT3472_GPIO_TYPE_STROBE:
>                         ret =3D skl_int3472_register_led(int3472, gpio, c=
on_id);
>                         if (ret)
> -                               err_msg =3D "Failed to register LED\n";
> +                               dev_err_probe(int3472->dev, ret,
> +                                             "Failed to register LED\n")=
;
>
>                         break;
>                 case INT3472_GPIO_TYPE_POWER_ENABLE:
> @@ -413,7 +415,8 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>                         ret =3D skl_int3472_register_regulator(int3472, g=
pio, enable_time_us,
>                                                              con_id, seco=
nd_sensor);
>                         if (ret)
> -                               err_msg =3D "Failed to register regulator=
\n";
> +                               dev_err_probe(int3472->dev, ret,
> +                                             "Failed to register regulat=
or\n");
>
>                         break;
>                 default: /* Never reached */
> @@ -436,11 +439,11 @@ static int skl_int3472_handle_gpio_resources(struct=
 acpi_resource *ares,
>         int3472->ngpios++;
>         ACPI_FREE(obj);
>
> -       if (ret < 0)
> -               return dev_err_probe(int3472->dev, ret, err_msg);
> -
> -       /* Tell acpi_dev_get_resources() to not make a copy of the resour=
ce */
> -       return 1;
> +       /*
> +        * Either return an error or tell acpi_dev_get_resources() to not=
 make a
> +        * copy of the resource.
> +        */
> +       return ret < 0 ? ret : 1;
>  }
>
>  int int3472_discrete_parse_crs(struct int3472_discrete_device *int3472)
> --
> 2.47.3
>
>


--=20
Ricardo Ribalda
