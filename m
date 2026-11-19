Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122385;
	b=KU0pNfGSOVD30HFPMsfqZ+qxRS6pZDS6htyDTsi8cVPfaC7FnhzNATO4rKOvTXJEQylk
	 uiEDDUY8VWlHSaOqmiIsPiO8B4wO/gesBb0Nh56bXxl3HmRm6mMi+sYq5ChFRlA5Vavrv
	 1AD8a6/JX50EIEqew7IU/kcYsp8ArF+HkXMjPjjgeKeA1w0ot/ekkRS7naK5uf4QeWF5n
	 4Ig4oCjd/HCYKKs2OIJ8Hj6M90ZGRuCa+P55iHV1kofJnCnlMGOiapPIdOD3I6Mh4Szd4
	 C4pKJUgBTflNphcb9c8acpg4BSqveICLugPAsgRp/uVKcIZMsXko8eddZIIoAU4JYxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=vucnUG/Dhgqx+NQa1tD8LlCK/y03WjamoKt/sY1T+RQ=;
	b=mj4s2YyLDAjkGDyT645pFtYdIcb5uc0LRKVOCiKTL4KiqOQan3vvzRsR677ewd8DAb+m
	 9VdqWfzS6DelKo/tXVgaIZZNyEQccDWwlzubYvdUMS0v4O0aYuIG5hNRfY0uAVBno0gV9
	 +WILRvL5EVQABFWjZddfot1K1VfM+tIgEYTIde3p5dluGDazYAPILJKY9kW5aoCzGiz+M
	 TXQQ+8QrGLmEXHHZYqqLqkqEey79nxJiBIOTdRRNIyTkF8BAeSLuqquPTzg9nKqqVugFD
	 lPZbBniIHe6DukYpTqW+DDrMGnmbKXt6uh59JizKtSDU34L+gqMv5+Te/rFWW52oHDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N9UwkbgY;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D24B606A325
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 21:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D24B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N9UwkbgY
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-921367ef6b3so523626d6.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 13:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795122383; x=1795727183; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vucnUG/Dhgqx+NQa1tD8LlCK/y03WjamoKt/sY1T+RQ=;
        b=N9UwkbgYDsf7MnwBnWUhj/LGFvXd8oiDqaPOjCe1MWLQNQdBLnQSR6OHUT0P29PmMe
         fulqbhDIg60bhzUCpwb9H1X2yjeZbaZ0WlGAWVs9gs1RMJRz/fVAO7FVVp9ojNjhQQRo
         UHVHeeKTzX4OljF5hwVJK8uRf/NQtKgyf3y9b6Z+a1nnZjLTqRjFcr5nUcH2tuSXVfHu
         SBOvEdJ+b9aN0zPT7hwD4V0/naLLOFfGHXU8jliyrINtspsJPaPeiXTHFSCQzmQwao5o
         F2A71h2Lp4QESqPtwUrEBGM77uUJp0KEFf+rNhRA6U7P3GvIk+ez2ZmKfLURCIcCxFWx
         0nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122383; x=1795727183;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vucnUG/Dhgqx+NQa1tD8LlCK/y03WjamoKt/sY1T+RQ=;
        b=lUDzRiNP3UNR+7612sq2+JfUg2mg+VCRvpr/aiwjgUENx4u/W07pnYlEVM8eF9IZtP
         +ovPG9htrpywIScpb0ozebkkZD+7638sEqJ1uYtfK6txDamju/W+8V6AraoAaHQADbuS
         +ieMNf3gJldregPjkDCqqQB9PDliXg17TGE1nKBRXEZpE2NsRaXks0QCesq4FXk112yw
         X5xobZ+M3U2Izt0YjXQHzoeZZifGGmUq/EgAZG2GAf1Lw7bC03qaqo3C0T1YecFY00nG
         Qt7RCLq0EOh1oxE5ns7L/AMm3lY8wC57tYY5LSxN6aJjhYM6tz8v+nNyw2KRmTb0wXyY
         Ivkw==
X-Forwarded-Encrypted: i=1; AL+hErGRU85Ak60LKbqRNATr5C3vmHwPEsJZZ2DwOKOzzMwIoRmY31O8sInnKWR0/96goDPM4C7fj7yaPDee5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+01SpWbirbMXi3ohHE8zMmMgt8pf6j09tgQla8sGYixy5Afj1v
	73scu/gf7qh4zmSOQNoS9z8V5dGrJBaXHUYSKOqv/6Ar6W5T2lmc8eQF/SoQ96WyJoo=
X-Gm-Gg: AZFdTZcbl0pJnvBG4QNZIPYzsXlfHsMJzZJzM1fJ1vbW3bpuizT4SCyVyxhi7OelEX1
	1Qm4hEjvGt0mzni3IgwKh9gqb/XDf3qeVoqg9UuWAeNSRQ51yPr/me/5TcDuS/SHov/UU98IjcU
	GLoSnujqFGo5lHpwCnKiRpeEgWU3r48AVcCEOuqsulfaePCFDhk/jsM8Y/pIwvBbXnmygpPnHyv
	RSccC+PfBE0tX6v1VhgTNlaB2dKnwvjbreK4xYE4UfxEbnAF/ISFdJKlR3aH8spGFPIjPMbw6SI
	r6NaKAvt+U6EJHXZq+rDes51tf5Ee7c8OeWoHJA0f/bO2IoVY2wl5KbgrNrl9EWoFejTcnAnmMm
	U3yPWomZdvlBZdI37Xqqc7kMAdR3OaBEs0QEqTxzLNdcEc0F/2FfruVmrHQ0u2D5LhHDDaVOG5z
	PqIdjkFSmcu8Z3BSsOdal/eUOXfnwsjzdVppf3T+9EEkYRhz/4+MWRYI92vEwghNcF7/NKnD7j6
	h8x4vuDeL9vqZK6gTUXPNm5W/xwzdM2NqCQRAv+uaPYAiVtDPT02PdeWdtqBYzU6vRew3afAeh9
	buy8Th37eDPuDN/WowKWbNxICUlSElavxCnLMfalcdHZRRkvAIHJqLhQ
X-Received: by 2002:a05:6214:8587:10b0:921:21d8:9a37 with SMTP id 6a1803df08f44-92134b4895amr12148686d6.51.1795122382719;
        Thu, 19 Nov 2026 13:06:22 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a24aa8sm8062686d6.42.2026.11.19.13.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:06:21 -0800 (PST)
Message-ID: <0cb2cae4075d3854ebb9c051d169ca121a8a360d.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 08/28] media: mali-vpu: register V76 decoder
 controls and introduce UAPI controls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 16:06:20 -0500
In-Reply-To: <20261119153758.1426673-9-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-9-charvi.mehta@arm.com>
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
	protocol="application/pgp-signature"; boundary="=-v1z0u0L414TDYIEjVr9u"
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

--=-v1z0u0L414TDYIEjVr9u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> Register a V4L2 control handler for each decoder session and attach it to
> the session file handle. Describe the controls supported by V76 in the
> variant data and maintain their values in per-session state.
>=20
> Add Mali VPU userspace controls for NALU layout, stream escaping,
> intermediate buffer size, stream-header handling, frame reordering and
> firmware debug output. Also expose the standard read-only
> V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control.

I would strongly recommend to keep each vendor control in its own patch. Th=
ese
are API, and they need documentation. In practice, you'll prefer to not
introduce vendor control as a first introduction of your driver, its just a=
 bad
idea. You completely missed Documentation/=20

>=20
> Stage control values set before the firmware is ready and reject changes =
to
> non-dynamic controls while the OUTPUT queue is streaming. Allow userspace
> to subscribe to control events.
>=20
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> ---
>  drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
>  .../platform/arm/mali-vpu/mali-vpu-controls.c | 339 ++++++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-controls.h |  71 ++++
>  .../platform/arm/mali-vpu/mali-vpu-dec.c      |  44 +++
>  .../platform/arm/mali-vpu/mali-vpu-dec.h      |   6 +
>  .../platform/arm/mali-vpu/mali-vpu-session.c  |  15 +
>  .../platform/arm/mali-vpu/mali-vpu-session.h  |  14 +
>  .../arm/mali-vpu/mali-vpu-variant-v76.c       |  99 +++++
>  .../platform/arm/mali-vpu/mali-vpu-variant.h  |  13 +
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |  19 +
>  .../uapi/linux/media/arm/mali-vpu-config.h    |  47 +++
>  include/uapi/linux/v4l2-controls.h            |   6 +
>  12 files changed, 675 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-controls=
.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-controls=
.h
>  create mode 100644 include/uapi/linux/media/arm/mali-vpu-config.h
>=20
> diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media=
/platform/arm/mali-vpu/Makefile
> index 1dc62621d9dc0..95bad821eb466 100644
> --- a/drivers/media/platform/arm/mali-vpu/Makefile
> +++ b/drivers/media/platform/arm/mali-vpu/Makefile
> @@ -7,6 +7,7 @@ mali-vpu-objs :=3D mali-vpu-probe.o \
>  =09=09mali-vpu-dec.o \
>  =09=09mali-vpu-buffer.o \
>  =09=09mali-vpu-vb2.o \
> -=09=09mali-vpu-formats.o
> +=09=09mali-vpu-formats.o \
> +=09=09mali-vpu-controls.o
> =20
>  obj-$(CONFIG_VIDEO_MALI_VPU) +=3D mali-vpu.o
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c b/dr=
ivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
> new file mode 100644
> index 0000000000000..d4921eddf0fcf
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/limits.h>
> +#include <linux/slab.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include <linux/media/arm/mali-vpu-config.h>
> +
> +#include "mali-vpu-controls.h"
> +#include "mali-vpu-session.h"
> +
> +static int mali_vpu_ctrl_slot_from_cid(const struct mali_vpu_session *se=
ss,
> +=09=09=09=09       u32 cid, u32 *slot)
> +{
> +=09const struct mali_vpu_ctrl_state *ctrl_state =3D sess->ctrls_state;
> +=09u32 i;
> +
> +=09for (i =3D 0; i < sess->num_ctrls_caps; i++) {
> +=09=09if (ctrl_state[i].cid =3D=3D cid) {
> +=09=09=09*slot =3D i;
> +=09=09=09return 0;
> +=09=09}
> +=09}
> +
> +=09return -EINVAL;
> +}
> +
> +static int mali_vpu_get_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +=09struct mali_vpu_session *sess =3D container_of(ctrl->handler,
> +=09=09=09=09=09=09     struct mali_vpu_session,
> +=09=09=09=09=09=09     ctrl_handler);
> +
> +=09switch (ctrl->id) {
> +=09case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> +=09=09if (sess->role !=3D MALI_VPU_DECODER)
> +=09=09=09return -EINVAL;
> +=09=09ctrl->val =3D sess->min_buffers_required;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int mali_vpu_apply_or_stage_ctrl(struct mali_vpu_session *sess,
> +=09=09=09=09=09const struct mali_vpu_ctrl_desc *desc,
> +=09=09=09=09=09struct mali_vpu_ctrl_state *state,
> +=09=09=09=09=09s64 value)
> +{
> +=09bool staged;
> +=09int ret;
> +
> +=09staged =3D !sess->is_fw_ready;
> +
> +=09if (!staged) {
> +=09=09ret =3D desc->set(sess, state->cid, value);
> +=09=09if (ret)
> +=09=09=09return ret;
> +=09}
> +
> +=09state->value =3D value;
> +=09state->client_set =3D true;
> +=09state->is_staged =3D staged;
> +
> +=09return 0;
> +}
> +
> +static int mali_vpu_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +=09struct mali_vpu_session *sess =3D container_of(ctrl->handler,
> +=09=09=09=09=09=09     struct mali_vpu_session,
> +=09=09=09=09=09=09     ctrl_handler);
> +=09const struct mali_vpu_ctrl_desc *desc;
> +=09struct mali_vpu_ctrl_state *state;
> +=09struct vb2_queue *src_vq;
> +=09u32 slot;
> +=09int ret;
> +
> +=09ret =3D mali_vpu_ctrl_slot_from_cid(sess, ctrl->id, &slot);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09desc =3D &sess->ctrls_caps[slot];
> +=09state =3D &sess->ctrls_state[slot];
> +
> +=09src_vq =3D v4l2_m2m_get_src_vq(sess->m2m_ctx);
> +=09if (vb2_is_streaming(src_vq) &&
> +=09    !(desc->flags & MALI_VPU_CTRL_FLAG_DYNAMIC))
> +=09=09return -EBUSY;
> +
> +=09return mali_vpu_apply_or_stage_ctrl(sess, desc, state, ctrl->val);
> +}
> +
> +static const struct v4l2_ctrl_ops mali_vpu_ctrl_ops =3D {
> +=09.g_volatile_ctrl =3D mali_vpu_get_volatile_ctrl,
> +=09.s_ctrl          =3D mali_vpu_set_ctrl,
> +};
> +
> +static int mali_vpu_register_control(struct mali_vpu_session *sess,
> +=09=09=09=09     const struct mali_vpu_ctrl_desc *d)
> +{
> +=09struct v4l2_ctrl *ctrl;
> +
> +=09if (d->is_custom) {
> +=09=09struct v4l2_ctrl_config cfg =3D {
> +=09=09=09.ops =3D &mali_vpu_ctrl_ops,
> +=09=09=09.id =3D d->cid,
> +=09=09=09.name =3D d->name,
> +=09=09=09.type =3D d->type,
> +=09=09=09.min =3D d->min_val,
> +=09=09=09.max =3D d->max_val,
> +=09=09=09.step =3D (d->type =3D=3D V4L2_CTRL_TYPE_MENU) ? 0 : d->step_or=
_mask,
> +=09=09=09.def =3D d->default_val,
> +=09=09=09.menu_skip_mask =3D (d->type =3D=3D V4L2_CTRL_TYPE_MENU) ? ~(d-=
>step_or_mask) : 0,
> +=09=09=09.qmenu =3D d->qmenu,
> +=09=09};
> +
> +=09=09ctrl =3D v4l2_ctrl_new_custom(&sess->ctrl_handler, &cfg, NULL);
> +
> +=09} else if (d->type =3D=3D V4L2_CTRL_TYPE_MENU) {
> +=09=09ctrl =3D v4l2_ctrl_new_std_menu(&sess->ctrl_handler,
> +=09=09=09=09=09      &mali_vpu_ctrl_ops,
> +=09=09=09=09=09      d->cid,
> +=09=09=09=09=09      d->max_val,
> +=09=09=09=09=09      ~(d->step_or_mask),
> +=09=09=09=09=09      d->default_val);
> +=09} else {
> +=09=09ctrl =3D v4l2_ctrl_new_std(&sess->ctrl_handler,
> +=09=09=09=09=09 &mali_vpu_ctrl_ops,
> +=09=09=09=09=09 d->cid,
> +=09=09=09=09=09 d->min_val,
> +=09=09=09=09=09 d->max_val,
> +=09=09=09=09=09 d->step_or_mask,
> +=09=09=09=09=09 d->default_val);
> +=09}
> +
> +=09if (!ctrl || sess->ctrl_handler.error)
> +=09=09return sess->ctrl_handler.error ? sess->ctrl_handler.error : -EINV=
AL;
> +
> +=09return 0;
> +}
> +
> +static int mali_vpu_validate_ctrl_caps(const struct mali_vpu_session *se=
ss)
> +{
> +=09u32 i, j;
> +
> +=09if (!sess->ctrls_caps || !sess->num_ctrls_caps) {
> +=09=09dev_err(sess->vpu_dev->dev, "invalid ctrl caps structure\n");
> +=09=09return -EINVAL;
> +=09}
> +
> +=09for (i =3D 0; i < sess->num_ctrls_caps; i++) {
> +=09=09const struct mali_vpu_ctrl_desc *d =3D &sess->ctrls_caps[i];
> +
> +=09=09if (!d->cid || !d->set)
> +=09=09=09return -EINVAL;
> +
> +=09=09if (d->min_val > d->max_val)
> +=09=09=09return -EINVAL;
> +
> +=09=09if (d->default_val < d->min_val || d->default_val > d->max_val)
> +=09=09=09return -EINVAL;
> +
> +=09=09if (d->is_custom && !d->name)
> +=09=09=09return -EINVAL;
> +
> +=09=09if (d->is_custom && d->type =3D=3D V4L2_CTRL_TYPE_MENU && !d->qmen=
u)
> +=09=09=09return -EINVAL;
> +
> +=09=09/* Reject duplicate entries */
> +=09=09for (j =3D i + 1; j < sess->num_ctrls_caps; j++) {
> +=09=09=09if (d->cid =3D=3D sess->ctrls_caps[j].cid)
> +=09=09=09=09return -EINVAL;
> +=09=09}
> +=09}
> +
> +=09return 0;
> +}
> +
> +int mali_vpu_ctrls_init(struct mali_vpu_session *sess)
> +{
> +=09const struct mali_vpu_ctrl_desc *ctrls_cap =3D sess->ctrls_caps;
> +=09struct mali_vpu_ctrl_state *ctrl_state;
> +=09struct v4l2_ctrl *volatile_ctrl;
> +=09u32 i;
> +=09int ret;
> +
> +=09ret =3D mali_vpu_validate_ctrl_caps(sess);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09sess->ctrls_state =3D kcalloc(sess->num_ctrls_caps, sizeof(*sess->ctr=
ls_state), GFP_KERNEL);
> +=09if (!sess->ctrls_state)
> +=09=09return -ENOMEM;
> +
> +=09/*
> +=09 * Adding 1 to num_ctrls to include
> +=09 * V4L2_CID_MIN_BUFFERS_FOR_CAPTURE for decoder
> +=09 */
> +=09ret =3D v4l2_ctrl_handler_init(&sess->ctrl_handler, sess->num_ctrls_c=
aps + 1);
> +=09if (ret)
> +=09=09goto err_free_state;
> +
> +=09sess->ctrl_handler.lock =3D &sess->vq_lock;
> +
> +=09ctrl_state =3D sess->ctrls_state;
> +
> +=09for (i =3D 0; i < sess->num_ctrls_caps; i++) {
> +=09=09const struct mali_vpu_ctrl_desc *d =3D &ctrls_cap[i];
> +
> +=09=09ctrl_state[i].cid =3D d->cid;
> +=09=09ctrl_state[i].value =3D d->default_val;
> +=09=09ctrl_state[i].client_set =3D false;
> +=09=09ctrl_state[i].is_staged =3D false;
> +
> +=09=09ret =3D mali_vpu_register_control(sess, d);
> +=09=09if (ret)
> +=09=09=09goto err_free_handler;
> +=09}
> +
> +=09if (sess->role =3D=3D MALI_VPU_DECODER) {
> +=09=09volatile_ctrl =3D v4l2_ctrl_new_std(&sess->ctrl_handler,
> +=09=09=09=09=09=09  &mali_vpu_ctrl_ops,
> +=09=09=09=09=09=09  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> +=09=09=09=09=09=09  1, 32, 1, 1);
> +=09} else {
> +=09=09ret =3D -EINVAL;
> +=09=09goto err_free_handler;
> +=09}
> +
> +=09if (!volatile_ctrl || sess->ctrl_handler.error) {
> +=09=09ret =3D sess->ctrl_handler.error ? sess->ctrl_handler.error : -EIN=
VAL;
> +=09=09goto err_free_handler;
> +=09}
> +
> +=09volatile_ctrl->flags |=3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_RE=
AD_ONLY;
> +
> +=09sess->fh.ctrl_handler =3D &sess->ctrl_handler;
> +
> +=09return 0;
> +
> +err_free_handler:
> +=09v4l2_ctrl_handler_free(&sess->ctrl_handler);
> +
> +err_free_state:
> +=09kfree(sess->ctrls_state);
> +=09sess->ctrls_state =3D NULL;
> +=09return ret;
> +}
> +
> +void mali_vpu_ctrls_cleanup(struct mali_vpu_session *sess)
> +{
> +=09v4l2_ctrl_handler_free(&sess->ctrl_handler);
> +=09kfree(sess->ctrls_state);
> +=09sess->ctrls_state =3D NULL;
> +=09sess->fh.ctrl_handler =3D NULL;
> +}
> +
> +int mali_vpu_apply_staged_controls(struct mali_vpu_session *sess)
> +{
> +=09u32 i;
> +=09int ret;
> +
> +=09if (!sess->is_fw_ready)
> +=09=09return -EINVAL;
> +
> +=09for (i =3D 0; i < sess->num_ctrls_caps; i++) {
> +=09=09const struct mali_vpu_ctrl_desc *d =3D &sess->ctrls_caps[i];
> +=09=09struct mali_vpu_ctrl_state *s =3D &sess->ctrls_state[i];
> +
> +=09=09if (!s->client_set || !s->is_staged)
> +=09=09=09continue;
> +
> +=09=09ret =3D mali_vpu_apply_or_stage_ctrl(sess, d, s, s->value);
> +=09=09if (ret)
> +=09=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
> +int mali_vpu_ctrl_set_nalu_format(struct mali_vpu_session *sess, u32 cid=
,
> +=09=09=09=09  s64 value)
> +{
> +=09if (cid !=3D V4L2_CID_MALI_VPU_NALU_FORMAT)
> +=09=09return -EINVAL;
> +
> +=09(void)sess;
> +=09(void)value;
> +=09return 0;
> +}
> +
> +int mali_vpu_ctrl_set_intbuf_size(struct mali_vpu_session *sess, u32 cid=
,
> +=09=09=09=09  s64 value)
> +{
> +=09if (cid !=3D V4L2_CID_MALI_VPU_INTBUF_SIZE || value < 0 || value > IN=
T_MAX)
> +=09=09return -EINVAL;
> +
> +=09(void)sess;
> +=09(void)value;
> +=09return 0;
> +}
> +
> +int mali_vpu_ctrl_set_stream_escaping(struct mali_vpu_session *sess, u32=
 cid,
> +=09=09=09=09      s64 value)
> +{
> +=09if (cid !=3D V4L2_CID_MALI_VPU_STREAM_ESCAPING)
> +=09=09return -EINVAL;
> +
> +=09if (value =3D=3D -1)
> +=09=09return 0; /* tristate no-op */
> +
> +=09if (value !=3D 0 && value !=3D 1)
> +=09=09return -EINVAL;
> +
> +=09(void)sess;
> +=09(void)value;
> +=09return 0;
> +}
> +
> +int mali_vpu_ctrl_set_host_print_enable(struct mali_vpu_session *sess, u=
32 cid,
> +=09=09=09=09=09s64 value)
> +{
> +=09if (cid !=3D V4L2_CID_MALI_VPU_HOST_PRINT_ENABLE)
> +=09=09return -EINVAL;
> +
> +=09if (value !=3D 0 && value !=3D 1)
> +=09=09return -EINVAL;
> +
> +=09(void)sess;
> +=09(void)value;
> +=09return 0;
> +}
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.h b/dr=
ivers/media/platform/arm/mali-vpu/mali-vpu-controls.h
> new file mode 100644
> index 0000000000000..d7f5898963478
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_CONTROLS_H__
> +#define __MALI_VPU_CONTROLS_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +#include <media/v4l2-ctrls.h>
> +
> +struct mali_vpu_session;
> +
> +enum mali_vpu_ctrl_flags {
> +=09MALI_VPU_CTRL_FLAG_DYNAMIC=09=3D BIT(0),
> +};
> +
> +/**
> + * struct mali_vpu_ctrl_desc - static description of one driver control.
> + * @cid: V4L2 control ID.
> + * @type: V4L2 control type.
> + * @name: Control name used for custom registration. NULL for standard c=
ontrols.
> + * @qmenu: Menu labels for V4L2_CTRL_TYPE_MENU custom controls.
> + * @min_val: Minimum allowed value for this control.
> + * @max_val: Maximum allowed value for this control.
> + * @default_val: Default value for this control at session init.
> + * @step_or_mask: Step for integer controls, or enabled-item mask for me=
nu controls.
> + * @is_custom: Flag to indicate if a control is a custom Mali VPU contro=
l.
> + * @flags: Driver-specific behavior flags from enum mali_vpu_ctrl_flags.
> + * @set: Setter callback invoked on client control changes, to apply val=
ue to firmware.
> + */
> +struct mali_vpu_ctrl_desc {
> +=09u32 cid;
> +=09enum v4l2_ctrl_type type;
> +=09const char *name;
> +=09const char * const *qmenu;
> +=09s64 min_val;
> +=09s64 max_val;
> +=09s64 default_val;
> +=09u64 step_or_mask;
> +=09bool is_custom;
> +=09enum mali_vpu_ctrl_flags flags;
> +=09int (*set)(struct mali_vpu_session *sess, u32 cid, s64 value);
> +};
> +
> +/**
> + * struct mali_vpu_ctrl_state - per-session runtime state of one driver =
control.
> + * @cid: V4L2 control ID.
> + * @value: Last accepted value for the control (from userspace or defaul=
t at init).
> + * @client_set: True if userspace explicitly set this control at least o=
nce.
> + * @is_staged: True if value is accepted but not yet sent to firmware.
> + */
> +struct mali_vpu_ctrl_state {
> +=09u32 cid;
> +=09s64 value;
> +=09bool client_set;
> +=09bool is_staged;
> +};
> +
> +int mali_vpu_ctrls_init(struct mali_vpu_session *sess);
> +void mali_vpu_ctrls_cleanup(struct mali_vpu_session *sess);
> +int mali_vpu_apply_staged_controls(struct mali_vpu_session *sess);
> +
> +/* Common controls setters */
> +int mali_vpu_ctrl_set_nalu_format(struct mali_vpu_session *sess, u32 cid=
, s64 value);
> +int mali_vpu_ctrl_set_intbuf_size(struct mali_vpu_session *sess, u32 cid=
, s64 value);
> +int mali_vpu_ctrl_set_stream_escaping(struct mali_vpu_session *sess, u32=
 cid, s64 value);
> +int mali_vpu_ctrl_set_host_print_enable(struct mali_vpu_session *sess, u=
32 cid, s64 value);
> +
> +#endif /* __MALI_VPU_CONTROLS_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers=
/media/platform/arm/mali-vpu/mali-vpu-dec.c
> index cb6eeee2f04df..7e78c475a4ff3 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
> @@ -3,6 +3,9 @@
>   * Copyright (C) 2026 ARM Limited.
>   */
> =20
> +#include <linux/errno.h>
> +#include <linux/media/arm/mali-vpu-config.h>
> +
>  #include "mali-vpu-dec.h"
>  #include "mali-vpu-session.h"
>  #include "mali-vpu-variant.h"
> @@ -13,4 +16,45 @@ void mali_vpu_session_init_dec(struct mali_vpu_session=
 *sess)
> =20
>  =09sess->port_src.supported_fmts =3D variant_fmts->dec_src;
>  =09sess->port_dst.supported_fmts =3D variant_fmts->dec_dst;
> +
> +=09const struct mali_vpu_control_caps *variant_ctrls =3D &sess->vpu_dev-=
>variant->ctrl_caps;
> +
> +=09sess->ctrls_caps=09=3D variant_ctrls->dec_ctrls;
> +=09sess->num_ctrls_caps=09=3D variant_ctrls->num_dec_ctrls;
> +
> +=09sess->min_buffers_required =3D 3;=09/* For CAPTURE/dst queue */
> +}
> +
> +int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *ses=
s,
> +=09=09=09=09=09    u32 cid, s64 value)
> +{
> +=09if (cid !=3D V4L2_CID_MALI_VPU_IGNORE_STREAM_HEADERS)
> +=09=09return -EINVAL;
> +
> +=09if (value =3D=3D -1)
> +=09=09return 0; /* tristate no-op */
> +
> +=09if (value !=3D 0 && value !=3D 1)
> +=09=09return -EINVAL;
> +
> +=09(void)sess;
> +=09(void)value;
> +=09return 0;
> +}
> +
> +int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u3=
2 cid,
> +=09=09=09=09       s64 value)
> +{
> +=09if (cid !=3D V4L2_CID_MALI_VPU_FRAME_REORDERING)
> +=09=09return -EINVAL;
> +
> +=09if (value =3D=3D -1)
> +=09=09return 0; /* tristate no-op */
> +
> +=09if (value !=3D 0 && value !=3D 1)
> +=09=09return -EINVAL;
> +
> +=09(void)sess;
> +=09(void)value;
> +=09return 0;
>  }
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h b/drivers=
/media/platform/arm/mali-vpu/mali-vpu-dec.h
> index 2514c897587c4..e323b38475c81 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
> @@ -6,8 +6,14 @@
>  #ifndef __MALI_VPU_DEC_H__
>  #define __MALI_VPU_DEC_H__
> =20
> +#include <linux/types.h>
> +
>  struct mali_vpu_session;
> =20
>  void mali_vpu_session_init_dec(struct mali_vpu_session *sess);
> =20
> +/* Decoder controls setters */
> +int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *ses=
s, u32 cid, s64 value);
> +int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u3=
2 cid, s64 value);
> +
>  #endif /* __MALI_VPU_DEC_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> index 6867f51287f48..d1e8680de5556 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> @@ -3,12 +3,14 @@
>   * Copyright (C) 2026 ARM Limited.
>   */
> =20
> +#include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/string.h>
>  #include <media/v4l2-mem2mem.h>
> =20
>  #include "mali-vpu-session.h"
> +#include "mali-vpu-controls.h"
>  #include "mali-vpu-dec.h"
>  #include "mali-vpu-formats.h"
>  #include "mali-vpu-variant.h"
> @@ -76,8 +78,19 @@ int mali_vpu_session_init(struct mali_vpu_session *ses=
s)
>  =09=09goto err_mutex_destroy;
>  =09}
> =20
> +=09sess->is_fw_ready =3D false;
> +
> +=09ret =3D mali_vpu_ctrls_init(sess);
> +=09if (ret) {
> +=09=09dev_err(sess->vpu_dev->dev, "failed to initialise controls: %d\n",=
 ret);
> +=09=09goto err_m2m_ctx_release;
> +=09}
> +
>  =09return 0;
> =20
> +err_m2m_ctx_release:
> +=09v4l2_m2m_ctx_release(sess->m2m_ctx);
> +
>  err_mutex_destroy:
>  =09mutex_destroy(&sess->vq_lock);
>  =09return ret;
> @@ -94,5 +107,7 @@ void mali_vpu_session_cleanup(struct mali_vpu_session =
*sess)
>  =09}
> =20
>  =09mutex_unlock(&sess->vq_lock);
> +
> +=09mali_vpu_ctrls_cleanup(sess);
>  =09mutex_destroy(&sess->vq_lock);
>  }
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.h
> index f8a602cb59006..766912aec0b8e 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
> @@ -8,6 +8,7 @@
> =20
>  #include <linux/mutex.h>
>  #include <linux/videodev2.h>
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fh.h>
> =20
>  #include "mali-vpu-device.h"
> @@ -32,6 +33,12 @@ struct mali_vpu_port {
>   * @port_src: Source (OUTPUT) port for this session.
>   * @port_dst: Destination (CAPTURE) port for this session.
>   * @vq_lock: Mutex lock to serialise per-session queue related ioctls.
> + * @is_fw_ready: True if the firmware is loaded and ready to accept comm=
ands.
> + * @min_buffers_required: Driver-reported minimum buffers for role-speci=
fic queue.
> + * @ctrls_caps: Variant-provided immutable control capability table.
> + * @num_ctrls_caps: Number of entries in @ctrls_caps.
> + * @ctrls_state: Per-session control cache and staging state.
> + * @ctrl_handler: V4L2 control handler bound to this session.
>   * @fh: V4L2 file handle for this session.
>   * @m2m_ctx: V4L2 mem2mem context for this session.
>   */
> @@ -41,6 +48,13 @@ struct mali_vpu_session {
>  =09struct mali_vpu_port=09=09port_src;
>  =09struct mali_vpu_port=09=09port_dst;
>  =09struct mutex=09=09=09vq_lock; /* lock to serialise per-session ioctls=
 */
> +=09bool=09=09=09=09is_fw_ready;
> +=09u32=09=09=09=09min_buffers_required;
> +
> +=09const struct mali_vpu_ctrl_desc *ctrls_caps;
> +=09u32=09=09=09=09num_ctrls_caps;
> +=09struct mali_vpu_ctrl_state=09*ctrls_state;
> +=09struct v4l2_ctrl_handler=09ctrl_handler;
> =20
>  =09struct v4l2_fh=09=09fh;
>  =09struct v4l2_m2m_ctx=09*m2m_ctx;
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b=
/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> index 7b04b51eeedc2..b807f8d888222 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> @@ -4,8 +4,14 @@
>   */
> =20
>  #include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/limits.h>
>  #include <linux/videodev2.h>
> =20
> +#include <linux/media/arm/mali-vpu-config.h>
> +
> +#include "mali-vpu-controls.h"
> +#include "mali-vpu-dec.h"
>  #include "mali-vpu-formats.h"
>  #include "mali-vpu-protocol-def-v3.h"
>  #include "mali-vpu-variant.h"
> @@ -53,6 +59,95 @@ static const struct mali_vpu_format_desc mali_v76_dec_=
dst_fmts[] =3D {
>  =09},
>  };
> =20
> +static const char *const mali_v76_nalu_format_qmenu[] =3D {
> +=09"Start Codes",
> +=09"One NALU Per Buffer",
> +=09"One Byte Length Field",
> +=09"Two Byte Length Field",
> +=09"Four Byte Length Field",
> +=09NULL,
> +};
> +
> +static const struct mali_vpu_ctrl_desc mali_v76_dec_ctrls[] =3D {
> +=09{
> +=09=09.cid =3D V4L2_CID_MALI_VPU_NALU_FORMAT,
> +=09=09.type =3D V4L2_CTRL_TYPE_MENU,
> +=09=09.name =3D "NALU format",
> +=09=09.qmenu =3D mali_v76_nalu_format_qmenu,
> +=09=09.min_val =3D MALI_VPU_NALU_FORMAT_START_CODES,
> +=09=09.max_val =3D MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD,
> +=09=09.default_val =3D MALI_VPU_NALU_FORMAT_START_CODES,
> +=09=09.step_or_mask =3D BIT(MALI_VPU_NALU_FORMAT_START_CODES) |
> +=09=09=09=09BIT(MALI_VPU_NALU_FORMAT_ONE_NALU_PER_BUFFER) |
> +=09=09=09=09BIT(MALI_VPU_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD) |
> +=09=09=09=09BIT(MALI_VPU_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD) |
> +=09=09=09=09BIT(MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD),

This mixes alignment and NAL format. Its historical, but the format is boun=
d to
V4L2_PIX_FMT_H264 and is documented as Annex B. If you want to add somethin=
g
such as AVCc formata instead, you'd need a new pixel format. There is
V4L2_PIX_FMT_H264_SC, but its hill define, nobody knows what it was origina=
lly
suppose to do. Venus (Qualcomm) maps it as if it was the same, perhaps they=
 have
a clue, but I would stay away.

For the alignment, V4L2_CID_MPEG_VIDEO_HEADER_MODE does not cover your 1 bu=
ffer
per nalue case, it only does the split header like OMX IL was doing (someti=
mes,
interoperanility killed OMX).

> +=09=09.is_custom =3D true,
> +=09=09.flags =3D 0,
> +=09=09.set =3D mali_vpu_ctrl_set_nalu_format,
> +=09},
> +=09{
> +=09=09.cid =3D V4L2_CID_MALI_VPU_INTBUF_SIZE,
> +=09=09.type =3D V4L2_CTRL_TYPE_INTEGER,
> +=09=09.name =3D "Internal buffer size",

No general equivalent, and to be fair, that seems like something the driver
should get correctly by itself, I'd say drop.

> +=09=09.min_val =3D 0,
> +=09=09.max_val =3D INT_MAX,
> +=09=09.default_val =3D 0,
> +=09=09.step_or_mask =3D 1,
> +=09=09.is_custom =3D true,
> +=09=09.flags =3D 0,
> +=09=09.set =3D mali_vpu_ctrl_set_intbuf_size,
> +=09},
> +=09{
> +=09=09.cid =3D V4L2_CID_MALI_VPU_STREAM_ESCAPING,

No doc, I suppose it was about emulation bytes. Nobody needs that drop.

> +=09=09.type =3D V4L2_CTRL_TYPE_INTEGER,
> +=09=09.name =3D "Stream Escaping",
> +=09=09.min_val =3D -1,
> +=09=09.max_val =3D 1,
> +=09=09.default_val =3D -1,
> +=09=09.step_or_mask =3D 1,
> +=09=09.is_custom =3D true,
> +=09=09.flags =3D 0,
> +=09=09.set =3D mali_vpu_ctrl_set_stream_escaping,
> +=09},
> +=09{
> +=09=09.cid =3D V4L2_CID_MALI_VPU_HOST_PRINT_ENABLE,

Debugging goes into sysfs or debugfs, drop.

> +=09=09.type =3D V4L2_CTRL_TYPE_BOOLEAN,
> +=09=09.name =3D "Firmware debug prints",
> +=09=09.min_val =3D false,
> +=09=09.max_val =3D true,
> +=09=09.default_val =3D false,
> +=09=09.step_or_mask =3D 1,
> +=09=09.is_custom =3D true,
> +=09=09.flags =3D MALI_VPU_CTRL_FLAG_DYNAMIC,
> +=09=09.set =3D mali_vpu_ctrl_set_host_print_enable,
> +=09},
> +=09{
> +=09=09.cid =3D V4L2_CID_MALI_VPU_IGNORE_STREAM_HEADERS,

If userspace want that, it can just strip the headers itself. Its not like =
a
stateful decoder can work without headers according to the spec. It will al=
ways
break one way or another.

> +=09=09.type =3D V4L2_CTRL_TYPE_INTEGER,
> +=09=09.name =3D "Ignore Stream Headers",
> +=09=09.min_val =3D -1,
> +=09=09.max_val =3D 1,
> +=09=09.default_val =3D -1,
> +=09=09.step_or_mask =3D 1,
> +=09=09.is_custom =3D true,
> +=09=09.flags =3D 0,
> +=09=09.set =3D mali_vpu_ctrl_set_ignore_stream_headers,
> +=09},
> +=09{
> +=09=09.cid =3D V4L2_CID_MALI_VPU_FRAME_REORDERING,

You can thank Samsung, instead you need
V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE and add support for
V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY 0. That will effectively disable
reordering. Some vendors calls this the thumbnail mode to add to the fun.

> +=09=09.type =3D V4L2_CTRL_TYPE_INTEGER,
> +=09=09.name =3D "Frame Reordering",
> +=09=09.min_val =3D -1,
> +=09=09.max_val =3D 1,
> +=09=09.default_val =3D -1,
> +=09=09.step_or_mask =3D 1,
> +=09=09.is_custom =3D true,
> +=09=09.flags =3D 0,
> +=09=09.set =3D mali_vpu_ctrl_set_frame_reordering,
> +=09},
> +};
> +
>  const struct mali_vpu_variant mali_vpu_v76_variant =3D {
>  =09.expected_hw_pid =3D MALI_VPU_HW_PID_V76,
> =20
> @@ -81,4 +176,8 @@ const struct mali_vpu_variant mali_vpu_v76_variant =3D=
 {
>  =09=09.width_default =3D MALI_V76_DEFAULT_FRAME_WIDTH,
>  =09=09.height_default =3D MALI_V76_DEFAULT_FRAME_HEIGHT,
>  =09},
> +=09.ctrl_caps =3D {
> +=09=09.dec_ctrls =3D mali_v76_dec_ctrls,
> +=09=09.num_dec_ctrls =3D ARRAY_SIZE(mali_v76_dec_ctrls),
> +=09},
>  };
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> index a46c25a94f18b..ad20896c90b0f 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  #include <linux/videodev2.h>
> =20
> +#include "mali-vpu-controls.h"
>  #include "mali-vpu-formats.h"
> =20
>  /**
> @@ -33,6 +34,16 @@ struct mali_vpu_format_caps {
>  =09const struct mali_vpu_format_list dec_dst;
>  };
> =20
> +/**
> + * struct mali_vpu_control_caps - Control capability tables per role.
> + * @dec_ctrls: Array of controls supported by the decoder.
> + * @num_dec_ctrls: Number of entries in @dec_ctrls.
> + */
> +struct mali_vpu_control_caps {
> +=09const struct mali_vpu_ctrl_desc *dec_ctrls;
> +=09u32 num_dec_ctrls;
> +};
> +
>  /**
>   * struct mali_vpu_variant - Variant-specific hardware capability descri=
ptor.
>   * @rst_names: Array of reset control names for this variant.
> @@ -40,6 +51,7 @@ struct mali_vpu_format_caps {
>   * @expected_hw_pid: Expected hardware product ID read from the version =
register.
>   * @fmt_caps: Format capability tables for encode/decode paths.
>   * @frmsz_caps: Frame dimension limits and defaults.
> + * @ctrl_caps:  Control capability tables for encode/decode paths.
>   */
>  struct mali_vpu_variant {
>  =09const char * const *rst_names;
> @@ -48,6 +60,7 @@ struct mali_vpu_variant {
> =20
>  =09struct mali_vpu_format_caps=09fmt_caps;
>  =09struct mali_vpu_framesize_caps=09frmsz_caps;
> +=09struct mali_vpu_control_caps=09ctrl_caps;
>  };
> =20
>  extern const struct mali_vpu_variant mali_vpu_v76_variant;
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/driv=
ers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> index dd142527a1a0c..88e706be6705e 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> @@ -8,7 +8,9 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-dev.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-fh.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mem2mem.h>
> @@ -318,6 +320,21 @@ static int mali_vpu_enum_framesizes(struct file *fil=
p, void *fh,
>  =09return 0;
>  }
> =20
> +static int mali_vpu_subscribe_event(struct v4l2_fh *fh, const struct v4l=
2_event_subscription *sub)
> +{
> +=09switch (sub->type) {
> +=09case V4L2_EVENT_CTRL:
> +=09=09return v4l2_ctrl_subscribe_event(fh, sub);
> +=09case V4L2_EVENT_EOS:
> +=09=09return v4l2_event_subscribe(fh, sub, 2, NULL);
> +=09case V4L2_EVENT_SOURCE_CHANGE:
> +=09=09return v4l2_event_subscribe(fh, sub, 2, NULL);
> +
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +}
> +
>  const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec =3D {
>  =09.vidioc_querycap=09=09=3D mali_vpu_querycap,
>  =09.vidioc_enum_fmt_vid_out=09=3D mali_vpu_enum_fmt,
> @@ -337,4 +354,6 @@ const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec =
=3D {
>  =09.vidioc_dqbuf=09=09=09=3D v4l2_m2m_ioctl_dqbuf,
>  =09.vidioc_remove_bufs=09=09=3D v4l2_m2m_ioctl_remove_bufs,
>  =09.vidioc_enum_framesizes=09=09=3D mali_vpu_enum_framesizes,
> +=09.vidioc_subscribe_event=09=09=3D mali_vpu_subscribe_event,
> +=09.vidioc_unsubscribe_event=09=3D v4l2_event_unsubscribe,
>  };
> diff --git a/include/uapi/linux/media/arm/mali-vpu-config.h b/include/uap=
i/linux/media/arm/mali-vpu-config.h
> new file mode 100644
> index 0000000000000..a82fd69f16b75
> --- /dev/null
> +++ b/include/uapi/linux/media/arm/mali-vpu-config.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Arm Mali-VPU Driver - Userspace API
> + *
> + * (C) COPYRIGHT 2026 ARM Limited.
> + */
> +
> +#ifndef __UAPI_MALI_VPU_CONFIG_H__
> +#define __UAPI_MALI_VPU_CONFIG_H__
> +
> +#include <linux/v4l2-controls.h>
> +
> +/* Mali VPU specific V4L2 driver controls */
> +
> +/* Encoded stream NALU encapsulation mode. */
> +#define V4L2_CID_MALI_VPU_NALU_FORMAT=09=09(V4L2_CID_USER_MALI_VPU_BASE =
+ 0x00)
> +
> +/**
> + * enum mali_vpu_nalu_format - Encoded stream NALU OUTPUT format.
> + *
> + * @MALI_VPU_NALU_FORMAT_START_CODES: Each NAL unit is prefixed by an An=
nex B start code.
> + * @MALI_VPU_NALU_FORMAT_ONE_NALU_PER_BUFFER: Exactly one NALU in each o=
utput buffer.
> + * @MALI_VPU_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD: Length-prefixed NALU wit=
h 1-byte size field.
> + * @MALI_VPU_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD: Length-prefixed NALU wit=
h 2-byte size field.
> + * @MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD: Length-prefixed NALU wi=
th 4-byte size field.
> + *
> + * Options for V4L2_CID_MALI_VPU_NALU_FORMAT control, which determines h=
ow the firmware
> + * encapsulates NALUs in the output stream buffers H.264.
> + */
> +enum mali_vpu_nalu_format {
> +=09MALI_VPU_NALU_FORMAT_START_CODES=09=09=3D 0,
> +=09MALI_VPU_NALU_FORMAT_ONE_NALU_PER_BUFFER=09=3D 1,
> +=09MALI_VPU_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD=09=3D 2,
> +=09MALI_VPU_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD=09=3D 3,
> +=09MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD=09=3D 4,
> +};
> +
> +#define V4L2_CID_MALI_VPU_STREAM_ESCAPING=09(V4L2_CID_USER_MALI_VPU_BASE=
 + 0x01)
> +#define V4L2_CID_MALI_VPU_IGNORE_STREAM_HEADERS=09(V4L2_CID_USER_MALI_VP=
U_BASE + 0x02)
> +#define V4L2_CID_MALI_VPU_FRAME_REORDERING=09(V4L2_CID_USER_MALI_VPU_BAS=
E + 0x03)
> +/* Suggested firmware intermediate buffer size limit. */
> +#define V4L2_CID_MALI_VPU_INTBUF_SIZE=09=09(V4L2_CID_USER_MALI_VPU_BASE =
+ 0x04)
> +
> +/* Enable firmware protocol to send debug prints to host. */
> +#define V4L2_CID_MALI_VPU_HOST_PRINT_ENABLE=09(V4L2_CID_USER_MALI_VPU_BA=
SE + 0x05)
> +
> +#endif /* __UAPI_MALI_VPU_CONFIG_H__ */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2ec..b9f7bc3aac1de 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -255,6 +255,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_IT6625_BASE=09=09(V4L2_CID_USER_BASE + 0x1250)
> =20
> +/*
> + * The base for Arm Mali-VPU driver controls.
> + * We reserve 64 controls for this driver.
> + */
> +#define V4L2_CID_USER_MALI_VPU_BASE=09=09(V4L2_CID_USER_BASE + 0x1260)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */

My recommendation, drop all the vendor controls, legacy users can use your
downstream kernels.

Nicolas

--=-v1z0u0L414TDYIEjVr9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9kzAAKCRDZQZRRKWBy
9G8qAQDgz4PqZvlcDfzpMBpKjt6jLEQaGEFlAu3RZhOUfEXLZgD+LZBnd9ig8IOk
4o0fT5r9ldGJ10+9lfm8Y9fHeuZLQwc=
=8r7j
-----END PGP SIGNATURE-----

--=-v1z0u0L414TDYIEjVr9u--
