Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551022;
	b=1n3DFJrmcZYnKTj8v5iKBWGikokhUUyFB4UuQMYrOcWddTfL0nHqo2ySDujzrrxX5hhz
	 KpIFoUCreLJYCVfyFiV/Q2WOOrnqFnSGnMuWZIWjI9jGKYHnWbSivHXQ6cDJpeySWx9hf
	 Uwu2+h8HZzN64mfu7kNWRSAWdaXHsTvi6hVDdjQzzXxlm6IJHiLtWx0IA+8VtRSRt1xi0
	 6BkU20Ubt4E/ROPPmJnmTW3BQzdGsWyNINfAL+BKunYk8TTSDg7/W5227UAvsAzaV8MuI
	 Jn3qQ87Pg0MbHBLkQuj4NN+ZT3yWmbCegO0jsiv8No98QSbcF1iHnbOHUYOw0z4Y2Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=scTX0bumEv05AQNebNSsHg/mOW7TqFZSq25FZEyaOcI=;
	b=suoxfz6GWYUgi223hGbFThUye8xK920uIik4tk23VK1S8w6Ov7UaS43mYP2rtDDKjIQA
	 mdtFOzDoKT+NN/r2cnClHxn5zxMWclmDkkh8a2B6IsBTMFhno9cEPL3BWsVrl8jeXKBvW
	 tqoR4pMeTq+4GHmp7Cwcl4vv9ktM1uzV//SXBm0pmQSej4BD2pWq304cXUgXp8wYpGwVK
	 mifD7ifnTWpa2ev3aD2OMd8pIoygpDRm+wAjOVerIyz0BbDuNksaG1NABa43YiaW3Fw4f
	 CsITkskT+wZIyVUnxn0qQx9SQPcTcdQhfgNYyIMCz7qleJIrygBA+9xDfeYQyCafZzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FPkWGBpk;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ECA606A327
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 06:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83ECA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FPkWGBpk
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso2749695e9.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 22:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551020; x=1795155820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scTX0bumEv05AQNebNSsHg/mOW7TqFZSq25FZEyaOcI=;
        b=FPkWGBpk/+uXvN7d8744zAwrLdMCouM1Hpl9aCBeyVo4Fs/0Pj1xsLJvubN9r3GJXc
         1gxiErW2ve2M3VfoTM3SoKFurchZBNdkD3dgwNrN3+8YrjE0FP+fjOZM7GlZ1bUqg/6k
         ioT+xge4GPeCMFg55Dg/XJVBqL4M2zBNdc6n1XO8p5HtIy1hp+PjvgeNjv69HGQjkkbJ
         /mHRayRZBQyoMk30pBOOm5OzWKwG0HoJNS20TBTz8P7M28axuxf96ZcFMxgCU2ljVX34
         L9xI/Ibuz4YIq8MYIJU7S57SIWQ6m18ACVwlUNoGUjKSRTxEKMtSz2feydcXhA+GIH6C
         3/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551020; x=1795155820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scTX0bumEv05AQNebNSsHg/mOW7TqFZSq25FZEyaOcI=;
        b=XcXl9rDE9VSwx26ywK4a92QbjlpWKyNdaTDuzTf9fUuoUEqqh0qmpoxWxFtOAQ3Gc9
         /TVgLKF0RTSv0n1aa3itK165TsvwVcgPug/qwrK70U52bDSuvFwzriRCfnDh9EnrZgVV
         A/wAeaJNyKSO9zHbjpJUdXtiF9t3Mb64v03NBdj09+CPjH3FoTxXYogaiJVC12AxpZ6F
         4V3vN8uO4m60z+A5VC3Zf7RJ6XJivIJUZjNDaKeV4vVZdT5C1AuMOfIHv+MGG8hwS9tr
         JL0s22Ns2iM/1lO3Qzk7enTrOaOPJ841lYTJPjXzFxfORJ7PN6qasHveHYYgR/1wTsCq
         V4ZA==
X-Forwarded-Encrypted: i=1; AL+hErFnhAHDjBI443aOmzCaiuUFJ1HAnriS5YGzxdEdwKtvQAcD5mrTjqK4fYArPVhUs/PwZinXYhtM63jKQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PMA5h/5Y+slpSmE4TdCz4hcCEf06PP5iPuuUOcdzBGjB/07qu
	RU+BjQSVhwCA8lXI5A8uo8xtUZUFRC3zpCXObjWSuXMay5aVXnYMLd5JDQYqyuBu8ZM=
X-Gm-Gg: AYBFou0+yKYSFu5qt/DByT1/fCHDVNnOXoZyx0BYq9F/il0pA2vDewGRmiHEkncqLiH
	PNUHMdrq2+FPGzjjdg3STR4+T/YOTmlukcK+3Nc4fwiOkUBrg40eb7+tfOccp2lAGA1GgcFwbns
	J7bydt9w9ZTNiiGtfa8ZdZ4kKSiZed9Ab/QKgLS0uLjqjNu1xOJe6MqHP1CC7/dX3f/+e4ARB9M
	ivPid01+GRSdvKSWrZO0h25ViPz5akETKKr5xSrKWhItlOAl0BansRKoYyc9ehV1cn395TSrcr+
	DWpKYeo2Ts9iJOOPQYBKA+HaN/TQtPue5sCnd/98hbFJUc3tiCcjslj6gvUXfdNPIJbxLWnI+SN
	Zf79CLar8lb0WFzGI82srgLRa+kryseAUweI4RlM+NTZ3fp40FhFBtIECMaj0KZGSBNy9SLsTB5
	FrV4qhZZ9PZY3WQPhpB1mxjsHVkgv0izauW6Gk8rv6lAvDUdSMab6e7Nr5hosu4uZnJp5f3SZKY
	tIt5GJL3yA4oEPiw2RmxB/z4bQPE8Kbs6w15M2cO7gD8IqhPI1ozt/fr5VdLs5mHumAuEsnEs3x
	PkpeUGU8q+F3/UwkonR/uNIEu0vtQ8VeCUwsBaZYkG/MrdrAxRrOW78Ulec2ODGBkxPOmynq1/n
	u5ynh0/LL4A9KPYWhtLo=
X-Received: by 2002:a05:600c:1daa:b0:4ba:2bfc:c8ab with SMTP id 5b1f17b1804b1-4bb55a4801bmr29639465e9.15.1794551019876;
        Thu, 12 Nov 2026 22:23:39 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb56f8d054sm16744035e9.3.2026.11.12.22.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:23:37 -0800 (PST)
Date: Fri, 13 Nov 2026 07:23:36 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: dri-devel@lists.freedesktop.org, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, imagination@lists.freedesktop.org, 
	Frank Binns <frank.binns@imgtec.com>, Gabriel Gama <operatingsystemsdepression@gmail.com>, 
	Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 12/13] drm/powervr_sgx: Add the DRM driver, power
 management and debugging
Message-ID: <avajebb1alBnAm8U@monoceros>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
 <20261112-powervr-sgx-v1-12-c69b84bac011@telaak.dev>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3fovxmny7pd3sxx"
Content-Disposition: inline
In-Reply-To: <20261112-powervr-sgx-v1-12-c69b84bac011@telaak.dev>


--q3fovxmny7pd3sxx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 12/13] drm/powervr_sgx: Add the DRM driver, power
 management and debugging
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 05:59:02PM -0500, Joseph Telaak wrote:
> +static const struct pci_device_id pvrsgx_pci_ids[] =3D {
> +	{ PCI_VDEVICE(INTEL, 0x089b), 545 },	/* CE5300 family: SGX545 */

Please make this

	{ PCI_VDEVICE(INTEL, 0x089b), .driver_data =3D 545 },	/* CE5300 family: SG=
X545 */

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(pci, pvrsgx_pci_ids);
> [...]
> diff --git a/drivers/gpu/drm/powervr_sgx/pvrsgx_of.c b/drivers/gpu/drm/po=
wervr_sgx/pvrsgx_of.c
> new file mode 100644
> index 000000000..e347a3699
> --- /dev/null
> +++ b/drivers/gpu/drm/powervr_sgx/pvrsgx_of.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright =A9 2026 Joseph Telaak */
> +
> +/*
> + * An SGX on a device tree SoC (Documentation/devicetree/bindings/gpu/
> + * img,powervr-sgx.yaml). On TI parts the GPU node has no clocks or power
> + * domain of its own: its ti-sysc parent module enables both, and applie=
s the
> + * SGX interrupt quirk, when the GPU device is runtime-resumed. Every re=
gister
> + * access happens with the parent held awake.
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. of_device_id is already
provided by <linux/of.h> and also by <linux/platform_device.h> without
the useless dependencies that <linux/mod_devicetable.h> introduces.

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>

Best regards
Uwe

--q3fovxmny7pd3sxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rOQACgkQj4D7WH0S
/k653gf/auhko2qaNS4BWJKPTZ0U6dpwzMZplMcZygr/SRNkqB4rtNEr7cniJb/w
6HZVwgsx6EXyuiQ3Fznzch9R+5VAoHbqY1QrjaycWAttOem37Sm+3FGHqoG0zW8R
XSea37dwrl441qCF8WonzOU9YK8dbo2CV5Bi6SGvtf/fnaj1F3smvAws5CmtB5yq
KEPdVWFNnVGqV95nEDkgb09I3EgkCZRkYmBn3bEN+VrJRvYJOfNdGX8AkBDjog3e
D6eh7mRm1yDdkHd8zrpKf9tAAaS784qhDz6YzqobHn/DSybseU7VEV+6gsajSEWE
tJ7bUnZyLTpFf7SLsE8ghAOQ8KSLmQ==
=uMBo
-----END PGP SIGNATURE-----

--q3fovxmny7pd3sxx--
