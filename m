Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118689;
	b=oTLfdWOTrETvMOZ7hgL3rLz+fh2pjPKF13HQIrg+ke85sLBQy7Dd6eD9Vu4OlAkh+Agp
	 HWF+6/CWPOfU0I1F6YKZ3d9+onBszcq04BWHdXap/+t9tSYsVbSPMsG17IJ5df154HdYJ
	 SDZp5zIKJU6J9kPIaQ1D+ACU7rVo4Pa+TlfDlyvioUDNTNn4IWT8s6SwZH58VZgjH7f+E
	 oE20wfym3T2XwvR7sFX11nzrl+mw7Sa2F12RUDlGCUuZ2PU7bJ3uD5fw3w3aUrH4wFPU0
	 MTy+20IeLV6gWW0F4BaUSiThhxQ/V+qN7ZaV2ez26mAXvg4evHQKxTNh21pccIN2IKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=Q14BaH4YWpZ1CMH/OeX/X6O3rC8BtXsm7PEVpfcrbpk=;
	b=0arxOZR6K6L40MKwO+OLXJemhkp/m9nn60+uX0EU1Lj6BNjgO0BhLLThX5qHbKMPSMJx
	 /cQlQBIzyACzO1n/pCPRLA+S+e6zB7q97BIfugIZCKuoeXG7QihlCtHCWIApOZl8GOYC8
	 A/kZqIU5JXqx8YyoMFpGOw41EBp4pL+GcifV1pq+WX/4I+uZRbNMf9kCix7a5lXWce6Z/
	 7gGUfeXGlsWSp/r6BBOfTjU9241K45mTiLgklmNhUe7D2FkatHGrztDzZIuSljpE6QYfR
	 /db5tF1lJYauP6rAFBxlFLEFQ/vIg/2BBLl8fBKf4LecWers/1ID5tOx5vf7ssRzYuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TpGQ+4NK;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D0606A32A
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 20:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D39D0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TpGQ+4NK
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53669f7b518so1882171cf.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 12:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795118687; x=1795723487; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q14BaH4YWpZ1CMH/OeX/X6O3rC8BtXsm7PEVpfcrbpk=;
        b=TpGQ+4NKLDXm7JKIrO1uAL0u3hIlrUP5ngM4xTeUvBr4FRyoOy8xZnncNh/6JihHxk
         bPu3SCd4KoCQkaLReh6zjuYWH93dArxhO0JlOiIrEM5oQp4SGc1cjPudtYyIRuDI2kg6
         TLkmY7RiMLqjwDNT8AZr8ZIS7phFjyFl0PQTQjdIPdpvAzw1/i81uIQaPj7nM3ET45rO
         CYreCZH3FnWEhqghxoqlnMkVsyZsLOhpVnJ5wpU2S0ajhZQXGTNoH7+46whgIJlwYKnL
         6YWKAsxfCOGwz6mbvd+HWwjcDErphArBPmURMYwhVjVIV5XSzbQd8/0BQObDHaR/vgKi
         kBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118687; x=1795723487;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q14BaH4YWpZ1CMH/OeX/X6O3rC8BtXsm7PEVpfcrbpk=;
        b=1PdUFNF4tqr3QUThGGjyoajO5QaJEOgRZxgBzjiLF3+mRDa/++b7BjwsDr9XZCcGS8
         WQjJsMlpOgQWsDKetkJI1+ESGHcUaQ6L+oLDZfVpJ1dBIHMvjRGhJcIOfIXvKYKJrGTH
         bpW0o4pkp9pEqp+1OGq44VAQTeRw3WqJ0Vo/tEEcU7LvDVWg5dnREnkwkZU0toVt75jj
         xaytDdCByllSBzMrHFVsWKso0HrXyBBj6/d6+j/K37CKJaAYGwjEPLZllA2EN3HpfNx0
         qoyxG+5oBNOpWPLItkuNZ/5mAwClFhD5yzPcZISHH9nHzrAKEubOr55ctU8msZ7qCVYk
         AGkg==
X-Forwarded-Encrypted: i=1; AL+hErEdv79M9HjoEYeD3bnGEnURCcYlwOXdg51HmU7Z0SkjiUbiklFWpq1H7pf3GTtVznXXqxqWnd4CVtXDYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z80R1Ekq12IYyk5kB9PfyCQvMq8j+EwHRXcc57r0xAX9aL5ynfg
	q76RX0tjAUGtxzBmxMWRiGNYFh4HzYOLOeReJbrqPieNm5hvCqQBB+xww0971Oxxyso=
X-Gm-Gg: AYBFou0TwtdpJeqLSIrkMOrCyzoKd3aDFBYcV6TsC4kloomQGxxs4p4NlJDK4ZeRIkn
	biaLg92Dah165rLuLiMpCi8qN+yKuefY1V4Z0XvEwWNIa1uPZpGk5YCcypT0v0YnoGpXxmBBMYh
	pnsu9R0d16y/qxIVZQrl2MlTaDvU7EudsLUhe6AaeK3BNXprbgYynzoFWQ2z1lzOpGtob6XkoQU
	ozTuom0/oiT10y2Pl7mqsg73zqy45B4w+euRIciP90SwijNS+9HXK5d/TprcGQqvzZq1Os75Nfu
	23HmT4njA2M61eK4JQTTAvmX90KInG6bmQ9Rw9elI3Zs44poiF4iSZdRdHBL8QvOIV4DeBBOOws
	iI9qsMQSSwtprbEC8JugQdpaSIsfIbnSRnD34F3hhU6LD5FabNnPLDcG3PZd8gfqcBUFfXNgKbo
	pv4vKoAiZTAjFIYqvalDwPY3iEy65pZFlAhnZKJraYHyuM3gp3RZlWo+pCLYJ05f+kgJldIvNHH
	7r4/oQ9Hb6IvctO4GUkmVwcGzFynpWrPRAXnlaZwo+y1Ja30W1IhQfj1Q55gTAcIjKLpBAIdAx7
	PNVbh2qTNPj+krL6RQQTtc/raNKfAdrl1iuWEA952eMf7ok+oXfZOMU=
X-Received: by 2002:a05:622a:613:b0:535:9686:b9e9 with SMTP id d75a77b69052e-55d7693bd69mr19037791cf.11.1795118686443;
        Thu, 19 Nov 2026 12:04:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882ea2dsm3925891cf.15.2026.11.19.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:04:45 -0800 (PST)
Message-ID: <8ad5ec8847859937aef900a09ae8b3eddaa15464.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 15:04:43 -0500
In-Reply-To: <20261119153758.1426673-3-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-3-charvi.mehta@arm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-77/Ca/PVjYZGlYteOTS6"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-77/Ca/PVjYZGlYteOTS6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> In preparation for adding H.264 video decode support, add the platform
> driver for Arm Mali-VPU.
>=20
> Add probe and remove operations to acquire and manage the MMIO region,
> interrupt, clocks and reset controls. Add the variant data for Mali-V76
> and validate the hardware product ID during probe.
>=20
> Restrict the driver to little-endian kernels, as the firmware interface
> uses little-endian shared memory structures accessed in native-byte order=
.
>=20
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> ---
>  drivers/media/platform/arm/Kconfig            |   1 +
>  drivers/media/platform/arm/Makefile           |   1 +
>  drivers/media/platform/arm/mali-vpu/Kconfig   |  14 ++
>  drivers/media/platform/arm/mali-vpu/Makefile  |   6 +
>  .../platform/arm/mali-vpu/mali-vpu-device.h   |  38 ++++
>  .../platform/arm/mali-vpu/mali-vpu-probe.c    | 215 ++++++++++++++++++
>  .../arm/mali-vpu/mali-vpu-registers.h         |  24 ++
>  .../arm/mali-vpu/mali-vpu-variant-v76.c       |  21 ++
>  .../platform/arm/mali-vpu/mali-vpu-variant.h  |  25 ++
>  9 files changed, 345 insertions(+)
>  create mode 100644 drivers/media/platform/arm/mali-vpu/Kconfig
>  create mode 100644 drivers/media/platform/arm/mali-vpu/Makefile
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-register=
s.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-variant-=
v76.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-variant.=
h
>=20
> diff --git a/drivers/media/platform/arm/Kconfig b/drivers/media/platform/=
arm/Kconfig
> index 4f0764c329c74..339969d0ef4ce 100644
> --- a/drivers/media/platform/arm/Kconfig
> +++ b/drivers/media/platform/arm/Kconfig
> @@ -3,3 +3,4 @@
>  comment "ARM media platform drivers"
> =20
>  source "drivers/media/platform/arm/mali-c55/Kconfig"
> +source "drivers/media/platform/arm/mali-vpu/Kconfig"
> diff --git a/drivers/media/platform/arm/Makefile b/drivers/media/platform=
/arm/Makefile
> index 8cc4918725efa..3c38ad267e59a 100644
> --- a/drivers/media/platform/arm/Makefile
> +++ b/drivers/media/platform/arm/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y +=3D mali-c55/
> +obj-y +=3D mali-vpu/
> diff --git a/drivers/media/platform/arm/mali-vpu/Kconfig b/drivers/media/=
platform/arm/mali-vpu/Kconfig
> new file mode 100644
> index 0000000000000..86403d7f424f9
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_MALI_VPU
> +=09tristate "ARM Mali VPU driver"
> +=09depends on VIDEO_DEV
> +=09depends on !CPU_BIG_ENDIAN
> +=09help
> +=09  Enable this to support Arm's Mali Video hardware accelerator.
> +=09  This is a V4L2 driver.
> +
> +=09  Only little-endian kernels are supported. The firmware interface
> +=09  uses little-endian shared-memory structures.
> +
> +=09  To compile this driver as a module, choose M here: the module
> +=09  will be called mali-vpu.
> diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media=
/platform/arm/mali-vpu/Makefile
> new file mode 100644
> index 0000000000000..22acf82e99a88
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +mali-vpu-objs :=3D mali-vpu-probe.o \
> +=09=09mali-vpu-variant-v76.o
> +
> +obj-$(CONFIG_VIDEO_MALI_VPU) +=3D mali-vpu.o
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h b/driv=
ers/media/platform/arm/mali-vpu/mali-vpu-device.h
> new file mode 100644
> index 0000000000000..04160090e64df
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_DEVICE_H__
> +#define __MALI_VPU_DEVICE_H__
> +
> +#include <linux/device.h>
> +
> +struct clk_bulk_data;
> +struct mali_vpu_variant;
> +struct reset_control_bulk_data;
> +
> +/**
> + * struct mali_vpu_dev - Mali VPU device
> + * @dev: Reference to device structure.
> + * @regs_base: MMIO base address for VPU registers.
> + * @clk_list: List of VPU clocks.
> + * @clk_count: Number of clocks in @clk_list.
> + * @rst_list: List of reset controls.
> + * @rst_count: Number of reset controls in @rst_list.
> + * @irq: IRQ number for VPU.
> + * @variant: Structure describing variant-specific features and capabili=
ties.
> + */
> +struct mali_vpu_dev {
> +=09struct device=09=09=09*dev;
> +=09void __iomem=09=09=09*regs_base;
> +=09struct clk_bulk_data=09=09*clk_list;
> +=09unsigned int=09=09=09clk_count;
> +=09struct reset_control_bulk_data=09*rst_list;
> +=09unsigned int=09=09=09rst_count;
> +=09int=09=09=09=09irq;
> +
> +=09const struct mali_vpu_variant=09*variant;
> +};
> +
> +#endif /* __MALI_VPU_DEVICE_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drive=
rs/media/platform/arm/mali-vpu/mali-vpu-probe.c
> new file mode 100644
> index 0000000000000..49ecd6ac4554c
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include "mali-vpu-device.h"
> +#include "mali-vpu-registers.h"
> +#include "mali-vpu-variant.h"
> +
> +/* VPU register access helpers */
> +static u32 mali_vpu_read_reg(void __iomem *regs_base, u32 off)
> +{
> +=09return readl(regs_base + off);

That wrapper does nothing other then increasing the code length. Why not ta=
ke a
vpu_dev as parameter?

You're chosen namespace is also very long, worth considering, but not stric=
tly a
problem.

> +}
> +
> +static void mali_vpu_read_version(struct mali_vpu_dev *vpu_dev, u32 *pro=
duct_id, u32 *rev,
> +=09=09=09=09  u32 *patch)
> +{
> +=09u32 pid_prefix, pid_suffix;
> +
> +=09u32 hwver =3D mali_vpu_read_reg(vpu_dev->regs_base, MALI_VPU_REG_VERS=
ION);
> +
> +=09pid_prefix =3D FIELD_GET(MALI_VPU_VERSION_PRODUCT_ID_MASK, hwver);
> +=09pid_suffix =3D FIELD_GET(MALI_VPU_PID_SUFFIX_MASK, hwver);
> +
> +=09*product_id=09=3D (pid_prefix << 4) | pid_suffix;
> +=09*rev=09=09=3D FIELD_GET(MALI_VPU_VERSION_REVISION_MASK, hwver);
> +=09*patch=09=09=3D FIELD_GET(MALI_VPU_VERSION_PATCH_MASK, hwver);
> +}
> +
> +static int mali_vpu_get_clocks(struct mali_vpu_dev *vpu_dev)
> +{
> +=09int ret;
> +
> +=09ret =3D devm_clk_bulk_get_all(vpu_dev->dev, &vpu_dev->clk_list);
> +=09if (ret < 0)
> +=09=09return dev_err_probe(vpu_dev->dev, ret, "failed to get clocks\n");
> +=09if (!ret)
> +=09=09return dev_err_probe(vpu_dev->dev, -EINVAL, "no clocks found\n");

I don't think the second check is required, that would mean you have zero c=
lock
in your DT, which is invalid according to your binding.

> +
> +=09vpu_dev->clk_count =3D ret;
> +
> +=09return 0;
> +}
> +
> +static int mali_vpu_get_resets(struct mali_vpu_dev *vpu_dev)
> +{
> +=09unsigned int i;
> +=09int ret;
> +
> +=09vpu_dev->rst_count =3D vpu_dev->variant->num_rsts;
> +=09if (vpu_dev->rst_count =3D=3D 0)
> +=09=09return 0;
> +
> +=09vpu_dev->rst_list =3D devm_kcalloc(vpu_dev->dev, vpu_dev->rst_count,
> +=09=09=09=09=09 sizeof(*vpu_dev->rst_list), GFP_KERNEL);
> +=09if (!vpu_dev->rst_list)
> +=09=09return -ENOMEM;
> +
> +=09for (i =3D 0; i < vpu_dev->rst_count; i++)
> +=09=09vpu_dev->rst_list[i].id =3D vpu_dev->variant->rst_names[i];
> +
> +=09ret =3D devm_reset_control_bulk_get_optional_exclusive(vpu_dev->dev,
> +=09=09=09=09=09=09=09     vpu_dev->rst_count,
> +=09=09=09=09=09=09=09     vpu_dev->rst_list);
> +=09if (ret)
> +=09=09return dev_err_probe(vpu_dev->dev, ret, "failed to get reset contr=
ols\n");
> +
> +=09return 0;
> +}
> +
> +static int mali_vpu_enable_clk(struct mali_vpu_dev *vpu_dev)
> +{
> +=09return clk_bulk_prepare_enable(vpu_dev->clk_count, vpu_dev->clk_list)=
;
> +}
> +
> +static void mali_vpu_disable_clk(struct mali_vpu_dev *vpu_dev)
> +{
> +=09clk_bulk_disable_unprepare(vpu_dev->clk_count, vpu_dev->clk_list);
> +}

The two wrapper above do nothing.

> +
> +static void mali_vpu_assert_reset(struct mali_vpu_dev *vpu_dev)
> +{
> +=09if (!vpu_dev->rst_count)
> +=09=09return;
> +
> +=09reset_control_bulk_assert(vpu_dev->rst_count, vpu_dev->rst_list);
> +}
> +
> +static int mali_vpu_deassert_reset(struct mali_vpu_dev *vpu_dev)
> +{
> +=09if (!vpu_dev->rst_count)
> +=09=09return 0;
> +
> +=09return reset_control_bulk_deassert(vpu_dev->rst_count, vpu_dev->rst_l=
ist);
> +}
> +
> +static int mali_vpu_get_resources(struct mali_vpu_dev *vpu_dev)
> +{
> +=09int ret;
> +
> +=09ret =3D mali_vpu_get_clocks(vpu_dev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return mali_vpu_get_resets(vpu_dev);
> +}
> +
> +static int mali_vpu_probe(struct platform_device *pdev)
> +{
> +=09struct mali_vpu_dev *vpu_dev;
> +=09u32 pid, rev, patch;
> +=09int ret;
> +
> +=09vpu_dev =3D devm_kzalloc(&pdev->dev, sizeof(*vpu_dev), GFP_KERNEL);
> +=09if (!vpu_dev)
> +=09=09return -ENOMEM;
> +=09vpu_dev->dev =3D &pdev->dev;
> +
> +=09vpu_dev->variant =3D of_device_get_match_data(&pdev->dev);
> +=09if (!vpu_dev->variant)
> +=09=09return -ENODEV;
> +
> +=09vpu_dev->regs_base =3D devm_platform_ioremap_resource(pdev, 0);
> +=09if (IS_ERR(vpu_dev->regs_base))
> +=09=09return PTR_ERR(vpu_dev->regs_base);
> +
> +=09ret =3D platform_get_irq(pdev, 0);
> +=09if (ret < 0)
> +=09=09return ret;
> +=09vpu_dev->irq =3D ret;
> +
> +=09ret =3D mali_vpu_get_resources(vpu_dev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D mali_vpu_enable_clk(vpu_dev);
> +=09if (ret) {
> +=09=09dev_err(vpu_dev->dev, "failed to enable core clock\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D mali_vpu_deassert_reset(vpu_dev);
> +=09if (ret) {
> +=09=09dev_err(vpu_dev->dev, "failed to deassert reset\n");
> +=09=09goto err_clk;
> +=09}

In practice the two above should be inside your PM runtime ops, not sure if
that's coming after, in which case just ignore. It best to do this early, P=
M as
after thought would be bad.

> +
> +=09mali_vpu_read_version(vpu_dev, &pid, &rev, &patch);
> +=09dev_info(&pdev->dev, "Mali VPU device product ID: %#x, revision: %#x,=
 patch: %#x\n",
> +=09=09 pid, rev, patch);
> +
> +=09if (pid !=3D vpu_dev->variant->expected_hw_pid) {
> +=09=09dev_err(vpu_dev->dev, "unexpected hardware product ID: %#x (expect=
ed %#x)\n",
> +=09=09=09pid, vpu_dev->variant->expected_hw_pid);
> +=09=09ret =3D -ENODEV;
> +=09=09goto err_rst_clk;
> +=09}

Both ways work, but you could also pick the variant based on the version
instead, and only depend on DT for the "families" (e.g. the version registe=
r
layout have changed but you still want this under the same driver).

> +
> +=09platform_set_drvdata(pdev, vpu_dev);
> +
> +=09return 0;
> +
> +err_rst_clk:
> +=09mali_vpu_assert_reset(vpu_dev);
> +err_clk:
> +=09mali_vpu_disable_clk(vpu_dev);
> +
> +=09return ret;
> +}
> +
> +static void mali_vpu_remove(struct platform_device *pdev)
> +{
> +=09struct mali_vpu_dev *vpu_dev =3D platform_get_drvdata(pdev);
> +
> +=09mali_vpu_assert_reset(vpu_dev);
> +=09mali_vpu_disable_clk(vpu_dev);
> +
> +=09platform_set_drvdata(pdev, NULL);
> +}
> +
> +static const struct of_device_id mali_vpu_dt_match[] =3D {
> +=09{
> +=09=09.compatible =3D "arm,mali-v76",
> +=09=09.data =3D &mali_vpu_v76_variant,
> +=09},
> +=09{},
> +};
> +MODULE_DEVICE_TABLE(of, mali_vpu_dt_match);
> +
> +static struct platform_driver mali_vpu_driver =3D {
> +=09.probe =3D mali_vpu_probe,
> +=09.remove =3D mali_vpu_remove,
> +=09.driver =3D {
> +=09=09.name =3D "mali-vpu",
> +=09=09.of_match_table =3D mali_vpu_dt_match,
> +=09},
> +};
> +
> +module_platform_driver(mali_vpu_driver);
> +MODULE_DESCRIPTION("Arm Mali VPU driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h b/d=
rivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
> new file mode 100644
> index 0000000000000..471a1f2412a7a
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_REGISTERS_H__
> +#define __MALI_VPU_REGISTERS_H__
> +
> +#include <linux/bits.h>
> +
> +/*
> + * Mali VPU register offsets and bitfield definitions.
> + *
> + * Offsets are relative to the VPU MMIO base.
> + */
> +#define MALI_VPU_REG_VERSION 0x00000
> +
> +/* Version register fields */
> +#define MALI_VPU_VERSION_PRODUCT_ID_MASK GENMASK(31, 16)
> +#define MALI_VPU_VERSION_REVISION_MASK   GENMASK(15, 8)
> +#define MALI_VPU_VERSION_PATCH_MASK      GENMASK(7, 0)
> +#define MALI_VPU_PID_SUFFIX_MASK         GENMASK(15, 12)
> +
> +#endif /* __MALI_VPU_REGISTERS_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b=
/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> new file mode 100644
> index 0000000000000..36509d6a1c5d5
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#include <linux/array_size.h>
> +
> +#include "mali-vpu-variant.h"
> +
> +#define MALI_VPU_HW_PID_V76 0x56627
> +
> +static const char * const mali_v76_rst_names[] =3D {
> +=09"warm",
> +};
> +
> +const struct mali_vpu_variant mali_vpu_v76_variant =3D {
> +=09.expected_hw_pid =3D MALI_VPU_HW_PID_V76,
> +
> +=09.rst_names =3D mali_v76_rst_names,
> +=09.num_rsts =3D ARRAY_SIZE(mali_v76_rst_names),
> +};
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> new file mode 100644
> index 0000000000000..dadfd686275db
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_VARIANT_H__
> +#define __MALI_VPU_VARIANT_H__
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct mali_vpu_variant - Variant-specific hardware capability descri=
ptor.
> + * @rst_names: Array of reset control names for this variant.
> + * @num_rsts: Number of reset controls for this variant.
> + * @expected_hw_pid: Expected hardware product ID read from the version =
register.
> + */
> +struct mali_vpu_variant {
> +=09const char * const *rst_names;
> +=09unsigned int num_rsts;
> +=09u32 expected_hw_pid;
> +};
> +
> +extern const struct mali_vpu_variant mali_vpu_v76_variant;
> +
> +#endif /* __MALI_VPU_VARIANT_H__ */
>=20
>=20


Nicolas

--=-77/Ca/PVjYZGlYteOTS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9WWwAKCRDZQZRRKWBy
9HSFAQC3dR8FY558bI4k7AkFIZnVrSsPsqNBimLPu0y6ccGJbwD7BJXx8SWhMg3O
mgPuuDQDu5kafUiyuUehOt65wtW2Qgc=
=0TVw
-----END PGP SIGNATURE-----

--=-77/Ca/PVjYZGlYteOTS6--
