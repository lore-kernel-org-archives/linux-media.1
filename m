Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821C37D110
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561453; cv=pass; b=q909Cqd2xENZLHe2kicY88aGcImh9qpM1G/h6K8N9SMfYzgfqq6c5bqiw2N5ZtrYnHT3xA/Fh+e1db0nlgpCbXXhoRGhCfxRNuUT6PqH+e6eYDzAbnS8JP59spBhW4YtXKl3EVrwDChrAbicnNp1aijDv5EEaEGvvc7WgZoY4/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561453; c=relaxed/simple;
	bh=z6HTALdKR+S8qZiGcJUt8xHO7LZzh2vu5r30XzI1PqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9/AYOzMgJimIj+1O4o7vjCuWl91QS4ESDnqnzLIAM2FQvF+0fGp4eSxnyGDWhgPTIsG4a+VPTKICxQs21b/eWxEHh4ynVomPLQ8KcwnRQJ0ok0HFQWKI9hpBC47YRww/GFPCqDGqoy2KYnwTrPATal50Uq4uVGfaWdtAPWJO6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j9HDxkHt; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j9HDxkHt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cede6375caso327635ad.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784561451; cv=none;
        d=google.com; s=arc-20260327;
        b=ge21N6aKEWGqzd3vnueDE0yRLCB+0e306C6Vbm8hbxFfzDllt359uiDzWhcmG4QBj6
         IHAhBkkwsMea+ufhYIJKCnxNZFrBJqr8yUQ4v0nEdI4BDcbElH4UeP+GjMYdobZKLI0I
         bTTwMq2OYDTHRQISe34ULUSc7WAOVvr+dvccMv0wWfAqetPKJMMLohsw6c163Oh4qWBS
         ClCshJ2qwMTD/seH6ajM3R41PC9HX6qmS+S1hii/yJ2SvbrQGMdMY7uM0j8Xb2BFRv/X
         ZNocbLD2cyd8b1jfUzwhBQJgqMY60XWdCODq6n1jCnVOCsQM/x+wrsdMV9ZZNQebWO2c
         mueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OaEXvFbvhMm6zafmsE8YuX95tDfvYPIMS3NPHCOYJiY=;
        fh=ECjZ8C8DQlzxSUptVVoAgMuMrWAzY0EQvDbERjCu3ng=;
        b=B+mFIiMhuW8skJiV+V1w0VKvRxugqtCFw7dWrL3ZCZelmBY9mzT/d7b/RZ7fCmkBjs
         RW/ypSoCwAVoTWUoks3jcMTmFZCWohukDoxr1WAOBa64SLGO5FOq/xAVzoLTgQa+GyxN
         QQIRhTGMnrq4s8VHoKpmqhpTCZbHpi2IGjkmZCEvlp9a/3CJresixuPQqkP17kdeomQG
         JRNtFYa911kFBoYBVXJNL/5q0fe+tTcukYyoBAX7YVPBP6PVH7rgF11apSIfsCNdpdqJ
         xisOqxbYNc88fWfFZwPdteXQbxMOD1SrYaGG+8m1AmqHrEFj1SLnazJixpMFu9/YImga
         PL4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784561451; x=1785166251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaEXvFbvhMm6zafmsE8YuX95tDfvYPIMS3NPHCOYJiY=;
        b=j9HDxkHtdQWc1GRYjEkmREb2GmNdSBmNUO7KX8EZSSH1g5RKWT8r2Y2b80RVAHKUdZ
         vgyxB1iyJnJrFzt+bUAYYzSyRa5BjzlFOdY8il4LsbkKQMBf4DytpJqMYDs3FgbdzUW+
         cnH6OyT53qBXfsAv761BSIIX7lsp+d1ry16G/FUN78i+PKpwvIREprq9yhbn+OECtPX3
         U3NVCPV5h6QdyepvpwgB2Q8lHVisvLu3Ch8FM80LLYdERfJrcCQnlFdW3+37zpggEOw8
         vwukexaP8ezOeOKZBZngElAfzSDX0UdYEq1EXDq2CQcull/Z8+bB5UgwpImLbKFdUd9x
         p33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561451; x=1785166251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaEXvFbvhMm6zafmsE8YuX95tDfvYPIMS3NPHCOYJiY=;
        b=EIOphM1ec1JQDmIAnkytFa1y/4BQkr//xWOhylnCh+SFpHMPt0u0jeIoxOo2KzXtJX
         /7yNQIsTdeKdBe0BHH1hpBPLGFWkncBJJB39jzqGtlS1CG8zsHNiEvkfL5tqQtGKWGs9
         S3zrYoTrUqd1mDIkMl7XErUcP2cWRqC6MjZcpdqnpURpzux03DY4JFOb5ottOuIZtk4x
         3ltatnU3ov6D43j5tI0nTuCnsYObZqr7F2HOegK1VAZSAmAOS10n90Um6IGeDlK0Z9X7
         hdnHLLl8IEn25xQGlnP7nWc/VxcRvV9W4Fz3oZfCd4kM3DcU/FXYHKjyxtfXLrYBqatj
         /1sw==
X-Forwarded-Encrypted: i=1; AHgh+RrjAy9lYwpE6yIZEtqbilHvYqz7Bo045If5LPBNiz71x+q6P2lvkPOYdPQ5lEBA74ssNBA435K2nT5bDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7oOpdXNacE3ESQKMTvAjU67hOPZnyD0Ay9lr6I1up/dwZ77ye
	n4yYrXtIKBUutETHLcl1KzOAb2DsASnEW433YhJF47OTniwAqwZGlSwRfGEOn2NYe75GiVLvOO5
	5sm1Dizo7BHA9jXWjiYoNUH8Ys9NRRKwBKcIa85g=
X-Gm-Gg: AR+sD11KWEvKZ+HrnO+mcN9fsqO/N8o2HYJ87IiV65RUmAEnTbWVF0ZlRLhXsP/ZbOF
	RrZ5Tp6CuDd2RQdOXbIaBhvgF/8nXLdIHwcWN2or1d632KFq7oeNhR+OzM6+fk0tVl3IKNcJNS6
	PKaBLTEgYgOA/yeG9hjgLInKGv0LssUTW1emXGdlJbPmm22b5yBwCMO6le2TdnEgJpKU7RHyvZJ
	2laT9xVEc4V/AbDp9JDeW2MtJGNedf+9Dm0is+x9Dj/7vwUhVnPdgvbCgYR
X-Received: by 2002:a17:902:e94d:b0:2c7:a13a:7fe6 with SMTP id
 d9443c01a7336-2cf7b5302afmr989835ad.10.1784561450388; Mon, 20 Jul 2026
 08:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260622204343.1994418-3-briandaniels@google.com> <20260622170708-mutt-send-email-mst@kernel.org>
 <CAD4i_GTBkZRAnBTohkzJSh2XTx+MHkTS_KokEMQ4s0-WP+DxcA@mail.gmail.com> <20260718132340-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260718132340-mutt-send-email-mst@kernel.org>
From: Brian Daniels <briandaniels@google.com>
Date: Mon, 20 Jul 2026 11:30:38 -0400
X-Gm-Features: AUfX_my7bUIuVQK5CvtCwH3h8wEpjooaJfs_B6T4ePVxaDFByVxemESeA75h3sM
Message-ID: <CAD4i_GQwWkze6tcHL1mX8V8RCVKDbmHvZYMvOf2eW4NoygA4CA@mail.gmail.com>
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

On Sat, Jul 18, 2026 at 1:27=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Jul 17, 2026 at 03:46:36PM -0400, Brian Daniels wrote:
> > On Mon, Jun 22, 2026 at 5:08=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Mon, Jun 22, 2026 at 04:43:37PM -0400, Brian Daniels wrote:
> > > > From: Alexandre Courbot <gnurou@gmail.com>
> > > >
> > > > Add the structs and function declarations for the new virtio-media =
drvier.
> > > >
> > > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > > > ---
> > > >  drivers/media/virtio/virtio_media.h | 95 +++++++++++++++++++++++++=
++++
> > > >  1 file changed, 95 insertions(+)
> > > >  create mode 100644 drivers/media/virtio/virtio_media.h
> > > >
> > > > diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/vi=
rtio/virtio_media.h
> > > > new file mode 100644
> > > > index 000000000..52809d4e9
> > > > --- /dev/null
> > > > +++ b/drivers/media/virtio/virtio_media.h
> > > > @@ -0,0 +1,95 @@
> > > > +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> > > > +
> > > > +/*
> > > > + * Virtio-media structures & functions declarations.
> > > > + *
> > > > + * Copyright (c) 2024-2025 Google LLC.
> > > > + */
> > > > +
> > > > +#ifndef __VIRTIO_MEDIA_H
> > > > +#define __VIRTIO_MEDIA_H
> > > > +
> > > > +#include <linux/virtio_config.h>
> > > > +#include <media/v4l2-device.h>
> > > > +
> > > > +#include "protocol.h"
> > > > +
> > > > +#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
> > > > +
> > > > +#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
> > > > +
> > > > +extern char *virtio_media_driver_name;
> > > > +extern bool virtio_media_allow_userptr;
> > > > +
> > > > +/**
> > > > + * struct virtio_media - Virtio-media device.
> > > > + * @v4l2_dev: v4l2_device for the media device.
> > > > + * @video_dev: video_device for the media device.
> > > > + * @virtio_dev: virtio device for the media device.
> > > > + * @commandq: virtio command queue.
> > > > + * @eventq: virtio event queue.
> > > > + * @eventq_work: work to run when events are received on @eventq.
> > > > + * @mmap_region: region into which MMAP buffers are mapped by the =
host.
> > > > + * @event_buffer: buffer for event descriptors.
> > > > + * @sessions: list of active sessions on the device.
> > > > + * @sessions_lock: protects @sessions and ``virtio_media_session::=
list``.
> > > > + * @events_lock: prevents concurrent processing of events.
> > > > + * @cmd: union of the device commands "open" and "munmap". The oth=
er
> > > > + *       commands are handled by @struct virtio_media_session
> > > > + * @resp: union of responses.to device commands "open" and "munmap=
". The
> > > > + *        other responses are handled by @struct virtio_media_sess=
ion
> > > > + * @vlock: serializes access to the command queue.
> > > > + * @wq: waitqueue for host responses on the command queue.
> > > > + */
> > > > +struct virtio_media {
> > > > +     struct v4l2_device v4l2_dev;
> > > > +     struct video_device video_dev;
> > > > +
> > > > +     struct virtio_device *virtio_dev;
> > > > +     struct virtqueue *commandq;
> > > > +     struct virtqueue *eventq;
> > > > +     struct work_struct eventq_work;
> > > > +
> > > > +     struct virtio_shm_region mmap_region;
> > > > +
> > > > +     void *event_buffer;
> > > > +
> > > > +     struct list_head sessions;
> > > > +     struct mutex sessions_lock; /* protects sessions list */
> > > > +
> > > > +     struct mutex events_lock; /* prevents concurrent event proces=
sing */
> > > > +
> > > > +     union {
> > > > +             struct virtio_media_cmd_open open;
> > > > +             struct virtio_media_cmd_munmap munmap;
> > > > +     } cmd;
> > > > +
> > > > +     union {
> > > > +             struct virtio_media_resp_open open;
> > > > +             struct virtio_media_resp_munmap munmap;
> > > > +     } resp;
> > >
> > >
> > > You need DMA alignment padding for these things.
> >
> > Each member of the above unions is already padded to 64-bit alignment,
> > is that sufficient?
> >
> > If not, could you tell me what else is necessary?
>
> Read up "What memory is DMA'able?" and following chapters in
> Documentation/core-api/dma-api-howto.rst

Great thanks!

> > > Which one can only see when I reads the actual driver 8 patches down.
> > > Which is why it's not a sensible way to split patches.
> > >
> > > A sensible way is to have a driver then add functionality
> > > in logical pieces gradually.
> > >
> >
> > Appreciate the feedback. There was a previous comment requesting to
> > split the patch into c/h file pairs, but I can try reformatting it as
> > you suggest for v5.
> >
> > > > +
> > > > +     struct mutex vlock; /* serializes command queue access */
> > > > +     wait_queue_head_t wq;
> > > > +};
> > > > +
> > > > +static inline struct virtio_media *
> > > > +to_virtio_media(struct video_device *video_dev)
> > > > +{
> > > > +     return container_of(video_dev, struct virtio_media, video_dev=
);
> > > > +}
> > > > +
> > > > +/* virtio_media_driver.c */
> > > > +
> > > > +int virtio_media_send_command(struct virtio_media *vv, struct scat=
terlist **sgs,
> > > > +                           const size_t out_sgs, const size_t in_s=
gs,
> > > > +                           size_t minimum_resp_len, size_t *resp_l=
en);
> > > > +void virtio_media_process_events(struct virtio_media *vv);
> > > > +
> > > > +/* virtio_media_ioctls.c */
> > > > +
> > > > +long virtio_media_device_ioctl(struct file *file, unsigned int cmd=
,
> > > > +                            unsigned long arg);
> > > > +extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
> > > > +
> > > > +#endif // __VIRTIO_MEDIA_H
> > > > --
> > > > 2.55.0.rc0.799.gd6f94ed593-goog
> > >
>
