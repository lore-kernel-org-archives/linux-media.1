Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471893;
	b=Uee5D9IYLbvUZyfWse0haLHYTZFyClTzP96sgnsqZGdn2rTvcVk6gzPKAawDcE+x/iIp
	 KUgm4Yfq8TSB7EzKxfFDrVW/F9twLlD1sPWG7xlAha3ZVGsNiwNe5QhPD0+KBHNalZRCl
	 xHJm31Zx3VB/rrRHwZ6dF7AmC4Y7OE4Ksx+3vWELFHM225vtL6w9wo7ctDhhx0B78jaQQ
	 z5fsn4/3uGJQYWd8Sr2TZ2TvPIbO/hIdfLKrp4eJtwwVvc+sD4tpj4z1TbtMA2pVSFsbC
	 PvJKAb+WqX0LE1UG8A6c3vxcmuENXCLhsbI1bPlzmhNgYObsnJGBvywDRlH+eDeRGDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471893;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=1IpZbwCrSDTnnz+vD5AaWRCoPZya/0VFq+ccteoKvpY=;
	b=r1tUWfw61KhG1VATpef+tLKC47jdZPSeCvpYLPZ56DSg1iXmm7WwdksAtT1HDA4IxbWt
	 MkmqgpQ2fN00jWTK2ulvqCCGnri0z7d56TVp1iuH0CGEYdV5jh/fuznO5g676Cy22YBZx
	 79sCJfD8SeCTdLK/x0vuawBlO48MjWO7muX0RDkEN2svUPxNG1nq+hbaFSEDHBSsviWFq
	 /J6WRVkvF3NnwrVmVWioiPWaLvMkyUUfANmzC1k0DuHf4sHR5H58e5QO4dJ+hPj8gw7Z+
	 yb+lu49dwAA/vhRPpWs7tslXb7i7wBM00A3KwRSbNgjExgvHV+HIfLHDSafZOjeV1OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=g+g5w5pr;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F31606A31E;
	Mon, 23 Nov 2026 22:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=g+g5w5pr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795471889;
	bh=iSYDHb9AszwO32Z0seVUU/wDM/C00m/nFqPGDR4PyqY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=g+g5w5prMj2bag9P4jaGKawtEigRRYXXoAafvWZpEQ4d9A5NeoOee8AaqL4qL4pNT
	 Y9HxIqPn236eVgY3EP7C/lw327ibnTlLDPH+20T7atCR8ak8QjURiEk7i2tZQZOnLc
	 NDg4dm7ep1DIDJyckVxXIew9+7XTmnXfwGqRn9MrL8T3JywxCU8FjmeDnb0IaHwuXA
	 rMPdUG+VOWLcYaOPyQ9ywhURsOJkU7RsCX03xZqOLWdiMFbmhVC991fu7FICEf+jGL
	 UiLoMM6hsxwTd2ADnC+n4sYY+Lmb0uN9hfckqg3TyYQYfXpenmJcZBNiLpnXfBsJfV
	 DRExFXgt3KTvw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDFB517E00C4;
	Mon, 23 Nov 2026 23:11:27 +0100 (CET)
Message-ID: <dab16edaccb4872175d06e614a941a87a1bb73f6.camel@collabora.com>
Subject: Re: [PATCH v3 2/3] media: rockchip: Add IEP2 deinterlacer driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp
 Zabel	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, Alex Bee
	 <knaerzche@gmail.com>
Date: Mon, 23 Nov 2026 17:11:26 -0500
In-Reply-To: <20261120-iep2-v3-2-e94eb9f629d2@gmail.com>
References: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
	 <20261120-iep2-v3-2-e94eb9f629d2@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-V18xtdmuoaSqJyCNbDa/"
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

--=-V18xtdmuoaSqJyCNbDa/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 11:30 +0000, Arun Iyengar via B4 Relay =
a =C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> Add a V4L2 mem2mem driver for the IEP2 deinterlacer of the RK3568 and
> RK3588. The V4L2 part follows sun8i-di and Alex Bee's IEP driver.
>=20
> The hardware reads past the end of the source, so OUTPUT buffers have
> 4 KiB of tail padding.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/admin-guide/media/rockchip-iep2.rst |   32 +
>  Documentation/admin-guide/media/v4l-drivers.rst   |    1 +
>  MAINTAINERS                                       |    2 +
>  drivers/media/platform/rockchip/Kconfig           |    1 +
>  drivers/media/platform/rockchip/Makefile          |    1 +
>  drivers/media/platform/rockchip/iep2/Kconfig      |   16 +
>  drivers/media/platform/rockchip/iep2/Makefile     |    3 +
>  drivers/media/platform/rockchip/iep2/iep2-regs.h  |  191 +++
>  drivers/media/platform/rockchip/iep2/iep2.c       | 1320 +++++++++++++++=
++++++
>  drivers/media/platform/rockchip/iep2/iep2.h       |  108 ++
>  10 files changed, 1675 insertions(+)
>=20
> diff --git a/Documentation/admin-guide/media/rockchip-iep2.rst b/Document=
ation/admin-guide/media/rockchip-iep2.rst
> new file mode 100644
> index 000000000000..ee0ffe23dec2
> --- /dev/null
> +++ b/Documentation/admin-guide/media/rockchip-iep2.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Rockchip IEP2 deinterlacer driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The rockchip-iep2 driver supports the IEP2 deinterlacer of the RK3568 an=
d
> +RK3588 as a V4L2 mem2mem device. OUTPUT takes interlaced frames, CAPTURE
> +returns progressive frames in the same format. For
> +``V4L2_FIELD_INTERLACED`` the field order follows the height: bottom fie=
ld
> +first below 576 lines, top field first otherwise.
> +
> +``V4L2_CID_DEINTERLACING_MODE (menu)``
> +    The rate cannot change while a queue is streaming (``EBUSY``).
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 4
> +
> +    * - ``"Bob, Frame Rate" (0)``
> +      - One CAPTURE buffer per OUTPUT buffer. Default.
> +    * - ``"Bob, Field Rate" (1)``
> +      - Two CAPTURE buffers per OUTPUT buffer.
> +    * - ``"Motion Adaptive, Frame Rate" (2)``
> +      - Uses the previous OUTPUT buffer as reference, so at least two
> +        OUTPUT buffers are needed. One CAPTURE buffer per OUTPUT buffer.
> +    * - ``"Motion Adaptive, Field Rate" (3)``
> +      - As above, two CAPTURE buffers per OUTPUT buffer.
> +
> +The hardware reads past the end of the source image, so the OUTPUT
> +``sizeimage`` is 4 KiB larger than the image and OUTPUT buffers must be =
at
> +least that size.
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentat=
ion/admin-guide/media/v4l-drivers.rst
> index 4621eae9fa1e..3d59d5d73fd0 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -29,6 +29,7 @@ Video4Linux (V4L) driver-specific documentation
>  =09rcar-fdp1
>  =09rkcif
>  =09rkisp1
> +=09rockchip-iep2
>  =09raspberrypi-rp1-cfe
>  =09saa7134
>  =09si470x
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 74a85e1653f4..ce603dcec801 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24289,7 +24289,9 @@ ROCKCHIP IEP2 DEINTERLACER DRIVER
>  M:=09Arun Iyengar <aiyengar1990@gmail.com>
>  L:=09linux-rockchip@lists.infradead.org
>  S:=09Maintained
> +F:=09Documentation/admin-guide/media/rockchip-iep2.rst
>  F:=09Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
> +F:=09drivers/media/platform/rockchip/iep2/
> =20
>  ROCKCHIP ISP V1 DRIVER
>  M:=09Dafna Hirschfeld <dafna@fastmail.com>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/plat=
form/rockchip/Kconfig
> index ba401d32f01b..4f65bd0126de 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -2,6 +2,7 @@
> =20
>  comment "Rockchip media platform drivers"
> =20
> +source "drivers/media/platform/rockchip/iep2/Kconfig"
>  source "drivers/media/platform/rockchip/rga/Kconfig"
>  source "drivers/media/platform/rockchip/rkcif/Kconfig"
>  source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/pla=
tform/rockchip/Makefile
> index 0e0b2cbbd4bd..c385048ba347 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-y +=3D iep2/
>  obj-y +=3D rga/
>  obj-y +=3D rkcif/
>  obj-y +=3D rkisp1/
> diff --git a/drivers/media/platform/rockchip/iep2/Kconfig b/drivers/media=
/platform/rockchip/iep2/Kconfig
> new file mode 100644
> index 000000000000..de1e445b3fd8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/iep2/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_ROCKCHIP_IEP2
> +=09tristate "Rockchip IEP2 deinterlacer"
> +=09depends on V4L_MEM2MEM_DRIVERS
> +=09depends on VIDEO_DEV
> +=09depends on ARCH_ROCKCHIP || COMPILE_TEST
> +=09select VIDEOBUF2_DMA_CONTIG
> +=09select V4L2_MEM2MEM_DEV
> +=09help
> +=09  Support for the IEP2 (image enhancement processor) found in the
> +=09  Rockchip RK3568 and RK3588 SoCs. It is exposed as a V4L2 memory to
> +=09  memory device that deinterlaces NV12/NV21/NV16/NV61 frames, using
> +=09  either intra-field (bob) or motion-adaptive interpolation.
> +
> +=09  To compile this driver as a module, choose M here: the module
> +=09  will be called rockchip-iep2.
> diff --git a/drivers/media/platform/rockchip/iep2/Makefile b/drivers/medi=
a/platform/rockchip/iep2/Makefile
> new file mode 100644
> index 000000000000..f13bb799de54
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/iep2/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_VIDEO_ROCKCHIP_IEP2) +=3D rockchip-iep2.o
> +rockchip-iep2-y :=3D iep2.o
> diff --git a/drivers/media/platform/rockchip/iep2/iep2-regs.h b/drivers/m=
edia/platform/rockchip/iep2/iep2-regs.h
> new file mode 100644
> index 000000000000..cdb32ede97aa
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/iep2/iep2-regs.h
> @@ -0,0 +1,191 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR MIT */
> +/*
> + * Based on the Rockchip BSP rockchip_iep2_regs.h
> + * Copyright (c) 2020 Fuzhou Rockchip Electronics Co., Ltd
> + */
> +
> +#ifndef __ROCKCHIP_IEP2_REGS_H__
> +#define __ROCKCHIP_IEP2_REGS_H__
> +
> +#include <linux/bits.h>
> +
> +#define IEP2_FRM_START=09=09=090x0000
> +#define   IEP2_FRM_EN=09=09=09BIT(0)
> +
> +#define IEP2_CONFIG0=09=09=090x0004
> +#define   IEP2_CCLK_SRESET_P=09=09BIT(22)
> +#define   IEP2_ACLK_SRESET_P=09=09BIT(21)
> +#define   IEP2_HANDSAVE_P=09=09BIT(20)
> +#define   IEP2_RST_PROTECT_EN=09=09BIT(19)
> +#define   IEP2_DEBUG_DATA_EN=09=09BIT(16)
> +#define   IEP2_DST_YUV_SWAP(x)=09=09(((x) & 3) << 12)
> +#define   IEP2_DST_FMT(x)=09=09(((x) & 3) << 8)
> +#define   IEP2_SRC_YUV_SWAP(x)=09=09(((x) & 3) << 4)
> +#define   IEP2_SRC_FMT(x)=09=09((x) & 3)
> +
> +#define IEP2_FMT_YUV422=09=09=092
> +#define IEP2_FMT_YUV420=09=09=093
> +
> +#define IEP2_YUV_SWAP_SP_UV=09=090
> +#define IEP2_YUV_SWAP_SP_VU=09=091
> +
> +#define IEP2_WORK_MODE=09=09=090x0008
> +#define   IEP2_WORK_MODE_IEP2=09=09BIT(0)
> +#define   IEP2_WORK_MODE_MASK=09=09GENMASK(1, 0)
> +
> +#define IEP2_GATING_CTRL=09=090x0010
> +
> +#define IEP2_STATUS=09=09=090x0014
> +#define   IEP2_ARST_FINISH_DONE=09=09BIT(0)
> +
> +#define IEP2_INT_EN=09=09=090x0020
> +#define IEP2_INT_CLR=09=09=090x0024
> +#define IEP2_INT_STS=09=09=090x0028
> +#define IEP2_INT_RAW_STS=09=090x002c
> +#define   IEP2_INT_TIMEOUT=09=09BIT(5)
> +#define   IEP2_INT_BUS_ERROR=09=09BIT(4)
> +#define   IEP2_INT_OSD_MAX=09=09BIT(1)
> +#define   IEP2_INT_FRM_DONE=09=09BIT(0)
> +#define   IEP2_INT_VALID=09=09(IEP2_INT_TIMEOUT | IEP2_INT_BUS_ERROR | \
> +=09=09=09=09=09 IEP2_INT_FRM_DONE)
> +
> +/* Strides are in units of 32-bit words */
> +#define IEP2_VIR_SRC_IMG_WIDTH=09=090x0030
> +#define   IEP2_SRC_VIR_UV_STRIDE(x)=09(((x) & 0xffff) << 16)
> +#define   IEP2_SRC_VIR_Y_STRIDE(x)=09((x) & 0xffff)
> +#define IEP2_VIR_DST_IMG_WIDTH=09=090x0034
> +#define   IEP2_DST_VIR_STRIDE(x)=09((x) & 0xffff)
> +
> +#define IEP2_SRC_IMG_SIZE=09=090x0038
> +#define   IEP2_SRC_PIC_HEIGHT(x)=09(((x) & 0x7ff) << 16)
> +#define   IEP2_SRC_PIC_WIDTH(x)=09=09((x) & 0x7ff)
> +
> +#define IEP2_DIL_CONFIG0=09=090x0040
> +#define   IEP2_DIL_MV_HIST_EN=09=09BIT(17)
> +#define   IEP2_DIL_ROI_EN=09=09BIT(16)
> +#define   IEP2_DIL_COMB_EN=09=09BIT(15)
> +#define   IEP2_DIL_BLE_EN=09=09BIT(14)
> +#define   IEP2_DIL_EEDI_EN=09=09BIT(13)
> +#define   IEP2_DIL_MEMC_EN=09=09BIT(12)
> +#define   IEP2_DIL_OSD_EN=09=09BIT(11)
> +#define   IEP2_DIL_PD_EN=09=09BIT(10)
> +#define   IEP2_DIL_FF_EN=09=09BIT(9)
> +#define   IEP2_DIL_MD_PRE_EN=09=09BIT(8)
> +#define   IEP2_DIL_FIELD_ORDER(x)=09(((x) & 1) << 5)
> +#define   IEP2_DIL_OUT_MODE(x)=09=09(((x) & 1) << 4)
> +#define   IEP2_DIL_MODE(x)=09=09((x) & 0xf)
> +
> +#define IEP2_DIL_FIELD_ORDER_TB=09=090
> +#define IEP2_DIL_FIELD_ORDER_BT=09=091
> +
> +#define IEP2_DIL_OUT_MODE_LINE=09=090
> +#define IEP2_DIL_OUT_MODE_TILE=09=091
> +
> +#define IEP2_DIL_MODE_DISABLE=09=090
> +#define IEP2_DIL_MODE_I5O2=09=091
> +#define IEP2_DIL_MODE_I5O1T=09=092
> +#define IEP2_DIL_MODE_I5O1B=09=093
> +#define IEP2_DIL_MODE_I2O2=09=094
> +#define IEP2_DIL_MODE_I1O1T=09=095
> +#define IEP2_DIL_MODE_I1O1B=09=096
> +#define IEP2_DIL_MODE_PD=09=097
> +#define IEP2_DIL_MODE_BYPASS=09=098
> +#define IEP2_DIL_MODE_DECT=09=099
> +
> +#define IEP2_TIMEOUT_CFG=09=090x0050
> +#define   IEP2_TIMEOUT_CFG_EN=09=09BIT(31)
> +#define   IEP2_TIMEOUT_CFG_MAX=09=09GENMASK(25, 0)
> +
> +#define IEP2_DBG_FRM_CNT=09=090x0058
> +#define IEP2_DBG_TIMEOUT_CNT=09=090x005c
> +
> +#define IEP2_SRC_ADDR_CURY=09=090x0060
> +#define IEP2_SRC_ADDR_NXTY=09=090x0064
> +#define IEP2_SRC_ADDR_PREY=09=090x0068
> +#define IEP2_SRC_ADDR_CURUV=09=090x006c
> +#define IEP2_SRC_ADDR_CURV=09=090x0070
> +#define IEP2_SRC_ADDR_NXTUV=09=090x0074
> +#define IEP2_SRC_ADDR_NXTV=09=090x0078
> +#define IEP2_SRC_ADDR_PREUV=09=090x007c
> +#define IEP2_SRC_ADDR_PREV=09=090x0080
> +#define IEP2_SRC_ADDR_MD=09=090x0084
> +#define IEP2_SRC_ADDR_MV=09=090x0088
> +#define IEP2_ROI_ADDR=09=09=090x008c
> +#define IEP2_DST_ADDR_TOPY=09=090x00b0
> +#define IEP2_DST_ADDR_BOTY=09=090x00b4
> +#define IEP2_DST_ADDR_TOPC=09=090x00b8
> +#define IEP2_DST_ADDR_BOTC=09=090x00bc
> +#define IEP2_DST_ADDR_MD=09=090x00c0
> +#define IEP2_DST_ADDR_MV=09=090x00c4
> +
> +#define IEP2_MD_CONFIG0=09=09=090x00e0
> +#define   IEP2_MD_THETA(x)=09=09(((x) & 3) << 8)
> +#define   IEP2_MD_R(x)=09=09=09(((x) & 0xf) << 4)
> +#define   IEP2_MD_LAMBDA(x)=09=09((x) & 0xf)
> +
> +#define IEP2_DECT_CONFIG0=09=090x00e4
> +#define   IEP2_OSD_GRADV_THR(x)=09=09(((x) & 0xff) << 24)
> +#define   IEP2_OSD_GRADH_THR(x)=09=09(((x) & 0xff) << 16)
> +#define   IEP2_OSD_AREA_NUM(x)=09=09(((x) & 0xf) << 8)
> +#define   IEP2_DECT_RESI_THR(x)=09=09((x) & 0xff)
> +
> +#define IEP2_OSD_LIMIT_CONFIG=09=090x00f0
> +#define   IEP2_OSD_POS_LIMIT_NUM(x)=09(((x) & 7) << 4)
> +#define   IEP2_OSD_POS_LIMIT_EN=09=09BIT(0)
> +#define IEP2_OSD_LIMIT_AREA(i)=09=09(0x00f4 + ((i) * 4))
> +
> +#define IEP2_OSD_CONFIG0=09=090x00fc
> +#define   IEP2_OSD_LINE_NUM(x)=09=09(((x) & 0x1ff) << 16)
> +#define   IEP2_OSD_PEC_THR(x)=09=09((x) & 0x7ff)
> +
> +#define IEP2_OSD_AREA_CONF(i)=09=09(0x0100 + ((i) * 4))
> +#define IEP2_OSD_AREA_NUM_MAX=09=098
> +
> +#define IEP2_ME_CONFIG0=09=09=090x0120
> +#define   IEP2_ME_THR_OFFSET(x)=09=09(((x) & 0xff) << 16)
> +#define   IEP2_MV_SIMILAR_NUM_THR0(x)=09(((x) & 0xf) << 12)
> +#define   IEP2_MV_SIMILAR_THR(x)=09(((x) & 0xf) << 8)
> +#define   IEP2_MV_BONUS(x)=09=09(((x) & 0xf) << 4)
> +#define   IEP2_ME_PENA(x)=09=09((x) & 0xf)
> +
> +#define IEP2_ME_LIMIT_CONFIG=09=090x0124
> +#define   IEP2_MV_RIGHT_LIMIT(x)=09(((x) & 0x3f) << 8)
> +#define   IEP2_MV_LEFT_LIMIT(x)=09=09((x) & 0x3f)
> +
> +#define IEP2_MV_TRU_LIST(i)=09=09(0x0128 + ((i) * 4))
> +#define IEP2_MV_TRU_LIST_NUM=09=092
> +
> +#define IEP2_EEDI_CONFIG0=09=090x0130
> +#define   IEP2_EEDI_THR0(x)=09=09((x) & 0x1f)
> +
> +#define IEP2_BLE_CONFIG0=09=090x0134
> +#define   IEP2_BLE_BACKTOMA_NUM(x)=09((x) & 7)
> +
> +#define IEP2_COMB_CONFIG0=09=090x0138
> +#define   IEP2_COMB_CNT_THR(x)=09=09(((x) & 0xf) << 24)
> +#define   IEP2_COMB_FEATURE_THR(x)=09(((x) & 0x3f) << 16)
> +#define   IEP2_COMB_T_THR(x)=09=09(((x) & 0xff) << 8)
> +#define   IEP2_COMB_OSD_VLD(x)=09=09((x) & 0xff)
> +
> +#define IEP2_DIL_MTN_TAB(i)=09=09(0x0140 + ((i) * 4))
> +#define IEP2_DIL_MTN_TAB_NUM=09=0916
> +
> +#define IEP2_RO_PD_TCNT=09=09=090x0400
> +#define IEP2_RO_PD_BCNT=09=09=090x0404
> +#define IEP2_RO_FF_CUR_TCNT=09=090x0408
> +#define IEP2_RO_FF_CUR_BCNT=09=090x040c
> +#define IEP2_RO_FF_NXT_TCNT=09=090x0410
> +#define IEP2_RO_FF_NXT_BCNT=09=090x0414
> +#define IEP2_RO_FF_BLE_TCNT=09=090x0418
> +#define IEP2_RO_FF_BLE_BCNT=09=090x041c
> +#define IEP2_RO_FF_COMB_NZ=09=090x0420
> +#define IEP2_RO_FF_COMB_F=09=090x0424
> +#define IEP2_RO_OSD_NUM=09=09=090x0428
> +#define IEP2_RO_COMB_CNT=09=090x042c
> +#define IEP2_RO_FF_GRADT_TCNT=09=090x0430
> +#define IEP2_RO_FF_GRADT_BCNT=09=090x0434
> +#define IEP2_RO_OSD_AREA_X(i)=09=09(0x0440 + ((i) * 8))
> +#define IEP2_RO_OSD_AREA_Y(i)=09=09(0x0444 + ((i) * 8))
> +#define IEP2_RO_MV_HIST_BIN(i)=09=09(0x0480 + ((i) * 4))
> +
> +#endif /* __ROCKCHIP_IEP2_REGS_H__ */
> diff --git a/drivers/media/platform/rockchip/iep2/iep2.c b/drivers/media/=
platform/rockchip/iep2/iep2.c
> new file mode 100644
> index 000000000000..11b349dda719
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/iep2/iep2.c
> @@ -0,0 +1,1320 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Based on the Rockchip BSP mpp_iep2.c
> + * Copyright (c) 2020 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "iep2.h"
> +#include "iep2-regs.h"
> +
> +#define IEP_WATCHDOG_MS=09=09500
> +#define IEP_AUTOSUSPEND_MS=09100
> +
> +#define IEP_IRQ_IOMMU_FAULT=09BIT(31)
> +#define IEP_MAX_FOREIGN_IRQS=094
> +
> +static const struct iep_fmt iep_formats[] =3D {
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_NV12,
> +=09=09.hw_fmt =3D IEP2_FMT_YUV420,
> +=09=09.hw_swap =3D IEP2_YUV_SWAP_SP_UV,
> +=09=09.vdiv =3D 2,
> +=09}, {
> +=09=09.fourcc =3D V4L2_PIX_FMT_NV21,
> +=09=09.hw_fmt =3D IEP2_FMT_YUV420,
> +=09=09.hw_swap =3D IEP2_YUV_SWAP_SP_VU,
> +=09=09.vdiv =3D 2,
> +=09}, {
> +=09=09.fourcc =3D V4L2_PIX_FMT_NV16,
> +=09=09.hw_fmt =3D IEP2_FMT_YUV422,
> +=09=09.hw_swap =3D IEP2_YUV_SWAP_SP_UV,
> +=09=09.vdiv =3D 1,
> +=09}, {
> +=09=09.fourcc =3D V4L2_PIX_FMT_NV61,
> +=09=09.hw_fmt =3D IEP2_FMT_YUV422,
> +=09=09.hw_swap =3D IEP2_YUV_SWAP_SP_VU,
> +=09=09.vdiv =3D 1,
> +=09},
> +};
> +
> +static const u32 iep_mtn_tab[IEP2_DIL_MTN_TAB_NUM] =3D {
> +=090x00000000, 0x00000000, 0x00000000, 0x00000000,
> +=090x01010000, 0x06050302, 0x0f0d0a08, 0x1c191512,
> +=090x2b282420, 0x3634312e, 0x3d3c3a38, 0x40403f3e,
> +=090x40404040, 0x40404040, 0x40404040, 0x40404040,
> +};

What is this, can you comment on top?

> +
> +static inline void iep_write(struct iep_dev *iep, u32 reg, u32 val)
> +{
> +=09writel_relaxed(val, iep->regs + reg);
> +}
> +
> +static inline u32 iep_read(struct iep_dev *iep, u32 reg)
> +{
> +=09return readl_relaxed(iep->regs + reg);
> +}
> +
> +static inline struct iep_ctx *file_to_iep_ctx(struct file *file)
> +{
> +=09return container_of(file_to_v4l2_fh(file), struct iep_ctx, fh);
> +}
> +
> +static const struct iep_fmt *iep_find_fmt(u32 fourcc)
> +{
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(iep_formats); i++)
> +=09=09if (iep_formats[i].fourcc =3D=3D fourcc)
> +=09=09=09return &iep_formats[i];
> +
> +=09return NULL;
> +}
> +
> +static enum v4l2_field iep_buf_field(struct iep_ctx *ctx,
> +=09=09=09=09     struct vb2_v4l2_buffer *vbuf)
> +{
> +=09enum v4l2_field field =3D vbuf->field;
> +
> +=09if (field =3D=3D V4L2_FIELD_ANY)
> +=09=09field =3D ctx->src_fmt.field;
> +=09/* No video standard: bottom field first below 576 lines, as rcar_fdp=
1 */
> +=09if (field =3D=3D V4L2_FIELD_INTERLACED)
> +=09=09field =3D ctx->src_fmt.height < 576 ? V4L2_FIELD_INTERLACED_BT :
> +=09=09=09=09=09=09    V4L2_FIELD_INTERLACED_TB;
> +
> +=09return field;
> +}
> +
> +static int iep_iommu_restore(struct iep_dev *iep)
> +{
> +=09int ret;
> +
> +=09if (!iep->empty_domain)
> +=09=09return 0;
> +
> +=09/* A reset leaves the IOMMU in bypass; reattaching reprograms it */
> +=09ret =3D iommu_attach_device(iep->empty_domain, iep->dev);
> +=09if (!ret)
> +=09=09iommu_detach_device(iep->empty_domain, iep->dev);

iommu maintainer have been clear this is a hack, so we need a proper and cl=
earer
solution from here. It will probably require a new helper in the rkiommu dr=
iver.

What do you mean by "in bypass"? If this is the case for this IP, we are ta=
lking
about a pretty severe security issue.

> +
> +=09return ret;
> +}
> +
> +static void iep_reset(struct iep_dev *iep)
> +{
> +=09u32 status;
> +=09int ret;
> +
> +=09/* The shared IRQ handlers must not touch the block in reset */
> +=09disable_hardirq(iep->irq);
> +
> +=09/* The core too: after a bus-only reset it keeps the IOMMU busy */
> +=09iep_write(iep, IEP2_CONFIG0, IEP2_CCLK_SRESET_P | IEP2_ACLK_SRESET_P =
|
> +=09=09  IEP2_RST_PROTECT_EN);
> +=09ret =3D readl_relaxed_poll_timeout(iep->regs + IEP2_STATUS, status,
> +=09=09=09=09=09 status & IEP2_ARST_FINISH_DONE, 0, 100);
> +=09if (ret)
> +=09=09dev_warn(iep->dev, "soft reset timeout, using CRU reset\n");
> +=09/* Also when the last reset left the IOMMU unusable */
> +=09if ((ret || iep->iommu_lost) && iep->rstc) {
> +=09=09reset_control_assert(iep->rstc);
> +=09=09udelay(5);
> +=09=09reset_control_deassert(iep->rstc);
> +=09}
> +
> +=09ret =3D iep_iommu_restore(iep);
> +=09enable_irq(iep->irq);
> +=09if (ret)
> +=09=09dev_err_ratelimited(iep->dev, "reset failed: %d\n", ret);
> +=09iep->iommu_lost =3D ret;
> +}
> +
> +static void iep_set_src(struct iep_dev *iep, u32 y_reg, u32 uv_reg, u32 =
v_reg,
> +=09=09=09dma_addr_t addr, u32 luma_size)
> +{
> +=09iep_write(iep, y_reg, addr);
> +=09iep_write(iep, uv_reg, addr + luma_size);
> +=09iep_write(iep, v_reg, 0);
> +}
> +
> +static void iep_hw_config(struct iep_ctx *ctx, u32 mode, u32 field_order=
,
> +=09=09=09  dma_addr_t prv, dma_addr_t cur, dma_addr_t nxt,
> +=09=09=09  dma_addr_t dst_top, dma_addr_t dst_bot)
> +{
> +=09struct iep_dev *iep =3D ctx->iep;
> +=09const struct iep_fmt *fmt =3D ctx->fmt;
> +=09u32 width =3D ctx->src_fmt.width;
> +=09u32 height =3D ctx->src_fmt.height;
> +=09u32 src_stride =3D ctx->src_fmt.plane_fmt[0].bytesperline;
> +=09u32 dst_stride =3D ctx->dst_fmt.plane_fmt[0].bytesperline;
> +=09u32 src_luma =3D src_stride * height;
> +=09u32 dst_luma =3D dst_stride * height;
> +=09u32 tiles_x =3D DIV_ROUND_UP(width, IEP_TILE_W);
> +=09u32 tiles_y =3D DIV_ROUND_UP(height, IEP_TILE_H);
> +=09u32 md_lambda =3D 4;
> +=09unsigned int i;
> +=09u32 reg;
> +
> +=09iep_write(iep, IEP2_CONFIG0,
> +=09=09  IEP2_SRC_FMT(fmt->hw_fmt) | IEP2_SRC_YUV_SWAP(fmt->hw_swap) |
> +=09=09  IEP2_DST_FMT(fmt->hw_fmt) | IEP2_DST_YUV_SWAP(fmt->hw_swap) |
> +=09=09  IEP2_DEBUG_DATA_EN);
> +=09iep_write(iep, IEP2_WORK_MODE, IEP2_WORK_MODE_IEP2);
> +
> +=09iep_write(iep, IEP2_SRC_IMG_SIZE,
> +=09=09  IEP2_SRC_PIC_WIDTH(tiles_x * IEP_TILE_W - 1) |
> +=09=09  IEP2_SRC_PIC_HEIGHT(tiles_y * IEP_TILE_H - 1));
> +=09iep_write(iep, IEP2_VIR_SRC_IMG_WIDTH,
> +=09=09  IEP2_SRC_VIR_Y_STRIDE(src_stride / 4) |
> +=09=09  IEP2_SRC_VIR_UV_STRIDE(src_stride / 4));
> +=09iep_write(iep, IEP2_VIR_DST_IMG_WIDTH,
> +=09=09  IEP2_DST_VIR_STRIDE(dst_stride / 4));
> +
> +=09reg =3D IEP2_DIL_MV_HIST_EN | IEP2_DIL_COMB_EN | IEP2_DIL_BLE_EN |
> +=09      IEP2_DIL_EEDI_EN | IEP2_DIL_MEMC_EN | IEP2_DIL_OSD_EN |
> +=09      IEP2_DIL_PD_EN | IEP2_DIL_FF_EN |
> +=09      IEP2_DIL_FIELD_ORDER(field_order) |
> +=09      IEP2_DIL_OUT_MODE(IEP2_DIL_OUT_MODE_LINE) |
> +=09      IEP2_DIL_MODE(mode);
> +=09if (md_lambda < 8)
> +=09=09reg |=3D IEP2_DIL_MD_PRE_EN;

That's always true, md_lambda is 4, did you forget something?

> +=09iep_write(iep, IEP2_DIL_CONFIG0, reg);
> +
> +=09iep_set_src(iep, IEP2_SRC_ADDR_CURY, IEP2_SRC_ADDR_CURUV,
> +=09=09    IEP2_SRC_ADDR_CURV, cur, src_luma);
> +=09iep_set_src(iep, IEP2_SRC_ADDR_NXTY, IEP2_SRC_ADDR_NXTUV,
> +=09=09    IEP2_SRC_ADDR_NXTV, nxt, src_luma);
> +=09iep_set_src(iep, IEP2_SRC_ADDR_PREY, IEP2_SRC_ADDR_PREUV,
> +=09=09    IEP2_SRC_ADDR_PREV, prv, src_luma);
> +
> +=09iep_write(iep, IEP2_TIMEOUT_CFG,
> +=09=09  IEP2_TIMEOUT_CFG_EN | IEP2_TIMEOUT_CFG_MAX);
> +
> +=09iep_write(iep, IEP2_SRC_ADDR_MD, ctx->md_dma);
> +=09iep_write(iep, IEP2_SRC_ADDR_MV, ctx->mv_dma);
> +=09iep_write(iep, IEP2_DST_ADDR_MD, ctx->md_dma);
> +=09iep_write(iep, IEP2_DST_ADDR_MV, ctx->mv_dma);
> +=09iep_write(iep, IEP2_ROI_ADDR, iep->roi_dma);
> +
> +=09iep_write(iep, IEP2_DST_ADDR_TOPY, dst_top);
> +=09iep_write(iep, IEP2_DST_ADDR_TOPC, dst_top + dst_luma);
> +=09iep_write(iep, IEP2_DST_ADDR_BOTY, dst_bot);
> +=09iep_write(iep, IEP2_DST_ADDR_BOTC, dst_bot + dst_luma);
> +
> +=09iep_write(iep, IEP2_MD_CONFIG0,
> +=09=09  IEP2_MD_THETA(1) | IEP2_MD_R(6) | IEP2_MD_LAMBDA(md_lambda));
> +=09iep_write(iep, IEP2_DECT_CONFIG0,
> +=09=09  IEP2_DECT_RESI_THR(30) | IEP2_OSD_AREA_NUM(0) |
> +=09=09  IEP2_OSD_GRADH_THR(60) | IEP2_OSD_GRADV_THR(60));
> +=09iep_write(iep, IEP2_OSD_LIMIT_CONFIG, 0);
> +=09iep_write(iep, IEP2_OSD_LIMIT_AREA(0), 0);
> +=09iep_write(iep, IEP2_OSD_LIMIT_AREA(1), 0);
> +=09iep_write(iep, IEP2_OSD_CONFIG0,
> +=09=09  IEP2_OSD_PEC_THR((width * 26) >> 7) | IEP2_OSD_LINE_NUM(2));
> +=09iep_write(iep, IEP2_ME_CONFIG0,
> +=09=09  IEP2_ME_PENA(5) | IEP2_MV_BONUS(10) |
> +=09=09  IEP2_MV_SIMILAR_THR(4) | IEP2_MV_SIMILAR_NUM_THR0(4) |
> +=09=09  IEP2_ME_THR_OFFSET(20));
> +=09iep_write(iep, IEP2_ME_LIMIT_CONFIG,
> +=09=09  IEP2_MV_LEFT_LIMIT(-28) | IEP2_MV_RIGHT_LIMIT(27));
> +=09iep_write(iep, IEP2_EEDI_CONFIG0, IEP2_EEDI_THR0(12));
> +=09iep_write(iep, IEP2_BLE_CONFIG0, IEP2_BLE_BACKTOMA_NUM(1));
> +
> +=09for (i =3D 0; i < IEP2_OSD_AREA_NUM_MAX; i++)
> +=09=09iep_write(iep, IEP2_OSD_AREA_CONF(i), 0);
> +
> +=09for (i =3D 0; i < IEP2_DIL_MTN_TAB_NUM; i++)
> +=09=09iep_write(iep, IEP2_DIL_MTN_TAB(i), iep_mtn_tab[i]);
> +
> +=09for (i =3D 0; i < IEP2_MV_TRU_LIST_NUM; i++)
> +=09=09iep_write(iep, IEP2_MV_TRU_LIST(i), 0);
> +
> +=09iep_write(iep, IEP2_COMB_CONFIG0,
> +=09=09  IEP2_COMB_OSD_VLD(0xff) | IEP2_COMB_T_THR(4) |
> +=09=09  IEP2_COMB_FEATURE_THR(16) | IEP2_COMB_CNT_THR(0));
> +
> +=09iep_write(iep, IEP2_INT_EN,
> +=09=09  IEP2_INT_FRM_DONE | IEP2_INT_OSD_MAX |
> +=09=09  IEP2_INT_BUS_ERROR | IEP2_INT_TIMEOUT);
> +}
> +
> +static void iep_pm_put(struct iep_dev *iep)
> +{
> +=09/* A power cycle of the domain restores a lost IOMMU: don't wait */
> +=09if (iep->iommu_lost)
> +=09=09pm_runtime_put_sync_suspend(iep->dev);
> +=09else
> +=09=09pm_runtime_put_autosuspend(iep->dev);

Looks like more hack.

> +}
> +
> +static void iep_job_done(struct iep_ctx *ctx, enum vb2_buffer_state stat=
e)
> +{
> +=09struct iep_dev *iep =3D ctx->iep;
> +=09struct vb2_v4l2_buffer *src =3D ctx->job_src;
> +=09unsigned int i;
> +
> +=09/* OUTPUT before CAPTURE, as v4l2_m2m_buf_done_and_job_finish() */
> +=09if (ctx->prev) {
> +=09=09v4l2_m2m_buf_done(ctx->prev, VB2_BUF_STATE_DONE);
> +=09=09ctx->prev =3D NULL;
> +=09}
> +
> +=09if (src) {
> +=09=09if (ctx->job_keep_src && state =3D=3D VB2_BUF_STATE_DONE)
> +=09=09=09ctx->prev =3D src;
> +=09=09else
> +=09=09=09v4l2_m2m_buf_done(src, state);
> +=09}
> +=09ctx->job_keep_src =3D false;
> +=09ctx->job_src =3D NULL;
> +
> +=09for (i =3D 0; i < ctx->job_ndst; i++) {
> +=09=09v4l2_m2m_buf_done(ctx->job_dst[i], state);
> +=09=09ctx->job_dst[i] =3D NULL;
> +=09}
> +=09ctx->job_ndst =3D 0;
> +
> +=09iep_pm_put(iep);
> +=09v4l2_m2m_job_finish(iep->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
> +static void iep_fail_job(struct iep_ctx *ctx)
> +{
> +=09unsigned int i, ndst =3D READ_ONCE(ctx->field_rate) ? 2 : 1;
> +=09struct vb2_v4l2_buffer *buf;
> +
> +=09if (ctx->prev) {
> +=09=09v4l2_m2m_buf_done(ctx->prev, VB2_BUF_STATE_DONE);
> +=09=09ctx->prev =3D NULL;
> +=09}
> +
> +=09buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +=09if (buf)
> +=09=09v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
> +
> +=09for (i =3D 0; i < ndst; i++) {
> +=09=09buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +=09=09if (buf)
> +=09=09=09v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
> +=09}
> +
> +=09v4l2_m2m_job_finish(ctx->iep->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
> +static void iep_set_dst_meta(struct iep_ctx *ctx, struct vb2_v4l2_buffer=
 *src,
> +=09=09=09     struct vb2_v4l2_buffer *dst)
> +{
> +=09v4l2_m2m_buf_copy_metadata(src, dst);
> +=09dst->field =3D V4L2_FIELD_NONE;
> +=09dst->sequence =3D ctx->cap_sequence++;
> +=09vb2_set_plane_payload(&dst->vb2_buf, 0,
> +=09=09=09      ctx->dst_fmt.plane_fmt[0].sizeimage);
> +}
> +
> +static void iep_device_run(void *priv)
> +{
> +=09struct iep_ctx *ctx =3D priv;
> +=09struct iep_dev *iep =3D ctx->iep;
> +=09struct vb2_v4l2_buffer *src, *dst0, *dst1 =3D NULL;
> +=09dma_addr_t src_addr, prv_addr, dst_top, dst_bot;
> +=09enum v4l2_field field;
> +=09bool motion_adaptive =3D READ_ONCE(ctx->motion_adaptive);
> +=09bool field_rate =3D READ_ONCE(ctx->field_rate);
> +=09bool bff, first_frame;
> +=09unsigned long flags;
> +=09u32 mode;
> +=09int ret;
> +
> +=09ret =3D pm_runtime_resume_and_get(iep->dev);
> +=09if (ret < 0) {
> +=09=09dev_err(iep->dev, "failed to resume: %d\n", ret);
> +=09=09iep_fail_job(ctx);
> +=09=09return;
> +=09}
> +
> +=09/* No DMA while the IOMMU may be in bypass */
> +=09if (iep->iommu_lost)
> +=09=09iep_reset(iep);
> +=09if (iep->iommu_lost) {
> +=09=09iep_pm_put(iep);
> +=09=09iep_fail_job(ctx);
> +=09=09return;
> +=09}
> +
> +=09if (field_rate && v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx) < 2)
> +=09=09field_rate =3D false;
> +
> +=09src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +=09dst0 =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +=09field =3D iep_buf_field(ctx, src);
> +=09bff =3D field =3D=3D V4L2_FIELD_INTERLACED_BT;
> +=09first_frame =3D !ctx->prev;
> +
> +=09src->sequence =3D ctx->out_sequence++;
> +=09src_addr =3D vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0);
> +=09prv_addr =3D ctx->prev ?
> +=09=09   vb2_dma_contig_plane_dma_addr(&ctx->prev->vb2_buf, 0) :
> +=09=09   src_addr;
> +
> +=09if (field =3D=3D V4L2_FIELD_NONE) {
> +=09=09mode =3D IEP2_DIL_MODE_BYPASS;
> +=09=09field_rate =3D false;
> +=09} else if (!motion_adaptive || first_frame) {
> +=09=09if (field_rate)
> +=09=09=09mode =3D IEP2_DIL_MODE_I2O2;
> +=09=09else
> +=09=09=09mode =3D bff ? IEP2_DIL_MODE_I1O1B : IEP2_DIL_MODE_I1O1T;
> +=09} else {
> +=09=09if (field_rate)
> +=09=09=09mode =3D IEP2_DIL_MODE_I5O2;
> +=09=09else
> +=09=09=09mode =3D bff ? IEP2_DIL_MODE_I5O1B : IEP2_DIL_MODE_I5O1T;
> +=09}
> +
> +=09ctx->job_src =3D src;
> +=09ctx->job_dst[0] =3D dst0;
> +=09ctx->job_ndst =3D 1;
> +=09ctx->job_keep_src =3D field !=3D V4L2_FIELD_NONE && motion_adaptive;
> +
> +=09if (field_rate) {
> +=09=09dst1 =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +=09=09ctx->job_dst[1] =3D dst1;
> +=09=09ctx->job_ndst =3D 2;
> +=09}
> +
> +=09iep_set_dst_meta(ctx, src, dst0);
> +=09if (dst1)
> +=09=09iep_set_dst_meta(ctx, src, dst1);
> +
> +=09dst_top =3D vb2_dma_contig_plane_dma_addr(&dst0->vb2_buf, 0);
> +=09dst_bot =3D dst_top;
> +=09if (dst1) {
> +=09=09if (bff)
> +=09=09=09dst_top =3D vb2_dma_contig_plane_dma_addr(&dst1->vb2_buf, 0);
> +=09=09else
> +=09=09=09dst_bot =3D vb2_dma_contig_plane_dma_addr(&dst1->vb2_buf, 0);
> +=09}
> +
> +=09/* No look-ahead: the current frame is also the next one */
> +=09dev_dbg(iep->dev,
> +=09=09"mode %u order %u src %pad prv %pad dst %pad %pad\n", mode, bff,
> +=09=09&src_addr, &prv_addr, &dst_top, &dst_bot);
> +
> +=09/* Left over from a reset or an aborted job */
> +=09iep_write(iep, IEP2_INT_CLR, 0xffffffff);
> +=09iep_hw_config(ctx, mode,
> +=09=09      bff ? IEP2_DIL_FIELD_ORDER_BT : IEP2_DIL_FIELD_ORDER_TB,
> +=09=09      prv_addr, src_addr, src_addr, dst_top, dst_bot);
> +
> +=09spin_lock_irqsave(&iep->irq_lock, flags);
> +=09iep->busy =3D true;
> +=09iep->irq_status =3D 0;
> +=09iep->foreign_irqs =3D 0;
> +=09schedule_delayed_work(&iep->watchdog_work,
> +=09=09=09      msecs_to_jiffies(IEP_WATCHDOG_MS));
> +=09writel(IEP2_FRM_EN, iep->regs + IEP2_FRM_START);
> +=09spin_unlock_irqrestore(&iep->irq_lock, flags);
> +}
> +
> +static int iep_job_ready(void *priv)
> +{
> +=09struct iep_ctx *ctx =3D priv;
> +=09unsigned int ndst =3D READ_ONCE(ctx->field_rate) ? 2 : 1;
> +
> +=09return v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) >=3D 1 &&
> +=09       v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx) >=3D ndst;
> +}
> +
> +static const struct v4l2_m2m_ops iep_m2m_ops =3D {
> +=09.device_run =3D iep_device_run,
> +=09.job_ready =3D iep_job_ready,
> +};
> +
> +static irqreturn_t iep_irq(int irq, void *data)
> +{
> +=09struct iep_dev *iep =3D data;
> +=09irqreturn_t ret =3D IRQ_NONE;
> +=09u32 status;
> +
> +=09/* Shared with the IOMMU: registers are only accessible during a job =
*/
> +=09spin_lock(&iep->irq_lock);
> +=09if (!iep->busy)
> +=09=09goto out;
> +
> +=09status =3D iep_read(iep, IEP2_INT_STS);
> +=09if (!status) {
> +=09=09/* IOMMU fault: the IEP would retry the read forever */
> +=09=09if (++iep->foreign_irqs < IEP_MAX_FOREIGN_IRQS)
> +=09=09=09goto out;

Something seems off, do you need/want some fault handler to be set on the
rkiommu driver?

> +
> +=09=09iep_write(iep, IEP2_INT_EN, 0);
> +=09=09iep_write(iep, IEP2_CONFIG0, IEP2_ACLK_SRESET_P);

No polling of any kind?

> +=09=09iep->busy =3D false;
> +=09=09iep->irq_status =3D IEP_IRQ_IOMMU_FAULT;
> +=09=09ret =3D IRQ_WAKE_THREAD;
> +=09=09goto out;
> +=09}
> +
> +=09if (status & IEP2_INT_VALID) {
> +=09=09/* Nothing may assert the shared line once busy is false */
> +=09=09iep_write(iep, IEP2_INT_EN, 0);
> +=09=09iep_write(iep, IEP2_INT_CLR, 0xffffffff);
> +=09=09iep->busy =3D false;
> +=09=09iep->irq_status =3D status;
> +=09=09ret =3D IRQ_WAKE_THREAD;
> +=09} else {
> +=09=09/* Not all bits: a FRM_DONE after the read must stay pending */
> +=09=09iep_write(iep, IEP2_INT_CLR, status);
> +=09=09ret =3D IRQ_HANDLED;
> +=09}
> +out:
> +=09spin_unlock(&iep->irq_lock);
> +
> +=09return ret;
> +}
> +
> +static irqreturn_t iep_irq_thread(int irq, void *data)
> +{
> +=09struct iep_dev *iep =3D data;
> +=09enum vb2_buffer_state state =3D VB2_BUF_STATE_DONE;
> +=09struct iep_ctx *ctx;
> +=09u32 status;
> +
> +=09/* Cancel the watchdog before the next job can start */
> +=09cancel_delayed_work_sync(&iep->watchdog_work);

I'm not sure this is the right way, normally we quickly handle the IRQ stat=
us
register, saving and clearing the IRQ bit and much later we do:

=09if (cancel_delayed_work(&rkvdec->watchdog_work))                        =
     =20
=09=09iep_job_done(ctx, state);

> +
> +=09spin_lock_irq(&iep->irq_lock);
> +=09status =3D iep->irq_status;
> +=09spin_unlock_irq(&iep->irq_lock);

I don't like this to be honest, you should be desperate to avoid locking he=
re.
At least you should have something explaining it better.

> +
> +=09ctx =3D v4l2_m2m_get_curr_priv(iep->m2m_dev);
> +=09if (WARN_ON(!ctx))
> +=09=09return IRQ_HANDLED;
> +
> +=09if (status & (IEP2_INT_BUS_ERROR | IEP2_INT_TIMEOUT |
> +=09=09      IEP_IRQ_IOMMU_FAULT)) {
> +=09=09dev_err_ratelimited(iep->dev, "job failed, status %#x\n",
> +=09=09=09=09    status);
> +=09=09iep_reset(iep);
> +=09=09state =3D VB2_BUF_STATE_ERROR;
> +=09}
> +
> +=09iep_job_done(ctx, state);
> +
> +=09return IRQ_HANDLED;
> +}
> +
> +static void iep_watchdog(struct work_struct *work)
> +{
> +=09struct iep_dev *iep =3D container_of(to_delayed_work(work),
> +=09=09=09=09=09   struct iep_dev, watchdog_work);
> +=09struct iep_ctx *ctx;
> +=09bool timeout;
> +
> +=09/* Mask first: a late completion must not hold the shared line */
> +=09spin_lock_irq(&iep->irq_lock);
> +=09timeout =3D iep->busy;
> +=09if (timeout) {
> +=09=09iep_write(iep, IEP2_INT_EN, 0);
> +=09=09iep_write(iep, IEP2_INT_CLR, 0xffffffff);
> +=09=09iep->busy =3D false;
> +=09}
> +=09spin_unlock_irq(&iep->irq_lock);

So maybe this ugly locking is just your LLM spinning after the miss-use of =
the
delayed worker? Also, if you do soft reset implementation, make sure to do =
it
synchronously and making sure the IP has completed it.

> +
> +=09if (!timeout)
> +=09=09return;
> +
> +=09ctx =3D v4l2_m2m_get_curr_priv(iep->m2m_dev);
> +=09if (WARN_ON(!ctx))
> +=09=09return;
> +
> +=09dev_err(iep->dev, "frame processing timed out\n");
> +=09iep_reset(iep);
> +=09iep_job_done(ctx, VB2_BUF_STATE_ERROR);
> +}
> +
> +static int iep_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> +=09=09=09   unsigned int *nplanes, unsigned int sizes[],
> +=09=09=09   struct device *alloc_devs[])
> +{
> +=09struct iep_ctx *ctx =3D vb2_get_drv_priv(vq);
> +=09struct v4l2_pix_format_mplane *pix;
> +
> +=09pix =3D V4L2_TYPE_IS_OUTPUT(vq->type) ? &ctx->src_fmt : &ctx->dst_fmt=
;
> +
> +=09if (*nplanes)
> +=09=09return (*nplanes !=3D 1 ||
> +=09=09=09sizes[0] < pix->plane_fmt[0].sizeimage) ? -EINVAL : 0;
> +
> +=09*nplanes =3D 1;
> +=09sizes[0] =3D pix->plane_fmt[0].sizeimage;
> +
> +=09return 0;
> +}
> +
> +static int iep_buf_out_validate(struct vb2_buffer *vb)
> +{
> +=09struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +=09struct iep_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +=09switch (vbuf->field) {
> +=09case V4L2_FIELD_ANY:
> +=09=09vbuf->field =3D ctx->src_fmt.field;
> +=09=09return 0;
> +=09case V4L2_FIELD_NONE:
> +=09case V4L2_FIELD_INTERLACED:
> +=09case V4L2_FIELD_INTERLACED_TB:
> +=09case V4L2_FIELD_INTERLACED_BT:
> +=09=09return 0;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +}
> +
> +static int iep_buf_prepare(struct vb2_buffer *vb)
> +{
> +=09struct iep_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +=09struct v4l2_pix_format_mplane *pix;
> +
> +=09pix =3D V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type) ?
> +=09      &ctx->src_fmt : &ctx->dst_fmt;
> +
> +=09if (vb2_plane_size(vb, 0) < pix->plane_fmt[0].sizeimage)
> +=09=09return -EINVAL;
> +
> +=09if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> +=09=09vb2_set_plane_payload(vb, 0, pix->plane_fmt[0].sizeimage);
> +=09=09return 0;
> +=09}
> +
> +=09if (vb2_get_plane_payload(vb, 0) <
> +=09    pix->plane_fmt[0].sizeimage - IEP_SRC_TAIL) {
> +=09=09dev_dbg(ctx->iep->dev, "OUTPUT payload %lu too small\n",
> +=09=09=09vb2_get_plane_payload(vb, 0));
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static void iep_buf_queue(struct vb2_buffer *vb)
> +{
> +=09struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +=09struct iep_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +=09v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static void iep_free_ctx_bufs(struct iep_ctx *ctx)
> +{
> +=09struct device *dev =3D ctx->iep->dev;
> +
> +=09if (ctx->md_cpu)
> +=09=09dma_free_coherent(dev, IEP_MD_BUF_SIZE, ctx->md_cpu,
> +=09=09=09=09  ctx->md_dma);
> +=09if (ctx->mv_cpu)
> +=09=09dma_free_coherent(dev, IEP_MV_BUF_SIZE, ctx->mv_cpu,
> +=09=09=09=09  ctx->mv_dma);
> +=09ctx->md_cpu =3D NULL;
> +=09ctx->mv_cpu =3D NULL;
> +}
> +
> +static void iep_return_bufs(struct vb2_queue *vq, enum vb2_buffer_state =
state)
> +{
> +=09struct iep_ctx *ctx =3D vb2_get_drv_priv(vq);
> +=09struct vb2_v4l2_buffer *vbuf;
> +
> +=09for (;;) {
> +=09=09if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +=09=09=09vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +=09=09else
> +=09=09=09vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +=09=09if (!vbuf)
> +=09=09=09break;
> +=09=09v4l2_m2m_buf_done(vbuf, state);
> +=09}
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(vq->type) && ctx->prev) {
> +=09=09v4l2_m2m_buf_done(ctx->prev, state);
> +=09=09ctx->prev =3D NULL;
> +=09}
> +}
> +
> +static int iep_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +=09struct iep_ctx *ctx =3D vb2_get_drv_priv(vq);
> +=09struct device *dev =3D ctx->iep->dev;
> +
> +=09if (!V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +=09=09ctx->cap_sequence =3D 0;
> +=09=09return 0;
> +=09}
> +
> +=09ctx->out_sequence =3D 0;
> +
> +=09ctx->md_cpu =3D dma_alloc_coherent(dev, IEP_MD_BUF_SIZE, &ctx->md_dma=
,
> +=09=09=09=09=09 GFP_KERNEL);
> +=09ctx->mv_cpu =3D dma_alloc_coherent(dev, IEP_MV_BUF_SIZE, &ctx->mv_dma=
,
> +=09=09=09=09=09 GFP_KERNEL);
> +=09if (!ctx->md_cpu || !ctx->mv_cpu) {
> +=09=09iep_free_ctx_bufs(ctx);
> +=09=09iep_return_bufs(vq, VB2_BUF_STATE_QUEUED);
> +=09=09return -ENOMEM;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static void iep_stop_streaming(struct vb2_queue *vq)
> +{
> +=09struct iep_ctx *ctx =3D vb2_get_drv_priv(vq);
> +
> +=09iep_return_bufs(vq, VB2_BUF_STATE_ERROR);
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +=09=09iep_free_ctx_bufs(ctx);
> +}
> +
> +static const struct vb2_ops iep_qops =3D {
> +=09.queue_setup =3D iep_queue_setup,
> +=09.buf_out_validate =3D iep_buf_out_validate,
> +=09.buf_prepare =3D iep_buf_prepare,
> +=09.buf_queue =3D iep_buf_queue,
> +=09.start_streaming =3D iep_start_streaming,
> +=09.stop_streaming =3D iep_stop_streaming,
> +};
> +
> +static int iep_queue_init(void *priv, struct vb2_queue *src_vq,
> +=09=09=09  struct vb2_queue *dst_vq)
> +{
> +=09struct iep_ctx *ctx =3D priv;
> +=09int ret;
> +
> +=09src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +=09src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +=09src_vq->drv_priv =3D ctx;
> +=09src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +=09src_vq->ops =3D &iep_qops;
> +=09src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +=09src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +=09src_vq->lock =3D &ctx->iep->mutex;
> +=09src_vq->dev =3D ctx->iep->dev;
> +=09src_vq->min_reqbufs_allocation =3D 2;
> +
> +=09ret =3D vb2_queue_init(src_vq);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +=09dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +=09dst_vq->drv_priv =3D ctx;
> +=09dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +=09dst_vq->ops =3D &iep_qops;
> +=09dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> +=09dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +=09dst_vq->lock =3D &ctx->iep->mutex;
> +=09dst_vq->dev =3D ctx->iep->dev;
> +
> +=09return vb2_queue_init(dst_vq);
> +}
> +
> +static void iep_fill_pix(struct v4l2_pix_format_mplane *pix,
> +=09=09=09 const struct iep_fmt *fmt, u32 tail)
> +{
> +=09struct v4l2_plane_pix_format *plane =3D &pix->plane_fmt[0];
> +=09u32 width, height, bpl;
> +
> +=09width =3D ALIGN(clamp(pix->width, IEP_MIN_WIDTH, IEP_MAX_WIDTH),
> +=09=09      IEP_TILE_W);
> +=09height =3D ALIGN(clamp(pix->height, IEP_MIN_HEIGHT, IEP_MAX_HEIGHT),
> +=09=09       IEP_TILE_H);
> +
> +=09bpl =3D ALIGN(plane->bytesperline, IEP_STRIDE_ALIGN);
> +=09bpl =3D clamp_t(u32, bpl, width,
> +=09=09      ALIGN_DOWN(IEP_MAX_STRIDE, IEP_STRIDE_ALIGN));
> +
> +=09pix->pixelformat =3D fmt->fourcc;
> +=09pix->width =3D width;
> +=09pix->height =3D height;
> +=09pix->num_planes =3D 1;
> +=09pix->flags =3D 0;
> +=09memset(pix->reserved, 0, sizeof(pix->reserved));
> +
> +=09plane->bytesperline =3D bpl;
> +=09plane->sizeimage =3D bpl * height + bpl * height / fmt->vdiv + tail;
> +=09memset(plane->reserved, 0, sizeof(plane->reserved));
> +}
> +
> +static int iep_querycap(struct file *file, void *priv,
> +=09=09=09struct v4l2_capability *cap)
> +{
> +=09strscpy(cap->driver, IEP_NAME, sizeof(cap->driver));
> +=09strscpy(cap->card, "Rockchip IEP2 deinterlacer", sizeof(cap->card));
> +
> +=09return 0;
> +}
> +
> +static int iep_enum_fmt_vid_out(struct file *file, void *priv,
> +=09=09=09=09struct v4l2_fmtdesc *f)
> +{
> +=09if (f->index >=3D ARRAY_SIZE(iep_formats))
> +=09=09return -EINVAL;
> +
> +=09f->pixelformat =3D iep_formats[f->index].fourcc;
> +
> +=09return 0;
> +}
> +
> +static int iep_enum_fmt_vid_cap(struct file *file, void *priv,
> +=09=09=09=09struct v4l2_fmtdesc *f)
> +{
> +=09struct iep_ctx *ctx =3D file_to_iep_ctx(file);
> +
> +=09if (f->index)
> +=09=09return -EINVAL;
> +
> +=09f->pixelformat =3D ctx->fmt->fourcc;
> +
> +=09return 0;
> +}
> +
> +static int iep_enum_framesizes(struct file *file, void *priv,
> +=09=09=09       struct v4l2_frmsizeenum *fsize)
> +{
> +=09if (fsize->index || !iep_find_fmt(fsize->pixel_format))
> +=09=09return -EINVAL;
> +
> +=09fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +=09fsize->stepwise.min_width =3D IEP_MIN_WIDTH;
> +=09fsize->stepwise.max_width =3D IEP_MAX_WIDTH;
> +=09fsize->stepwise.step_width =3D IEP_TILE_W;
> +=09fsize->stepwise.min_height =3D IEP_MIN_HEIGHT;
> +=09fsize->stepwise.max_height =3D IEP_MAX_HEIGHT;
> +=09fsize->stepwise.step_height =3D IEP_TILE_H;
> +
> +=09return 0;
> +}
> +
> +static int iep_g_fmt_vid_out(struct file *file, void *priv,
> +=09=09=09     struct v4l2_format *f)
> +{
> +=09f->fmt.pix_mp =3D file_to_iep_ctx(file)->src_fmt;
> +
> +=09return 0;
> +}
> +
> +static int iep_g_fmt_vid_cap(struct file *file, void *priv,
> +=09=09=09     struct v4l2_format *f)
> +{
> +=09f->fmt.pix_mp =3D file_to_iep_ctx(file)->dst_fmt;
> +
> +=09return 0;
> +}
> +
> +static int iep_try_fmt_vid_out(struct file *file, void *priv,
> +=09=09=09       struct v4l2_format *f)
> +{
> +=09struct v4l2_pix_format_mplane *pix =3D &f->fmt.pix_mp;
> +=09const struct iep_fmt *fmt;
> +
> +=09fmt =3D iep_find_fmt(pix->pixelformat);
> +=09if (!fmt)
> +=09=09fmt =3D &iep_formats[0];
> +
> +=09if (pix->field !=3D V4L2_FIELD_INTERLACED_TB &&
> +=09    pix->field !=3D V4L2_FIELD_INTERLACED_BT &&
> +=09    pix->field !=3D V4L2_FIELD_INTERLACED &&
> +=09    pix->field !=3D V4L2_FIELD_NONE)
> +=09=09pix->field =3D V4L2_FIELD_INTERLACED;
> +
> +=09if (pix->colorspace =3D=3D V4L2_COLORSPACE_DEFAULT) {
> +=09=09pix->colorspace =3D pix->height > 576 ? V4L2_COLORSPACE_REC709 :
> +=09=09=09=09=09=09      V4L2_COLORSPACE_SMPTE170M;
> +=09=09pix->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +=09=09pix->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +=09=09pix->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +=09}
> +
> +=09iep_fill_pix(pix, fmt, IEP_SRC_TAIL);
> +
> +=09return 0;
> +}
> +
> +static int iep_try_fmt_vid_cap(struct file *file, void *priv,
> +=09=09=09       struct v4l2_format *f)
> +{
> +=09struct iep_ctx *ctx =3D file_to_iep_ctx(file);
> +=09struct v4l2_pix_format_mplane *pix =3D &f->fmt.pix_mp;
> +
> +=09pix->width =3D ctx->src_fmt.width;
> +=09pix->height =3D ctx->src_fmt.height;
> +=09pix->field =3D V4L2_FIELD_NONE;
> +=09pix->colorspace =3D ctx->src_fmt.colorspace;
> +=09pix->xfer_func =3D ctx->src_fmt.xfer_func;
> +=09pix->ycbcr_enc =3D ctx->src_fmt.ycbcr_enc;
> +=09pix->quantization =3D ctx->src_fmt.quantization;
> +
> +=09iep_fill_pix(pix, ctx->fmt, 0);
> +
> +=09return 0;
> +}
> +
> +static int iep_s_fmt_vid_out(struct file *file, void *priv,
> +=09=09=09     struct v4l2_format *f)
> +{
> +=09struct iep_ctx *ctx =3D file_to_iep_ctx(file);
> +=09struct v4l2_pix_format_mplane *dst =3D &ctx->dst_fmt;
> +=09struct vb2_queue *vq;
> +=09int ret;
> +
> +=09vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +=09if (vb2_is_busy(vq))
> +=09=09return -EBUSY;
> +
> +=09vq =3D v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
> +=09if (vb2_is_busy(vq))
> +=09=09return -EBUSY;
> +
> +=09ret =3D iep_try_fmt_vid_out(file, priv, f);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ctx->src_fmt =3D f->fmt.pix_mp;
> +=09ctx->fmt =3D iep_find_fmt(ctx->src_fmt.pixelformat);
> +
> +=09dst->width =3D ctx->src_fmt.width;
> +=09dst->height =3D ctx->src_fmt.height;
> +=09dst->field =3D V4L2_FIELD_NONE;
> +=09dst->colorspace =3D ctx->src_fmt.colorspace;
> +=09dst->xfer_func =3D ctx->src_fmt.xfer_func;
> +=09dst->ycbcr_enc =3D ctx->src_fmt.ycbcr_enc;
> +=09dst->quantization =3D ctx->src_fmt.quantization;
> +=09dst->plane_fmt[0].bytesperline =3D 0;
> +=09iep_fill_pix(dst, ctx->fmt, 0);
> +
> +=09return 0;
> +}
> +
> +static int iep_s_fmt_vid_cap(struct file *file, void *priv,
> +=09=09=09     struct v4l2_format *f)
> +{
> +=09struct iep_ctx *ctx =3D file_to_iep_ctx(file);
> +=09struct vb2_queue *vq;
> +=09int ret;
> +
> +=09vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +=09if (vb2_is_busy(vq))
> +=09=09return -EBUSY;
> +
> +=09ret =3D iep_try_fmt_vid_cap(file, priv, f);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ctx->dst_fmt =3D f->fmt.pix_mp;
> +
> +=09return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops iep_ioctl_ops =3D {
> +=09.vidioc_querycap =3D iep_querycap,
> +=09.vidioc_enum_framesizes =3D iep_enum_framesizes,
> +
> +=09.vidioc_enum_fmt_vid_cap =3D iep_enum_fmt_vid_cap,
> +=09.vidioc_g_fmt_vid_cap_mplane =3D iep_g_fmt_vid_cap,
> +=09.vidioc_try_fmt_vid_cap_mplane =3D iep_try_fmt_vid_cap,
> +=09.vidioc_s_fmt_vid_cap_mplane =3D iep_s_fmt_vid_cap,
> +
> +=09.vidioc_enum_fmt_vid_out =3D iep_enum_fmt_vid_out,
> +=09.vidioc_g_fmt_vid_out_mplane =3D iep_g_fmt_vid_out,
> +=09.vidioc_try_fmt_vid_out_mplane =3D iep_try_fmt_vid_out,
> +=09.vidioc_s_fmt_vid_out_mplane =3D iep_s_fmt_vid_out,
> +
> +=09.vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
> +=09.vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
> +=09.vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
> +=09.vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
> +=09.vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
> +=09.vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
> +=09.vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
> +
> +=09.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> +=09.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> +
> +=09.vidioc_subscribe_event =3D v4l2_ctrl_subscribe_event,
> +=09.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> +};
> +
> +static int iep_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +=09struct iep_ctx *ctx =3D container_of(ctrl->handler, struct iep_ctx,
> +=09=09=09=09=09   ctrl_handler);
> +=09bool field_rate;
> +
> +=09switch (ctrl->id) {
> +=09case V4L2_CID_DEINTERLACING_MODE:
> +=09=09field_rate =3D ctrl->val =3D=3D IEP_DEINT_BOB_FIELD ||
> +=09=09=09     ctrl->val =3D=3D IEP_DEINT_MA_FIELD;
> +=09=09if (field_rate !=3D ctx->field_rate && ctx->fh.m2m_ctx &&
> +=09=09    (vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)) ||
> +=09=09     vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))))
> +=09=09=09return -EBUSY;
> +=09=09WRITE_ONCE(ctx->motion_adaptive,
> +=09=09=09   ctrl->val =3D=3D IEP_DEINT_MA_FRAME ||
> +=09=09=09   ctrl->val =3D=3D IEP_DEINT_MA_FIELD);
> +=09=09WRITE_ONCE(ctx->field_rate, field_rate);
> +=09=09return 0;
> +=09}
> +
> +=09return -EINVAL;
> +}
> +
> +static const struct v4l2_ctrl_ops iep_ctrl_ops =3D {
> +=09.s_ctrl =3D iep_s_ctrl,
> +};
> +
> +static const char * const iep_deint_mode_menu[] =3D {
> +=09[IEP_DEINT_BOB_FRAME]=09=3D "Bob, Frame Rate",
> +=09[IEP_DEINT_BOB_FIELD]=09=3D "Bob, Field Rate",
> +=09[IEP_DEINT_MA_FRAME]=09=3D "Motion Adaptive, Frame Rate",
> +=09[IEP_DEINT_MA_FIELD]=09=3D "Motion Adaptive, Field Rate",
> +=09NULL,
> +};
> +
> +static int iep_ctrls_init(struct iep_ctx *ctx)
> +{
> +=09struct v4l2_ctrl_handler *hdl =3D &ctx->ctrl_handler;
> +
> +=09v4l2_ctrl_handler_init(hdl, 1);
> +=09v4l2_ctrl_new_std_menu_items(hdl, &iep_ctrl_ops,
> +=09=09=09=09     V4L2_CID_DEINTERLACING_MODE,
> +=09=09=09=09     IEP_DEINT_MA_FIELD, 0, IEP_DEINT_BOB_FRAME,
> +=09=09=09=09     iep_deint_mode_menu);
> +
> +=09if (hdl->error) {
> +=09=09int ret =3D hdl->error;
> +
> +=09=09v4l2_ctrl_handler_free(hdl);
> +=09=09return ret;
> +=09}
> +
> +=09ctx->fh.ctrl_handler =3D hdl;
> +
> +=09return v4l2_ctrl_handler_setup(hdl);
> +}
> +
> +static int iep_open(struct file *file)
> +{
> +=09struct iep_dev *iep =3D video_drvdata(file);
> +=09struct iep_ctx *ctx;
> +=09int ret;
> +
> +=09ctx =3D kzalloc_obj(*ctx);
> +=09if (!ctx)
> +=09=09return -ENOMEM;
> +
> +=09ctx->iep =3D iep;
> +=09ctx->fmt =3D &iep_formats[0];
> +
> +=09ctx->src_fmt.width =3D 720;
> +=09ctx->src_fmt.height =3D 576;

Just for style, use defines.

> +=09ctx->src_fmt.field =3D V4L2_FIELD_INTERLACED_TB;
> +=09ctx->src_fmt.colorspace =3D V4L2_COLORSPACE_SMPTE170M;
> +=09iep_fill_pix(&ctx->src_fmt, ctx->fmt, IEP_SRC_TAIL);
> +
> +=09ctx->dst_fmt =3D ctx->src_fmt;
> +=09ctx->dst_fmt.field =3D V4L2_FIELD_NONE;
> +=09iep_fill_pix(&ctx->dst_fmt, ctx->fmt, 0);
> +
> +=09v4l2_fh_init(&ctx->fh, video_devdata(file));
> +
> +=09ret =3D iep_ctrls_init(ctx);
> +=09if (ret)
> +=09=09goto err_free_ctrls;
> +
> +=09if (mutex_lock_interruptible(&iep->mutex)) {
> +=09=09ret =3D -ERESTARTSYS;
> +=09=09goto err_free_ctrls;
> +=09}
> +=09ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(iep->m2m_dev, ctx,
> +=09=09=09=09=09    iep_queue_init);
> +=09mutex_unlock(&iep->mutex);
> +=09if (IS_ERR(ctx->fh.m2m_ctx)) {
> +=09=09ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> +=09=09goto err_free_ctrls;
> +=09}
> +
> +=09v4l2_fh_add(&ctx->fh, file);
> +
> +=09return 0;
> +
> +err_free_ctrls:
> +=09v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +=09v4l2_fh_exit(&ctx->fh);
> +=09kfree(ctx);
> +=09return ret;
> +}
> +
> +static int iep_release(struct file *file)
> +{
> +=09struct iep_dev *iep =3D video_drvdata(file);
> +=09struct iep_ctx *ctx =3D file_to_iep_ctx(file);
> +
> +=09mutex_lock(&iep->mutex);
> +=09v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +=09mutex_unlock(&iep->mutex);
> +
> +=09v4l2_fh_del(&ctx->fh, file);
> +=09v4l2_fh_exit(&ctx->fh);
> +=09v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +=09kfree(ctx);
> +
> +=09return 0;
> +}
> +
> +static const struct v4l2_file_operations iep_fops =3D {
> +=09.owner =3D THIS_MODULE,
> +=09.open =3D iep_open,
> +=09.release =3D iep_release,
> +=09.poll =3D v4l2_m2m_fop_poll,
> +=09.unlocked_ioctl =3D video_ioctl2,
> +=09.mmap =3D v4l2_m2m_fop_mmap,
> +};
> +
> +static const struct video_device iep_video_device =3D {
> +=09.name =3D IEP_NAME,
> +=09.vfl_dir =3D VFL_DIR_M2M,
> +=09.fops =3D &iep_fops,
> +=09.ioctl_ops =3D &iep_ioctl_ops,
> +=09.minor =3D -1,
> +=09.release =3D video_device_release_empty,
> +=09.device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> +};
> +
> +static int iep_runtime_suspend(struct device *dev)
> +{
> +=09struct iep_dev *iep =3D dev_get_drvdata(dev);
> +
> +=09clk_bulk_disable_unprepare(iep->num_clks, iep->clks);
> +
> +=09return 0;
> +}
> +
> +static int iep_runtime_resume(struct device *dev)
> +{
> +=09struct iep_dev *iep =3D dev_get_drvdata(dev);
> +
> +=09return clk_bulk_prepare_enable(iep->num_clks, iep->clks);
> +}
> +
> +static void iep_v4l2_release(struct v4l2_device *v4l2_dev)
> +{
> +=09struct iep_dev *iep =3D container_of(v4l2_dev, struct iep_dev, v4l2_d=
ev);
> +
> +=09if (iep->m2m_dev)
> +=09=09v4l2_m2m_release(iep->m2m_dev);
> +=09v4l2_device_unregister(v4l2_dev);
> +=09mutex_destroy(&iep->mutex);
> +=09kfree(iep);
> +}
> +
> +static void iep_put(void *data)
> +{
> +=09struct iep_dev *iep =3D data;
> +
> +=09v4l2_device_put(&iep->v4l2_dev);
> +}
> +
> +static int iep_probe(struct platform_device *pdev)
> +{
> +=09struct device *dev =3D &pdev->dev;
> +=09struct iep_dev *iep;
> +=09int irq, ret;
> +
> +=09iep =3D kzalloc_obj(*iep);
> +=09if (!iep)
> +=09=09return -ENOMEM;
> +
> +=09iep->dev =3D dev;
> +=09iep->vfd =3D iep_video_device;
> +=09mutex_init(&iep->mutex);
> +=09spin_lock_init(&iep->irq_lock);
> +=09INIT_DELAYED_WORK(&iep->watchdog_work, iep_watchdog);
> +
> +=09ret =3D v4l2_device_register(dev, &iep->v4l2_dev);
> +=09if (ret) {
> +=09=09mutex_destroy(&iep->mutex);
> +=09=09kfree(iep);
> +=09=09return ret;
> +=09}
> +=09iep->v4l2_dev.release =3D iep_v4l2_release;
> +
> +=09/* Registered before the IRQ, so it runs after the IRQ is freed */
> +=09ret =3D devm_add_action_or_reset(dev, iep_put, iep);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09platform_set_drvdata(pdev, iep);
> +
> +=09iep->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +=09if (IS_ERR(iep->regs))
> +=09=09return PTR_ERR(iep->regs);
> +
> +=09iep->num_clks =3D devm_clk_bulk_get_all(dev, &iep->clks);
> +=09if (iep->num_clks < 0)
> +=09=09return dev_err_probe(dev, iep->num_clks,
> +=09=09=09=09     "failed to get clocks\n");
> +
> +=09iep->rstc =3D devm_reset_control_array_get_optional_exclusive(dev);
> +=09if (IS_ERR(iep->rstc))
> +=09=09return dev_err_probe(dev, PTR_ERR(iep->rstc),
> +=09=09=09=09     "failed to get resets\n");
> +
> +=09ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "failed to set DMA mask\n");
> +=09vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
> +
> +=09iep->roi_cpu =3D dmam_alloc_coherent(dev, IEP_ROI_BUF_SIZE,
> +=09=09=09=09=09   &iep->roi_dma, GFP_KERNEL);
> +=09if (!iep->roi_cpu)
> +=09=09return -ENOMEM;
> +
> +=09irq =3D platform_get_irq(pdev, 0);
> +=09if (irq < 0)
> +=09=09return irq;
> +=09iep->irq =3D irq;
> +
> +=09ret =3D devm_request_threaded_irq(dev, irq, iep_irq, iep_irq_thread,
> +=09=09=09=09=09IRQF_SHARED, dev_name(dev), iep);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "failed to request IRQ\n");
> +
> +=09if (iommu_get_domain_for_dev(dev)) {
> +=09=09iep->empty_domain =3D iommu_paging_domain_alloc(dev);
> +=09=09if (IS_ERR(iep->empty_domain)) {
> +=09=09=09dev_warn(dev, "cannot allocate empty IOMMU domain\n");
> +=09=09=09iep->empty_domain =3D NULL;
> +=09=09}
> +=09}
> +
> +=09pm_runtime_set_autosuspend_delay(dev, IEP_AUTOSUSPEND_MS);
> +=09pm_runtime_use_autosuspend(dev);
> +=09pm_runtime_enable(dev);
> +
> +=09iep->m2m_dev =3D v4l2_m2m_init(&iep_m2m_ops);
> +=09if (IS_ERR(iep->m2m_dev)) {
> +=09=09ret =3D PTR_ERR(iep->m2m_dev);
> +=09=09iep->m2m_dev =3D NULL;
> +=09=09v4l2_err(&iep->v4l2_dev, "failed to init mem2mem device\n");
> +=09=09goto err_pm;
> +=09}
> +
> +=09iep->vfd.lock =3D &iep->mutex;
> +=09iep->vfd.v4l2_dev =3D &iep->v4l2_dev;
> +=09video_set_drvdata(&iep->vfd, iep);
> +
> +=09ret =3D video_register_device(&iep->vfd, VFL_TYPE_VIDEO, -1);
> +=09if (ret) {
> +=09=09v4l2_err(&iep->v4l2_dev, "failed to register video device\n");
> +=09=09goto err_pm;
> +=09}
> +
> +=09return 0;
> +
> +err_pm:
> +=09pm_runtime_dont_use_autosuspend(dev);
> +=09pm_runtime_disable(dev);
> +=09if (iep->empty_domain)
> +=09=09iommu_domain_free(iep->empty_domain);
> +=09return ret;
> +}
> +
> +static void iep_remove(struct platform_device *pdev)
> +{
> +=09struct iep_dev *iep =3D platform_get_drvdata(pdev);
> +
> +=09video_unregister_device(&iep->vfd);
> +=09/* Wait for ioctls in flight before suspending the m2m core */
> +=09mutex_lock(&iep->mutex);
> +=09v4l2_m2m_suspend(iep->m2m_dev);
> +=09mutex_unlock(&iep->mutex);
> +=09cancel_delayed_work_sync(&iep->watchdog_work);
> +
> +=09pm_runtime_dont_use_autosuspend(&pdev->dev);
> +=09pm_runtime_disable(&pdev->dev);
> +=09if (!pm_runtime_status_suspended(&pdev->dev))
> +=09=09iep_runtime_suspend(&pdev->dev);
> +=09pm_runtime_set_suspended(&pdev->dev);
> +
> +=09if (iep->empty_domain)
> +=09=09iommu_domain_free(iep->empty_domain);
> +=09iep->empty_domain =3D NULL;
> +}
> +
> +static int iep_suspend(struct device *dev)
> +{
> +=09struct iep_dev *iep =3D dev_get_drvdata(dev);
> +=09int ret;
> +
> +=09mutex_lock(&iep->mutex);
> +=09v4l2_m2m_suspend(iep->m2m_dev);
> +=09mutex_unlock(&iep->mutex);
> +
> +=09ret =3D pm_runtime_force_suspend(dev);
> +=09if (ret)
> +=09=09v4l2_m2m_resume(iep->m2m_dev);
> +
> +=09return ret;
> +}
> +
> +static int iep_resume(struct device *dev)
> +{
> +=09struct iep_dev *iep =3D dev_get_drvdata(dev);
> +=09int ret;
> +
> +=09ret =3D pm_runtime_force_resume(dev);
> +=09/* Even on error, so that queued jobs fail instead of hanging */
> +=09v4l2_m2m_resume(iep->m2m_dev);
> +
> +=09return ret;
> +}
> +
> +static const struct dev_pm_ops iep_pm_ops =3D {
> +=09SYSTEM_SLEEP_PM_OPS(iep_suspend, iep_resume)
> +=09RUNTIME_PM_OPS(iep_runtime_suspend, iep_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id iep_of_match[] =3D {
> +=09{ .compatible =3D "rockchip,rk3568-iep2" },
> +=09{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, iep_of_match);
> +
> +static struct platform_driver iep_driver =3D {
> +=09.probe =3D iep_probe,
> +=09.remove =3D iep_remove,
> +=09.driver =3D {
> +=09=09.name =3D IEP_NAME,
> +=09=09.of_match_table =3D iep_of_match,
> +=09=09.pm =3D pm_ptr(&iep_pm_ops),
> +=09},
> +};
> +module_platform_driver(iep_driver);
> +
> +MODULE_DESCRIPTION("Rockchip IEP2 deinterlacer driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/rockchip/iep2/iep2.h b/drivers/media/=
platform/rockchip/iep2/iep2.h
> new file mode 100644
> index 000000000000..85a2decb30b6
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/iep2/iep2.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ROCKCHIP_IEP2_H__
> +#define __ROCKCHIP_IEP2_H__
> +
> +#include <linux/clk.h>
> +#include <linux/mutex.h>
> +#include <linux/reset.h>
> +#include <linux/sizes.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define IEP_NAME=09=09"rockchip-iep2"
> +
> +#define IEP_TILE_W=09=0916
> +#define IEP_TILE_H=09=094
> +
> +#define IEP_MIN_WIDTH=09=0932U
> +#define IEP_MAX_WIDTH=09=091920U
> +#define IEP_MIN_HEIGHT=09=0916U
> +#define IEP_MAX_HEIGHT=09=091088U
> +
> +#define IEP_MAX_STRIDE=09=09(0xffff * 4)
> +#define IEP_STRIDE_ALIGN=0916
> +
> +/* The IEP2 reads past the end of the OUTPUT buffer */
> +#define IEP_SRC_TAIL=09=09SZ_4K
> +
> +enum iep_deint_mode {
> +=09IEP_DEINT_BOB_FRAME,
> +=09IEP_DEINT_BOB_FIELD,
> +=09IEP_DEINT_MA_FRAME,
> +=09IEP_DEINT_MA_FIELD,
> +};
> +
> +#define IEP_MD_BUF_SIZE=09=09(IEP_MAX_WIDTH * IEP_MAX_HEIGHT)
> +#define IEP_MV_BUF_SIZE=09=09(120 * 480)
> +#define IEP_ROI_BUF_SIZE=09(120 * 272)
> +
> +struct iep_fmt {
> +=09u32 fourcc;
> +=09u8 hw_fmt;
> +=09u8 hw_swap;
> +=09u8 vdiv;
> +};
> +
> +struct iep_dev {
> +=09struct v4l2_device v4l2_dev;
> +=09struct v4l2_m2m_dev *m2m_dev;
> +=09struct video_device vfd;
> +=09struct device *dev;
> +=09/* serialises ioctls and vb2 queue operations */
> +=09struct mutex mutex;
> +
> +=09void __iomem *regs;
> +=09struct clk_bulk_data *clks;
> +=09int num_clks;
> +=09struct reset_control *rstc;
> +=09struct iommu_domain *empty_domain;
> +=09bool iommu_lost;
> +
> +=09void *roi_cpu;
> +=09dma_addr_t roi_dma;
> +
> +=09struct delayed_work watchdog_work;
> +=09int irq;
> +=09/* protects busy and irq_status */
> +=09spinlock_t irq_lock;
> +=09bool busy;
> +=09u32 irq_status;
> +=09unsigned int foreign_irqs;
> +};
> +
> +struct iep_ctx {
> +=09struct v4l2_fh fh;
> +=09struct iep_dev *iep;
> +=09struct v4l2_ctrl_handler ctrl_handler;
> +
> +=09const struct iep_fmt *fmt;
> +=09struct v4l2_pix_format_mplane src_fmt;
> +=09struct v4l2_pix_format_mplane dst_fmt;
> +
> +=09bool motion_adaptive;
> +=09bool field_rate;
> +
> +=09void *md_cpu;
> +=09dma_addr_t md_dma;
> +=09void *mv_cpu;
> +=09dma_addr_t mv_dma;
> +
> +=09struct vb2_v4l2_buffer *prev;
> +
> +=09struct vb2_v4l2_buffer *job_src;
> +=09struct vb2_v4l2_buffer *job_dst[2];
> +=09unsigned int job_ndst;
> +=09bool job_keep_src;
> +
> +=09u32 out_sequence;
> +=09u32 cap_sequence;
> +};
> +
> +#endif /* __ROCKCHIP_IEP2_H__ */

There is just too many hidden workarounds in there, upstreaming is about do=
ing
it right as much as possible, which in fact require spending time on it.

Nicolas


--=-V18xtdmuoaSqJyCNbDa/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawS6DgAKCRDZQZRRKWBy
9MfZAQDOBhZR3qieEcpBGwMVlN4bIoLF8Uk27QkERHS8StiCUAEAu71QVRwXr0Z8
O0aHEaUOb4N0yocAPlq07jwEcLBSOQc=
=WaP/
-----END PGP SIGNATURE-----

--=-V18xtdmuoaSqJyCNbDa/--
