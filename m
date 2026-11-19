Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120257;
	b=fwFl6PQ0IR5GV0gHlwe4gJ78UjNxxzSNMIkzHiwe7/gTHwgYTwVopEfliUlgVvUrVD8C
	 t28yoxsCcvzqzb0pmYdrmXaKR6GWcXO5w2KB0YAYYzapqP1CMQRCQ/i6EnEoDnEdYrnoD
	 k4tT+RfZh/1aYEfgg5hJuX4K5H6ca/Exe2Thc4yUC0URkDOWeJqypWkBbsumpka1DoT33
	 TJLK6A5jv22emJTPb5z7kCe2kVrEF858RkbI858Kk2We/mSBJxEG0N54i/Cx12Yq3WSV8
	 fO5jV8VivkA4/qXtR6KNezR/pDPLmafe/qY6zdSxS8fXMOx64WxTwQ46qWPm2JpcKgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=i8ykn4E5LzByOueGyLMiBc4qBRmllQm4EsarmCaWf3M=;
	b=FcQH6pN0y576euUGWOj8LK5VbETLhaFDGQI+swos7SPtJXgzipOdMvYszMGaAfZPeMH8
	 3McKjr0v7q6MwRskBV/q6slhOl5CwJ0I6MAVbeOYkkov5QTs7mHk4tAb5ancSe3ehQ0v/
	 5c9W4Qza0hbku4ZHryIz7LVhfLcuwyr9eMn+4ROkg2w9BMfB13KQeFEOnT3V68iNDNjdd
	 EOs8vZhiUxURfWBwn/Gh1JLdF1mbFar1i7/v1q8C651V/FBU4YH+eHW5msptFdW+CdzCF
	 eXPw4+60iB5M54pwVizFtcvuF74u7SIb28WO4A9R7Q8/Jn0czCnSIuWkhfqnpri3qhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K9Py7VFs;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0AD606A330
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 20:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F0AD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K9Py7VFs
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4efdc8c20so1243597b3.1
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 12:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795120254; x=1795725054; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8ykn4E5LzByOueGyLMiBc4qBRmllQm4EsarmCaWf3M=;
        b=K9Py7VFsp5gYQrQrUGuZZ0yNwck1b/51JNp68XzV/WqcWIeRa6BKAmnBXNY+rpOWwW
         /e3up888WsrMvkvS3QG+8UDCLYAerJi3uJlkbOvO4HlBxriGX0y+LLS1xagKxU1mVNj3
         j1wNyJDeE8VruUmCK+msFNeNDlA+XhcGriMGMh6qGNtpdDEuLHczH+bgCBpouFYBY0+G
         /taobZfgDEWuXuraU82oYy4Bjhm+JnSDITDeEvnGeKDVefdFs1ViX2aaPH5vUXuK+Pt9
         63CJ2aQVSelea5ZWjDpHK5f4SMK+YxJG5FJR2krAgK7ygfevDRvamQrjAdgN+VjIdSWb
         YJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120254; x=1795725054;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8ykn4E5LzByOueGyLMiBc4qBRmllQm4EsarmCaWf3M=;
        b=NXfEUde3vD54gbLMud1f12Wai1n85AHyG4a54OnFw3phf7tJyDYP2UX41GjcgTzE1m
         jkOMM60XvwrCJPPQDhwXn0zmfmLy4u39uqDDdZ4QcN1zZd9AxZp/3E8XY2Umg2kOYklG
         S7XE6RVXBgTokBPlMqWl3X/AoK1Nz4k9R1cYhEs2TKDwlR0Dl5cGm6zwxUDKTmfPjod1
         vuUfPepbKqzMnzNjvbAjDng+n3wDLg6kAXbQBjaO3Bx0zJnDGC9hskaahJ5MMEyfLQvB
         lz0tmrdYY1tYhmg24dtquiPX4w64zyIEfdtK8RDQzWLF/tfwjA/NPNtKg0PG8fqUYUir
         HtpQ==
X-Forwarded-Encrypted: i=1; AL+hErGi22X+i58TX3tU09adtDKhzU9/wD1tcDMjwNDKqnZi0JCZ/yGq43jHTXO4QvHSFl0g8AFY8Z47UdWvhQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FfHq6GtOGrtzUMoQnI8Un4ivkQmOAQXtPifv0+dzbKbkLb4C1
	iyUlAwx2KcspBtU06qM6j8I/1r7CrMxCQfGwjYCW7Kvhg2OenNy+hZ0Ng3Fe9JxCEUY=
X-Gm-Gg: AZFdTZfpyRqm4+ng8Sum1yi3u1NymhGaVIQTt7rYexLd0a/yMKD/YY2dH5oJvUN6tQU
	c1CXG/VHaRjfsNH4Tr0DU8Hz0LJ4js0uunX28RY1JlqajOOcFXG1P1R4cRmA+/FJatOsjjjI+2X
	90XqBa/hbQK0N40xLuZa1wPWfCvtJ29xPauGeTTGiYHgUFMMsrSbgEerCfDa9ETrUe/7YegAEpf
	ID2mvzK0D9iTb7p762plqvDhKXek3C/sg6WpqZ+/+Kd16430wkmVHdm1R3ugRmzeMRmF6Cbk+qt
	+pkXH85UsPkTgQFWbNnBQEx8EzUyuLFISeT/EoSlHQAv7RYsU30jvkaHdL5akFTnzNogXK6vAFc
	nx6yflJPzUfKGX0XH9jsO4AfWn4DawbHGkNVHgS92iwJ2OhLq+JS4q2ObIX8/9uH3yn0sUH60JU
	0fu1OIjHvs/5qt7sgElwEZYXO9TUO+k/PvSHZRy9BeLiFl3SSPv/bAo88TiYc8cmSpmFDhomhmj
	+w2ykX6/2o2SvQAs6fsdFHGmmGkGpgga+mOfC1ht7d2oGzQNJoB+PcbfO0u6TjP4id9qmIliWa+
	y61BR/a7PYXRM7So66vAr08DiSZ52a3FIb24MyDJvCPSrp1PKezH6p8=
X-Received: by 2002:a05:690c:4491:b0:8b3:8d8:e985 with SMTP id 00721157ae682-8b5204faf4amr4886077b3.57.1795120253872;
        Thu, 19 Nov 2026 12:30:53 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d89csm5068547b3.15.2026.11.19.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:30:53 -0800 (PST)
Message-ID: <d1d53edeb358e1bdcd1c262e48074f7f1be276cf.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 04/28] media: mali-vpu: initialize decoder format
 state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 15:30:51 -0500
In-Reply-To: <20261119153758.1426673-5-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-5-charvi.mehta@arm.com>
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
	protocol="application/pgp-signature"; boundary="=-x5a1wcjL9jf38bTSf9aZ"
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

--=-x5a1wcjL9jf38bTSf9aZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> Describe the H.264 OUTPUT format and YUV420M, NV12M and NV21M CAPTURE
> formats supported by Mali-V76, together with its frame-size limits.
>=20
> Add source and destination format state to each decoder session and
> initialize both ports from variant defaults. Add the MVE format identifie=
rs
> required by the format descriptors.
>=20
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> ---
>  drivers/media/platform/arm/mali-vpu/Makefile  |  4 +-
>  .../platform/arm/mali-vpu/mali-vpu-dec.c      | 16 ++++
>  .../platform/arm/mali-vpu/mali-vpu-dec.h      | 13 +++
>  .../platform/arm/mali-vpu/mali-vpu-formats.h  | 27 ++++++
>  .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   | 51 ++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-session.c  | 83 +++++++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-session.h  | 18 ++++
>  .../arm/mali-vpu/mali-vpu-variant-v76.c       | 63 ++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-variant.h  | 30 +++++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |  7 ++
>  10 files changed, 311 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.=
h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-protocol=
-def-v3.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-session.=
c
>=20
> diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media=
/platform/arm/mali-vpu/Makefile
> index e659101bd0eac..0a42c53ae5088 100644
> --- a/drivers/media/platform/arm/mali-vpu/Makefile
> +++ b/drivers/media/platform/arm/mali-vpu/Makefile
> @@ -2,6 +2,8 @@
> =20
>  mali-vpu-objs :=3D mali-vpu-probe.o \
>  =09=09mali-vpu-variant-v76.o \
> -=09=09mali-vpu-vidioc.o
> +=09=09mali-vpu-vidioc.o \
> +=09=09mali-vpu-session.o \
> +=09=09mali-vpu-dec.o
> =20
>  obj-$(CONFIG_VIDEO_MALI_VPU) +=3D mali-vpu.o
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers=
/media/platform/arm/mali-vpu/mali-vpu-dec.c
> new file mode 100644
> index 0000000000000..cb6eeee2f04df
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#include "mali-vpu-dec.h"
> +#include "mali-vpu-session.h"
> +#include "mali-vpu-variant.h"
> +
> +void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
> +{
> +=09const struct mali_vpu_format_caps *variant_fmts =3D &sess->vpu_dev->v=
ariant->fmt_caps;
> +
> +=09sess->port_src.supported_fmts =3D variant_fmts->dec_src;
> +=09sess->port_dst.supported_fmts =3D variant_fmts->dec_dst;

Why? the variant are constant, you can just read the information from the
variant. Make a getter or point to it.

p.s. is that "port" like in OMX IL?

> +}
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h b/drivers=
/media/platform/arm/mali-vpu/mali-vpu-dec.h
> new file mode 100644
> index 0000000000000..2514c897587c4
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_DEC_H__
> +#define __MALI_VPU_DEC_H__
> +
> +struct mali_vpu_session;
> +
> +void mali_vpu_session_init_dec(struct mali_vpu_session *sess);
> +
> +#endif /* __MALI_VPU_DEC_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-formats.h
> new file mode 100644
> index 0000000000000..13031809fdb4d
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_FORMATS_H__
> +#define __MALI_VPU_FORMATS_H__
> +
> +#include <linux/types.h>
> +
> +enum mali_vpu_codec_fmt {
> +=09MALI_VPU_FORMAT_CODEC_H264,
> +};
> +
> +struct mali_vpu_format_desc {
> +=09u32 fourcc;
> +=09u16 mve_frame_fmt;
> +=09u16 codec_fmt;
> +=09u32 flags;
> +};
> +
> +struct mali_vpu_format_list {
> +=09const struct mali_vpu_format_desc *fmts;
> +=09u32 num_fmts;
> +};
> +
> +#endif /* __MALI_VPU_FORMATS_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3=
.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
> new file mode 100644
> index 0000000000000..aed51eec6ca9c
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_PROTOCOL_DEF_V3_H__
> +#define __MALI_VPU_PROTOCOL_DEF_V3_H__
> +
> +/***********************************************************************=
******
> + *
> + * Communication protocol between the host/driver and the MVE firmware,
> + * the 'host interface'.
> + *
> + * MVE =3D=3D MALI Video Engine
> + *
> + * Protocol version 3.1
> + *
> + * Note: Message structs may be expanded in the future; the host should
> + * use the 'size' of the message to determine how many bytes to
> + * read from the message queue, rather than a sizeof(struct).
> + *
> + * All multibyte integer fields in the shared-memory interface are littl=
e-endian.
> + * The driver supports only little-endian kernels and therefore accesses=
 these
> + * fields in native byte order.
> + *
> + ***********************************************************************=
*****/
> +
> + #define MVE_CHROMA_FORMAT_420 (0x1)
> +
> +/* format bitfield: */
> +#define MVE_FORMAT_BF_C  (0) /* 3 bits, chroma subsampling   */
> +#define MVE_FORMAT_BF_B  (4) /* 4 bits, max bitdepth minus 8 */
> +#define MVE_FORMAT_BF_N  (8) /* 2 bits, number of planes     */
> +#define MVE_FORMAT_BF_V (12) /* 2 bits, format variant       */
> +/* formats: */
> +#define MVE_FORMAT_YUV420_I420=09((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_=
BF_C) | \
> +=09=09=09=09((8 - 8) << MVE_FORMAT_BF_B) | \
> +=09=09=09=09(3 << MVE_FORMAT_BF_N) | \
> +=09=09=09=09(0 << MVE_FORMAT_BF_V))
> +
> +#define MVE_FORMAT_YUV420_NV12=09((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_=
BF_C) | \
> +=09=09=09=09((8 - 8) << MVE_FORMAT_BF_B) | \
> +=09=09=09=09(2 << MVE_FORMAT_BF_N) | \
> +=09=09=09=09(0 << MVE_FORMAT_BF_V))
> +
> +#define MVE_FORMAT_YUV420_NV21=09((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_=
BF_C) | \
> +=09=09=09=09((8 - 8) << MVE_FORMAT_BF_B) | \
> +=09=09=09=09(2 << MVE_FORMAT_BF_N) | \
> +=09=09=09=09(1 << MVE_FORMAT_BF_V))
> +
> +#endif /* __MALI_VPU_PROTOCOL_DEF_V3_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> new file mode 100644
> index 0000000000000..9bcb3a73a582e
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mm.h>
> +#include <linux/string.h>
> +#include <media/v4l2-common.h>
> +
> +#include "mali-vpu-session.h"
> +#include "mali-vpu-dec.h"
> +#include "mali-vpu-variant.h"
> +
> +static int mali_vpu_set_port_fmt(struct mali_vpu_port *port,
> +=09=09=09=09 enum v4l2_buf_type type,
> +=09=09=09=09 u32 width, u32 height)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &port->curr_fmt.fmt.pix_mp;
> +=09const struct mali_vpu_format_desc *fmt_default;
> +=09int ret;
> +
> +=09if (!port->supported_fmts.fmts || !port->supported_fmts.num_fmts)
> +=09=09return -EINVAL;
> +
> +=09fmt_default =3D &port->supported_fmts.fmts[0];
> +
> +=09memset(&port->curr_fmt, 0, sizeof(port->curr_fmt));
> +=09port->curr_fmt.type =3D type;
> +
> +=09if (fmt_default->flags & V4L2_FMT_FLAG_COMPRESSED) {
> +=09=09pix_mp->pixelformat =3D fmt_default->fourcc;
> +=09=09pix_mp->num_planes =3D 1;
> +=09=09pix_mp->width =3D width;
> +=09=09pix_mp->height =3D height;
> +=09=09pix_mp->plane_fmt[0].bytesperline =3D 0;
> +
> +=09=09/*
> +=09=09 * Use one byte per pixel as the default compressed sizeimage,
> +=09=09 * with a minimum of one page, aligned to a page boundary.
> +=09=09 */
> +=09=09pix_mp->plane_fmt[0].sizeimage =3D PAGE_ALIGN(max_t(u32, PAGE_SIZE=
, width * height));
> +=09} else {
> +=09=09ret =3D v4l2_fill_pixfmt_mp(pix_mp, fmt_default->fourcc, width, he=
ight);
> +=09=09if (ret)
> +=09=09=09return ret;

I might have to come back to this code once we have TRY/SET_FMT in place,
meanwhile it seems more like a default setting helper then something that w=
ill
be part of the ioctl interface.

> +=09}
> +
> +=09pix_mp->field =3D V4L2_FIELD_NONE;
> +
> +=09return 0;
> +}
> +
> +static int mali_vpu_set_port_defaults(struct mali_vpu_session *sess)
> +{
> +=09const struct mali_vpu_framesize_caps *fmsz =3D &sess->vpu_dev->varian=
t->frmsz_caps;
> +=09int ret;
> +
> +=09ret =3D mali_vpu_set_port_fmt(&sess->port_src, V4L2_BUF_TYPE_VIDEO_OU=
TPUT_MPLANE,
> +=09=09=09=09    fmsz->width_default, fmsz->height_default);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return mali_vpu_set_port_fmt(&sess->port_dst, V4L2_BUF_TYPE_VIDEO_CAP=
TURE_MPLANE,
> +=09=09=09=09    fmsz->width_default, fmsz->height_default);
> +}
> +
> +int mali_vpu_session_init(struct mali_vpu_session *sess)
> +{
> +=09int ret;
> +
> +=09if (sess->role !=3D MALI_VPU_DECODER)
> +=09=09return -EINVAL;
> +
> +=09mali_vpu_session_init_dec(sess);
> +
> +=09ret =3D mali_vpu_set_port_defaults(sess);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return 0;
> +}
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.h
> index 7166c53236f1a..a2778ca496381 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
> @@ -6,21 +6,39 @@
>  #ifndef __MALI_VPU_SESSION_H__
>  #define __MALI_VPU_SESSION_H__
> =20
> +#include <linux/videodev2.h>
>  #include <media/v4l2-fh.h>
> =20
>  #include "mali-vpu-device.h"
> +#include "mali-vpu-formats.h"
> +
> +/**
> + * struct mali_vpu_port - format state of a src/dst queue in a session.
> + * @curr_fmt: V4L2 format currently configured for the port
> + * @supported_fmts: List of format descriptors supported by the queue.
> + */
> +struct mali_vpu_port {
> +=09struct v4l2_format=09=09curr_fmt;
> +=09struct mali_vpu_format_list=09supported_fmts;
> +};
> =20
>  /**
>   * struct mali_vpu_session - holds per session state and resources.
>   * @vpu_dev: Reference to the parent device structure.
>   * @role: Role of this session.
> + * @port_src: Source (OUTPUT) port for this session.
> + * @port_dst: Destination (CAPTURE) port for this session.
>   * @fh: V4L2 file handle for this session.
>   */
>  struct mali_vpu_session {
>  =09struct mali_vpu_dev=09=09*vpu_dev;
>  =09enum mali_vpu_session_role=09role;
> +=09struct mali_vpu_port=09=09port_src;
> +=09struct mali_vpu_port=09=09port_dst;

Ok, its time to comment, src_port and dst_port is a lot easier to read imho=
.

> =20
>  =09struct v4l2_fh=09=09fh;
>  };
> =20
> +int mali_vpu_session_init(struct mali_vpu_session *sess);
> +
>  #endif /* __MALI_VPU_SESSION_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b=
/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> index 36509d6a1c5d5..7b04b51eeedc2 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> @@ -4,18 +4,81 @@
>   */
> =20
>  #include <linux/array_size.h>
> +#include <linux/videodev2.h>
> =20
> +#include "mali-vpu-formats.h"
> +#include "mali-vpu-protocol-def-v3.h"
>  #include "mali-vpu-variant.h"
> =20
>  #define MALI_VPU_HW_PID_V76 0x56627
> =20
> +#define MALI_V76_MAX_FRAME_WIDTH 8192
> +#define MALI_V76_MAX_FRAME_HEIGHT 8192
> +#define MALI_V76_MIN_FRAME_WIDTH 2
> +#define MALI_V76_MIN_FRAME_HEIGHT 2
> +#define MALI_V76_DEFAULT_FRAME_WIDTH 640
> +#define MALI_V76_DEFAULT_FRAME_HEIGHT 480
> +
>  static const char * const mali_v76_rst_names[] =3D {
>  =09"warm",
>  };
> =20
> +static const struct mali_vpu_format_desc mali_v76_dec_src_fmts[] =3D {
> +=09{
> +=09=09.fourcc=09=09=3D V4L2_PIX_FMT_H264,
> +=09=09.mve_frame_fmt=09=3D 0,
> +=09=09.codec_fmt=09=3D MALI_VPU_FORMAT_CODEC_H264,
> +=09=09.flags=09=09=3D V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOL=
UTION,
> +=09},
> +};
> +
> +static const struct mali_vpu_format_desc mali_v76_dec_dst_fmts[] =3D {
> +=09{
> +=09=09.fourcc=09=09=3D V4L2_PIX_FMT_YUV420M,
> +=09=09.mve_frame_fmt=09=3D MVE_FORMAT_YUV420_I420,
> +=09=09.codec_fmt=09=3D 0,
> +=09=09.flags=09=09=3D 0,
> +=09},
> +=09{
> +=09=09.fourcc=09=09=3D V4L2_PIX_FMT_NV12M,
> +=09=09.mve_frame_fmt=09=3D MVE_FORMAT_YUV420_NV12,
> +=09=09.codec_fmt=09=3D 0,
> +=09=09.flags=09=09=3D 0,
> +=09},
> +=09{
> +=09=09.fourcc=09=09=3D V4L2_PIX_FMT_NV21M,
> +=09=09.mve_frame_fmt=09=3D MVE_FORMAT_YUV420_NV21,
> +=09=09.codec_fmt=09=3D 0,
> +=09=09.flags=09=09=3D 0,
> +=09},
> +};
> +
>  const struct mali_vpu_variant mali_vpu_v76_variant =3D {
>  =09.expected_hw_pid =3D MALI_VPU_HW_PID_V76,
> =20
>  =09.rst_names =3D mali_v76_rst_names,
>  =09.num_rsts =3D ARRAY_SIZE(mali_v76_rst_names),
> +
> +=09.fmt_caps =3D {
> +=09=09.dec_src =3D {
> +=09=09=09.fmts =3D mali_v76_dec_src_fmts,
> +=09=09=09.num_fmts =3D ARRAY_SIZE(mali_v76_dec_src_fmts),
> +=09=09},
> +=09=09.dec_dst =3D {
> +=09=09=09.fmts =3D mali_v76_dec_dst_fmts,
> +=09=09=09.num_fmts =3D ARRAY_SIZE(mali_v76_dec_dst_fmts),
> +=09=09},
> +=09},
> +=09.frmsz_caps =3D {
> +=09=09.stepwise =3D {
> +=09=09=09.min_width =3D MALI_V76_MIN_FRAME_WIDTH,
> +=09=09=09.max_width =3D MALI_V76_MAX_FRAME_WIDTH,
> +=09=09=09.step_width =3D 2,
> +=09=09=09.min_height =3D MALI_V76_MIN_FRAME_HEIGHT,
> +=09=09=09.max_height =3D MALI_V76_MAX_FRAME_HEIGHT,
> +=09=09=09.step_height =3D 2,
> +=09=09},

Are you sure this will be the same for all codecs and all formats?

> +=09=09.width_default =3D MALI_V76_DEFAULT_FRAME_WIDTH,
> +=09=09.height_default =3D MALI_V76_DEFAULT_FRAME_HEIGHT,
> +=09},
>  };
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> index dadfd686275db..a46c25a94f18b 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> @@ -7,17 +7,47 @@
>  #define __MALI_VPU_VARIANT_H__
> =20
>  #include <linux/types.h>
> +#include <linux/videodev2.h>
> +
> +#include "mali-vpu-formats.h"
> +
> +/**
> + * struct mali_vpu_framesize_caps - Variant-specific frame size capabili=
ty.
> + * @stepwise: Stepwise frame size limits and increments supported by the=
 hardware.
> + * @width_default: Default width used when userspace does not request on=
e.
> + * @height_default: Default height used when userspace does not request =
one.
> + */
> +struct mali_vpu_framesize_caps {
> +=09struct v4l2_frmsize_stepwise stepwise;
> +=09u32 width_default;
> +=09u32 height_default;
> +};
> +
> +/**
> + * struct mali_vpu_format_caps - Pixel/coded format capability tables.
> + * @dec_src: List of formats supported on decoder OUTPUT queue (compress=
ed bitstream in).
> + * @dec_dst: List of formats supported on decoder CAPTURE queue (decoded=
 raw frames).
> + */
> +struct mali_vpu_format_caps {
> +=09const struct mali_vpu_format_list dec_src;
> +=09const struct mali_vpu_format_list dec_dst;

Strange naming, perhaps src_formats/dst_formats?

> +};
> =20
>  /**
>   * struct mali_vpu_variant - Variant-specific hardware capability descri=
ptor.
>   * @rst_names: Array of reset control names for this variant.
>   * @num_rsts: Number of reset controls for this variant.
>   * @expected_hw_pid: Expected hardware product ID read from the version =
register.
> + * @fmt_caps: Format capability tables for encode/decode paths.
> + * @frmsz_caps: Frame dimension limits and defaults.
>   */
>  struct mali_vpu_variant {
>  =09const char * const *rst_names;
>  =09unsigned int num_rsts;
>  =09u32 expected_hw_pid;
> +
> +=09struct mali_vpu_format_caps=09fmt_caps;
> +=09struct mali_vpu_framesize_caps=09frmsz_caps;
>  };
> =20
>  extern const struct mali_vpu_variant mali_vpu_v76_variant;
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/driv=
ers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> index 7a169b7b14bf3..13468c6baba76 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> @@ -37,8 +37,15 @@ static int mali_vpu_open(struct file *filp)
>  =09v4l2_fh_init(&sess->fh, vdev);
>  =09v4l2_fh_add(&sess->fh, filp);
> =20
> +=09ret =3D mali_vpu_session_init(sess);
> +=09if (ret)
> +=09=09goto err_v4l2_fh_deinit;
> +
>  =09return 0;
> =20
> +err_v4l2_fh_deinit:
> +=09v4l2_fh_del(&sess->fh, filp);
> +=09v4l2_fh_exit(&sess->fh);
>  err_free_sess:
>  =09kfree(sess);
>  =09return ret;

--=-x5a1wcjL9jf38bTSf9aZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9cewAKCRDZQZRRKWBy
9MSpAP0eSHQ+3hy7zpRxGVr4rQcqja2hn0rjTXuVfuEeMp3buQEAruHvL0WkcAMK
uFbRUCy3Umn8MWJbxN2+mssZsaaRDQM=
=+GQR
-----END PGP SIGNATURE-----

--=-x5a1wcjL9jf38bTSf9aZ--
