Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082C8283C82
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 17:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784395642; cv=none; b=qXCUQuVkERLtbeIvslmUOZ26sPIHi7/3wsxlr4Dcc9i2RHApDRVo4h/kwobW1JXi1z5LobpQc05IiWLDgl3ZI0nSE73BlaqAL2Z9T2iJOLr+WGkA3bOdSi/z5UmkEUq1rkVQd8JyFD6Jt3zD3M9dshQ+AotpdvfCyggh+rjBaBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784395642; c=relaxed/simple;
	bh=6rSrZyCWXJlF3I3FaDITfDYsoSwgsFAnSZw5FPIkPTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Os5jnaWNNLXuFO8va0UHydJXla80Sep0rIVXEnmMHxhCyL+pgJNw4ISDSXdLzHpt0vIspHccFsLkfhXzlt5CZidSywH8m/wZsR/3CYVs6kSyg9M3NJRAo0lO4DbMMQJm0TV9qNA2473GdOqTbqHpWiFSluEYg4sqF3+nPtJm0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zs4dkLZF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kN0GmuFI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zs4dkLZF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kN0GmuFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784395637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4SYB/B+bDlxilXL6idtvWKAFgvw269dvYm2IM94meE=;
	b=Zs4dkLZF+DMsL3zSIkXhlzZ0Sm7kiIKtL30sMbff7RcEHMX69+9WqZ2Dlm/JBn8zLgYTSy
	pObWgYQlhslSAVfFbh5qAsv/wyNiwZaBDL/wtLDg0ZtNKnwSE05ILCeMvIdARW01irVMeI
	R1K/gbJ+Z+G4OXrqcTagVzLVMios5ds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-ssgszS3ROlSXfrqMFnYR5A-1; Sat, 18 Jul 2026 13:27:16 -0400
X-MC-Unique: ssgszS3ROlSXfrqMFnYR5A-1
X-Mimecast-MFC-AGG-ID: ssgszS3ROlSXfrqMFnYR5A_1784395635
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4953c5d6d87so42802065e9.3
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784395635; x=1785000435; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4SYB/B+bDlxilXL6idtvWKAFgvw269dvYm2IM94meE=;
        b=kN0GmuFIilQKzHzT6GyKQ/+Hgj8l3V6mTaah8JHz/MeA/JCK6CyNw/3oZQ/Cj+wjQh
         JrIMuy01RoNxJdf041ZLWsRgqNYQxB+/kLM4vR1x3Et6acbAeYzGU38gZ8LAw7QFd0tk
         oXK4o4dqQfppQ3oQuvisbIJwDuRHNlXQfoDZgAmwlza9GqkoV5zh1BR3jB1O/aUXGJNj
         fNgxR/41AioNwcd55V5dB8DlmLMr8Ty7ZWv9ul6rVNmvpgDcA3ck+ipEJrbp/lzq0tsz
         t0k4lJMJ5oZaUJXXIU14tH9kFQxYD11WrAaX75BowJbysPPJI1gzQuBUiVhsX30KE5zV
         y3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784395635; x=1785000435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y4SYB/B+bDlxilXL6idtvWKAFgvw269dvYm2IM94meE=;
        b=QijOZdrHBgMXG0LspB3Uiu/+GQkIXnFzU9WKPUb4qaXD+Kk6K2T8BkE3IjlV0HZSsN
         txW8HFS/lmoHwVp7twM1sXa9LAJqEBJGjoY9M52W+7+7Zo70+yt4qq2oEwBQ3smtjc0b
         HL25prG3DO/Dhu6fXSCnTIAQMlpVz8QRlYJGwDKGEtEhW52PamtQDcpqCcnqhytGegt0
         zWylFTaVeSNdfDH8Bf1F3lV6V+tgGPagIDp04/g4N5nIk4df9mj6RCTRi/hib1Ez8v/X
         CDTgaTwp863z3BKgaJ9OfeA8vzX5MIiZ1gREefk+WLdqYml7Q7x1QRZ/32V6b2yvPcKL
         FXzw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8USp6LWBqgL1zpxjPrhBOo3v+S1esRZSCzG7k4imacbWFu8yCS322Blz8/1TzXDf0C8HgRBcW57oNXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsg5Wr0lPFyYqMlTYFwoJ//b+MuSt5bq+2OsFFdCeR+uAibRu1
	GRdguNI9JG0p7SPSsLCKbVc3RjN5eMinLpHuWwzzcpsVGJdVslZBRgzMm+32Rk8TQLFJFaC4KcT
	Hfje1kUNEIQPNWVrfpMHioMGEU55pl7+DrhsT2jev5dbJsDzv/9Tt2IPiatrqx0VO
X-Gm-Gg: AfdE7cnNJUwu9mZbs0JVDUNc80o1uOgqCh7rFuQ405inaNApTkNP7/4fKxjuSLsgLx+
	TKUf4shZ6YBcLH37PYosJhYxivDhZOsuWrH8o14iVmL+2+vyYBBH0EoMqG7hwkXjjES35cHc69j
	8qO1+J8uO4eT1QE3QH6gZyI5nWUNbFCoDDujOYZR+R/w7fhkwOXI+3DwsbyqYXYmZTfzyowez7L
	J+g7QIPiK7kkktJOUUdi1sMutwQ9s9oOg1cCu7YYJ/bvJEpS3onzqZzR0uJ/nTJQbGTgz4B0SMV
	ifWPuKBW+ceLROrGCB/s4cpXhck+9rAIYzoA+mQG05kvrN3APuIn/IkFzSvK4b9QVEVjBRvk+Jz
	3vmPsyx2+Z0dBVvPCVkT0oIaEWk2hPxA=
X-Received: by 2002:a05:600c:1c0b:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-4954a50ea30mr92150585e9.30.1784395634913;
        Sat, 18 Jul 2026 10:27:14 -0700 (PDT)
X-Received: by 2002:a05:600c:1c0b:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-4954a50ea30mr92150045e9.30.1784395634331;
        Sat, 18 Jul 2026 10:27:14 -0700 (PDT)
Received: from redhat.com (bzq-79-177-145-168.red.bezeqint.net. [79.177.145.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6b85970esm7812651f8f.15.2026.07.18.10.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:27:12 -0700 (PDT)
Date: Sat, 18 Jul 2026 13:27:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
	adelva@google.com, aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 2/8] media: virtio: Add virtio-media driver structs
 and function declarations
Message-ID: <20260718132340-mutt-send-email-mst@kernel.org>
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260622204343.1994418-3-briandaniels@google.com>
 <20260622170708-mutt-send-email-mst@kernel.org>
 <CAD4i_GTBkZRAnBTohkzJSh2XTx+MHkTS_KokEMQ4s0-WP+DxcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD4i_GTBkZRAnBTohkzJSh2XTx+MHkTS_KokEMQ4s0-WP+DxcA@mail.gmail.com>

On Fri, Jul 17, 2026 at 03:46:36PM -0400, Brian Daniels wrote:
> On Mon, Jun 22, 2026 at 5:08 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 22, 2026 at 04:43:37PM -0400, Brian Daniels wrote:
> > > From: Alexandre Courbot <gnurou@gmail.com>
> > >
> > > Add the structs and function declarations for the new virtio-media drvier.
> > >
> > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > > ---
> > >  drivers/media/virtio/virtio_media.h | 95 +++++++++++++++++++++++++++++
> > >  1 file changed, 95 insertions(+)
> > >  create mode 100644 drivers/media/virtio/virtio_media.h
> > >
> > > diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virtio/virtio_media.h
> > > new file mode 100644
> > > index 000000000..52809d4e9
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/virtio_media.h
> > > @@ -0,0 +1,95 @@
> > > +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> > > +
> > > +/*
> > > + * Virtio-media structures & functions declarations.
> > > + *
> > > + * Copyright (c) 2024-2025 Google LLC.
> > > + */
> > > +
> > > +#ifndef __VIRTIO_MEDIA_H
> > > +#define __VIRTIO_MEDIA_H
> > > +
> > > +#include <linux/virtio_config.h>
> > > +#include <media/v4l2-device.h>
> > > +
> > > +#include "protocol.h"
> > > +
> > > +#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
> > > +
> > > +#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
> > > +
> > > +extern char *virtio_media_driver_name;
> > > +extern bool virtio_media_allow_userptr;
> > > +
> > > +/**
> > > + * struct virtio_media - Virtio-media device.
> > > + * @v4l2_dev: v4l2_device for the media device.
> > > + * @video_dev: video_device for the media device.
> > > + * @virtio_dev: virtio device for the media device.
> > > + * @commandq: virtio command queue.
> > > + * @eventq: virtio event queue.
> > > + * @eventq_work: work to run when events are received on @eventq.
> > > + * @mmap_region: region into which MMAP buffers are mapped by the host.
> > > + * @event_buffer: buffer for event descriptors.
> > > + * @sessions: list of active sessions on the device.
> > > + * @sessions_lock: protects @sessions and ``virtio_media_session::list``.
> > > + * @events_lock: prevents concurrent processing of events.
> > > + * @cmd: union of the device commands "open" and "munmap". The other
> > > + *       commands are handled by @struct virtio_media_session
> > > + * @resp: union of responses.to device commands "open" and "munmap". The
> > > + *        other responses are handled by @struct virtio_media_session
> > > + * @vlock: serializes access to the command queue.
> > > + * @wq: waitqueue for host responses on the command queue.
> > > + */
> > > +struct virtio_media {
> > > +     struct v4l2_device v4l2_dev;
> > > +     struct video_device video_dev;
> > > +
> > > +     struct virtio_device *virtio_dev;
> > > +     struct virtqueue *commandq;
> > > +     struct virtqueue *eventq;
> > > +     struct work_struct eventq_work;
> > > +
> > > +     struct virtio_shm_region mmap_region;
> > > +
> > > +     void *event_buffer;
> > > +
> > > +     struct list_head sessions;
> > > +     struct mutex sessions_lock; /* protects sessions list */
> > > +
> > > +     struct mutex events_lock; /* prevents concurrent event processing */
> > > +
> > > +     union {
> > > +             struct virtio_media_cmd_open open;
> > > +             struct virtio_media_cmd_munmap munmap;
> > > +     } cmd;
> > > +
> > > +     union {
> > > +             struct virtio_media_resp_open open;
> > > +             struct virtio_media_resp_munmap munmap;
> > > +     } resp;
> >
> >
> > You need DMA alignment padding for these things.
> 
> Each member of the above unions is already padded to 64-bit alignment,
> is that sufficient?
> 
> If not, could you tell me what else is necessary?

Read up "What memory is DMA'able?" and following chapters in
Documentation/core-api/dma-api-howto.rst


> > Which one can only see when I reads the actual driver 8 patches down.
> > Which is why it's not a sensible way to split patches.
> >
> > A sensible way is to have a driver then add functionality
> > in logical pieces gradually.
> >
> 
> Appreciate the feedback. There was a previous comment requesting to
> split the patch into c/h file pairs, but I can try reformatting it as
> you suggest for v5.
> 
> > > +
> > > +     struct mutex vlock; /* serializes command queue access */
> > > +     wait_queue_head_t wq;
> > > +};
> > > +
> > > +static inline struct virtio_media *
> > > +to_virtio_media(struct video_device *video_dev)
> > > +{
> > > +     return container_of(video_dev, struct virtio_media, video_dev);
> > > +}
> > > +
> > > +/* virtio_media_driver.c */
> > > +
> > > +int virtio_media_send_command(struct virtio_media *vv, struct scatterlist **sgs,
> > > +                           const size_t out_sgs, const size_t in_sgs,
> > > +                           size_t minimum_resp_len, size_t *resp_len);
> > > +void virtio_media_process_events(struct virtio_media *vv);
> > > +
> > > +/* virtio_media_ioctls.c */
> > > +
> > > +long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
> > > +                            unsigned long arg);
> > > +extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
> > > +
> > > +#endif // __VIRTIO_MEDIA_H
> > > --
> > > 2.55.0.rc0.799.gd6f94ed593-goog
> >

