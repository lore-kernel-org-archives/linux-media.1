Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D75F2F8E9E
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784317610; cv=pass; b=uGBLWpbvJrUolwiKbvpDuytEpODyovf5J8bDhPCqGBGJpPmXqM0ziGf81dRhlYQJlFhclhr9N/QTW5cpNDjofx8GaTqdcHGQrB8sgyR3BgMvp+qUhZlJgC4hRSPZCsRVxlaUX5d281zGjwynA3fqMQbO1qCGijqLE7YhYPt7s6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784317610; c=relaxed/simple;
	bh=zoiSF3JeQIqnQcvMW43JD4qB9vpjOVAXImiebAn+BPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoUzz50Kr7hhe1qSF6SrKMj2ejJWt6PNW03gqYa2hSa0fAZTGcP1m76nck6dHqSiD9K82rZRbJzmgcminMbCqY5+eZGoIzTIPtY6ESW9FcXkKyvqFsAybBvgl6AjWfv6Ckm+dBWuZh0bxjDDBZ0cJrp2CKEHyfRd3/OqPi+wd/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZLJJ4FtI; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZLJJ4FtI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cab97c86bdso220145ad.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 12:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784317608; cv=none;
        d=google.com; s=arc-20260327;
        b=TX73HddBKemvg8SYAeCEY3GbSBBrwL2UYHUKiTqKYCvuJGx82FAIJC7tuqd9bzbaKq
         cDrJqWbTXPZBLXF/JkjV6h/jsDH4tS8Uni1wdvkB9QYWI2sbGmx8QQqw3SacRpccEYfl
         BObdeOZ9Mv/7Q7esu/VgScnKhLUXmrjCitkRfHdTUbSnIS+iat8rcc0SH3N3BN4cdDYP
         mHt2CHV4CmydqVTl3wOTlN4yyU95D3fBv/SpmlZRyE2a2NnovVmj4ju8fWUKczRNnIww
         K+JTIFoqpw+KdWx0sLCQqD98RvWGREywL/eYNhJ0rtTFp9nm7Hs1igcEiElmLv+YTAYJ
         isSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nsZo6eYxZiNwWUFhdwOagBZhkMfykQcqUISKPpPxaDA=;
        fh=dOlNbiW6Urco0byt7T5UpFujNImDoAtOqtXZokSSmWU=;
        b=WPrLVFz2d8HuXYlQ4FGncRbc6EjCByT67Qby/sxd4rkDkD2frq7xnd6C1UMFLVN1Aj
         BWH4yG6jn/8z1Gjl/s4qP0FMqKNMe0+mEQFM2O/IwuDXIaeYISkqKPyuawFhoCVyXEjV
         8NmtrsclayLi/+Q+S+y0rRP8JLuYQ3B00NKnaCAMwQBWfnuxscXGP132fkmccakcO+n0
         3qFgInnUywXUJbNAAhQ/fAQW/abhy6UifpdS9gy1Q847NIpKdAzrDKF0BHWtNlTp7BLC
         7QwtEqnjlmBTxRE//HgOMiXEXMM2cv0PUZBfGzCS4ur8zuvPeUKZviCicinT5Ab7OIj5
         83UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784317608; x=1784922408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nsZo6eYxZiNwWUFhdwOagBZhkMfykQcqUISKPpPxaDA=;
        b=ZLJJ4FtIxJdZLTVhd1RiJptzGMSMFeQdCy76jT9+DTiciAT7YfYWb72fFvMDWNpFgl
         N3XWmuPV96ZVobFtEwFO2V2fgqk+u1szCWiZbDlJIo8X4otQ+Mhm2g4ZrCjeCUJ0PHUO
         avO+Fm+uF4LOBKtbTGwVHnxiAXI1hFgGFH7rTFiD6N1BYsEmBhfqv7UcCVvTFUDwEZsz
         7gFHNWFj+qYNQTPCi78yKvjzlXUq/Qa9s+DUrVqpLnU2AntH/UeRM/O+8WkQl2BKs1Et
         uXwTbiQmhH+zogVH6PRG/DKvKD2RBfS4ercFxgzk4iR76MGhlrDYtF7DSiFsJXff5Jpz
         BIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784317608; x=1784922408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nsZo6eYxZiNwWUFhdwOagBZhkMfykQcqUISKPpPxaDA=;
        b=XKgNgStNbEnYvxVyLa71iaEFq/NE95q5+E5nR+0pJ/3upr4hl8n1vgB9GyUZyYbB6s
         tWsK29CLahYEcCmS19tRLd5QTsYq1XT/pBA8+Z3w9fdcnMkTn5nyI+5JSC1fofrmS+vS
         9Yr1NPMx+DBuuJvQjiRc1Zwz9rCi82b6NiZpNreAYT0NW5EOQA97f1tqE854qIm5KPkD
         m99oL+aGMkKFLeXkqhxKf2wtxRA79RXaNuSnGun9Mcdylw8vSRFw78ZfGNgQ+8NY/qW6
         rMUUhhmyDQxXOrR3Jr/qt8zYU9H9bms9hsng9sJYMWQrdw6B8de14bfPv3H9rYWlRItj
         01hA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+UR79emYcDhwwQoYLN2yQ0k7LQe/urKRB7EjjT9d6k3q+0BIs14Gcwqh1OEyVEv+aItDujenpd29XIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzldatG9HovKi96IEJgeJgKRK182Qq/As8jVWSqQKoG9Y7Jcjz9
	NVeJVRlocKVIjSCIxmlbDRfWETobg7xbQmyZOe03kLseeL1N0kHgG6OQXtPMrb4GM7pbKFKmcow
	FN9is67WdVXv8RP2z7aWfR61ZFynN/50sRChFjcE=
X-Gm-Gg: AfdE7cnP7DLpTmxc27TVrX+8up7xrzgKqwRcwSWZHECIldi3mAlI3y9naLon3KD8iE7
	Ve8bqUqnk1wDnF6K8yOZyuShUpt3ftwFD34rKfk29LTxhb96ofgEFxWDEL3vOJA1nFIsdRo08fo
	uTNEGEUd63fC357BF24Z3DOErV5/Y9uLW0373rjaxS79XYdLfwHN2VIA9ErUHnRjOj0l4aNUnnf
	O0pZcmVyOobBsEU2NVqM68XcVJ+85cQMAEonsDP9kY0+rCt/HWuG3uF/0Rq3mcsDcpyNzE=
X-Received: by 2002:a17:902:cec8:b0:2cf:41ba:96b8 with SMTP id
 d9443c01a7336-2cf45301963mr639285ad.6.1784317608017; Fri, 17 Jul 2026
 12:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260622204343.1994418-3-briandaniels@google.com> <20260622170708-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260622170708-mutt-send-email-mst@kernel.org>
From: Brian Daniels <briandaniels@google.com>
Date: Fri, 17 Jul 2026 15:46:36 -0400
X-Gm-Features: AUfX_mw74d-5_R4YCuTDMGPYdle20s2YGu2aL-50gbj-ggLz6JZziwCSX5CR83w
Message-ID: <CAD4i_GTBkZRAnBTohkzJSh2XTx+MHkTS_KokEMQ4s0-WP+DxcA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] media: virtio: Add virtio-media driver structs and
 function declarations
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, adelva@google.com, 
	aesteve@redhat.com, changyeon@google.com, daniel.almeida@collabora.com, 
	eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com, 
	hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 5:08=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Jun 22, 2026 at 04:43:37PM -0400, Brian Daniels wrote:
> > From: Alexandre Courbot <gnurou@gmail.com>
> >
> > Add the structs and function declarations for the new virtio-media drvi=
er.
> >
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > ---
> >  drivers/media/virtio/virtio_media.h | 95 +++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 drivers/media/virtio/virtio_media.h
> >
> > diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virtio=
/virtio_media.h
> > new file mode 100644
> > index 000000000..52809d4e9
> > --- /dev/null
> > +++ b/drivers/media/virtio/virtio_media.h
> > @@ -0,0 +1,95 @@
> > +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> > +
> > +/*
> > + * Virtio-media structures & functions declarations.
> > + *
> > + * Copyright (c) 2024-2025 Google LLC.
> > + */
> > +
> > +#ifndef __VIRTIO_MEDIA_H
> > +#define __VIRTIO_MEDIA_H
> > +
> > +#include <linux/virtio_config.h>
> > +#include <media/v4l2-device.h>
> > +
> > +#include "protocol.h"
> > +
> > +#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
> > +
> > +#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
> > +
> > +extern char *virtio_media_driver_name;
> > +extern bool virtio_media_allow_userptr;
> > +
> > +/**
> > + * struct virtio_media - Virtio-media device.
> > + * @v4l2_dev: v4l2_device for the media device.
> > + * @video_dev: video_device for the media device.
> > + * @virtio_dev: virtio device for the media device.
> > + * @commandq: virtio command queue.
> > + * @eventq: virtio event queue.
> > + * @eventq_work: work to run when events are received on @eventq.
> > + * @mmap_region: region into which MMAP buffers are mapped by the host=
.
> > + * @event_buffer: buffer for event descriptors.
> > + * @sessions: list of active sessions on the device.
> > + * @sessions_lock: protects @sessions and ``virtio_media_session::list=
``.
> > + * @events_lock: prevents concurrent processing of events.
> > + * @cmd: union of the device commands "open" and "munmap". The other
> > + *       commands are handled by @struct virtio_media_session
> > + * @resp: union of responses.to device commands "open" and "munmap". T=
he
> > + *        other responses are handled by @struct virtio_media_session
> > + * @vlock: serializes access to the command queue.
> > + * @wq: waitqueue for host responses on the command queue.
> > + */
> > +struct virtio_media {
> > +     struct v4l2_device v4l2_dev;
> > +     struct video_device video_dev;
> > +
> > +     struct virtio_device *virtio_dev;
> > +     struct virtqueue *commandq;
> > +     struct virtqueue *eventq;
> > +     struct work_struct eventq_work;
> > +
> > +     struct virtio_shm_region mmap_region;
> > +
> > +     void *event_buffer;
> > +
> > +     struct list_head sessions;
> > +     struct mutex sessions_lock; /* protects sessions list */
> > +
> > +     struct mutex events_lock; /* prevents concurrent event processing=
 */
> > +
> > +     union {
> > +             struct virtio_media_cmd_open open;
> > +             struct virtio_media_cmd_munmap munmap;
> > +     } cmd;
> > +
> > +     union {
> > +             struct virtio_media_resp_open open;
> > +             struct virtio_media_resp_munmap munmap;
> > +     } resp;
>
>
> You need DMA alignment padding for these things.

Each member of the above unions is already padded to 64-bit alignment,
is that sufficient?

If not, could you tell me what else is necessary?

> Which one can only see when I reads the actual driver 8 patches down.
> Which is why it's not a sensible way to split patches.
>
> A sensible way is to have a driver then add functionality
> in logical pieces gradually.
>

Appreciate the feedback. There was a previous comment requesting to
split the patch into c/h file pairs, but I can try reformatting it as
you suggest for v5.

> > +
> > +     struct mutex vlock; /* serializes command queue access */
> > +     wait_queue_head_t wq;
> > +};
> > +
> > +static inline struct virtio_media *
> > +to_virtio_media(struct video_device *video_dev)
> > +{
> > +     return container_of(video_dev, struct virtio_media, video_dev);
> > +}
> > +
> > +/* virtio_media_driver.c */
> > +
> > +int virtio_media_send_command(struct virtio_media *vv, struct scatterl=
ist **sgs,
> > +                           const size_t out_sgs, const size_t in_sgs,
> > +                           size_t minimum_resp_len, size_t *resp_len);
> > +void virtio_media_process_events(struct virtio_media *vv);
> > +
> > +/* virtio_media_ioctls.c */
> > +
> > +long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
> > +                            unsigned long arg);
> > +extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
> > +
> > +#endif // __VIRTIO_MEDIA_H
> > --
> > 2.55.0.rc0.799.gd6f94ed593-goog
>
