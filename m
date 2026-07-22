Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC844AB94;
	Wed, 22 Jul 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714431; cv=none; b=fhu1YitXk9EmhMTJJ4kBG6DBzInvdlojdbZv5ukArccQJEMe5E2wQqlUIpAo4WKyXBp/HYY5NWuiwYC+GZx0L3PH/bG1XV4rTsypxxL7BAjjR6bQWrMimiPxmmqRdLjQeXCGCs9/9ETbEsoflSLQVf3zuvTEzuYIllh0NR2TTEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714431; c=relaxed/simple;
	bh=H2E5SAYDZsN9P+pHCklo95G8JwQNxDI1MtwfO2yckiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W1mrOnToM2YNB2qu2QJFp+IGyplhsUgaOo2ra7HmYM3h6TIPSKTS25HAcB6qlNRFk2gcWFWic0dC7NRYUOy8p1dWSo5UD9zQNE2smDzf2Ghqn5FJcCCzb5+aBzeeZZiJFE4w/3WRqWj6Hbe60XqGOIFvNPejqcjl4Ue1p205tP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AwgZpszx; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AwgZpszx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sWDWsM9TBRItqToA/efliUD8bssiJSLzstCW4+0QWoE=; b=AwgZpszx5epBC4Iy5r0MfWV7nm
	NqsefgU0PQJF7xw8wCPw9mDwW1avyoqiCPDSl6Byd4DUNYl7/auQYEpedEmoTNniJ4vIcqfbzfW29
	Lzc0U9RmTHeJMvLoxb8mwDTiPo/rB0aTGIJNYUn6rENStzqvpNln1B2NHIkaWZ2ahkiZWlxIKv8FQ
	cuoa2tlp+gFkdkBakUUi83prtZEI5g6vFAKypdM4XkE4/urMmDKIGrZ9RcG+cU+Ri78pFlzb7znC7
	Mu5ZiDTPI9jepe3KCqBwVSIPvuZhee94BeM2P9byVXTXOd5HJPMmJcqDAFL/5qMMo+zq24XI+OAsE
	ah9a+nPQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.dufresne@collabora.com,
 Jiaxing Hu <gahing@gahingwoo.com>
Cc: ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject:
 Re: [RFC PATCH 2/3] media: rockchip: add VEPU510 H.264 encoder driver for
 RK3576
Date: Wed, 22 Jul 2026 12:00:16 +0200
Message-ID: <3096814.BaHzMo0RvP@diego>
In-Reply-To: <20260722073417.2064667-3-gahing@gahingwoo.com>
References:
 <20260722073417.2064667-1-gahing@gahingwoo.com>
 <20260722073417.2064667-3-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 22. Juli 2026, 09:34:16 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Jiaxing Hu:
> Add a from-scratch stateful V4L2 mem2mem driver for the Rockchip RK3576
> VEPU510 H.264 hardware video encoder (raw NV12 in, H.264 Annex-B out),
> modelled on the verisilicon/hantro device_run()/codec_ops split rather
> than the downstream MPP-service/task-queue model.
>=20
> The two encoder cores (rkvenc0/rkvenc1) are exposed as two independent
> V4L2 M2M device nodes, each driving one physical core standalone; the
> downstream vendor CCU cross-core load-balancing is not implemented.
>=20
> Register field semantics were worked out by trial-and-error against
> Rockchip's own open-source userspace codec library (rockchip-linux/mpp)
> and cross-checked against a real register-write trace of the downstream
> vendor stack running the same encode.
>=20
> Intra (I-frame) encoding is confirmed working on real hardware (Radxa
> ROCK 4D): it produces valid H.264 that the reference decoders accept.
> Inter (P-frame) encoding still hits a hardware-watchdog stall in the
> reference-read datapath -- this is the main open question for this RFC;
> see the cover letter for the full symptom analysis.
>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

[...]

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.c b/drivers/me=
dia/platform/rockchip/rkvenc/rkvenc.c
> new file mode 100644
> index 000000000..d70bcc5fb
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
> @@ -0,0 +1,892 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip VEPU510 (RK3576) hardware video encoder driver.
> + *
> + * Copyright (C) 2026 Jiaxing Hu <gahing@gahingwoo.com>
> + *
> + * Architecture notes (see also rkvenc-regs.h):
> + *
> + *  - This is a *stateful* V4L2 mem2mem encoder (raw NV12 in on OUTPUT,
> + *    H.264 Annex-B out on CAPTURE) modelled on
> + *    drivers/media/platform/verisilicon's hantro_drv.c device_run()/
> + *    codec_ops{run,done} split, NOT on rkvdec's stateless request-API
> + *    decoder pattern =E2=80=94 an encoder has no per-frame bitstream to=
 parse,
> + *    so there is nothing analogous to rkvdec_run_preamble/postamble her=
e.
> + *
> + *  - The vendor downstream driver (rockchip-linux/kernel,
> + *    drivers/video/rockchip/mpp/mpp_rkvenc2.c) groups rkvenc0/rkvenc1
> + *    under a "CCU" (rockchip,rkv-encoder-rk3576-ccu) that does pure
> + *    software task-queue load balancing across both cores, plus an
> + *    optional DCHS (dual-core-handshake) register protocol used only
> + *    when *deliberately* splitting one frame's rows across both cores.
> + *    There is no hardware descriptor/link-list engine behind it (unlike
> + *    the decoder's CCU). v1 of this driver does not implement either:
> + *    rkvenc0 and rkvenc1 are exposed as two independent V4L2 M2M device
> + *    nodes, each driving one physical core standalone =E2=80=94 the same
> + *    simplification rkvdec itself makes for multi-core VDPU hardware
> + *    (see rkvdec_disable_multicore()).

At least the comment and from a casual look also the code get this
backwards. The idea is to explicitly _not_ expose multiple video devices.

See
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/media/platform/rockchip/rkvdec/rkvdec.c#n1613

Any (future) scheduling should happen inside the driver, and not get
offloaded onto _every_ userspace application individually.


Heiko


