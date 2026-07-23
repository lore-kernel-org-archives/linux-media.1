Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636C3672AF;
	Thu, 23 Jul 2026 19:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784836742; cv=none; b=TCEcdrR8WiUnvn89jzW75UkNYd6oUa+h1Ph0v4AtmMed7LjuG/fsxrRkuWhJxNVwH3RwS+3BalqNLu2VzssRBPk9sOEEAZq7C9r1fe+WmfdOiV9x7UthZqJg9C+oknDZb8VQ1ZpgzBVBr8kQ+2f2BRJA3dZcP8pyjH/vNae9+3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784836742; c=relaxed/simple;
	bh=1VReOtTUr8SGvMibtRJjs+n6+sCfmKy0q9UGPZz4WXs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bUXbsywOgUEFXyAkHtjSmhIMYAhv8yznix2kIA/ahzMDwW/Nzn4UEt025l5J8Jkw+sYdANGHz2ltH92Db2gGHhMzPCpi9tZ98OgcyLEnXhUDCfGu0zX54uS3ytqB/S6doUESwAXDf7fWGLEzT0MUHVTAghk9/TwYokQ3zdfuwd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gxHorqUe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gxHorqUe"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 822301D18;
	Thu, 23 Jul 2026 21:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784836673;
	bh=1VReOtTUr8SGvMibtRJjs+n6+sCfmKy0q9UGPZz4WXs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gxHorqUeBR0tOHwhbAH5ic0Lh0P3iIe8g8HPkzZi2jCo7YuRyjxN3QvcAN3P1JY+O
	 6DZX3fPpN2oJ678tT2aDQuPUiZyH/7MYKWLgbBGK+xvdtvfbl6BGHA2HzoGoGKV+Ol
	 ALNgAMUNCn3l1rXNCzcA8HNfLv197pOcmRASIGls=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260723154117.1917644-2-b-brnich@ti.com>
References: <20260723154117.1917644-1-b-brnich@ti.com> <20260723154117.1917644-2-b-brnich@ti.com>
Subject: Re: [PATCH v2 2/2] media: imagination: e5010: Enable autosuspend for runtime PM
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, k-willis@ti.com, b-brnich@ti.com
To: Brandon Brnich <b-brnich@ti.com>, benjamin.gaignard@collabora.com, devarsht@ti.com, hverkuil@kernel.org, mchehab@kernel.org
Date: Fri, 24 Jul 2026 01:28:49 +0530
Message-ID: <178483672959.3335539.14769511933917798474@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Brandon,

Thanks for the patch.

Quoting Brandon Brnich (2026-07-23 21:11:17)
> Current implementation only has one call to turn the device on -
> start_streaming. This can waste power of device as the device can be in
> STREAM_ON state, but no buffers are actually being submitted.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>  .../platform/imagination/e5010-jpeg-enc.c     | 32 +++++++------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/driver=
s/media/platform/imagination/e5010-jpeg-enc.c
> index 2b98d230429d1..580490d1a0f45 100644
> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> @@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
> =20
>         v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>         dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
> +       pm_runtime_put_autosuspend(e5010->dev);
> =20
>  job_unlock:
>         spin_unlock(&e5010->hw_lock);
> @@ -1099,6 +1100,8 @@ static int e5010_probe(struct platform_device *pdev)
>                 goto fail_after_v4l2_register;
>         }
> =20
> +       pm_runtime_set_autosuspend_delay(dev, 100);
> +       pm_runtime_use_autosuspend(dev);
>         pm_runtime_enable(dev);
> =20
>         ret =3D video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
> @@ -1289,31 +1292,13 @@ static int e5010_encoder_cmd(struct file *file, v=
oid *priv,
>  static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
>  {
>         struct e5010_context *ctx =3D vb2_get_drv_priv(q);
> -       int ret;
> =20
>         struct e5010_q_data *queue =3D get_queue(ctx, q->type);
> =20
>         v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
>         queue->sequence =3D 0;
> =20
> -       ret =3D pm_runtime_resume_and_get(ctx->e5010->dev);
> -       if (ret < 0) {
> -               v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\=
n");
> -               goto fail;
> -       }
> -
> -       ret =3D e5010_init_device(ctx->e5010);
> -       if (ret) {
> -               v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 d=
evice\n");
> -               goto fail;
> -       }
> -
>         return 0;
> -
> -fail:
> -       e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
> -
> -       return ret;
>  }
> =20
>  static void e5010_stop_streaming(struct vb2_queue *q)
> @@ -1329,8 +1314,6 @@ static void e5010_stop_streaming(struct vb2_queue *=
q)
>             v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
>                 v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>         }
> -
> -       pm_runtime_put_sync(ctx->e5010->dev);
>  }
> =20
>  static void e5010_device_run(void *priv)
> @@ -1343,7 +1326,15 @@ static void e5010_device_run(void *priv)
>         unsigned long flags;
>         int num_planes =3D ctx->out_queue.fmt->num_planes;
> =20
> +       ret =3D pm_runtime_resume_and_get(e5010->dev);
> +       if (ret < 0) {
> +               dev_err(e5010->dev, "Device failed to turn on\n");
> +               v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
> +               return;
> +       }
> +

Sashiko (LLM bot) made a comment here [1] that the device may end up using
default qp table values after resuming from power down because the state
isn't cleared properly.. is there any validity to that?

[1] https://sashiko.dev/#/patchset/20260723154117.1917644-1-b-brnich%40ti.c=
om

LLMs can give plausible sounding false positives too, but I'll still
withold my R-By tag until confirmation or testing from you and/or Devarsh.

Thanks,
    Jai

>         spin_lock_irqsave(&e5010->hw_lock, flags);
> +
>         s_vb =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>         WARN_ON(!s_vb);
>         d_vb =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> @@ -1474,6 +1465,7 @@ static void e5010_device_run(void *priv)
>         e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
> =20
>  no_ready_buf_err:
> +       pm_runtime_put_autosuspend(e5010->dev);
>         if (s_vb) {
>                 v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
>                 v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
> --=20
> 2.43.0
>
