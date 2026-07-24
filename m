Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8C5364022;
	Fri, 24 Jul 2026 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893095; cv=none; b=pFB1sIwnKrG9TT5H638rsU8ufdyukpRe70tA/4D2t9Ki5HnKJlq+fHb4zNrcDRdF4TCggAp+aw52DD0a76pZhlL1Aak/enbqNJNcOgzyD/Ai7PANWo4vYWlzOlf45Z3jcPsWDPVSDyZvWW2vEFrX9Mr4LDliyaDiAxTbC2UA+VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893095; c=relaxed/simple;
	bh=g10ktDXCjr+O11SuVKY0DfYWJl0MOm6C6MZfbRfKLuw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dBdBdyAklfL0n7zzqxC+BNmnq1FgcNMvFyyxLfcoyd4MRTI3IY8orwOdMNK/6UKAPL+jOrP8pswKfBQZqI6JPsQ08aW6lj6sxxtcWBM6ja/YDLOKkgw50wAlP/edYAySuoiVkxxRF/6LR/MDU+vBOpQzo59JkY5kBJC5hqaQT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1797920203A;
	Fri, 24 Jul 2026 13:38:09 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wnEEC-0013Rp-3B;
	Fri, 24 Jul 2026 13:38:08 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wnEEC-000000007wH-3hMI;
	Fri, 24 Jul 2026 13:38:08 +0200
Message-ID: <193a0d2b4f7c33163cb6aee56ceee0bf5cb6c11c.camel@pengutronix.de>
Subject: Re: [PATCH] media: hantro: release runtime resources when
 device_run fails
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>, Nicolas Dufresne	
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil	
 <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel-mentees@lists.linux.dev,
 	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Date: Fri, 24 Jul 2026 13:38:08 +0200
In-Reply-To: <20260724111548.2109-1-tharitt97@gmail.com>
References: <20260724111548.2109-1-tharitt97@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fr, 2026-07-24 at 11:15 +0000, Tharit Tangkijwanichakul wrote:
> device_run() acquires a runtime PM reference and enables the VPU clocks
> before invoking the codec-specific run callback.
>=20
> If clk_bulk_enable() fails, the runtime PM reference is left held. If
> the codec-specific run callback fails, both the enabled clocks and the
> runtime PM reference are left held.
>=20
> Add separate error paths to release the resources acquired by
> device_run(). Disable the clocks when the codec run callback fails, and
> drop the runtime PM reference when either clock enabling or the codec
> run callback fails.
>=20
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
> Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
>   H.264 (JVT-AVC_V1):	     129/135, unchanged
>   MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
>   VP8 (VP8-TEST-VECTORS):    61/61, unchanged
>=20
>  drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..9daaf129211d 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -170,6 +170,7 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  static void device_run(void *priv)
>  {
>  	struct hantro_ctx *ctx =3D priv;
> +	struct hantro_dev *vpu =3D ctx->dev;
>  	struct vb2_v4l2_buffer *src, *dst;
>  	int ret;
> =20
> @@ -178,11 +179,11 @@ static void device_run(void *priv)
> =20
>  	ret =3D pm_runtime_resume_and_get(ctx->dev->dev);
>  	if (ret < 0)
> -		goto err_cancel_job;
> +		goto err_disable_clock;

This doesn't make any sense.

>  	ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks=
);
>  	if (ret)
> -		goto err_cancel_job;
> +		goto err_pm_put_autosuspend;

This looks fine to me.

>  	v4l2_m2m_buf_copy_metadata(src, dst);

But right below this, you are still letting

	if (ctx->codec_ops->run(ctx))
		goto err_cancel_job;

without disabling the clocks.

> =20
> @@ -191,8 +192,12 @@ static void device_run(void *priv)
> =20
>  	return;
> =20
> +err_disable_clock:
> +	clk_bulk_disable(vpu->variant->num_clocks, ctx->dev->clocks);

You have added vpu =3D ctx->dev, why not use vpu->clocks as second
parameter?

> +err_pm_put_autosuspend:
> +	pm_runtime_put_autosuspend(vpu->dev);
>  err_cancel_job:
> -	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> +	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);

Why are you changing ctx->dev to vpu here, but not in the other
function calls in device_run(), e.g. pm_runtime_resume_and_get() and
clk_bulk_enable() above?

regards
Philipp
