Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0FA417BD7;
	Thu, 23 Jul 2026 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806155; cv=none; b=dTFymC39bUxwJeEbhZ2SH6b/FAsRW/hfNagZlYgra+lYB6rVLvwKSagffT8eHeD/IshLUYKZgTO9UsmdAoNkFOu0Lp0WH0azgFpsCmAZM5xpHT4O+TlnYORPLJXbAPd5dGem5nQdXfu+JXVWLeVXTSAGG1BdWl1Z4vUZ+H8hVfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806155; c=relaxed/simple;
	bh=rw1tuzSLXQeFogPX3j/GqQFEtkIoV3jmmiGoJythoX8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Tm0JJ95wl5Wc32NkTbBgrG39Wn/019fD0Z1TnYtwxq0SIqmG5fBFPiS265zJG5YN/P7TywCCmF2xTu4q8WZu7SVfN7FpKCzgZ7NVy5daVKRkfT5YNPwDJkQZAG7x8buFwXt2uigUWfHM53Y25P37pQyxlosvv2P7lvEf4P5rkpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O8+zQUTI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O8+zQUTI"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C11D11C37;
	Thu, 23 Jul 2026 13:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784806091;
	bh=rw1tuzSLXQeFogPX3j/GqQFEtkIoV3jmmiGoJythoX8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=O8+zQUTIHjgKQjokz96ex+qlFs/Qcsm7Vnq2hccz0ckD2DZw153UCOsPyH826VCxA
	 gYtUcoey0L2MMWXnkcnuyrgfl8fhS17wKFIShH4d/ysLtZLgZHvQaoOfT+PE0s0Ttu
	 hq9x/9TDIOSXKBFdxYgZ/YeqNNM058H1Uj6nPuTA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722210845.723864-1-b-brnich@ti.com>
References: <20260722210845.723864-1-b-brnich@ti.com>
Subject: Re: [PATCH] media: imagination: e5010: Enable autosuspend for runtime PM
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, b-brnich@ti.com, k-willis@ti.com
To: Brandon Brnich <b-brnich@ti.com>, benjamin.gaignard@collabora.com, devarsht@ti.com, hverkuil@kernel.org, mchehab@kernel.org, sebastian.fricke@collabora.com
Date: Thu, 23 Jul 2026 16:59:06 +0530
Message-ID: <178480614614.3238585.14838665134431310375@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Brandon,

Thank you for the patch.

Quoting Brandon Brnich (2026-07-23 02:38:45)
> Current implementation only has one call to turn the device on -
> start_streaming. This can waste power of device as the device can be in
> STREAM_ON state, but no buffers are actually being submitted.
>=20
> e5010_init_device needs to be moved to the resume hook to ensure
> register state is correct during any power on. This also fixes an issue
> when device was never powered on, but system resumes from deep sleep.
> The PM framework skips the runtime resume hook since device was never on
> in the first place. This causes e5010_init_device to be called for a
> powered off device leading to invalid write and system crash.

There are two separate things be solved by this patch, one is the bug fix
and the other is the good-to-have feature for autosuspending the device
between buffers.

It would make it much easier to review the logic if v2 splits the two, and
only keeps the Fixes tag (+cc stable) for the bug fix.

>=20
> Fixes: a1e2940458853 ("media: imagination: Add E5010 JPEG Encoder driver")
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>  .../platform/imagination/e5010-jpeg-enc.c     | 47 +++++++++----------
>  1 file changed, 21 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/driver=
s/media/platform/imagination/e5010-jpeg-enc.c
> index 42ad9ee3993b4..189c147cb9705 100644
> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> @@ -976,6 +976,8 @@ static irqreturn_t e5010_irq(int irq, void *data)
> =20
>         v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>         dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
> +       pm_runtime_mark_last_busy(e5010->dev);
> +       pm_runtime_put_autosuspend(e5010->dev);

The implementation of put_autosuspend() already handles mark_last_busy()
since b3db492e8335 ("PM: runtime: Mark last busy stamp in
                    pm_runtime_put_autosuspend()")

> =20
>  job_unlock:
>         spin_unlock(&e5010->hw_lock);
> @@ -1099,6 +1101,8 @@ static int e5010_probe(struct platform_device *pdev)
>                 goto fail_after_v4l2_register;
>         }
> =20
> +       pm_runtime_set_autosuspend_delay(dev, 100);
> +       pm_runtime_use_autosuspend(dev);
>         pm_runtime_enable(dev);
> =20
>         ret =3D video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
> @@ -1289,31 +1293,13 @@ static int e5010_encoder_cmd(struct file *file, v=
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
> @@ -1329,8 +1315,6 @@ static void e5010_stop_streaming(struct vb2_queue *=
q)
>             v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
>                 v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>         }
> -
> -       pm_runtime_put_sync(ctx->e5010->dev);
>  }
> =20
>  static void e5010_device_run(void *priv)
> @@ -1343,7 +1327,15 @@ static void e5010_device_run(void *priv)
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
>         spin_lock_irqsave(&e5010->hw_lock, flags);
> +
>         s_vb =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>         WARN_ON(!s_vb);
>         d_vb =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> @@ -1474,6 +1466,8 @@ static void e5010_device_run(void *priv)
>         e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
> =20
>  no_ready_buf_err:
> +       pm_runtime_mark_last_busy(e5010->dev);
> +       pm_runtime_put_autosuspend(e5010->dev);

Same here.

Thanks,
    Jai

>         if (s_vb) {
>                 v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
>                 v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
> @@ -1501,6 +1495,13 @@ static int e5010_runtime_resume(struct device *dev)
>                 return ret;
>         }
> =20
> +       ret =3D e5010_init_device(e5010);
> +       if (ret) {
> +               dev_err(dev, "Failed to re-enable e5010 device\n");
> +               clk_disable_unprepare(e5010->clk);
> +               return ret;
> +       }
> +
>         return 0;
>  }
> =20
> @@ -1533,12 +1534,6 @@ static int e5010_resume(struct device *dev)
>         if (ret < 0)
>                 return ret;
> =20
> -       ret =3D e5010_init_device(e5010);
> -       if (ret) {
> -               dev_err(dev, "Failed to re-enable e5010 device\n");
> -               return ret;
> -       }
> -
>         v4l2_m2m_resume(e5010->m2m_dev);
> =20
>         return ret;
> --=20
> 2.43.0
>=20
>
