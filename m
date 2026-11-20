Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209388;
	b=2h9nrArF+BUPPrPkjzmnfnJ1/yi2GH0T8u/5znuVjymPn0j+KbzSyuuO4VR/2lhNR3eR
	 6eaXkVRJv3ejgNC23C3tzlrdEbsL7a2mJ9AU6REOcuMxHDZFs+L1TCmnvNl8Vc2V7IRUP
	 pq0wBNBGJuGxxPZx7Ye79+VKQj3S/odcqcJhEtsIfV4TeWmrKAV8GRhy9zyo+gi7JHBV9
	 hTixCVuW4NWbtul2ydyzntGHvEuGI/ux0E+hnlH1kkYwcHwumcEeBcVhe4y7eVUcR90Cj
	 LRjH5g+clxIDyuopsqc9rdgYoUcJ6weE9y9/xJ5KvM1MGisJozGeO1O+s7cxnGzst2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
	b=qnjPSlNf0mVptj+gdZFVgbFD6ZGLN8Fp0iAEqP6EWMmUvr2kdXVi3mABKYBD5vfOB6aC
	 my66Ye8O6YWz8v6mqQYbDW/rTA4grFuj1uaI97bisCHH7R+0nicw4qE5xL06Q/m6cVADF
	 tT38pAlmrrUcArqxqWv07mryLn71PPwQfLuigYiRxUEXNsdGRcoTOub6SznlS1eGHpKla
	 GcV1ZbAe2/dqyJYmwDFhLBfuV5SdHGvuTmSmPrZxDmCbj7bsptS/kcyWDbYbd+Nk6M6EV
	 KVHEsJLB60+8mLyC0oVxKrfads+6jnQITzU01fsX3KXMFxkwopm1ymkD2uvUJBxucOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0ezxby9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F48606A33C
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 21:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F48606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0ezxby9
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so12584811fa.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 13:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209384; cv=none;
        d=google.com; s=arc-20260327;
        b=TTSox+gXvF07zG4xfgDA6Boa6FfiEISInVJMa0hxadPkZQiCmMOVQPu7FoJ5omiK1M
         s4PdlPdwIfu7Khrh36oGHrPLcSyaKM26hWoNUWVwFk1UM87J+nJb5a5SrY/hbKRmWNrU
         1d9VnaPAX37EaIDYmvg5164efoYAs7Os1+bE60NYAWbfsQR7uDJFHSJZ31JuJgpgFHi8
         xh/i9rM4iRmhvBoZn6ACp/ZUSWTK6nc4fa1PU+M27p1Cjf/qcsJCmkQxmF8bugfiuWWI
         tM73BRZVY/ZpBULPq0ynf+Rs4TmkDo8i/iDHgpkorwCU4i9ZQ85vENSwrF2korgVE39X
         Nonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        fh=1mS8dTGKuxTmwO2rAyDAsYk9mjAzJVZQ6AaP61FBd4Q=;
        b=RT2WZF6qAvs6ygzHQqPPrVmWmNAe+pLQMUV4uG1dnZpCfUFY+iCPPWaTdtXp67vICP
         nbqPO/qDRlfOXLVhdUboa1xQqGxJ4Myh8viJSwmNgxiBwkEdQhNoxI4e+bTkI9x5WMIN
         N9CFZp2V8FFB84ND9V/8rADuA8ZT5cAUxLd9tqS2KIqb9lOLP/u/vhLioBVgjQZr3fq/
         pwT2+QZKA4n8/WbiqvTBC024I+wACGXl3ykVHmCRkR+dbR7gqlsp/+9z/Zq+3mXlZtve
         6z5uZYYHCQEPUYnvCmHfTOylrdwO+WS0peXFnAJ+h4FO9jzKOdyMvCJOk//O1Px1KCQi
         Pv4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209384; x=1795814184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        b=q0ezxby914XfUpGLrhzfA6E1/m4QOv5ChuIclloI+bpZwI7pSVyRELveWg3VGGlf8x
         0ah6sTes6aaFJBTBqrSDmqmK8zeRZLPStCECxFt4dPRObKQN4NTxhbUgf3PGooeUOUoB
         V5av6Vxqu1RodwnduQCs/LIC06FqUqHLGVoQtRi+YpYNQcegi2LayeGPBGDYKO6k1HUs
         6RZ1441EVAo+jHUIpmaivLDV9OyMZm0rjt2rU/q4wkvtqqvqzDkPC3MwrwPjX0KgP+16
         rLdHJKs5CsP5+/40QnppnK2xzVaxqA9fxCMguzrsuioWYq+InT3/FAxG9QpEr4OyP9Bo
         bKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209384; x=1795814184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        b=aV3ZQ/Yrkk5VuAFWehFUgxltgcwv+8raYPqL2iFpfR2KjoTB0OPKtAy5Ob5idUVHHk
         pU/qDqrdaBpREOx1GzaJbokg0t8+22YyEwYSDv2lsEBkfdJIV+tZTcpZSEQgCaKClqxl
         dP8nUGs+sJlk94zvb+WUwHNFBvZrBEFA+p2gKfZ8ElwxL8EM5OaZ66MQQLIlRKKp2FGA
         9KY2SnGLa/amWtGdmlN+F/J7Rlu20+fPo5CiW3kq0IG8lxyTp7U+8OcXHqrXfpR8nodT
         Lnf9/5mUhqEEdMk1/b/aXVvN9zW7/28lxs+j58pruevnzYhd8U8vw8jSnf8osf7Mvf2C
         g8Cg==
X-Forwarded-Encrypted: i=1; AL+hErH0gbnh7dlyvEujIfnJY43QOdL9+9muaKq1glNnhhkcjI7sw1S6J8s2vseUjFE+aFsUqST6pN1XwK7ziQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fIN6JUgQVqXbDoN77+BSf70s3pHWQBLW09LQbf7ArIeEj+rFd
	o6s+zvImsl5GUvZgP+G3lLZR/SeEKHwOH20kv0Zm+Ai4rtLuB/g8ilBMPo33ahf931kIGsWs0XG
	tke94CLn0XcTLv/tPOeVzepWM3pllsTE=
X-Gm-Gg: AZFdTZeKRHRjzJpLju/klf04OVr2HxQ4GJetI9eQ6EFNfxHcuSgFe7rmHMb0q7GFt0+
	Heh3/weI7pE3CbXWhGvg9ZVTQuBpz7Adx6zxeTeppmtzENGLkJ6Bk9lcY90ADtYEHGr6KpkDimx
	0ZMpR8xRqgBYlW1G2VpolSsPzPcHJJxbePMX4Wv1ngHovccdWOtEynWGmS3n9jzCeNMpY58sopg
	71iJx0uZfD/2XIqva3SF5r7piOByvOMCmgAQgUuq81UKIjkbCiM7ASCMDWNDml/pO3VaDdD0BLR
	THGbt/pGiuUwo6oKIGjSQNeTJ93wY7XgAHt2YI4JJHqNyYcZN/zRQG2j7KB4mZ8pMmhZSbr9xpv
	pZVR4/+JheSkkOhNAhJaXeestPDPEk/rfMLV2yhATS60dYW2nb6enJf5+ir/8gYTnvbJa/+mzyI
	EVwd1KC/ShCEIDtjIagUnrN4LW
X-Received: by 2002:a05:651c:1595:b0:3ad:f0bb:344c with SMTP id
 38308e7fff4ca-3ae7f9def47mr12754941fa.10.1795209383639; Fri, 20 Nov 2026
 13:16:23 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004121931.6746-1-festevam@gmail.com> <20261004121931.6746-2-festevam@gmail.com>
In-Reply-To: <20261004121931.6746-2-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Nov 2026 18:16:12 -0300
X-Gm-Features: Aa3M54oHDOEQ22OODjmPc2GutyOvkFljPYhxfBAHn2qECiQinM-o8DAEKa4qfsg
Message-ID: <CAOMZO5DFgk66C=+eNepzWwrNHa-t8KQ47wstPZRGW+tf548rOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: rc: Add keymap for Ruwido Z3 RC-34 remote
To: sean@mess.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Sun, Oct 4, 2026 at 9:19=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@nabladev.com>
>
> Add keymap for the Ruwido Z3 RC-34 remote control.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v2:
> - None.

A gentle ping.

>
> Changes since v1:
> - Use RC_PROTO_NECX. (Sean)
> - Use media prefix in the Subject.
>
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  .../media/rc/keymaps/rc-nec-ruwido-z3-rc34.c  | 80 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  3 files changed, 82 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
>
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps=
/Makefile
> index 38b84e34b225..525d203c0a94 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_RC_MAP) +=3D \
>                         rc-msi-tvanywhere-plus.o \
>                         rc-mygica-utv3.o \
>                         rc-nebula.o \
> +                       rc-nec-ruwido-z3-rc34.o \
>                         rc-nec-terratec-cinergy-xs.o \
>                         rc-norwood.o \
>                         rc-npgtech.o \
> diff --git a/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c b/drivers/m=
edia/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> new file mode 100644
> index 000000000000..8a090772446d
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Keytable for the Ruwido Z3 RC-34 remote
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +static struct rc_map_table nec_ruwido_z3_rc34[] =3D {
> +       /* Ruwido Z3 RC-34, NECX address 0xe310 */
> +       { 0xe3100f, KEY_POWER },
> +       { 0xe31016, KEY_MENU },
> +       { 0xe3100a, KEY_UP },
> +       { 0xe3100b, KEY_DOWN },
> +       { 0xe3100d, KEY_LEFT },
> +       { 0xe3100c, KEY_RIGHT },
> +       { 0xe31019, KEY_OK },
> +       { 0xe3106a, KEY_BACK },
> +       { 0xe31033, KEY_INFO },
> +       { 0xe31066, KEY_DISPLAYTOGGLE },
> +       { 0xe3101a, KEY_VOLUMEUP },
> +       { 0xe31010, KEY_VOLUMEDOWN },
> +       { 0xe31013, KEY_MUTE },
> +       { 0xe31032, KEY_CHANNELUP },
> +       { 0xe31031, KEY_CHANNELDOWN },
> +       { 0xe31069, KEY_HP },
> +       { 0xe31000, KEY_NUMERIC_1 },
> +       { 0xe31001, KEY_NUMERIC_2 },
> +       { 0xe31002, KEY_NUMERIC_3 },
> +       { 0xe31003, KEY_NUMERIC_4 },
> +       { 0xe31004, KEY_NUMERIC_5 },
> +       { 0xe31005, KEY_NUMERIC_6 },
> +       { 0xe31006, KEY_NUMERIC_7 },
> +       { 0xe31007, KEY_NUMERIC_8 },
> +       { 0xe31008, KEY_NUMERIC_9 },
> +       { 0xe31030, KEY_NUMERIC_0 },
> +       { 0xe31065, KEY_RED },
> +       { 0xe31063, KEY_GREEN },
> +       { 0xe31064, KEY_YELLOW },
> +       { 0xe3106b, KEY_OPTION },
> +       { 0xe31050, KEY_PLAY },
> +       { 0xe31057, KEY_REWIND },
> +       { 0xe31058, KEY_FASTFORWARD },
> +       { 0xe31060, KEY_PROG1 },
> +       { 0xe31061, KEY_PROG2 },
> +       { 0xe31062, KEY_PROG3 },
> +
> +       /* RC-34 remote volume keys */
> +       { 0x3506, KEY_VOLUMEUP },
> +       { 0x3507, KEY_VOLUMEDOWN },
> +
> +       /* McIntosh HR070 remote volume keys */
> +       { 0xca5542, KEY_VOLUMEUP },
> +       { 0xca5543, KEY_VOLUMEDOWN },
> +};
> +
> +static struct rc_map_list nec_ruwido_z3_rc34_map =3D {
> +       .map =3D {
> +               .scan     =3D nec_ruwido_z3_rc34,
> +               .size     =3D ARRAY_SIZE(nec_ruwido_z3_rc34),
> +               .rc_proto =3D RC_PROTO_NECX,
> +               .name     =3D RC_MAP_NEC_RUWIDO_Z3_RC34,
> +       }
> +};
> +
> +static int __init init_rc_map_nec_ruwido_z3_rc34(void)
> +{
> +       return rc_map_register(&nec_ruwido_z3_rc34_map);
> +}
> +
> +static void __exit exit_rc_map_nec_ruwido_z3_rc34(void)
> +{
> +       rc_map_unregister(&nec_ruwido_z3_rc34_map);
> +}
> +
> +module_init(init_rc_map_nec_ruwido_z3_rc34)
> +module_exit(exit_rc_map_nec_ruwido_z3_rc34)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Fabio Estevam <festevam@gmail.com>");
> +MODULE_DESCRIPTION("Ruwido Z3 RC-34 remote keytable");
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index f167c37179c8..290919a7247e 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -289,6 +289,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
>  #define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
>  #define RC_MAP_NEBULA                    "rc-nebula"
> +#define RC_MAP_NEC_RUWIDO_Z3_RC34        "rc-nec-ruwido-z3-rc34"
>  #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
>  #define RC_MAP_NORWOOD                   "rc-norwood"
>  #define RC_MAP_NPGTECH                   "rc-npgtech"
> --
> 2.43.0
>
