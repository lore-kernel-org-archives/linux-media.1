Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB54043BDD5
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250133; cv=none; b=QiqANA7bpLbotjOsc9WHSUnrg4U7+8csh8MwrqUC//DpOJEZWo6Rg2gP9Uj61ypLXYRoiO2DDpael9uLwqQw53TAbPNWqC61Oozv0fY74Qv9f/jenRwJjvv45ppjETtBjBBV1xqUhzOxvihEEeSqJsLW/gXHIE3zizS7WZztpA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250133; c=relaxed/simple;
	bh=6Ci/VEJZSM0bGfJtrVrGJaZlcyvyeDLOe93SO47o/Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGuowMDNSytccIuox+TMRDKO7dBzYd8yL521WSJrZ47q1ZbdhAhcHBy1Pcdi+8w0JqIKfzfKQNev2JnehpAf6pUcAdZFvXUJ4OC6ALgTQ3I2qXVfGPwdE6yxtn4t9OVF4yBkVieVM+Paw3bKZhvWCh5wDeghCOU3nT46EO4awaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HnUyyAqj; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HnUyyAqj"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a3490bso1649258b3a.3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790250126; x=1790854926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOOv2O6zq4PyMopt568prr5tiBYbBpQ3ybLcCpUCdfI=;
        b=HnUyyAqj4t7eUQBKHBoH6ym+Rj5Gv0LYC/jsoZLX6bz1u/QN1PTj/M9ctMCJEZmOs/
         ugqL/mwxoQuaCH9RJ3DtQ9rCG+OQfjn3n88BkwUAVRMcE2kQCVg3PwnyNExeNNawosxP
         QSupAMsP7qzeQpK3EsaP+Ci07SRAlNFUywJU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790250126; x=1790854926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VOOv2O6zq4PyMopt568prr5tiBYbBpQ3ybLcCpUCdfI=;
        b=cdY49ysnRZFMwuLIhklIVE2i5TVGjhP1ZlwS6pn8/O6887shXmGKzT65bjaGd/GhHP
         yndXnen4ha8uGIafHCzcePLalGr5bkap49f+WCtxdtRudCTogF9BJ9MYbaTF6bRhAQ0u
         +Ax0AHirG+IeVa5yuFhHWz1hduC1BhTD8DIGGcYX955piad4y+Lmb7OhsmyTFYGdcZN2
         fGEwbXh/F31kmxXhkKtlQe6c6TSh6LlI1rFGfnpWy9H9n71ovUbPvYo6zuuS8bl2+Xyc
         c+IMvNiGeG/qys0lycZ7btjOlKyBLYrjdXZse/7WPhI6lGykhOB81FoM1yyvkueMT3lR
         Yu0g==
X-Forwarded-Encrypted: i=1; AKwUvBza7bpC3hZZGcEUMgY2IsP2lnQrTTWM0WvbQMrn/iRx7YGV3I7Rm+hAa6Oq71iCK5fKrTEtQ8r6ExFPXw==@vger.kernel.org
X-Gm-Message-State: AFuF++kzszZDxIe/PgKohCCZ4OeQX27Fq6TELMjiOOwXlY+fFhucQQeG
	Rx8YfDvD8QTA6Nl/7Gs+SBuAOvqMLPk2rsGI8I2C7WwyNlzb8/5SPXoptP5JKqf88W6HLn1TR/k
	RVcURoA==
X-Gm-Gg: AYBFou3HscwV0xpiHUVuS/q42YL2fCLOAQiBI3OXFnGK85uWCfLGHrgqU012GW8ezFC
	lQkOi9l6c+EOtLc9QStXM13qvnnUU5TTbUIxG5VD6Hotpphl4e++PjHD6IVB95fPLX0jVwCF8R5
	1CsrceF/X52Q24nRicAcR1RXOpRk6H3UefmDZxm7t1sQZjpwocoGLhsLAgtlwi4mB8pSVmZG4i8
	29r5+bUgnRrC4oTaZZpMpj5C7BE7iUpC6MQ3oS8bn4zIP/HdLQGzSDEuIDH0/LtYxJ68so9AWI3
	xET7XLrM8t8XY//Ap8dZqkoogctdaEQRxCY1lgzWbzhxSAW1MQfwH5uhWwJNG38RNUVAla1ihj1
	AlKlmU4SSffboEHPl3/0T6db1/nLLrnfceB9t6SVAiWmb9UjxfhCqqhpkUsM2laZiiGOmgouMaH
	F1ILYq/WqjpMQzFuj/SCVl0D3b4mOf/s597/7H/3biSrhBsrYtpe5IJ3ZzP6P17eNQZiNrvdcLd
	oJt12/WhT66E7BfxYeMRNgoGrRmltvXbVf21Wl41jLnCDWXDQ==
X-Received: by 2002:a05:6a21:168e:b0:3dd:a196:69ed with SMTP id adf61e73a8af0-3de0ea5ca76mr1913637637.72.1790250125611;
        Thu, 24 Sep 2026 04:42:05 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dff9769sm2796878b3a.46.2026.09.24.04.42.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 04:42:04 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144ecebb6cbso860984c88.3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 04:42:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwgpCEK5S1hdwNPKEdfbJL1KrfZN8FYVgtNpCSrKwYVIyqFe+42DBz1DnB0L21bMEF7YgZhgf6B/Ytrg==@vger.kernel.org
X-Received: by 2002:a05:7022:f508:b0:13c:dc9f:51c9 with SMTP id
 a92af1059eb24-14503f0e17emr1725764c88.12.1790250123198; Thu, 24 Sep 2026
 04:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903131141.6368-1-huhb1@xiaopeng.com> <20260917144630.16923-1-huhb04@gmail.com>
In-Reply-To: <20260917144630.16923-1-huhb04@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Sep 2026 13:41:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCvrcjTvZGoyYk1Ari3teaNEvorxk1YZL1LbLZxBzXepew@mail.gmail.com>
X-Gm-Features: AclHuK9Cen_qwGLrCLpHMX7fJkmbCIl91iGwSkSnidsxCDIu_h_ukU9-Qanppuw
Message-ID: <CANiDSCvrcjTvZGoyYk1Ari3teaNEvorxk1YZL1LbLZxBzXepew@mail.gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: defer cancelled buffer completion
 until copies finish
To: Hongbing Hu <huhb04@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org, 
	linux5-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hongbing

Something is wrong with your mail agent, it should not add:
In-Reply-To: <20260903131141.6368-1-huhb1@xiaopeng.com>
References: <20260903131141.6368-1-huhb1@xiaopeng.com>

Otherwise it is added to the previous email thread [1]

[1] https://lore.kernel.org/linux-media/20260917144630.16923-1-huhb04@gmail.com/

Have you looked into using b4 for contributing code? I find it much
simpler to use.

On Thu, 17 Sept 2026 at 16:47, Hongbing Hu <huhb04@gmail.com> wrote:
>
> uvc_queue_cancel() returns queued buffers to videobuf2 directly via
> vb2_buffer_done(). This is unsafe because asynchronous memcpy workers may
> still hold a reference on the same uvc_buffer. Once vb2_buffer_done() has
> run, userspace can dequeue and requeue the buffer while the old worker is
> still running, leading to the same list_head being inserted into irqqueue
> twice and corrupting the list.
>
> The crash manifests in two ways depending on the drop-corrupted-frames
> module parameter:
>
> 1. With the default (drop corrupted frames enabled), the old worker's
>    final kref_put reaches uvc_queue_buffer_complete(), sees buf->error set,
>    and calls uvc_queue_buffer_requeue(). This performs list_add_tail() on
>    buf->queue even though userspace has already QBUF'd the same buffer and
>    added it to irqqueue.
>
> 2. With nodrop=1, uvc_queue_buffer_complete() calls vb2_buffer_done() a
>    second time. If userspace has already dequeued and requeued the buffer,
>    the second completion exposes it to userspace again, and the next
>    DQBUF/QBUF inserts the still-linked list_head into irqqueue a second
>    time.
>
> Both cases produce the kind of list_del corruption seen here:
>
>     list_del corruption. next->prev should be ..., but was ...
>     kernel BUG at lib/list_debug.c:64!
>
> Fix the cancel path to remove buffers from irqqueue and drop the queue's
> reference through uvc_queue_buffer_release() (i.e. kref_put()). The final
> VB2 completion then only happens from uvc_queue_buffer_complete() once the
> last async reference is released, so userspace cannot reuse the buffer
> while an old worker still accesses it.
>
> Introduce a dedicated bool cancelled flag in struct uvc_buffer,this keeps
> the cancellation semantics explicit regardless of any later state updates
> from the packet decoder.
> Cancelled buffers are forced to complete as errors; normal malformed frames
> continue to be requeued or dropped as before.

I prefer my commit message [2], but I am probably biased :)

[2] https://lore.kernel.org/linux-media/CANiDSCuxtH1wbXAwoWrbV6Y97dN3Ym-A2zSbkEpLVEGFToXLfg@mail.gmail.com/

>
> Fixes: 01e90464e42e ("media: uvcvideo: queue: Support asynchronous buffer handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongbing Hu <huhb04@gmail.com>
> ---
> v3:
> - invoke uvc_queue_buffer_release() while holding the spinlock to keep it simple
> - Set/clear the new cancelled flag in uvc_queue_cancel() and
>   uvc_buffer_prepare() instead of overloading buf->state.
> - Force cancelled buffers to complete as errors,
>   so the returned buff->state is UVC_BUF_STATE_ERROR.
>
>  drivers/media/usb/uvc/uvc_queue.c | 17 +++++++++++++++--
>  drivers/media/usb/uvc/uvcvideo.h  |  1 +
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 3c002c8f44..1026d7def3 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -122,6 +122,7 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>
>         buf->state = UVC_BUF_STATE_QUEUED;
>         buf->error = 0;
> +       buf->cancelled = false;
>         buf->mem = vb2_plane_vaddr(vb, 0);
>         buf->length = vb2_plane_size(vb, 0);
>         if (vb->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> @@ -289,10 +290,17 @@ int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
>   */
>  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
>  {
> +       struct uvc_buffer *buf;
>         unsigned long flags;
>
>         spin_lock_irqsave(&queue->irqlock, flags);
> -       __uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> +       while (!list_empty(&queue->irqqueue)) {
> +               buf = list_first_entry(&queue->irqqueue, struct uvc_buffer, queue);
> +               list_del(&buf->queue);
> +               buf->error = 1;
> +               buf->cancelled = true;
> +               uvc_queue_buffer_release(buf);
> +       }
>         /*
>          * This must be protected by the irqlock spinlock to avoid race
>          * conditions between uvc_buffer_queue and the disconnection event that
> @@ -356,7 +364,12 @@ static void uvc_queue_buffer_complete(struct kref *ref)

Please add a comment to the function header noting that if
buf->cancelled is true, this function may be called with
queue->irqlock held.

I am dreaming of a day where we can finally remove uvc_no_drop_param :)


>         struct vb2_buffer *vb = &buf->buf.vb2_buf;
>         struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
>
> -       if (buf->error && !uvc_no_drop_param) {
> +       /*
> +        * Buffers cancelled from uvc_queue_cancel() are forced to complete as
> +        * errors. They must not be requeued by the corrupted-frame policy even
> +        * when buf->error is set.
> +        */
> +       if (!buf->cancelled && buf->error && !uvc_no_drop_param) {
>                 uvc_queue_buffer_requeue(queue, buf);
>                 return;
>         }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b6bcee4a22..1b611715fa 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -317,6 +317,7 @@ struct uvc_buffer {
>
>         enum uvc_buffer_state state;
>         unsigned int error;
> +       bool cancelled;
>
>         void *mem;
>         unsigned int length;
> --
> 2.34.1
>

With the comment (and maybe a new commit message, up to you), feel
free to add my:

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>


-- 
Ricardo Ribalda
