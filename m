Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B193E400E0A
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552962; cv=none; b=UO37OiYMj1uFyZzH9L86d2RoTLv0A5MZMOzm/JdaujjvIGuI4SVqsqKs5tXMet2A+yFfEENJgEQHzG+OYsvbBHQn8UhPacKArERWBI+Gmc8jX5FIf5hTNGSDZWDJL1t3TSfqMdFwfJgKBdo5E6NOEdtNfZl2sFFypws03gdB2BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552962; c=relaxed/simple;
	bh=FS8MxZ8YyGQ2W9Hj1dd+u+1B1d277SbJNR23NtdMutE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PW3AMBPzqRASC0NnyBWdZQPfRg/jdX2ak1kN+GOEpNEiAXm+ba1xOgWqdQ7NLo6wIbR+9v9Wo2pHeexoD4WHEHtZrc18OXGW/1HWuQD/gnzjmD2CC1Lp+LYrsZ1lL4uSbQPtOdMtd+DQc4NFbOFnrjEGnAbttSylbezYeJlsa5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a4hPeczg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFNy+ZcS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a4hPeczg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFNy+ZcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784552958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hXdalDaXy2xf3eodZl74rZNVVsdWJmZ/y6OsbO7vO2g=;
	b=a4hPeczgRp7j1qKfFWP53eIKgps5lIOGesEZnNgQLKka04toHz8LEqBVkeFL6I9NLYn7NV
	iStpvgtG7FxQVrNuVO592RVo1f7kd90uXtyhYlKF90qZ0Wf9v/2PN53mmB2zu20fEqodH2
	fxIL4jeVTnrzBKdv4sl2MMD1UvkXm9Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-FTYGHtmfPCuNkL3GBzRfmQ-1; Mon, 20 Jul 2026 09:09:17 -0400
X-MC-Unique: FTYGHtmfPCuNkL3GBzRfmQ-1
X-Mimecast-MFC-AGG-ID: FTYGHtmfPCuNkL3GBzRfmQ_1784552956
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f3e6cc5c4so4345927f8f.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 06:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784552956; x=1785157756; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXdalDaXy2xf3eodZl74rZNVVsdWJmZ/y6OsbO7vO2g=;
        b=HFNy+ZcSYA8MDfOULraMg4AzLZ4wxyQsQUmGCnyle6+uOEPV/bz6WUePFEX3uldd6+
         tvpunyUnn0d3IVprw+FOvfdGB2LEIEoiPnGxOFwgM8782XDe5dtWefX0XFTtKG0OSleb
         WR7bMB0ZwKGv2s6Vu56S/g2AdiTgEJh/7UbOa72QUZLpTd1tteQ/2NJLlqysr9944yr+
         pC0Nln0xIRzFS+xlDP06jXw2VFiwYG/jpTVK+sfBUwvTr3S3IQJIOQ0ndIOpF5y2sfqO
         8Gi7SHES6c8Ge4K2Mx/q+t3ne8fPv4gEKC0XBd/MuvCG56JvpXzwrZeVOeCxSJmRPSe4
         ixHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552956; x=1785157756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hXdalDaXy2xf3eodZl74rZNVVsdWJmZ/y6OsbO7vO2g=;
        b=NSfILAQeAKOfL9kFt7dDr70XlefqjkKeE7S4XUfabT54FnYj39ooj/21Sol4qHwGIS
         C5YTZd+ycXlQEtBVUwP7anuYLYN6Xqkp6laRBy6QAjbNiKoBoRIBH0g5r+LWJdyOVf4L
         w962TxBji4cwJgrcIV0lOy+CtI3xJejQjtwUKRTvvHb/8pcyplNkg2XH2qduBqeKjqYx
         XAsyajla45fBS9Sp7T3esvheADNZow2K518Z2cVQO9Lo0aIh6atB0CfWSWwcXeXJ+xiK
         xs9GW6Mb9YWqMc4LGQea/41IKJm0EP17lWPgYnw3H14G3Q9RjD9ycOtu/T9JL0s0KaNx
         8O/w==
X-Forwarded-Encrypted: i=1; AHgh+RocEpPoKsu4wADFlhg9KMwXxRpEy+sz/LnkgCsD+zoM1LyZhRtS+DoFJk3qvk4iNWytJqrr67kKlKOu1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgiP8Dd4hPaMF3pVJryqU8+E39UpFewasZtW9qDtkg9XrM6bA1
	zbQTWksV+YiangSUJ2FGXFIRWZq5BLqX8Sbm52J9Xkb8uMsYsnfw+jaa0QKfks7QnlZzMZTYyDk
	0wWuaTDHLZoF5d6oFb8hG4gSZzL4DMkxLtxuCIpaNsEf0spxOmlJ4+52McfAbzTvw
X-Gm-Gg: AR+sD126PESD8bPHQv0ISZwr+RvPGzKQLzGecyVPNzFEYdpc/R6cVjlgUpbrC3/u1OR
	gMA4KFUD9hGfIoRV9iVomZ8dSKDbzREcoYKRYMxbQwWYiJ6RKh01jkURsInvI4MAVZhANH5lTNU
	gx0vI9A3ID9F41J8ABuzSTA3mVSo2mi6MF5O6cGJ67dRN8ww0f7q9zvyloGf+Megal7gYw/G5yA
	KtM69EZXvdC7oSGhW8qR2FzcmLwhUmccqe3JpeYTOzoyyyaziocRT67B+kPzxPKHEfqdmS5P5nN
	mY98Sns538n2of+CiQp6OyVLnjwJQmSyBoz2DMN2gAyaSg9eYiD8WpplcoNtyPCzyG2UE5D2bCI
	8RkKItRXN0SqMIBwFTSTXTA==
X-Received: by 2002:a05:6000:24c9:b0:47f:756f:9a8f with SMTP id ffacd0b85a97d-47f756f9c0dmr6727119f8f.26.1784552955894;
        Mon, 20 Jul 2026 06:09:15 -0700 (PDT)
X-Received: by 2002:a05:6000:24c9:b0:47f:756f:9a8f with SMTP id ffacd0b85a97d-47f756f9c0dmr6727069f8f.26.1784552955265;
        Mon, 20 Jul 2026 06:09:15 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-37-66.inter.net.il. [80.230.37.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed244asm28675096f8f.20.2026.07.20.06.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:09:14 -0700 (PDT)
Date: Mon, 20 Jul 2026 09:09:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alistair Delva <adelva@google.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Brian Daniels <briandaniels@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
	aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 6/8] media: virtio: Add virtio_media_driver
Message-ID: <20260720090703-mutt-send-email-mst@kernel.org>
References: <20260622171017-mutt-send-email-mst@kernel.org>
 <20260625201850.2981130-1-briandaniels@google.com>
 <20260712085726.19198fda@foz.lan>
 <20260718132759-mutt-send-email-mst@kernel.org>
 <CANDihLFeF_nKi5z=eH5Mwaa4s8fEU1chS4K2VQZ+0b-0OLybjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDihLFeF_nKi5z=eH5Mwaa4s8fEU1chS4K2VQZ+0b-0OLybjg@mail.gmail.com>

On Mon, Jul 20, 2026 at 05:35:19AM -0700, Alistair Delva wrote:
> On Sat, Jul 18, 2026 at 10:29 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Jul 12, 2026 at 08:57:26AM +0200, Mauro Carvalho Chehab wrote:
> > > On Thu, 25 Jun 2026 16:18:48 -0400
> > > Brian Daniels <briandaniels@google.com> wrote:
> > >
> > > > > > From: Alexandre Courbot <gnurou@gmail.com>
> > > > > >
> > > > > > virtio_media_driver.c provides the expected driver hooks, and support
> > > > > > for mmapping and polling.
> > > > > >
> > > > > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > > > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > > > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > > > > > ---
> > > > > >  drivers/media/virtio/virtio_media_driver.c | 959 +++++++++++++++++++++
> > > > > >  1 file changed, 959 insertions(+)
> > > > > >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > > > > >
> > > > > > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media/virtio/virtio_media_driver.c
> > > > > > new file mode 100644
> > > > > > index 000000000..d6363c673
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/media/virtio/virtio_media_driver.c
> > > > > > @@ -0,0 +1,959 @@
> > > > > > +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> > > > > > +
> > > > > > +/*
> > > > > > + * Virtio-media driver.
> > > > > > + *
> > > > > > + * Copyright (c) 2024-2025 Google LLC.
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/delay.h>
> > > > > > +#include <linux/device.h>
> > > > > > +#include <linux/dev_printk.h>
> > > > > > +#include <linux/mm.h>
> > > > > > +#include <linux/mutex.h>
> > > > > > +#include <linux/scatterlist.h>
> > > > > > +#include <linux/types.h>
> > > > > > +#include <linux/videodev2.h>
> > > > > > +#include <linux/vmalloc.h>
> > > > > > +#include <linux/wait.h>
> > > > > > +#include <linux/workqueue.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/moduleparam.h>
> > > > > > +#include <linux/virtio.h>
> > > > > > +#include <linux/virtio_config.h>
> > > > > > +#include <linux/virtio_ids.h>
> > > > > > +
> > > > > > +#include <media/frame_vector.h>
> > > > > > +#include <media/v4l2-dev.h>
> > > > > > +#include <media/v4l2-event.h>
> > > > > > +#include <media/videobuf2-memops.h>
> > > > > > +#include <media/v4l2-device.h>
> > > > > > +#include <media/v4l2-ioctl.h>
> > > > > > +
> > > > > > +#include "protocol.h"
> > > > > > +#include "session.h"
> > > > > > +#include "virtio_media.h"
> > > > > > +
> > > > > > +#define VIRTIO_MEDIA_NUM_EVENT_BUFS 16
> > > > > > +
> > > > > > +/* ID of the SHM region into which MMAP buffer will be mapped. */
> > > > > > +#define VIRTIO_MEDIA_SHM_MMAP 0
> > > > > > +
> > > > > > +/*
> > > > > > + * Name of the driver to expose to user-space.
> > > > > > + *
> > > > > > + * This is configurable because v4l2-compliance has workarounds specific to
> > > > > > + * some drivers. When proxying these directly from the host, this allows it to
> > > > > > + * apply them as needed.
> > > > > > + */
> > > > > > +char *virtio_media_driver_name;
> > > > > > +module_param_named(driver_name, virtio_media_driver_name, charp, 0660);
> > > > >
> > > > >
> > > > > Um. What? Not how it should be handled.
> > > >
> > > > I can remove this module param. I didn't end up using this when compliance testing.
> > > > Instead, I patched v4l-utils:
> > > > https://lore.kernel.org/all/20260528163448.4031965-1-briandaniels@google.com/
> > > >
> > > > Let me know if you think the v4l-utils patch is a good approach, otherwise let
> > > > me know how you'd prefer to address the v4l2-compliance driver-specific workounds
> > > > when they're being proxied with virtio-media.
> > >
> > > This kind of discussion should happen on a separate PR for v4l2-compliance,
> > > c/c to the proper developers and maintainers of it.
> >
> >
> > I wonder how migration can work when guest is tied to host driver model like
> > this.
> 
> We haven't given migration much thought yet, but I think it wouldn't
> be so different to GPU, where to do snapshot/migration we have to
> record all initialization / context setup state and replay it against
> the GPU driver on restore (see https://github.com/google/gfxstream).
> Some migrations will be possible, some will not, and the host should
> be able to decide.
> 
> Also, Brian mentioned the host device pass-through use case, but we
> also have device implementations on the host that work with camera
> emulators or some other data source like video/webrtc, which will
> support snapshot/migration more easily. This use case will probably
> will see more real-world use and migration will be more relevant.

This is par for the course.


But I'm afraid I wasn't clear enough. This thread mentions
supplying the host driver name to guest userspace
in order to implement "driver specific work arounds".

But given such, for migration to work userspace needs
to be notified about driver change? And what to do about
the things it started after migration but before the
notification?


> > > >
> > > > > > +
> > > > > > +/*
> > > > > > + * Whether USERPTR buffers are allowed.
> > > > > > + *
> > > > > > + * This is disabled by default as USERPTR buffers are dangerous, but the option
> > > > > > + * is left to enable them if desired.
> > > > > > + */
> > > > > > +bool virtio_media_allow_userptr;
> > > > > > +module_param_named(allow_userptr, virtio_media_allow_userptr, bool, 0660);
> > > > >
> > > > >
> > > > > is this kind of thing common?
> > >
> > > There is one old media device that has it (saa7134).
> > >
> > > >
> > > > To be honest, I don't really know. I'm also not that familiar with the USERPTR
> > > > issues. I see a few references online about their use being discouraged due to
> > > > possible race conditions, perhaps that was the original motivation for this
> > > > parameter (I'm not the original author of this driver).
> > > >
> > > > I'm open to alternatives, feel free to let me know if you have a preference.
> > >
> > > We tend to not implement USERPTR on newer drivers. I suggest you
> > > to place the logic with regards to V4L2_MEMORY_USERPTR on a separate
> > > patch for further discussions.
> > >
> > > >
> > > > > > +
> > > > > > +/**
> > > > > > + * virtio_media_session_alloc - Allocate a new session.
> > > > > > + * @vv: virtio-media device the session belongs to.
> > > > > > + * @id: ID of the session.
> > > > > > + * @nonblocking_dequeue: whether dequeuing of buffers should be blocking or
> > > > > > + * not.
> > > > > > + *
> > > > > > + * The ``id`` and ``list`` fields must still be set by the caller.
> > > > >
> > > > > still in what sense?
> > > >
> > > > Based on the code below, I'm not so sure that the caller is responsible for
> > > > setting these values. They seem to be initialized in the function.
> > > >
> > > > Perhaps Alexandre Courbot (the original author) would know more. Unless he
> > > > says otherwise though I'm inclined to remove this comment.
> > > >
> > > > > > + */
> > > > > > +static struct virtio_media_session *
> > > > > > +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> > > > > > +                          struct file *file)
> > > > > > +{
> > > > > > +       struct virtio_media_session *session;
> > > > > > +       int i;
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       session = kzalloc_obj(*session, GFP_KERNEL);
> > > > > > +       if (!session)
> > > > > > +               goto err_session;
> > > > > > +
> > > > > > +       session->shadow_buf = kzalloc(VIRTIO_SHADOW_BUF_SIZE, GFP_KERNEL);
> > > > > > +       if (!session->shadow_buf)
> > > > > > +               goto err_shadow_buf;
> > > > > > +
> > > > > > +       ret = sg_alloc_table(&session->command_sgs, DESC_CHAIN_MAX_LEN,
> > > > > > +                            GFP_KERNEL);
> > > > > > +       if (ret)
> > > > > > +               goto err_payload_sgs;
> > > > > > +
> > > > > > +       session->id = id;
> > > > > > +       session->nonblocking_dequeue = file->f_flags & O_NONBLOCK;
> > > > > > +
> > > > > > +       INIT_LIST_HEAD(&session->list);
> > > > > > +       v4l2_fh_init(&session->fh, &vv->video_dev);
> > > > > > +       virtio_media_session_fh_add(session, file);
> > > > > > +
> > > > > > +       for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
> > > > > > +               INIT_LIST_HEAD(&session->queues[i].pending_dqbufs);
> > > > > > +       mutex_init(&session->queues_lock);
> > > > > > +
> > > > > > +       init_waitqueue_head(&session->dqbuf_wait);
> > > > > > +
> > > > > > +       mutex_lock(&vv->sessions_lock);
> > > > > > +       list_add_tail(&session->list, &vv->sessions);
> > > > > > +       mutex_unlock(&vv->sessions_lock);
> > > > > > +
> > > > > > +       return session;
> > > > > > +
> > > > > > +err_payload_sgs:
> > > > > > +       kfree(session->shadow_buf);
> > > > > > +err_shadow_buf:
> > > > > > +       kfree(session);
> > > > > > +err_session:
> > > > > > +       return ERR_PTR(-ENOMEM);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * virtio_media_session_free - Free all resources of a session.
> > > > > > + * @vv: virtio-media device the session belongs to.
> > > > > > + * @session: session to destroy.
> > > > > > + *
> > > > > > + * All the resources of @sesssion, as well as the backing memory of @session
> > > > > > + * itself, are freed.
> > > > >
> > > > > why @ here and `` above? And typo in the name.
> > > >
> > > > The `@` here was an attempt to follow the guide here for referencing function
> > > > parameters:
> > > > https://docs.kernel.org/doc-guide/kernel-doc.html#highlights-and-cross-references
> > >
> > > Yes. This is part of Linux Kernel kernel-doc markup: when referring to
> > > struct fields, you should use @field (or ``field`` if one wants to place an
> > > asterisk on it, like ``*field``).
> > >
> > > >
> > > > That being said, I don't believe this file is 100% consistent with that. I will
> > > > spend some time cleaning up the comments throughout this patch set to get them
> > > > consistent for v5. Thanks!
> > >
> > > Please use it on a consistent way along the driver.
> > >
> > >
> > > Thanks,
> > > Mauro
> >

