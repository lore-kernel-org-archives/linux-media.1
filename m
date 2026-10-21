Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600130;
	b=h56VEb/kiaJm4c9FnBTUhjNKri21MSnRWRLT+wSfBhA2WP2BxSQ9HXEF9H6Qk6vbTSTU
	 3K9C5ZPX3STaxSD7dqJI6rxVKUh4vC+X8JzzueTYFlOZy4owWKQCAzxzlf/rzRnB5Mneo
	 IfwBreXEblIdR4CtXlH1HsAxrqcVQQoBhWlSQHnxVFgtKnn8NzTHML05TjLMm7TUne0TH
	 IUnFoy//yK9UCMz2iOejqGYlfhQ3HLj0M8OMwpuV1p410/xLXMuI9UeKcP2UY8pwblXv9
	 7dYnkS1UEsGNHC88Ww7VIrJjQ46P7GYrf+YadUXwJFGUQq4peoP5qTgK0/Er8YjI9OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yD9IAYb20XpV4c8q/FjxNnZgM/Snf2zMfMM29REONjA=;
	b=3AyKBKrU5zWXZJH+J3AoGWjM4QULRz4Z+z3bfn/52LTouIp8heV5ldECrmX2ngeSl3jg
	 lcID3xsVJbbT7euto02K/0/SMvysKYw37Ly1BsWQ48L7oWFQyU1dqOh3OgvxPcloLsKYK
	 vkRqPM2zsk0ZQTBXbtyvbheOkQgNAbqjLRL8CBw0T9DLfySqYlgMdWMP+zkK3YJrXKPA/
	 6vRE01EetqAaCWSPQUogyp/G7VQ9EP+xFSq89gVX/rbV58ff67PWonKdqMk7SJ2V+xaPY
	 GY5Iuj9n46B6f2daUc2gZOEsMTuO8i46ifZgBNNZoT/Xi9dsRu3QwnyLb0FYWOo+flg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JmEULUQm;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D8606A31B
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 16:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 874D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JmEULUQm
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so1167947a12.2
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792600128; x=1793204928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yD9IAYb20XpV4c8q/FjxNnZgM/Snf2zMfMM29REONjA=;
        b=JmEULUQmk+oX0mdNlnJ0TR3JBpyxtBiW/qAN0T491dG362TwROGowZ9vuhX9suSogl
         J98Wdw/UsYRUfAyXuSjpkDsha1BcsxCvfO6oW9V8cIJWrGSSxRtEBAt1AB0VE11RaoAx
         5zwyxCm5Prvwzg/fEcbg2I7o5K9s7C02pgxj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600128; x=1793204928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD9IAYb20XpV4c8q/FjxNnZgM/Snf2zMfMM29REONjA=;
        b=cveTmeSRPnK8GXUMpYqh9CbsVOuZpiGMQQ5M3mnGQFff2eHLN+jQ8NGklldtN72/Ec
         WNSs1QhpYDFYkQhEPGevo6eNiNHGzjq2s7TT3O0WqNy2SyGpWW7esHZjDtdmcBtE/3fU
         iV+sACuhDrdEYwbwM4lAl/ZgW8BItXFhHHG42z/k0iR+k2lGPL0diHmvsGcuhimhqqpa
         XpKJb086J7yeCA+4QPQPTp5/3Vx5tkFra8EmKMeTpjM55lNO2AEbSp9CQQjp+7c3WO2d
         g5RUU677ZpsjxPMxRyLuCdcHTw3ocyRb7TpPFYHN1O5Ewwo5B1cglg2sy0AyHP1dlPZY
         tGPA==
X-Gm-Message-State: AFq9FYJtGPlpzngZflrNeiHUv7ia8uxAZ/TOBmWwnkVMT4l7QSGTlMMR
	nDn1KZXRo9YCPOaw1+HJqll4UNdq2YvKq5+ghl3HGi2JRcTvOI9aovsaj0yHYBTJ56rVAehN+Xa
	FE991Ilk0zS4=
X-Gm-Gg: AYBFou1Bp7D5cFATWFtUvOssZAey3JfeGOHQJt11QBu1XyV2PR4gloL3I5Kx1g5vLcu
	gzkWpeV5ndU0rgNqoHpv26qjx6YWlAncpNwMOpICKEmBxE1JBjfA2/p5MON4JNyhqIBGumDmjYb
	S7qhd3rZkqKlGK23tr6MOhZ3lp/HDnp7nYYGij44xOSN6zrM2a0wpaWwr4L7rlf/hu4D3bG71yS
	8SKDYUs/IOysUhAgaa0ie3ZEWwNVyaf5Os9aO7CHSrYcNMkTBg3ZRAH0S0riY5XSFx5uTd84NnN
	q1RLjgTss32cVth4NMWcW4zgnMkBFLF4gB/y511g/olTknQL22q0JG0DChJhXI/T98ehIHNruZl
	vre3LiggGUTwEISzBklVG5YPaokwIYtARpleEOonxXks3Ry7VrSildp1myOFJLQULX58aoz6KIi
	lih8IwC5apfUduv0gvbcC9Nba4UeFUtHWgjO7C+dqGQWnm6z8IJNlrmZh/oc84eAbcxx77t8vTZ
	fqFX5scVKwESb7VxkEtNpgZm0h+Uhb82It+aeENKop1PRDHQZNudK0K4KXD6jUiYCcl/uV+FM2z
	LMs+cxueFss3U1w=
X-Received: by 2002:a05:6402:4493:b0:6b1:8818:1090 with SMTP id 4fb4d7f45d1cf-6b408ead3a2mr1848237a12.22.1792600127838;
        Wed, 21 Oct 2026 09:28:47 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403167e3fsm1013141a12.34.2026.10.21.09.28.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:28:47 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so12431a12.1
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 09:28:47 -0700 (PDT)
X-Received: by 2002:a05:6402:2044:b0:6b1:c6fc:aba0 with SMTP id
 4fb4d7f45d1cf-6b3e9be7ba4mr120012a12.7.1792599663258; Wed, 21 Oct 2026
 09:21:03 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792392288.git.kmehltretter@gmail.com> <673c04ad9dcc4f12685c076193ebad9e48e5f08d.1792392288.git.kmehltretter@gmail.com>
In-Reply-To: <673c04ad9dcc4f12685c076193ebad9e48e5f08d.1792392288.git.kmehltretter@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 22 Oct 2026 01:20:45 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>
X-Gm-Features: AclHuK80vv_q-GEvbu8sLJBBH0IyziGztPYcS_R9pzpbS5seFO7FReBA3oE07cA
Message-ID: <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: videobuf2: add opt-in DMA-BUF CPU access
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomasz Stanislawski <t.stanislaws@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 4:14=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> Drivers must bracket CPU access to imported DMA-BUFs with
> dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().
>
> Add a queue flag to do so from buf_prepare() through buf_finish(). Use
> read access for output and write access for capture. Map imports
> bidirectionally because CPU and device access directions are opposite.
> Pass the mapping direction to attach_dmabuf() so USERPTR and MMAP keep
> the queue's normal direction.

This isn't right. For the regular vb2 mem ops (dma-sg, dma-contig), a
buffer in the prepared state is expected to be ready for hardware
usage, meaning only the hardware can access it until the buffer is
finished. The vmalloc ops are special in a way that CPU is the
"hardware".

>
> Keep this opt-in because some vb2-vmalloc drivers pass buffers to
> hardware. End access in process context because DMA-BUF callbacks may
> sleep.

That is at least unexpected, but also probably wrong (I haven't
checked all the drivers) - the vmalloc mem ops are expected to be used
by drivers that only access the buffer contents from the CPU.

Putting all the above together, what I think we need is:
 1) prepare/finish ops in vb2_vmalloc_memops to invoke the
dma_buf_begin/end_cpu_access() API if the buffer is backed by a
DMA-buf,
 2) some vb2 API for drivers using the regular (dma-) memops to invoke
the dma_buf_begin/end_cpu_access() API for them when they need to
perform some CPU accesses to the buffers - typically they would do
that in their vb2_ops::buf_prepare/finish callbacks, but definitelly
must not after the buffer is already prepared.

It sounds like this series focuses on uvcvideo and vivid, which likely
means that 1) alone would be enough to fix the original problem. WDYT?

Best,
Tomasz

>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 83 ++++++++++++++++++-
>  .../common/videobuf2/videobuf2-dma-contig.c   |  5 +-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  5 +-
>  .../common/videobuf2/videobuf2-vmalloc.c      |  5 +-
>  include/media/videobuf2-core.h                | 12 ++-
>  5 files changed, 101 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index 460eaf4e82f78..d2a78cd0a86bb 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -371,6 +371,65 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *=
vb)
>                 call_void_memop(vb, finish, vb->planes[plane].mem_priv);
>  }
>
> +/* Output buffers are read by the driver; capture buffers are written. *=
/
> +static enum dma_data_direction vb2_cpu_access_dir(const struct vb2_queue=
 *q)
> +{
> +       return q->is_output ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +}
> +
> +static bool __vb2_dmabuf_is_duplicate(const struct vb2_buffer *vb,
> +                                     unsigned int plane)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < plane; i++)
> +               if (vb->planes[i].dbuf =3D=3D vb->planes[plane].dbuf)
> +                       return true;
> +
> +       return false;
> +}
> +
> +static void __vb2_buf_end_cpu_access(struct vb2_buffer *vb,
> +                                    unsigned int num_planes)
> +{
> +       struct vb2_queue *q =3D vb->vb2_queue;
> +       enum dma_data_direction dir =3D vb2_cpu_access_dir(q);
> +       unsigned int plane;
> +
> +       for (plane =3D 0; plane < num_planes; plane++) {
> +               int ret;
> +
> +               if (__vb2_dmabuf_is_duplicate(vb, plane))
> +                       continue;
> +
> +               ret =3D dma_buf_end_cpu_access(vb->planes[plane].dbuf, di=
r);
> +               if (ret)
> +                       pr_warn_ratelimited("[%s] failed to end CPU acces=
s to dmabuf plane %u: %d\n",
> +                                           q->name, plane, ret);
> +       }
> +}
> +
> +static int __vb2_buf_begin_cpu_access(struct vb2_buffer *vb)
> +{
> +       struct vb2_queue *q =3D vb->vb2_queue;
> +       enum dma_data_direction dir =3D vb2_cpu_access_dir(q);
> +       unsigned int plane;
> +       int ret;
> +
> +       for (plane =3D 0; plane < vb->num_planes; plane++) {
> +               if (__vb2_dmabuf_is_duplicate(vb, plane))
> +                       continue;
> +
> +               ret =3D dma_buf_begin_cpu_access(vb->planes[plane].dbuf, =
dir);
> +               if (ret) {
> +                       __vb2_buf_end_cpu_access(vb, plane);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  /*
>   * __setup_offsets() - setup unique offsets ("cookies") for every plane =
in
>   * the buffer.
> @@ -1423,6 +1482,9 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>         }
>
>         if (reacquired) {
> +               enum dma_data_direction attach_dir =3D q->uses_cpu_access=
 ?
> +                       DMA_BIDIRECTIONAL : q->dma_dir;
> +
>                 if (vb->planes[0].mem_priv) {
>                         vb->copied_timestamp =3D 0;
>                         call_void_vb_qop(vb, buf_cleanup, vb);
> @@ -1453,7 +1515,8 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                                                   vb,
>                                                   q->alloc_devs[plane] ? =
: q->dev,
>                                                   planes[plane].dbuf,
> -                                                 planes[plane].length);
> +                                                 planes[plane].length,
> +                                                 attach_dir);
>                         if (IS_ERR(mem_priv)) {
>                                 dprintk(q, 1, "failed to attach dmabuf\n"=
);
>                                 ret =3D PTR_ERR(mem_priv);
> @@ -1504,9 +1567,21 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                 }
>         }
>
> +       if (q->uses_cpu_access) {
> +               ret =3D __vb2_buf_begin_cpu_access(vb);
> +               if (ret) {
> +                       dprintk(q, 1, "failed to begin CPU access to dmab=
uf: %d\n",
> +                               ret);
> +                       call_void_vb_qop(vb, buf_cleanup, vb);
> +                       goto err_put_vb2_buf;
> +               }
> +       }
> +
>         ret =3D call_vb_qop(vb, buf_prepare, vb);
>         if (ret) {
>                 dprintk(q, 1, "buffer preparation failed\n");
> +               if (q->uses_cpu_access)
> +                       __vb2_buf_end_cpu_access(vb, vb->num_planes);
>                 call_void_vb_qop(vb, buf_cleanup, vb);
>                 goto err_put_vb2_buf;
>         }
> @@ -1756,6 +1831,8 @@ int vb2_core_remove_bufs(struct vb2_queue *q, unsig=
ned int start, unsigned int c
>
>                 __vb2_buf_mem_finish(vb);
>                 call_void_vb_qop(vb, buf_finish, vb);
> +               if (q->memory =3D=3D VB2_MEMORY_DMABUF && q->uses_cpu_acc=
ess)
> +                       __vb2_buf_end_cpu_access(vb, vb->num_planes);
>                 vb->prepared =3D 0;
>         }
>
> @@ -2160,6 +2237,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned in=
t *pindex, void *pb,
>         }
>
>         call_void_vb_qop(vb, buf_finish, vb);
> +       if (q->memory =3D=3D VB2_MEMORY_DMABUF && q->uses_cpu_access)
> +               __vb2_buf_end_cpu_access(vb, vb->num_planes);
>         vb->prepared =3D 0;
>
>         if (pindex)
> @@ -2296,6 +2375,8 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
>
>                 if (vb->prepared) {
>                         call_void_vb_qop(vb, buf_finish, vb);
> +                       if (q->memory =3D=3D VB2_MEMORY_DMABUF && q->uses=
_cpu_access)
> +                               __vb2_buf_end_cpu_access(vb, vb->num_plan=
es);
>                         vb->prepared =3D 0;
>                 }
>                 __vb2_dqbuf(vb);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/driv=
ers/media/common/videobuf2/videobuf2-dma-contig.c
> index 9ce6284cd5f26..68c146c043fb1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -768,7 +768,8 @@ static void vb2_dc_detach_dmabuf(void *mem_priv)
>  }
>
>  static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *=
dev,
> -                                 struct dma_buf *dbuf, unsigned long siz=
e)
> +                                 struct dma_buf *dbuf, unsigned long siz=
e,
> +                                 enum dma_data_direction dma_dir)
>  {
>         struct vb2_dc_buf *buf;
>         struct dma_buf_attachment *dba;
> @@ -794,7 +795,7 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *=
vb, struct device *dev,
>                 return dba;
>         }
>
> -       buf->dma_dir =3D vb->vb2_queue->dma_dir;
> +       buf->dma_dir =3D dma_dir;
>         buf->size =3D size;
>         buf->db_attach =3D dba;
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/=
media/common/videobuf2/videobuf2-dma-sg.c
> index b1d0695cda260..ab03f9d31391a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -616,7 +616,8 @@ static void vb2_dma_sg_detach_dmabuf(void *mem_priv)
>  }
>
>  static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct devi=
ce *dev,
> -                                     struct dma_buf *dbuf, unsigned long=
 size)
> +                                     struct dma_buf *dbuf, unsigned long=
 size,
> +                                     enum dma_data_direction dma_dir)
>  {
>         struct vb2_dma_sg_buf *buf;
>         struct dma_buf_attachment *dba;
> @@ -640,7 +641,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buff=
er *vb, struct device *dev,
>                 return dba;
>         }
>
> -       buf->dma_dir =3D vb->vb2_queue->dma_dir;
> +       buf->dma_dir =3D dma_dir;
>         buf->size =3D size;
>         buf->db_attach =3D dba;
>         buf->vb =3D vb;
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers=
/media/common/videobuf2/videobuf2-vmalloc.c
> index 63f023696f3ee..c38faa0188bc9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -402,7 +402,8 @@ static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
>  static void *vb2_vmalloc_attach_dmabuf(struct vb2_buffer *vb,
>                                        struct device *dev,
>                                        struct dma_buf *dbuf,
> -                                      unsigned long size)
> +                                      unsigned long size,
> +                                      enum dma_data_direction dma_dir)
>  {
>         struct vb2_vmalloc_buf *buf;
>
> @@ -414,7 +415,7 @@ static void *vb2_vmalloc_attach_dmabuf(struct vb2_buf=
fer *vb,
>                 return ERR_PTR(-ENOMEM);
>
>         buf->dbuf =3D dbuf;
> -       buf->dma_dir =3D vb->vb2_queue->dma_dir;
> +       buf->dma_dir =3D dma_dir;
>         buf->size =3D size;
>
>         return buf;
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-cor=
e.h
> index 4b4f4c15c53a7..8dfe22fa4423c 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -78,7 +78,8 @@ struct vb2_buffer;
>   *             to the userspace, also optional.
>   * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operat=
ion;
>   *                used for DMABUF memory types; dev is the alloc device
> - *                dbuf is the shared dma_buf; returns ERR_PTR() on failu=
re;
> + *                dbuf is the shared dma_buf; dma_dir is the DMA mapping
> + *                direction; returns ERR_PTR() on failure;
>   *                allocator private per-buffer structure on success;
>   *                this needs to be used for further accesses to the buff=
er.
>   * @detach_dmabuf: inform the exporter of the buffer that the current DM=
ABUF
> @@ -136,7 +137,8 @@ struct vb2_mem_ops {
>         void            *(*attach_dmabuf)(struct vb2_buffer *vb,
>                                           struct device *dev,
>                                           struct dma_buf *dbuf,
> -                                         unsigned long size);
> +                                         unsigned long size,
> +                                         enum dma_data_direction dma_dir=
);
>         void            (*detach_dmabuf)(void *buf_priv);
>         int             (*map_dmabuf)(void *buf_priv);
>         void            (*unmap_dmabuf)(void *buf_priv);
> @@ -510,6 +512,11 @@ struct vb2_buf_ops {
>   *             ->finish().
>   * @non_coherent_mem: when set queue will attempt to allocate buffers us=
ing
>   *             non-coherent memory.
> + * @uses_cpu_access: the driver transfers buffer data with the CPU inste=
ad of
> + *             DMA. For imported dma-bufs, videobuf2 brackets the interv=
al from
> + *             buf_prepare through buf_finish with dma_buf_begin_cpu_acc=
ess()
> + *             and dma_buf_end_cpu_access(). Imported attachments use
> + *             bidirectional DMA mappings.
>   * @lock:      pointer to a mutex that protects the &struct vb2_queue. T=
he
>   *             driver must set this to a mutex to let the v4l2 core seri=
alize
>   *             the queuing ioctls. This lock is used when waiting for a =
new
> @@ -614,6 +621,7 @@ struct vb2_queue {
>         unsigned int                    uses_requests:1;
>         unsigned int                    allow_cache_hints:1;
>         unsigned int                    non_coherent_mem:1;
> +       unsigned int                    uses_cpu_access:1;
>
>         struct mutex                    *lock;
>         void                            *owner;
> --
> 2.47.3
>
