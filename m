Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6EC449B18
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625369; cv=pass; b=ptZn4r5K0rsmxq1rvg0UHkUHo/Lc5R+vQJ1aXn17oFgSqrmnAe2G5dXGissIxvbZxESM2g09QpuIol66wLVEhBFLHLaYCCrmTWlrgawvzyvQQXvSuNok9YEghu+8USBA7e3SoRXwhoITyTYtm69yGuMiSchopM+dOv3gD6jiCoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625369; c=relaxed/simple;
	bh=2wVv+mPaY7QfhDvlUvhChcf1oJ7h9lqAow5DdO3a1kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQ5DtG6gz8Pn9LYtLCrOcnX1dErw6jDhsZl/xHwTwbUWOjaIkP53qXx3ayaXYOaR0SkOLXBiLoxIiK/XNslBW3VIqj9zASAGYJ0v4UAWGlFa2/LAeRt6fzGyUo8szh0c7vhvU48/t0LbmAYMwFErguUCMX2PJGeiU9OEWrVkKrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxKL72tV; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxKL72tV"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8143daf89c7so71441327b3.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784625367; cv=none;
        d=google.com; s=arc-20260327;
        b=XZqQkMmqGgO8hjXmSLGH63SqbmfRkx+L5ufZ1BW0lCBR3f4LLeeF9/SPQ+q1Ot+vaH
         60mnvI+keO1VJizBsyD3XLYhu7wgB4TZmrfkl3Wq4ZxMM/ctTRiFjtv64K3t5LskBAbH
         dLWewEzdkwJUNqBZAxxAEjf2iFEBwonCoQhcegBXWZABrcSxHjR0EYVlDwaWnA3fKeQC
         S2drn/UrBSndylXFPorek8iaTkSRUMnUOisBRmDf8qTI2X0NVL+ldm09u/zRnNNcV921
         vSqWTIbdciqingFhaXQkNUyUKfOlpqWVoxXXPyDxDjnvlVuY5tJEOr5n0a5jTmEGtykG
         xPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3jptShbGvvubXF+8O/bdbRKyZuq6dKEohNKihfAkSY=;
        fh=NcysuxgE73rW/aAwVeyA6tnkXkQkwArsEsbljz2/LhY=;
        b=He8puaMIIF5vM9IuMqkmYhqASl3YoLOHHm7xJGTsJPtaIfRtjjJWd4GVvXeCE2fuxy
         vIJpoTet8tgjtzxT6nuSAmREhFNo5Q6hLwM1ABZGri4xd0mcXIqwf2G4lIOjg1GMgAdr
         Aj/ZcOFxNTeicCNlAfwed/q9+fbFor4Qall/NcYputtJIt2HoL4RXMcaM9u+MII6ftBV
         YIjbEF7Nwpiox9W/xR0PebNcAOq08fvMKka4L2iFbYQxyo1kxOrD+izUiPNMS2ndylzs
         KAUzlPvAwFKyOK5jLftCh5pEVYtZAihp8HHbqG7bU76yXbxSjP2YhOS9JI7b8hKz/KGY
         m4qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784625367; x=1785230167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/3jptShbGvvubXF+8O/bdbRKyZuq6dKEohNKihfAkSY=;
        b=gxKL72tVQP8PZ5AB7dsgZLKOzjeU4IsMgx04Njl7SnJWVcrrz/uSkLQBspi8pNqO15
         b2I6X9RJGy/yPAV9UzL+07mWR3czs0IjDJIY1C/P6BK/ywu6qtX0D0Q0yoPCb+ie2vo7
         DoAC1hx/7Vescw2eVcV91ne4ngquV9QV2S6Dd7+zCcvpe8k5tsrF8wrHaIOCBgTg/Cj4
         w1MfTAtu++b1d11XuX5huuYA7o6uwNnFb2nfa7aIKMrAkPIo2E/6gTCE2pQjH5m0C9/O
         wKF5MTbVXi1bHzz9euLl8Wgrs1P7J3Ds3NGm2r0y76flEA7scy6eSC6z2GkCTNBcO0zu
         5FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625367; x=1785230167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3jptShbGvvubXF+8O/bdbRKyZuq6dKEohNKihfAkSY=;
        b=UHDHMI5XwHTtrSQrU9c59V1PacSWv2rdqYYqq3Ns0O8wMfWl9M+yPF9BXfI+bjJs67
         NEYb8dTRruJxs4PhBABJzeAwrSs3/OzlVzi9Y6l6/87gY4mnOq/cCHfWFkJbwTVJ7YNe
         q3OmGDnM4vCTgkbqZmrDXNa/4o9Df9YFSUUU5vHStLGxqKbqIX6toovjTwEYhLw4faSC
         gtqhqshlwUuX/7kYeOvmrJ54+w8pWclDViO1156HUg5oel+fY3fSH9P/I+9uDEV4dzeC
         Vx0s7bhG/YXUWLQCweMWrnljZjRy3YV0kYoV9sIaDLYe40GU5pad3a6uzfwU8tskA3qW
         Q24g==
X-Forwarded-Encrypted: i=1; AHgh+RqhHOKHWFjaCICTMhC/S67JzQcdqpKskXnsGgf+sI/77Y9ZBvUxWsQrJKSgBr3x2WPYl5+U7046SPWCzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNGBd5bCG4flTIop9uMI8Bla6SGzD5nhKWgAbt3rsaM94Hiki
	x3q7q4mbLatTMYTVOJZ+yBw6udVl1JQVdVK9/HokxRc4x9WDdSVLkyT2pan9njAs3FgcLqnel7g
	iVyoAk8kvtnVwZg2PqTQGwMeskFk80G8=
X-Gm-Gg: AR+sD12z49ty9GjJMj3UJ8T4zJCqqWHzMZkhOUnGy4kEn/UsfBmKu0aG9+1KDWp1VNQ
	uVKofabRV0nS2x/qVddEUDkJh+1NiYEkPWbTmLMPtKpvBk+TkRjFXRXtaHJpWsyQHwJZRHvjIce
	DAEWjmWYubl0uXI0RnJBTEj/+adZH7NwPTqqFfHC75b2KtxT/ff89W2+qLF1DISSy7yNBTXHJrn
	8AyDGJTRtHuFkXHv5e+p+hOH96KtTE4uhQJOsi23XegfoEhM7FfNYou30yV66l5
X-Received: by 2002:a05:690c:16:b0:81e:68d6:22ab with SMTP id
 00721157ae682-81ef262f4cfmr54289977b3.68.1784625366773; Tue, 21 Jul 2026
 02:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718112448.3289122-1-lgs201920130244@gmail.com> <f60f255b81db1db310276a1acdca412f6070a28b.camel@collabora.com>
In-Reply-To: <f60f255b81db1db310276a1acdca412f6070a28b.camel@collabora.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 21 Jul 2026 17:15:56 +0800
X-Gm-Features: AUfX_my04FUr-X1r_TKcdnYxuTyggU38FunHk98baU-KGlQdSh6A9LRiqDyfCX4
Message-ID: <CANUHTR-0-_zOegBf74bmAFqLgUUgjzqz5B7ydO9+Zyj=XSJ2CA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-jpeg: drain hardware completion before
 freeing context
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Sat, 18 Jul 2026 at 22:56, Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le samedi 18 juillet 2026 =C3=A0 19:24 +0800, Guangshuo Li a =C3=A9crit :
> > The change referenced by the Fixes tag cancels ctx->jpeg_work before
> > freeing the JPEG context.
> >
> > That prevents the worker itself from accessing the context after it has
> > been freed. However, the multi-core workers return after programming a
> > hardware instance. The IRQ handler or the per-hardware timeout work can
> > then continue to access the context through hw_param.curr_ctx after the
> > worker has completed.
> >
> > If userspace closes the file while a hardware job is still pending,
> > cancel_work_sync() can return and mtk_jpeg_release() can free the
> > context before the IRQ or timeout path has finished using it.
> >
> > Track the number of in-flight hardware jobs for each context and wait
> > for them to complete in mtk_jpeg_release().
> >
> > Use a per-hardware active flag to ensure that only the IRQ handler or
> > the timeout work completes each job. Clear hw_param.curr_ctx and drop
> > the in-flight count only after the completion path has finished all
> > accesses to the context.
> >
> > Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release pa=
th due to uncancelled work")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> > v2:
> >   - Replace the undefined mtk_jpeg_release_hw() call with per-context
> >     in-flight hardware job tracking.
> >   - Ensure that only the IRQ or timeout path completes each hardware jo=
b.
> >   - Clear hw_param.curr_ctx after the completion path stops using the
> >     context.
> >   - Keep hardware instances busy until the timeout path has finished
> >     accessing their saved context and buffers.
> >
> >  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 12 ++++++++-
> >  .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 14 +++++++++++
> >  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 25 +++++++++++++------
> >  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 25 +++++++++++++------
> >  4 files changed, 61 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > index d147ec483081..d41c0e0516b9 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > @@ -1161,6 +1161,8 @@ static int mtk_jpeg_open(struct file *file)
> >       }
> >
> >       INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
> > +     atomic_set(&ctx->hw_jobs, 0);
> > +     init_waitqueue_head(&ctx->hw_jobs_wq);
> >       INIT_LIST_HEAD(&ctx->dst_done_queue);
> >       spin_lock_init(&ctx->done_queue_lock);
> >       v4l2_fh_init(&ctx->fh, vfd);
> > @@ -1202,8 +1204,12 @@ static int mtk_jpeg_release(struct file *file)
> >       struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> >       struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_file_to_ctx(file);
> >
> > -     if (jpeg->variant->jpeg_worker)
> > +     if (jpeg->variant->jpeg_worker) {
> >               cancel_work_sync(&ctx->jpeg_work);
> > +             wait_event(ctx->hw_jobs_wq,
> > +                        atomic_read(&ctx->hw_jobs) =3D=3D 0);
> > +     }
> > +
> >       mutex_lock(&jpeg->lock);
> >       v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>
> The things is that we already paid the price of this complexity in the m2=
m
> framework by synchronously waiting for the last v4l2_m2m_job_finish() to =
be
> called from the driver. I think we should not add a mechanism on top, but=
 rather
> figure-out why this is not working for your usage of this driver.
>
> Nicolas
>
> >       v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > @@ -1640,6 +1646,8 @@ static void mtk_jpegenc_worker(struct work_struct=
 *work)
> >       v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> >       v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> >
> > +     atomic_inc(&ctx->hw_jobs);
> > +     atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
> >       schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> >                             msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC))=
;
> >
> > @@ -1759,6 +1767,8 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> >               goto setdst_end;
> >       }
> >
> > +     atomic_inc(&ctx->hw_jobs);
> > +     atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
> >       schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> >                             msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC))=
;
> >
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > index 02ed0ed5b736..be8ada60782a 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > @@ -103,6 +103,7 @@ struct mtk_jpeg_hw_param {
> >       struct vb2_v4l2_buffer *src_buffer;
> >       struct vb2_v4l2_buffer *dst_buffer;
> >       struct mtk_jpeg_ctx *curr_ctx;
> > +     atomic_t job_active;
> >  };
> >
> >  enum mtk_jpegenc_hw_id {
> > @@ -282,6 +283,8 @@ struct mtk_jpeg_q_data {
> >   * @restart_interval:                jpeg encoder restart interval
> >   * @ctrl_hdl:                        controls handler
> >   * @jpeg_work:                       jpeg encoder workqueue
> > + * @hw_jobs:                 number of hardware jobs still referencing=
 this context
> > + * @hw_jobs_wq:                      wait queue for hardware job compl=
etion
> >   * @total_frame_num:         encoded frame number
> >   * @dst_done_queue:          encoded frame buffer queue
> >   * @done_queue_lock:         encoded frame operation spinlock
> > @@ -299,6 +302,8 @@ struct mtk_jpeg_ctx {
> >       struct v4l2_ctrl_handler ctrl_hdl;
> >
> >       struct work_struct jpeg_work;
> > +     atomic_t hw_jobs;
> > +     wait_queue_head_t hw_jobs_wq;
> >       u32 total_frame_num;
> >       struct list_head dst_done_queue;
> >       /* spinlock protecting the encode done buffer */
> > @@ -306,4 +311,13 @@ struct mtk_jpeg_ctx {
> >       u32 last_done_frame_num;
> >  };
> >
> > +static inline void
> > +mtk_jpeg_hw_job_done(struct mtk_jpeg_hw_param *hw_param,
> > +                  struct mtk_jpeg_ctx *ctx)
> > +{
> > +     WRITE_ONCE(hw_param->curr_ctx, NULL);
> > +     if (atomic_dec_and_test(&ctx->hw_jobs))
> > +             wake_up(&ctx->hw_jobs_wq);
> > +}
> > +
> >  #endif /* _MTK_JPEG_CORE_H */
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/d=
rivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > index 32372781daf5..c2d40653891a 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > @@ -527,7 +527,12 @@ static void mtk_jpegdec_timeout_work(struct work_s=
truct *work)
> >                            job_timeout_work.work);
> >       struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> >       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +     struct mtk_jpeg_ctx *ctx;
> > +
> > +     if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) !=3D 1)
> > +             return;
> >
> > +     ctx =3D cjpeg->hw_param.curr_ctx;
> >       src_buf =3D cjpeg->hw_param.src_buffer;
> >       dst_buf =3D cjpeg->hw_param.dst_buffer;
> >       v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > @@ -535,11 +540,13 @@ static void mtk_jpegdec_timeout_work(struct work_=
struct *work)
> >       mtk_jpeg_dec_reset(cjpeg->reg_base);
> >       clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> >       pm_runtime_put(cjpeg->dev);
> > +     v4l2_m2m_buf_done(src_buf, buf_state);
> > +     mtk_jpegdec_put_buf(cjpeg);
> > +     mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
> > +
> >       cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> >       atomic_inc(&master_jpeg->hw_rdy);
> >       wake_up(&master_jpeg->hw_wq);
> > -     v4l2_m2m_buf_done(src_buf, buf_state);
> > -     mtk_jpegdec_put_buf(cjpeg);
> >  }
> >
> >  static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> > @@ -555,12 +562,10 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int=
 irq, void *priv)
> >       struct mtk_jpegdec_comp_dev *jpeg =3D priv;
> >       struct mtk_jpeg_dev *master_jpeg =3D jpeg->master_dev;
> >
> > -     cancel_delayed_work(&jpeg->job_timeout_work);
> > +     if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) !=3D 1)
> > +             return IRQ_HANDLED;
> >
> > -     ctx =3D jpeg->hw_param.curr_ctx;
> > -     src_buf =3D jpeg->hw_param.src_buffer;
> > -     dst_buf =3D jpeg->hw_param.dst_buffer;
> > -     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > +     cancel_delayed_work(&jpeg->job_timeout_work);
> >
> >       irq_status =3D mtk_jpeg_dec_get_int_status(jpeg->reg_base);
> >       dec_irq_ret =3D mtk_jpeg_dec_enum_result(irq_status);
> > @@ -570,6 +575,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int =
irq, void *priv)
> >       if (dec_irq_ret !=3D MTK_JPEG_DEC_RESULT_EOF_DONE)
> >               dev_warn(jpeg->dev, "Jpg Dec occurs unknown Err.");
> >
> > +     ctx =3D jpeg->hw_param.curr_ctx;
> > +     src_buf =3D jpeg->hw_param.src_buffer;
> > +     dst_buf =3D jpeg->hw_param.dst_buffer;
> > +     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > +
> >       jpeg_src_buf =3D
> >               container_of(src_buf, struct mtk_jpeg_src_buf, b);
> >
> > @@ -582,6 +592,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int i=
rq, void *priv)
> >       mtk_jpegdec_put_buf(jpeg);
> >       pm_runtime_put(ctx->jpeg->dev);
> >       clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> > +     mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
> >
> >       jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> >       wake_up(&master_jpeg->hw_wq);
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/d=
rivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > index b312a15d707b..b08f94845613 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > @@ -257,7 +257,12 @@ static void mtk_jpegenc_timeout_work(struct work_s=
truct *work)
> >       struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> >       enum vb2_buffer_state buf_state =3D VB2_BUF_STATE_ERROR;
> >       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +     struct mtk_jpeg_ctx *ctx;
> > +
> > +     if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) !=3D 1)
> > +             return;
> >
> > +     ctx =3D cjpeg->hw_param.curr_ctx;
> >       src_buf =3D cjpeg->hw_param.src_buffer;
> >       dst_buf =3D cjpeg->hw_param.dst_buffer;
> >       v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > @@ -265,11 +270,13 @@ static void mtk_jpegenc_timeout_work(struct work_=
struct *work)
> >       mtk_jpeg_enc_reset(cjpeg->reg_base);
> >       clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> >       pm_runtime_put(cjpeg->dev);
> > +     v4l2_m2m_buf_done(src_buf, buf_state);
> > +     mtk_jpegenc_put_buf(cjpeg);
> > +     mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
> > +
> >       cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> >       atomic_inc(&master_jpeg->hw_rdy);
> >       wake_up(&master_jpeg->hw_wq);
> > -     v4l2_m2m_buf_done(src_buf, buf_state);
> > -     mtk_jpegenc_put_buf(cjpeg);
> >  }
> >
> >  static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> > @@ -283,12 +290,10 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int=
 irq, void *priv)
> >       struct mtk_jpegenc_comp_dev *jpeg =3D priv;
> >       struct mtk_jpeg_dev *master_jpeg =3D jpeg->master_dev;
> >
> > -     cancel_delayed_work(&jpeg->job_timeout_work);
> > +     if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) !=3D 1)
> > +             return IRQ_HANDLED;
> >
> > -     ctx =3D jpeg->hw_param.curr_ctx;
> > -     src_buf =3D jpeg->hw_param.src_buffer;
> > -     dst_buf =3D jpeg->hw_param.dst_buffer;
> > -     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > +     cancel_delayed_work(&jpeg->job_timeout_work);
> >
> >       irq_status =3D readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
> >               JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> > @@ -297,6 +302,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int =
irq, void *priv)
> >       if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
> >               dev_warn(jpeg->dev, "Jpg Enc occurs unknown Err.");
> >
> > +     ctx =3D jpeg->hw_param.curr_ctx;
> > +     src_buf =3D jpeg->hw_param.src_buffer;
> > +     dst_buf =3D jpeg->hw_param.dst_buffer;
> > +     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> > +
> >       result_size =3D mtk_jpeg_enc_get_file_size(jpeg->reg_base,
> >                                                ctx->jpeg->variant->supp=
ort_34bit);
> >       vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
> > @@ -305,6 +315,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int i=
rq, void *priv)
> >       mtk_jpegenc_put_buf(jpeg);
> >       pm_runtime_put(ctx->jpeg->dev);
> >       clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> > +     mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
> >
> >       jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> >       wake_up(&master_jpeg->hw_wq);

Thanks. I agree that the v4l2-m2m framework should normally provide
the required lifetime synchronization.

The reason it does not appear to work for the multi-core path is that
mtk_jpegenc_worker() and mtk_jpegdec_worker() call
v4l2_m2m_job_finish() immediately after programming the hardware, before
the IRQ or timeout completion path has finished using the context.

That clears TRANS_RUNNING, so a later v4l2_m2m_ctx_release() has no
running m2m job to wait for, while hw_param.curr_ctx can still point to
the context and the IRQ or timeout path can still dereference it.

I added the private in-flight tracking because the early job_finish()
also appears to be what allows the m2m scheduler to dispatch additional
jobs to the other hardware instances. Deferring job_finish() until the
IRQ or timeout path would restore the normal framework lifetime
contract, but since v4l2-m2m tracks a single current transaction per
m2m_dev, it also appears to serialize the multi-core variant.

Would you prefer a correctness-first change that moves job_finish() to
the hardware completion paths, accepting that serialization, or is
there an existing v4l2-m2m mechanism for representing several
concurrent hardware jobs that I have missed?

Thanks,
Guangshuo
