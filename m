Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC77B3D5C2A;
	Sat, 18 Jul 2026 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784386610; cv=none; b=t8f5MO9Jhkts9m0k3V/6C1g1ghPF5bMosKulPLWIUXe2jRzqFePHC/P6+8WFNO81lSEMLWD+dHXZbhUR5iAkcl10SDjLQKTzCEI4AyGnDZM5wADj9PYMqre18WlyeR9fz3XV4qM5pafA0vBKHxxiMB9YytKNDEpkb6FXPTSV8/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784386610; c=relaxed/simple;
	bh=LKs2RiOPdG74pFGp0r9TLdRwYZYM+8e0AGESKFmQTCg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gGqHIH0uyArYX5Y/v9/mETqQmF1q0hqf7+prLrAh5epw9s+NMKgRttWqwnNTMEj9oMWr+iYc8p0o0I8RR/9dHENX6PM/EfDe7rCPu6JyF7hbUCFPdlWCV7+BQhN9Pm3LBBlutTodG7qGk5XtJVvXj5Ne/CZkOdyxEa5iGBnSRq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S0GsWdsg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S0GsWdsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784386600;
	bh=LKs2RiOPdG74pFGp0r9TLdRwYZYM+8e0AGESKFmQTCg=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=S0GsWdsgyMCyLvnFVNPDKVdpoqhZAQwPMfMsjqs9COYNqLaG9AssULlErRoBJGxhS
	 jit0rkTF/XnPbQYsxu4BsGtNwNOd//9N3+oYk6Ukj68Pz5nQ8i7MtzK3vGhGknPzX7
	 jILuftE8/j9F4HPqwdEKBoaeYO73wbIuJ7mPixkw8f1V+++nBPNPrLjmIFj0ZeDVll
	 5q6hIdSCfY7jELoE4G5rM5TAxMVUnAgsCR08PjaZ9Xs5k1zi0+5gD81J+qElwzP79h
	 2fDZrUL22DHhdQaDgnOsb/pAWU4Bq22nWucoa1UANUQ1Nsr0Z5Fu0N2f8VGMiAVj9V
	 NllbABsAf5/LQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5409917E0564;
	Sat, 18 Jul 2026 16:56:39 +0200 (CEST)
Message-ID: <f60f255b81db1db310276a1acdca412f6070a28b.camel@collabora.com>
Subject: Re: [PATCH v2] media: mtk-jpeg: drain hardware completion before
 freeing context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Bin Liu
 <bin.liu@mediatek.com>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Fan Wu	 <fanwu01@zju.edu.cn>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Sat, 18 Jul 2026 10:56:37 -0400
In-Reply-To: <20260718112448.3289122-1-lgs201920130244@gmail.com>
References: <20260718112448.3289122-1-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-0dO7DanIzYXmfAeHXFYB"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0dO7DanIzYXmfAeHXFYB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 18 juillet 2026 =C3=A0 19:24 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> The change referenced by the Fixes tag cancels ctx->jpeg_work before
> freeing the JPEG context.
>=20
> That prevents the worker itself from accessing the context after it has
> been freed. However, the multi-core workers return after programming a
> hardware instance. The IRQ handler or the per-hardware timeout work can
> then continue to access the context through hw_param.curr_ctx after the
> worker has completed.
>=20
> If userspace closes the file while a hardware job is still pending,
> cancel_work_sync() can return and mtk_jpeg_release() can free the
> context before the IRQ or timeout path has finished using it.
>=20
> Track the number of in-flight hardware jobs for each context and wait
> for them to complete in mtk_jpeg_release().
>=20
> Use a per-hardware active flag to ensure that only the IRQ handler or
> the timeout work completes each job. Clear hw_param.curr_ctx and drop
> the in-flight count only after the completion path has finished all
> accesses to the context.
>=20
> Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path=
 due to uncancelled work")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
> =C2=A0 - Replace the undefined mtk_jpeg_release_hw() call with per-contex=
t
> =C2=A0=C2=A0=C2=A0 in-flight hardware job tracking.
> =C2=A0 - Ensure that only the IRQ or timeout path completes each hardware=
 job.
> =C2=A0 - Clear hw_param.curr_ctx after the completion path stops using th=
e
> =C2=A0=C2=A0=C2=A0 context.
> =C2=A0 - Keep hardware instances busy until the timeout path has finished
> =C2=A0=C2=A0=C2=A0 accessing their saved context and buffers.
>=20
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 12 +=
+++++++-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=A0=C2=A0 | 14 +=
++++++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 25 +++++++++++=
++------
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 25 +++++++++++=
++------
> =C2=A04 files changed, 61 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483081..d41c0e0516b9 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1161,6 +1161,8 @@ static int mtk_jpeg_open(struct file *file)
> =C2=A0	}
> =C2=A0
> =C2=A0	INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
> +	atomic_set(&ctx->hw_jobs, 0);
> +	init_waitqueue_head(&ctx->hw_jobs_wq);
> =C2=A0	INIT_LIST_HEAD(&ctx->dst_done_queue);
> =C2=A0	spin_lock_init(&ctx->done_queue_lock);
> =C2=A0	v4l2_fh_init(&ctx->fh, vfd);
> @@ -1202,8 +1204,12 @@ static int mtk_jpeg_release(struct file *file)
> =C2=A0	struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_file_to_ctx(file);
> =C2=A0
> -	if (jpeg->variant->jpeg_worker)
> +	if (jpeg->variant->jpeg_worker) {
> =C2=A0		cancel_work_sync(&ctx->jpeg_work);
> +		wait_event(ctx->hw_jobs_wq,
> +			=C2=A0=C2=A0 atomic_read(&ctx->hw_jobs) =3D=3D 0);
> +	}
> +
> =C2=A0	mutex_lock(&jpeg->lock);
> =C2=A0	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);

The things is that we already paid the price of this complexity in the m2m
framework by synchronously waiting for the last v4l2_m2m_job_finish() to be
called from the driver. I think we should not add a mechanism on top, but r=
ather
figure-out why this is not working for your usage of this driver.

Nicolas

> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> @@ -1640,6 +1646,8 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> +	atomic_inc(&ctx->hw_jobs);
> +	atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> @@ -1759,6 +1767,8 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0		goto setdst_end;
> =C2=A0	}
> =C2=A0
> +	atomic_inc(&ctx->hw_jobs);
> +	atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 02ed0ed5b736..be8ada60782a 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -103,6 +103,7 @@ struct mtk_jpeg_hw_param {
> =C2=A0	struct vb2_v4l2_buffer *src_buffer;
> =C2=A0	struct vb2_v4l2_buffer *dst_buffer;
> =C2=A0	struct mtk_jpeg_ctx *curr_ctx;
> +	atomic_t job_active;
> =C2=A0};
> =C2=A0
> =C2=A0enum mtk_jpegenc_hw_id {
> @@ -282,6 +283,8 @@ struct mtk_jpeg_q_data {
> =C2=A0 * @restart_interval:		jpeg encoder restart interval
> =C2=A0 * @ctrl_hdl:			controls handler
> =C2=A0 * @jpeg_work:			jpeg encoder workqueue
> + * @hw_jobs:			number of hardware jobs still referencing this context
> + * @hw_jobs_wq:			wait queue for hardware job completion
> =C2=A0 * @total_frame_num:		encoded frame number
> =C2=A0 * @dst_done_queue:		encoded frame buffer queue
> =C2=A0 * @done_queue_lock:		encoded frame operation spinlock
> @@ -299,6 +302,8 @@ struct mtk_jpeg_ctx {
> =C2=A0	struct v4l2_ctrl_handler ctrl_hdl;
> =C2=A0
> =C2=A0	struct work_struct jpeg_work;
> +	atomic_t hw_jobs;
> +	wait_queue_head_t hw_jobs_wq;
> =C2=A0	u32 total_frame_num;
> =C2=A0	struct list_head dst_done_queue;
> =C2=A0	/* spinlock protecting the encode done buffer */
> @@ -306,4 +311,13 @@ struct mtk_jpeg_ctx {
> =C2=A0	u32 last_done_frame_num;
> =C2=A0};
> =C2=A0
> +static inline void
> +mtk_jpeg_hw_job_done(struct mtk_jpeg_hw_param *hw_param,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_jpeg_ctx *ctx)
> +{
> +	WRITE_ONCE(hw_param->curr_ctx, NULL);
> +	if (atomic_dec_and_test(&ctx->hw_jobs))
> +		wake_up(&ctx->hw_jobs_wq);
> +}
> +
> =C2=A0#endif /* _MTK_JPEG_CORE_H */
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 32372781daf5..c2d40653891a 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -527,7 +527,12 @@ static void mtk_jpegdec_timeout_work(struct work_str=
uct *work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 job_timeout_work.work);
> =C2=A0	struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_ctx *ctx;
> +
> +	if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) !=3D 1)
> +		return;
> =C2=A0
> +	ctx =3D cjpeg->hw_param.curr_ctx;
> =C2=A0	src_buf =3D cjpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D cjpeg->hw_param.dst_buffer;
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> @@ -535,11 +540,13 @@ static void mtk_jpegdec_timeout_work(struct work_st=
ruct *work)
> =C2=A0	mtk_jpeg_dec_reset(cjpeg->reg_base);
> =C2=A0	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> =C2=A0	pm_runtime_put(cjpeg->dev);
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +	mtk_jpegdec_put_buf(cjpeg);
> +	mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
> +
> =C2=A0	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> -	v4l2_m2m_buf_done(src_buf, buf_state);
> -	mtk_jpegdec_put_buf(cjpeg);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -555,12 +562,10 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int i=
rq, void *priv)
> =C2=A0	struct mtk_jpegdec_comp_dev *jpeg =3D priv;
> =C2=A0	struct mtk_jpeg_dev *master_jpeg =3D jpeg->master_dev;
> =C2=A0
> -	cancel_delayed_work(&jpeg->job_timeout_work);
> +	if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) !=3D 1)
> +		return IRQ_HANDLED;
> =C2=A0
> -	ctx =3D jpeg->hw_param.curr_ctx;
> -	src_buf =3D jpeg->hw_param.src_buffer;
> -	dst_buf =3D jpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> +	cancel_delayed_work(&jpeg->job_timeout_work);
> =C2=A0
> =C2=A0	irq_status =3D mtk_jpeg_dec_get_int_status(jpeg->reg_base);
> =C2=A0	dec_irq_ret =3D mtk_jpeg_dec_enum_result(irq_status);
> @@ -570,6 +575,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int ir=
q, void *priv)
> =C2=A0	if (dec_irq_ret !=3D MTK_JPEG_DEC_RESULT_EOF_DONE)
> =C2=A0		dev_warn(jpeg->dev, "Jpg Dec occurs unknown Err.");
> =C2=A0
> +	ctx =3D jpeg->hw_param.curr_ctx;
> +	src_buf =3D jpeg->hw_param.src_buffer;
> +	dst_buf =3D jpeg->hw_param.dst_buffer;
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> +
> =C2=A0	jpeg_src_buf =3D
> =C2=A0		container_of(src_buf, struct mtk_jpeg_src_buf, b);
> =C2=A0
> @@ -582,6 +592,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	mtk_jpegdec_put_buf(jpeg);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> +	mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
> =C2=A0
> =C2=A0	jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index b312a15d707b..b08f94845613 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -257,7 +257,12 @@ static void mtk_jpegenc_timeout_work(struct work_str=
uct *work)
> =C2=A0	struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> =C2=A0	enum vb2_buffer_state buf_state =3D VB2_BUF_STATE_ERROR;
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_ctx *ctx;
> +
> +	if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) !=3D 1)
> +		return;
> =C2=A0
> +	ctx =3D cjpeg->hw_param.curr_ctx;
> =C2=A0	src_buf =3D cjpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D cjpeg->hw_param.dst_buffer;
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> @@ -265,11 +270,13 @@ static void mtk_jpegenc_timeout_work(struct work_st=
ruct *work)
> =C2=A0	mtk_jpeg_enc_reset(cjpeg->reg_base);
> =C2=A0	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> =C2=A0	pm_runtime_put(cjpeg->dev);
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +	mtk_jpegenc_put_buf(cjpeg);
> +	mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
> +
> =C2=A0	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> -	v4l2_m2m_buf_done(src_buf, buf_state);
> -	mtk_jpegenc_put_buf(cjpeg);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -283,12 +290,10 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int i=
rq, void *priv)
> =C2=A0	struct mtk_jpegenc_comp_dev *jpeg =3D priv;
> =C2=A0	struct mtk_jpeg_dev *master_jpeg =3D jpeg->master_dev;
> =C2=A0
> -	cancel_delayed_work(&jpeg->job_timeout_work);
> +	if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) !=3D 1)
> +		return IRQ_HANDLED;
> =C2=A0
> -	ctx =3D jpeg->hw_param.curr_ctx;
> -	src_buf =3D jpeg->hw_param.src_buffer;
> -	dst_buf =3D jpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> +	cancel_delayed_work(&jpeg->job_timeout_work);
> =C2=A0
> =C2=A0	irq_status =3D readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
> =C2=A0		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> @@ -297,6 +302,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int ir=
q, void *priv)
> =C2=A0	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
> =C2=A0		dev_warn(jpeg->dev, "Jpg Enc occurs unknown Err.");
> =C2=A0
> +	ctx =3D jpeg->hw_param.curr_ctx;
> +	src_buf =3D jpeg->hw_param.src_buffer;
> +	dst_buf =3D jpeg->hw_param.dst_buffer;
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> +
> =C2=A0	result_size =3D mtk_jpeg_enc_get_file_size(jpeg->reg_base,
> =C2=A0						 ctx->jpeg->variant->support_34bit);
> =C2=A0	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
> @@ -305,6 +315,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> +	mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
> =C2=A0
> =C2=A0	jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	wake_up(&master_jpeg->hw_wq);

--=-0dO7DanIzYXmfAeHXFYB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaluUJQAKCRDZQZRRKWBy
9OfiAP9dS9e9CSZovtBek0vhUMnhqaHhuPmqsAPzZS3/CjgQdAD9GzllYArQQrXZ
IbvNmGEM7Sck0Vh/95Y1Gahbl+q0oAo=
=0tOb
-----END PGP SIGNATURE-----

--=-0dO7DanIzYXmfAeHXFYB--
