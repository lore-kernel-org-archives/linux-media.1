Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758349;
	b=BwzajS6r99oWel41LPGeTF3DBB7EQsiNFfORikurr0NIx5Z6oT8vnM4kAoK04eqi5vvK
	 4b9CWNqkC+1wVVdoWLml64DVoTLrriQBsunRONYgRN5Fu9FvGDrVLwsoR05uEh7sAzZ/F
	 iK4bcN8EojMtIcMKiJKplIFMYxy+3lo0d/QUyL/VD/QHKCSb/nmQry8DVEfpuSDMHpOdo
	 rA5rT+GClgMsW6SIunb3XfPH5cHy/wA6ofq82Gxu1Ook+kKosfMXZwLfhcPvPaWUpBBrR
	 gjjsmWwQYdkVNXo/d0noV1q1wpknoONQ+3tmfvSg0822sg47UsyQTOM3UQ51StNffyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
	b=lZvMLBBZGZZx/3t49/8HS05J+8pS75wEp35JumQM19bR6ZG6onXff71wxh71JVXQIZ+l
	 gciV05339NdDlSKYBPiScP5mBAakhAlaVlLhJjCd9Zo2OmNzur8l151JLdpRQBlGdgtI9
	 7+FQXkFose9wphGApSp4YNsMIARW0XC8ZMi8y8fEugstV4LTOSuw74OAgFwCx7Hn/QBjg
	 mjLvfZbQY1Q9sAbq+gpNfE/xFHdQZ0BEnN3GVupWtk2Ktia6O09QcWdO5DRLHrJBMCAV3
	 3iTRroQPZDR1GhZZB6XSQWBuKBCIgidukA3MLcDZVkeUQge1pxIcY+RVaJmeLWarGDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhe+kyK0;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C9606A324
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38C9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhe+kyK0
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b53db3d0a5so7934a91.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795758348; x=1796363148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
        b=mhe+kyK0VVGVYeJouQ09m8H5WI3njxmJANGLkLkHkwybehLVRDQvLBiqm8eTo5D7i0
         PTMo1vbOJfvvklt3uSmZ/0w8nNOzuhkpg5qSog4jnLH0q+foAqHpJYdNBLm7fhhqeVCU
         BqY6Vg1licMPi+uR3cXoFxQ7XzZeDl19PuQcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758348; x=1796363148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
        b=jltGbXBS8hgmGVWf//zgLjxLJJQpsrwayDfGEiRPlAPOhaGpr/1Q9DIQYDL2S2f29H
         CIlweIGeS0+uOCMhRJPQ2ugPVLb3BYpQRf4RR1s1hEiGpGvBhTYBl3BP0H21r0JvuJ6S
         WuL2Y7go5RRtxROQvAj7ZCXwD+D547r8zo2rpy6sVtqsPc4TF8YsqY2BCcb05/clfJmD
         iT3JhpksQh/Kq2uZx6s9gpaCsUt0Z/vwtwylERUvGwDnY2eI/cB30PtlifUa1JO92pBl
         gE9FLdurLY3S7SXEVp/21pznykpXyQs6LUm75X+yywspu9tV0ZkEzEZswG6f/4sxSLOR
         wwNQ==
X-Forwarded-Encrypted: i=1; AL+hErHeC947ee4EELLmEfct76XJOfFzp5+eSjE6TKB4b0fa0oZ4rgWZAA5Rvo37IT6xtYZOmOk1yqxpdVx1og==@vger.kernel.org
X-Gm-Message-State: APuU4Z8G5YRhmPYTdaOumC6lGetJPWcG+5mdfVNz9TO8TpF9GzA+2/Cf
	8rV8EEctkU7OH4L17pObA0aH0vQeb4O4rN9gKIiQfvhyRvCkPzact5q33qWfsi84YSk0TmgEJOB
	chRLyVg==
X-Gm-Gg: AZFdTZfpy0pR31LDYi1k6zXM3aQmELBWd4khcFMOKyVwlbjfQhQbIAK/0a0tx1/7NPA
	wCk5P8YwiPSEwTLwyYHigxvgMuIHNgNAYVvMEY3ec9fh8EDFL7g+MYJAm4ESDH5uhXO8V/0Lhh4
	IEqLfawXhOIgX8fER/54zdcBhC7XL3MG1ZsPgaeB/Z8VsHZKV8iZlZNlxbjtEt7wgtJNGDOT6vE
	2VSqlRyiREK6wOLmvxTrotKPQfybzcKQowrMIPP0GUWX6caJMNlhsaK+MXFVY0+yEMfHWhpQ8AZ
	iueMBhju4b6jhubm0279b4mEGdm/aBKkTqsijXDlwKIg6vMU521eV6NY5FdOJDK8V2Kxj1NroYC
	E3kvT7+dJvyYkUQMSU2rPZQ4WPDH24WenQPT2cpryco4QaAY3Ax+SWKhv1vw683c//9LRNggiL1
	OS+xn9Y2GCnGQWApDAD12Jg9nGlJ+LMY1R8j/2S5fNXcdGyYGWf8Ga3rYzvVjkH06F9T6ILL+zH
	x6ueIlOkWiR9VS648HaiyAjVBSlxLzDqnAkJZy44RCW4rx+JyOGFStx4duJakXnl+auAXHOxOgs
	+ewajmTX4Y0LdiBoDZ3swxORYIF+923QxRsWbHiOjZy2CGJW+jqiZ/V1qMh+C6+AfPI=
X-Received: by 2002:a17:90b:5287:b0:3b4:402:b3fa with SMTP id 98e67ed59e1d1-3b41c8fe1edmr22183685a91.18.1795758348031;
        Thu, 26 Nov 2026 21:45:48 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm39218643a91.12.2026.11.26.21.45.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:45:47 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso16428493eec.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:45:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFPliEGsdJ+abNTOXjh9fKKUQdkiIpF3oRjxUVPBp3h/iOhcog+rWCpXFE1BJdw32mQnwB+lPLSx8F79w==@vger.kernel.org
X-Received: by 2002:a05:693c:87d2:10b0:386:b5a8:1c5b with SMTP id
 5a478bee46e88-386b5a82496mr13605222eec.18.1795758345905; Thu, 26 Nov 2026
 21:45:45 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023075642.3671805-1-fshao@chromium.org> <20261023075642.3671805-2-fshao@chromium.org>
 <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
In-Reply-To: <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 13:45:07 +0800
X-Gmail-Original-Message-ID: <CAC=S1niZJjX92misxLioPnpoFJNfJEjWuaHsH_iiQ7TGs2afDQ@mail.gmail.com>
X-Gm-Features: Aa3M54qNDjQhU6gA65neybgLv3Xn13aUHMcLYLRb3RcSnItlV06t95c1GfEEZAc
Message-ID: <CAC=S1niZJjX92misxLioPnpoFJNfJEjWuaHsH_iiQ7TGs2afDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on
 NULL va in stateful decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 3:17=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi Fei,
>
> sorry for the delay, so many patches...

No problem at all. Appreciate your time and review!

>
> Le vendredi 23 octobre 2026 =C3=A0 15:55 +0800, Fei Shao a =C3=A9crit :
> > mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
> > If vb2_plane_vaddr() returns NULL because the buffer has no kernel
> > mapping, the worker finishes the m2m job with the buffer still at the
> > head of the ready list. v4l2_m2m_job_finish() then schedules the same
> > job again, which fails the same way, so the decoder never makes
> > progress.
> >
> > Remove the buffer from the ready list so that the job is not scheduled
> > again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
> > back. Print the error before that, as the buffer must not be touched
> > once it is returned.
> >
> > Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video=
 Decoder Driver")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateful.c
> > index aa9bdee7a96c..a4cbb7c76998 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teful.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teful.c
> > @@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *wo=
rk)
> >       buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,=
 0);
> >       buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
> >       if (!buf.va) {
> > -             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> >               mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!",=
 ctx->id,
> >                                 src_buf->vb2_buf.index);
> > +             v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +             v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> > +             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>
> I did some research as all this felt very late and defensive. My conclusi=
on is
> that you should validate this in vb2ops_vdec_buf_prepare() (mtk_vcodec_de=
c.c).
> This will let you remove this defensive check. Buffers that failed to map=
 (or
> unmappable/protected memory?) will simply not endup in the queue. It will=
 also
> give an immediate feedback to userspace.

Agreed. Early rejection, fewer manual checks and less code overall is
much better.
I sent v3 as a single patch:
https://lore.kernel.org/all/20261127-vcodec-null-va-v3-1-e24521086062@chrom=
ium.org/

Thanks,
Fei


>
> Nicolas
>
> >               return;
> >       }
> >       mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=
=3D%zx vb=3D%p",
