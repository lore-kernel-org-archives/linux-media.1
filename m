Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4E3D891C
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 17:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784395745; cv=none; b=NuZWdJKynotJkpSvPUAuDwTMTErsKL9BJTSRmUjDflulNiMqC9kn7UG5XxXKbF2USAjWRJLo9wWrwhtokMiJqU1jIoA7r8C15hCdW3w1MdL6VpnuYxJAWiGOhJB4iLC0Sk0YMK6QR06RNxnA72RuiZlkkP05gf9HYEROHOlxfvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784395745; c=relaxed/simple;
	bh=7K8x2+GBEePl39ZU7AHYccmQWw9KmKGu8EaHrXEobqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyQheP3B5fFbx7GYFK3UIFFFHq/Ig+VrhiYyWe4BBcvCy21I6dJGDqTyfqH0qEZUpdsoCN5WSDKNG8hZX4tiehdMO7D4cEhvqiUrmUK0B6MloVOCBiGmvRYOdwh24eNR9LYJ70ZcfL/xcJsRtz66Md8iPu0DbCoOpxidyrygUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hn1LVKXg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BFoGBdVp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hn1LVKXg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BFoGBdVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784395741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FhCQ2Emrbj/HDb8KVno6YlUg/VJvnIV+wiiPmup6hPA=;
	b=Hn1LVKXgSQwxlhefm6Qw17b9UxF9WGBhl0GQVJL1YsxRcOEmu9pqoPLaYi4AeaHRF6akIF
	u/wbmLYzpvi7u/y7JkvqMXB3Kz7Epa/OOHgp9Z0Y67R/nZIwi9bNIvS/qDWofytwLw0U3+
	qwOEFLtUCWV6FYS5Wcabd/NRVpFD0/o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-WiQ0Pl65Mj26ZPc7PuP6NQ-1; Sat, 18 Jul 2026 13:29:00 -0400
X-MC-Unique: WiQ0Pl65Mj26ZPc7PuP6NQ-1
X-Mimecast-MFC-AGG-ID: WiQ0Pl65Mj26ZPc7PuP6NQ_1784395739
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f6e658363so323442f8f.3
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784395739; x=1785000539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhCQ2Emrbj/HDb8KVno6YlUg/VJvnIV+wiiPmup6hPA=;
        b=BFoGBdVpIj0j5lot91rECqUVHpLyDSOxt/Q2DJw6bR0jb5EJrWz5KgD3Mb5OdN4I1u
         gpdnz/O4RRpRnRvHKfvnJTnoXPDmHJ2sBLJvcPlOfYCTzJp+huLctiieDJsopjKS/D2N
         vkU3xQAmykdSzf5mAA0QK7AKDmF+mSINpEr1Xrzp+BrCb5ksBuRF7sT/F7XxklQA5UW+
         6qKcllAReIwN6/fkyyvgb5PaoBkafDr6Tb//LFOwWN1fd+MFe7GlDsiHDQ5ZTxkogtyR
         mTfkojxeKjWPFF18gTzuKwYs0O3tp3GwdPtL2dInfJPji36N4GC3n6tI0Ehm6yjsPTqZ
         YZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784395739; x=1785000539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhCQ2Emrbj/HDb8KVno6YlUg/VJvnIV+wiiPmup6hPA=;
        b=ht4GsNxjr9vqHfgtTYmWSpERHuNwz9tD3tTZqJe0havOdbUtBlB2I9z0JkvxLUiIvg
         /m3gJdV+RIqk/Q/2mrgUykowMfQJbsQ8dQeAdcL41Zeu6JJcto6Jz6zcCvSYjMAVNtdM
         hSQ5rXllmi130SjwMkCtazAAbLXNgiIDG5FRhu1dUiablB9FJ3isNUGIC2RllMM9IXfF
         zsHbgKIieyUFD4CB78n9d8dqePcmAzeWG9XuSa7mfcRbtsmFN0S91c8SWQzRuUgeYtIc
         ru3DerKhFd2lFlbM3NYac5hjvKKgRDAJEUxRA7TFVfM+CBXSiqeo2BQtVByOMZyJzTNI
         UXAg==
X-Forwarded-Encrypted: i=1; AHgh+RrD8gTJ3UHK8kdw5eYHdNFntE5TwCUd3hqH5d8cv7I9f/zrUrgDvzJf1twdEGrS4qKNhjh6aIaXCsb+Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFT6/Mh+rK7fdcCOL89065FYnHvo5fhuydZkT4kXImV/QayPHC
	pkH3lXyhuxsM6iFOwgfO5AeFNz/ok+Di+2CY5r2/XEP4EgY0jwoHSCDZKtr9rIVhCMpwdTPFi8n
	4ogV/ChWiHssi9DKlS51xYbKUDJcLyF2cswdB2IZ51A/B/1Ahf06/I8K/UFvrwsEb
X-Gm-Gg: AfdE7cn/9XiOs3gaxG140EvzK7geZaKzUlgXwTcDYk2MMumk7c6IWGWqScFBuprN26p
	AFJghzLyyvOmQpxYzD+l6u7uWzIF7upl26dSRQwYxXKLOthEO9d2GcBcYPCmmz/6OUuwm57EcR3
	heF193N9T7sMwhuvn/fbR4upMLc8WrgwjlsbFHzWfHdSAYWWKctIv8IiCwin1E00gR94oriYjcI
	fWm9ZgpzU/P8Zbs+TiwoWlX1Gj1ECLf1wyB2FJZB61fYJBZDTkXGa4324MiNE8L0FeQEJrQxnaD
	PeWQQ3bTHDcGy1jzdjRzfAblmpbaqKU8RLaIJF3FxUzG7tw2oiVeZROxm56SvVllWDEaMRhTWCW
	v1ZCJzLcGYv/lp6XDelYW2wNV7ScGu0Q=
X-Received: by 2002:a05:600c:4512:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-4954a50e92bmr81309855e9.39.1784395739233;
        Sat, 18 Jul 2026 10:28:59 -0700 (PDT)
X-Received: by 2002:a05:600c:4512:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-4954a50e92bmr81309425e9.39.1784395738416;
        Sat, 18 Jul 2026 10:28:58 -0700 (PDT)
Received: from redhat.com (bzq-79-177-145-168.red.bezeqint.net. [79.177.145.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a47de7sm138584905e9.7.2026.07.18.10.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:28:57 -0700 (PDT)
Date: Sat, 18 Jul 2026 13:28:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Brian Daniels <briandaniels@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
	adelva@google.com, aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 6/8] media: virtio: Add virtio_media_driver
Message-ID: <20260718132759-mutt-send-email-mst@kernel.org>
References: <20260622171017-mutt-send-email-mst@kernel.org>
 <20260625201850.2981130-1-briandaniels@google.com>
 <20260712085726.19198fda@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712085726.19198fda@foz.lan>

On Sun, Jul 12, 2026 at 08:57:26AM +0200, Mauro Carvalho Chehab wrote:
> On Thu, 25 Jun 2026 16:18:48 -0400
> Brian Daniels <briandaniels@google.com> wrote:
> 
> > > > From: Alexandre Courbot <gnurou@gmail.com>
> > > > 
> > > > virtio_media_driver.c provides the expected driver hooks, and support
> > > > for mmapping and polling.
> > > > 
> > > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > > > ---
> > > >  drivers/media/virtio/virtio_media_driver.c | 959 +++++++++++++++++++++
> > > >  1 file changed, 959 insertions(+)
> > > >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > > > 
> > > > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media/virtio/virtio_media_driver.c
> > > > new file mode 100644
> > > > index 000000000..d6363c673
> > > > --- /dev/null
> > > > +++ b/drivers/media/virtio/virtio_media_driver.c
> > > > @@ -0,0 +1,959 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> > > > +
> > > > +/*
> > > > + * Virtio-media driver.
> > > > + *
> > > > + * Copyright (c) 2024-2025 Google LLC.
> > > > + */
> > > > +
> > > > +#include <linux/delay.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/dev_printk.h>
> > > > +#include <linux/mm.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/scatterlist.h>
> > > > +#include <linux/types.h>
> > > > +#include <linux/videodev2.h>
> > > > +#include <linux/vmalloc.h>
> > > > +#include <linux/wait.h>
> > > > +#include <linux/workqueue.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/moduleparam.h>
> > > > +#include <linux/virtio.h>
> > > > +#include <linux/virtio_config.h>
> > > > +#include <linux/virtio_ids.h>
> > > > +
> > > > +#include <media/frame_vector.h>
> > > > +#include <media/v4l2-dev.h>
> > > > +#include <media/v4l2-event.h>
> > > > +#include <media/videobuf2-memops.h>
> > > > +#include <media/v4l2-device.h>
> > > > +#include <media/v4l2-ioctl.h>
> > > > +
> > > > +#include "protocol.h"
> > > > +#include "session.h"
> > > > +#include "virtio_media.h"
> > > > +
> > > > +#define VIRTIO_MEDIA_NUM_EVENT_BUFS 16
> > > > +
> > > > +/* ID of the SHM region into which MMAP buffer will be mapped. */
> > > > +#define VIRTIO_MEDIA_SHM_MMAP 0
> > > > +
> > > > +/*
> > > > + * Name of the driver to expose to user-space.
> > > > + *
> > > > + * This is configurable because v4l2-compliance has workarounds specific to
> > > > + * some drivers. When proxying these directly from the host, this allows it to
> > > > + * apply them as needed.
> > > > + */
> > > > +char *virtio_media_driver_name;
> > > > +module_param_named(driver_name, virtio_media_driver_name, charp, 0660);  
> > > 
> > > 
> > > Um. What? Not how it should be handled.  
> > 
> > I can remove this module param. I didn't end up using this when compliance testing.
> > Instead, I patched v4l-utils:
> > https://lore.kernel.org/all/20260528163448.4031965-1-briandaniels@google.com/
> > 
> > Let me know if you think the v4l-utils patch is a good approach, otherwise let
> > me know how you'd prefer to address the v4l2-compliance driver-specific workounds
> > when they're being proxied with virtio-media.
> 
> This kind of discussion should happen on a separate PR for v4l2-compliance,
> c/c to the proper developers and maintainers of it.


I wonder how migration can work when guest is tied to host driver model like
this.

> > 
> > > > +
> > > > +/*
> > > > + * Whether USERPTR buffers are allowed.
> > > > + *
> > > > + * This is disabled by default as USERPTR buffers are dangerous, but the option
> > > > + * is left to enable them if desired.
> > > > + */
> > > > +bool virtio_media_allow_userptr;
> > > > +module_param_named(allow_userptr, virtio_media_allow_userptr, bool, 0660);  
> > > 
> > > 
> > > is this kind of thing common?  
> 
> There is one old media device that has it (saa7134).
> 
> > 
> > To be honest, I don't really know. I'm also not that familiar with the USERPTR
> > issues. I see a few references online about their use being discouraged due to
> > possible race conditions, perhaps that was the original motivation for this
> > parameter (I'm not the original author of this driver).
> > 
> > I'm open to alternatives, feel free to let me know if you have a preference.
> 
> We tend to not implement USERPTR on newer drivers. I suggest you
> to place the logic with regards to V4L2_MEMORY_USERPTR on a separate
> patch for further discussions.
> 
> > 
> > > > +
> > > > +/**
> > > > + * virtio_media_session_alloc - Allocate a new session.
> > > > + * @vv: virtio-media device the session belongs to.
> > > > + * @id: ID of the session.
> > > > + * @nonblocking_dequeue: whether dequeuing of buffers should be blocking or
> > > > + * not.
> > > > + *
> > > > + * The ``id`` and ``list`` fields must still be set by the caller.  
> > > 
> > > still in what sense?  
> > 
> > Based on the code below, I'm not so sure that the caller is responsible for
> > setting these values. They seem to be initialized in the function.
> > 
> > Perhaps Alexandre Courbot (the original author) would know more. Unless he
> > says otherwise though I'm inclined to remove this comment.
> > 
> > > > + */
> > > > +static struct virtio_media_session *
> > > > +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> > > > +			   struct file *file)
> > > > +{
> > > > +	struct virtio_media_session *session;
> > > > +	int i;
> > > > +	int ret;
> > > > +
> > > > +	session = kzalloc_obj(*session, GFP_KERNEL);
> > > > +	if (!session)
> > > > +		goto err_session;
> > > > +
> > > > +	session->shadow_buf = kzalloc(VIRTIO_SHADOW_BUF_SIZE, GFP_KERNEL);
> > > > +	if (!session->shadow_buf)
> > > > +		goto err_shadow_buf;
> > > > +
> > > > +	ret = sg_alloc_table(&session->command_sgs, DESC_CHAIN_MAX_LEN,
> > > > +			     GFP_KERNEL);
> > > > +	if (ret)
> > > > +		goto err_payload_sgs;
> > > > +
> > > > +	session->id = id;
> > > > +	session->nonblocking_dequeue = file->f_flags & O_NONBLOCK;
> > > > +
> > > > +	INIT_LIST_HEAD(&session->list);
> > > > +	v4l2_fh_init(&session->fh, &vv->video_dev);
> > > > +	virtio_media_session_fh_add(session, file);
> > > > +
> > > > +	for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
> > > > +		INIT_LIST_HEAD(&session->queues[i].pending_dqbufs);
> > > > +	mutex_init(&session->queues_lock);
> > > > +
> > > > +	init_waitqueue_head(&session->dqbuf_wait);
> > > > +
> > > > +	mutex_lock(&vv->sessions_lock);
> > > > +	list_add_tail(&session->list, &vv->sessions);
> > > > +	mutex_unlock(&vv->sessions_lock);
> > > > +
> > > > +	return session;
> > > > +
> > > > +err_payload_sgs:
> > > > +	kfree(session->shadow_buf);
> > > > +err_shadow_buf:
> > > > +	kfree(session);
> > > > +err_session:
> > > > +	return ERR_PTR(-ENOMEM);
> > > > +}
> > > > +
> > > > +/**
> > > > + * virtio_media_session_free - Free all resources of a session.
> > > > + * @vv: virtio-media device the session belongs to.
> > > > + * @session: session to destroy.
> > > > + *
> > > > + * All the resources of @sesssion, as well as the backing memory of @session
> > > > + * itself, are freed.  
> > > 
> > > why @ here and `` above? And typo in the name.  
> > 
> > The `@` here was an attempt to follow the guide here for referencing function
> > parameters:
> > https://docs.kernel.org/doc-guide/kernel-doc.html#highlights-and-cross-references
> 
> Yes. This is part of Linux Kernel kernel-doc markup: when referring to
> struct fields, you should use @field (or ``field`` if one wants to place an
> asterisk on it, like ``*field``).
> 
> > 
> > That being said, I don't believe this file is 100% consistent with that. I will
> > spend some time cleaning up the comments throughout this patch set to get them
> > consistent for v5. Thanks!
> 
> Please use it on a consistent way along the driver.
> 
> 
> Thanks,
> Mauro

