Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993004192FC
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550934; cv=pass; b=Xc+h/OOSSk+oc8JTRCgUzH3to0Ct7KE7Uzf1ju3jXAYoXyK0cA85i51GkANptlxa6Y/tOkE62z+xtOMxBMT8cdaXdliezvVremNX+S5XZhYGXz5+29cZJ3FFz4vj+EjV+00e/NXKhCR8wjFg1jZX8K7h1WvyaHa5T5bRbXFd50o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550934; c=relaxed/simple;
	bh=UvbBTMKoPXsh3DPN/yaSeC34UC/Z+/EiQKZzUC4gry4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jof+QRhik/QyvU6/Er/MisygO4RoS0l+TPS0B1F/Pyl1j8WC1TJN3G6P+8NYdklxMgmA1Nuoa6qO5MxDQ9aXniIThL5IAJFbZzTTMKPZsv6fOvO4iXt9D6VSPURI/uS1voAQe//4MuATBe+lJfcxtC2eZ1b8wihCALZkzlYFKjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dUJcP0gf; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dUJcP0gf"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso1644457241.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 05:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784550931; cv=none;
        d=google.com; s=arc-20260327;
        b=CirsEAAelm97c3dmy09/TfJRZq+jPBGCWwy8Em0TNZY7NuE/pFYieTaTmIu6RYZXkZ
         OZ3L04++c5+JBHiX9C7iON/fANsVuK942g1I1nM0MRuvJC0rA9iX8fR5NwkloK8Y60+s
         WDgzSsovzuUnWoxsmpBjaqNLGvusoiQWPp1xisR0Yo8p2RT6Dt1YEPssuF7kbB95pQPE
         HVqqh4G9cTo++JaeykNdm+G4lAs8AWTNbkiLPgKPW3HaI2OYCF+vpG+S25eNld8pRGUC
         Del9zAWrLfL22g5e4kz3+Azr8jWnqpXSGRqqnKhfCi7WcDt+3B4CINj0FsRhRdff9X89
         Agew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJdZgmXdl95EzfJaX2vfpeNo7f8JMkb0O8aB4sRTCUY=;
        fh=EK8RoDb7CAlTBnEx7OnfYH906OKJU0xysCQL3MiixaE=;
        b=bdv/pLMCQ/DK8MEXL6+BTaiQailGO9xnLlrKmIKzDVTDOGt3c/iffprKaILt+6t2ga
         SPO7+VU/o5mtO6bOvmSKbEthoVCbj5EXyyPK11fTU/7MsinTrbfq8ph/YE5hBEjoapJ+
         MZjeFNKPiAuj0S5cs9L8oU4PZBNbBa9s8DWr+90GNRpSDV0sCYXE7SwPu/db3qcCS9Kq
         YsXys+yer9yfxokpU68MGI/MC+J+3rvqDZypjZkntYVe44jUPAJmfZzPhBFW0pabYhfr
         cOe/U2yIXgoLqRPAGnMSlIff1HTdGRc5UrSg0QDUQ1az4whNgfEBy7LXECijAm4kQNUn
         uAEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784550931; x=1785155731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJdZgmXdl95EzfJaX2vfpeNo7f8JMkb0O8aB4sRTCUY=;
        b=dUJcP0gfuCSjAkJsq6fHRIXv4um8ijgy3kKVYaaD1F5p1YZdyPCZ+CaT7W4/NAFVx+
         1XmV3SXr+BWgnbdHOj3fzW91n0Sm9boVaYgve0Isq59eXQ585kB1uFd1TbDjaSiDxS65
         YzzqAPBv3aNoKSHx6//7gRRNojBPUL0De4SUliRO1EIFqAcsOaJtlaRSEXXqg/em4rTT
         zGiMNVR0j1z3tFupVbNo1iPpqjI5MkVI/1r2L1oPlDEB1/1+mUr/LYH5wwk/Ycf+uf3d
         4lZyRjoGhEmCZr2kkRl+rjU4tzrsjRWEdwzQzQ86K5HBAuIHcZOWGjzAotzanvgmfq7B
         zLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550931; x=1785155731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJdZgmXdl95EzfJaX2vfpeNo7f8JMkb0O8aB4sRTCUY=;
        b=IaqtqsPXt/HGsi/omWi9hQGAfwXJR/jAQBf2tE5FZpir/JIc0N3Gb8mNKe0rdyVVQO
         dGDwkeevzsvxRfe/DwRfLTNWlsVLD7Td5h4ScRtrHcWgyefbix/fqe/l6ExvGBEEhzdh
         K7UgjYSgIziV4mQxU6tBxwtyLkQux/Bdpw43P3E4L3bUBbRx1r3Dx/QZx2AS6GrXjOjP
         2IrRLapMkp160LE6K/UPISp+M/U/ECBeyEZrD1QRo0lM21ZcdXt2xBsM9QeJYhZzBKTQ
         CeusTrjAQQNi1+3zv8ofi4TShfSsENi/gFjqry7rVMMumTJI5i/a/F9uXLRPZVhj0atr
         mnBw==
X-Forwarded-Encrypted: i=1; AHgh+RpaO8XdcWONU6x7b9Ye5w+E0ZJgZ1rPqOJEnXKDsnwp9KOfkGGsG5LtApkhbiCW5jTpDCl5LDMrCBhI5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9u2qGbWZfWUn1Saqyx/pN2ghkgGiAmVK3bdWc0jwfIrafxqMq
	14oBW+dxXlrFohV8Jrg05dbRVFUYTVTk42i6c8mlhHztkCudttgLaFThnhSRbUD7RM/Mpiv76Jv
	glTuWAomxm5LQnLxZsqYKlvMhXLQLg3T29MkybV/K
X-Gm-Gg: AfdE7cnGrPW0mGSrI4FlZ8q+6VBBa+5fESCiOxPbuE+sY1O2WnAyOCqirwusWmmPemt
	qn+2PHZbOZW/7cRH1+uXhPhWR33zSlh2mIqO4EOHtcAV060O6UzvgUCNLVfOLbRWluDb86qAHlv
	FkOp8WitIYrvvc4LGELnKz4zc5T8/XssVutLx2cuRv8AnS4Q0ES9ERCnIMp7OxYp3HBvRNO7hId
	O7FhRoBBCrATb3NfOqwW7QsJverk8QKxlfoTV8D8SwjEZl8SYkIlY4/OTkMO5mYEe2r2fU=
X-Received: by 2002:a05:6102:370b:b0:745:6b55:30c8 with SMTP id
 ada2fe7eead31-7475379582cmr3097214137.27.1784550930790; Mon, 20 Jul 2026
 05:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622171017-mutt-send-email-mst@kernel.org>
 <20260625201850.2981130-1-briandaniels@google.com> <20260712085726.19198fda@foz.lan>
 <20260718132759-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260718132759-mutt-send-email-mst@kernel.org>
From: Alistair Delva <adelva@google.com>
Date: Mon, 20 Jul 2026 05:35:19 -0700
X-Gm-Features: AUfX_myV_gcQhOt-mF2dgrkfwe13YMu_2UC0wTl03jSgp2LZR5qnj01EJpc8usY
Message-ID: <CANDihLFeF_nKi5z=eH5Mwaa4s8fEU1chS4K2VQZ+0b-0OLybjg@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] media: virtio: Add virtio_media_driver
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Brian Daniels <briandaniels@google.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 10:29=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Sun, Jul 12, 2026 at 08:57:26AM +0200, Mauro Carvalho Chehab wrote:
> > On Thu, 25 Jun 2026 16:18:48 -0400
> > Brian Daniels <briandaniels@google.com> wrote:
> >
> > > > > From: Alexandre Courbot <gnurou@gmail.com>
> > > > >
> > > > > virtio_media_driver.c provides the expected driver hooks, and sup=
port
> > > > > for mmapping and polling.
> > > > >
> > > > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > > > > ---
> > > > >  drivers/media/virtio/virtio_media_driver.c | 959 +++++++++++++++=
++++++
> > > > >  1 file changed, 959 insertions(+)
> > > > >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > > > >
> > > > > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers=
/media/virtio/virtio_media_driver.c
> > > > > new file mode 100644
> > > > > index 000000000..d6363c673
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/virtio/virtio_media_driver.c
> > > > > @@ -0,0 +1,959 @@
> > > > > +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> > > > > +
> > > > > +/*
> > > > > + * Virtio-media driver.
> > > > > + *
> > > > > + * Copyright (c) 2024-2025 Google LLC.
> > > > > + */
> > > > > +
> > > > > +#include <linux/delay.h>
> > > > > +#include <linux/device.h>
> > > > > +#include <linux/dev_printk.h>
> > > > > +#include <linux/mm.h>
> > > > > +#include <linux/mutex.h>
> > > > > +#include <linux/scatterlist.h>
> > > > > +#include <linux/types.h>
> > > > > +#include <linux/videodev2.h>
> > > > > +#include <linux/vmalloc.h>
> > > > > +#include <linux/wait.h>
> > > > > +#include <linux/workqueue.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/moduleparam.h>
> > > > > +#include <linux/virtio.h>
> > > > > +#include <linux/virtio_config.h>
> > > > > +#include <linux/virtio_ids.h>
> > > > > +
> > > > > +#include <media/frame_vector.h>
> > > > > +#include <media/v4l2-dev.h>
> > > > > +#include <media/v4l2-event.h>
> > > > > +#include <media/videobuf2-memops.h>
> > > > > +#include <media/v4l2-device.h>
> > > > > +#include <media/v4l2-ioctl.h>
> > > > > +
> > > > > +#include "protocol.h"
> > > > > +#include "session.h"
> > > > > +#include "virtio_media.h"
> > > > > +
> > > > > +#define VIRTIO_MEDIA_NUM_EVENT_BUFS 16
> > > > > +
> > > > > +/* ID of the SHM region into which MMAP buffer will be mapped. *=
/
> > > > > +#define VIRTIO_MEDIA_SHM_MMAP 0
> > > > > +
> > > > > +/*
> > > > > + * Name of the driver to expose to user-space.
> > > > > + *
> > > > > + * This is configurable because v4l2-compliance has workarounds =
specific to
> > > > > + * some drivers. When proxying these directly from the host, thi=
s allows it to
> > > > > + * apply them as needed.
> > > > > + */
> > > > > +char *virtio_media_driver_name;
> > > > > +module_param_named(driver_name, virtio_media_driver_name, charp,=
 0660);
> > > >
> > > >
> > > > Um. What? Not how it should be handled.
> > >
> > > I can remove this module param. I didn't end up using this when compl=
iance testing.
> > > Instead, I patched v4l-utils:
> > > https://lore.kernel.org/all/20260528163448.4031965-1-briandaniels@goo=
gle.com/
> > >
> > > Let me know if you think the v4l-utils patch is a good approach, othe=
rwise let
> > > me know how you'd prefer to address the v4l2-compliance driver-specif=
ic workounds
> > > when they're being proxied with virtio-media.
> >
> > This kind of discussion should happen on a separate PR for v4l2-complia=
nce,
> > c/c to the proper developers and maintainers of it.
>
>
> I wonder how migration can work when guest is tied to host driver model l=
ike
> this.

We haven't given migration much thought yet, but I think it wouldn't
be so different to GPU, where to do snapshot/migration we have to
record all initialization / context setup state and replay it against
the GPU driver on restore (see https://github.com/google/gfxstream).
Some migrations will be possible, some will not, and the host should
be able to decide.

Also, Brian mentioned the host device pass-through use case, but we
also have device implementations on the host that work with camera
emulators or some other data source like video/webrtc, which will
support snapshot/migration more easily. This use case will probably
will see more real-world use and migration will be more relevant.

> > >
> > > > > +
> > > > > +/*
> > > > > + * Whether USERPTR buffers are allowed.
> > > > > + *
> > > > > + * This is disabled by default as USERPTR buffers are dangerous,=
 but the option
> > > > > + * is left to enable them if desired.
> > > > > + */
> > > > > +bool virtio_media_allow_userptr;
> > > > > +module_param_named(allow_userptr, virtio_media_allow_userptr, bo=
ol, 0660);
> > > >
> > > >
> > > > is this kind of thing common?
> >
> > There is one old media device that has it (saa7134).
> >
> > >
> > > To be honest, I don't really know. I'm also not that familiar with th=
e USERPTR
> > > issues. I see a few references online about their use being discourag=
ed due to
> > > possible race conditions, perhaps that was the original motivation fo=
r this
> > > parameter (I'm not the original author of this driver).
> > >
> > > I'm open to alternatives, feel free to let me know if you have a pref=
erence.
> >
> > We tend to not implement USERPTR on newer drivers. I suggest you
> > to place the logic with regards to V4L2_MEMORY_USERPTR on a separate
> > patch for further discussions.
> >
> > >
> > > > > +
> > > > > +/**
> > > > > + * virtio_media_session_alloc - Allocate a new session.
> > > > > + * @vv: virtio-media device the session belongs to.
> > > > > + * @id: ID of the session.
> > > > > + * @nonblocking_dequeue: whether dequeuing of buffers should be =
blocking or
> > > > > + * not.
> > > > > + *
> > > > > + * The ``id`` and ``list`` fields must still be set by the calle=
r.
> > > >
> > > > still in what sense?
> > >
> > > Based on the code below, I'm not so sure that the caller is responsib=
le for
> > > setting these values. They seem to be initialized in the function.
> > >
> > > Perhaps Alexandre Courbot (the original author) would know more. Unle=
ss he
> > > says otherwise though I'm inclined to remove this comment.
> > >
> > > > > + */
> > > > > +static struct virtio_media_session *
> > > > > +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> > > > > +                          struct file *file)
> > > > > +{
> > > > > +       struct virtio_media_session *session;
> > > > > +       int i;
> > > > > +       int ret;
> > > > > +
> > > > > +       session =3D kzalloc_obj(*session, GFP_KERNEL);
> > > > > +       if (!session)
> > > > > +               goto err_session;
> > > > > +
> > > > > +       session->shadow_buf =3D kzalloc(VIRTIO_SHADOW_BUF_SIZE, G=
FP_KERNEL);
> > > > > +       if (!session->shadow_buf)
> > > > > +               goto err_shadow_buf;
> > > > > +
> > > > > +       ret =3D sg_alloc_table(&session->command_sgs, DESC_CHAIN_=
MAX_LEN,
> > > > > +                            GFP_KERNEL);
> > > > > +       if (ret)
> > > > > +               goto err_payload_sgs;
> > > > > +
> > > > > +       session->id =3D id;
> > > > > +       session->nonblocking_dequeue =3D file->f_flags & O_NONBLO=
CK;
> > > > > +
> > > > > +       INIT_LIST_HEAD(&session->list);
> > > > > +       v4l2_fh_init(&session->fh, &vv->video_dev);
> > > > > +       virtio_media_session_fh_add(session, file);
> > > > > +
> > > > > +       for (i =3D 0; i <=3D VIRTIO_MEDIA_LAST_QUEUE; i++)
> > > > > +               INIT_LIST_HEAD(&session->queues[i].pending_dqbufs=
);
> > > > > +       mutex_init(&session->queues_lock);
> > > > > +
> > > > > +       init_waitqueue_head(&session->dqbuf_wait);
> > > > > +
> > > > > +       mutex_lock(&vv->sessions_lock);
> > > > > +       list_add_tail(&session->list, &vv->sessions);
> > > > > +       mutex_unlock(&vv->sessions_lock);
> > > > > +
> > > > > +       return session;
> > > > > +
> > > > > +err_payload_sgs:
> > > > > +       kfree(session->shadow_buf);
> > > > > +err_shadow_buf:
> > > > > +       kfree(session);
> > > > > +err_session:
> > > > > +       return ERR_PTR(-ENOMEM);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * virtio_media_session_free - Free all resources of a session.
> > > > > + * @vv: virtio-media device the session belongs to.
> > > > > + * @session: session to destroy.
> > > > > + *
> > > > > + * All the resources of @sesssion, as well as the backing memory=
 of @session
> > > > > + * itself, are freed.
> > > >
> > > > why @ here and `` above? And typo in the name.
> > >
> > > The `@` here was an attempt to follow the guide here for referencing =
function
> > > parameters:
> > > https://docs.kernel.org/doc-guide/kernel-doc.html#highlights-and-cros=
s-references
> >
> > Yes. This is part of Linux Kernel kernel-doc markup: when referring to
> > struct fields, you should use @field (or ``field`` if one wants to plac=
e an
> > asterisk on it, like ``*field``).
> >
> > >
> > > That being said, I don't believe this file is 100% consistent with th=
at. I will
> > > spend some time cleaning up the comments throughout this patch set to=
 get them
> > > consistent for v5. Thanks!
> >
> > Please use it on a consistent way along the driver.
> >
> >
> > Thanks,
> > Mauro
>
