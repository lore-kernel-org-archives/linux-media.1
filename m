Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E38437851
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562551; cv=pass; b=FruoDO0Az/HWJNj2lBpTrxsrOn6Q1wVXeAuNyXVKhGZg8j7pgdBylVKCj2gx2o3m9AyNgvh9TgN2Vbv48Zfn/PoNfBqodPVG0K4nR5wtDIknnEQLsCx+OApqNT6b9ZT2I9uvidUWs4Cj48qpp/7z8T0302mJn6NY/cYa/5RZZ2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562551; c=relaxed/simple;
	bh=9IHkLXWFTSQVwdp6rmoJfE1bYrN4W9BCKMG9hqh6Y1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBIIvzNREL+0tkGaM+HPOAil2qsrPQe/6bFdSqRGMEQ9hTuyBrxfyKjyui+B6nTLfhMJaXZ9m0vHLBQk8M0CxiPaI/glvHvDT1CMfqt/zea8XjU033LEluXoOhM0OC2xChdSTI7NXmxneMxHkvdYI5ByfFSTQPwxjIGekLy7s5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M3tOReA8; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M3tOReA8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cede6375caso330395ad.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784562549; cv=none;
        d=google.com; s=arc-20260327;
        b=tBjW25ThDSOCNdNQh1gy0OqAiNBeI38fdNfRtavMNEsO2cMsE65L3h1yrrWzqUUz0w
         ulILf8gsWvyGiDC5OWAIiX9+f4uzVabWv5gGZKWCdyYkPiXuMshiGtkU7g5EherR/OWT
         iAi/EXJUwo83vZtDyrRJj/ij7oETMwR6q8QyW2VzQN9FMjilqId2OKWEL+hdZ6mBEyG2
         lqKdYQSF1rSl4BPG580McJrVZf3hpUTn9JpmBYBR2m6JGymxwCUWXf0awR0lH/Wr6L3e
         wAYx/lqUR6TCK19LnKNh5PtuDxLAliUmrLRP+EH0BOnXdILKyYsdMTKdU0gMrmjvMatb
         zp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5oTv9im5ZGYwoCoeEyWerVwRP7Sucl0k2LnrtSJ/dM=;
        fh=FAeC3PKNpo3KPCSjYLARvQkO4CCW7gxmGi3vHJlvrLg=;
        b=TSCACpMA24dYaqtIn7TEBCNdPLiPj43xlIusyk360KuTTY6eKUxB1fuDOK6//O7tvx
         P1+O88A3Y+y5HCt+TRRS56r8G22dJljVCwAdATdFRGvhsuI8zADkYQgPoTvdVSmh/+V6
         joHLHPhMCOqa0RUQZEjjUGM1apTYOaJu9LV4vIbkDUjk5N7dA3yDsZiyccY3sqhs1Qrg
         0y20CNaRlzWDIIRDsEwMYNSCTui2uPUCyWO7RyP9XftXGEO+pGl8Nn6sqHTkuljNfkkA
         B3PMIBiDMQb1SiXAdj1o0uejBm3yiqU6/KnXskujaDLSYR1zxqgXv3WUG8NMuUr5Bdki
         HM1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784562549; x=1785167349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5oTv9im5ZGYwoCoeEyWerVwRP7Sucl0k2LnrtSJ/dM=;
        b=M3tOReA8D1LFzOACWkz8HV71FLxsf8t2Itk18b9a1lYFvW/xEBDg4XO3KFpsEKSvdA
         SBtajcmDzRZlIMU8YgfuZfRxE/lDX199wJ4jB/a83Hn+ZD1kIth03iFx1DTk3ksa4PCm
         x/5+JGoY6mQpSkCIBUFlSnC1iiFnaPueZM3GIw1oSSOoYkirLR5wLw+eYsd0p27IIbBN
         lraGls3bL+MODZY7I6o58fiIChw8HBsdIKPb3NN8MjGsERfYHkQCtA6TW142vkubCcNv
         tOPPBiWFpIhEaSQbqvHvWdz4rf3iGrOAcjfBBI7jWXl/5fGb76Wsn9B8TssupAYAn5Xd
         +A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562549; x=1785167349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5oTv9im5ZGYwoCoeEyWerVwRP7Sucl0k2LnrtSJ/dM=;
        b=PoilrdLTO4zNzEQTZXYlPsboHI6EmLSyifCAiZ9g9Ipvim3NERjZi1h53m4xXHcPfi
         TJaqJrfaH5wNcc+6KwJgVvLmwOEFL4ndQmluMbN+b72UO166+3wY/7Y0X4a81NLAOZnR
         PTCLgeVKFV36pUfRFYoHjXGg0IFXukwWsY7nLmsvsaV499XRh9LmqFNMJtekt5bpPfYJ
         SM70cUwDi67zsUKog2za02aXALjIzmn04hLgZDi0XJkKPfVCvASoZMC/xnGymx/llGn7
         zlnSBALlDiS8bfYDR9JV6dqFYn9qpuaXk4ii1TVGDMRH7DP8IitdHkQ3ipxGvMYkU3/L
         8OMg==
X-Forwarded-Encrypted: i=1; AHgh+RqyDAGZr1MMtCYb6jnXXpbvKTn/UKWiLPbHB3P34YUlYXIQ8KqJfxwo3v1ae+CVdEyDZ2VhDkZvtl5NIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgdUJoyYgc39Yp5X6HDpHPdF63bnikowXp17LBOqTV104ArzX
	rfGI/HoqhCbErnP68Abz4J/N0dm0vkSGxj7oQz2Klpo+9j03Bf+AOqK/uALH0hFN5ee6gZRzTkw
	JKAn6PH7FpHumclBu8CJ1Be4LsBbWqh4NbqrtkOw=
X-Gm-Gg: AR+sD11W0lYd04TfIc2FfNXq8qn+XxV5cYSbjen1Sqo2ItuJ/KVF86EE60c9kUKNf2V
	OfSgW2fnq2v49rkDZBRVRf9jaSa7rxgc1ECecAdvMJ5TR31F4xolM8K/Zct8QhUSTYh9K+x6TBL
	f1kTedywnjutuXjnUdqhcKYyeorLECr0h6pkhLZBwv4Vfu2czC7Xo/8twa5viniiNEHUGwclpx5
	gRTuYFACtl/z8E8c1VYYry7J/8wER4ZhYCDzjLIZhj6SRg0Q3q629qqpKhbPgXek4xBuns=
X-Received: by 2002:a17:902:c94f:b0:2c0:bf57:8746 with SMTP id
 d9443c01a7336-2cf7b6989a3mr1047145ad.18.1784562548557; Mon, 20 Jul 2026
 08:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622171017-mutt-send-email-mst@kernel.org>
 <20260625201850.2981130-1-briandaniels@google.com> <20260712085726.19198fda@foz.lan>
In-Reply-To: <20260712085726.19198fda@foz.lan>
From: Brian Daniels <briandaniels@google.com>
Date: Mon, 20 Jul 2026 11:48:56 -0400
X-Gm-Features: AUfX_mw4MXvWhNuerdRMN-iqz-guHtGrBirhPauSpR73MGgBqfY_Ti9V6_c9yaQ
Message-ID: <CAD4i_GQk=GhpVfevReO_mr_KZguzo37d7zdEmuzL+f_u2ye0vg@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] media: virtio: Add virtio_media_driver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, 
	adelva@google.com, aesteve@redhat.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 2:57=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> On Thu, 25 Jun 2026 16:18:48 -0400
> Brian Daniels <briandaniels@google.com> wrote:
>
> > > > From: Alexandre Courbot <gnurou@gmail.com>
> > > >
> > > > virtio_media_driver.c provides the expected driver hooks, and suppo=
rt
> > > > for mmapping and polling.
> > > >
> > > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > > > ---
> > > >  drivers/media/virtio/virtio_media_driver.c | 959 +++++++++++++++++=
++++
> > > >  1 file changed, 959 insertions(+)
> > > >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > > >
> > > > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/m=
edia/virtio/virtio_media_driver.c
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
> > > > + * This is configurable because v4l2-compliance has workarounds sp=
ecific to
> > > > + * some drivers. When proxying these directly from the host, this =
allows it to
> > > > + * apply them as needed.
> > > > + */
> > > > +char *virtio_media_driver_name;
> > > > +module_param_named(driver_name, virtio_media_driver_name, charp, 0=
660);
> > >
> > >
> > > Um. What? Not how it should be handled.
> >
> > I can remove this module param. I didn't end up using this when complia=
nce testing.
> > Instead, I patched v4l-utils:
> > https://lore.kernel.org/all/20260528163448.4031965-1-briandaniels@googl=
e.com/
> >
> > Let me know if you think the v4l-utils patch is a good approach, otherw=
ise let
> > me know how you'd prefer to address the v4l2-compliance driver-specific=
 workounds
> > when they're being proxied with virtio-media.
>
> This kind of discussion should happen on a separate PR for v4l2-complianc=
e,
> c/c to the proper developers and maintainers of it.

I've removed the driver name module parameter in v5. Let's continue
the compliance testing discussion on the v4l-utils patch:
https://lore.kernel.org/all/20260528163448.4031965-1-briandaniels@google.co=
m/

> >
> > > > +
> > > > +/*
> > > > + * Whether USERPTR buffers are allowed.
> > > > + *
> > > > + * This is disabled by default as USERPTR buffers are dangerous, b=
ut the option
> > > > + * is left to enable them if desired.
> > > > + */
> > > > +bool virtio_media_allow_userptr;
> > > > +module_param_named(allow_userptr, virtio_media_allow_userptr, bool=
, 0660);
> > >
> > >
> > > is this kind of thing common?
>
> There is one old media device that has it (saa7134).
>
> >
> > To be honest, I don't really know. I'm also not that familiar with the =
USERPTR
> > issues. I see a few references online about their use being discouraged=
 due to
> > possible race conditions, perhaps that was the original motivation for =
this
> > parameter (I'm not the original author of this driver).
> >
> > I'm open to alternatives, feel free to let me know if you have a prefer=
ence.
>
> We tend to not implement USERPTR on newer drivers. I suggest you
> to place the logic with regards to V4L2_MEMORY_USERPTR on a separate
> patch for further discussions.

Will do in v5.

> >
> > > > +
> > > > +/**
> > > > + * virtio_media_session_alloc - Allocate a new session.
> > > > + * @vv: virtio-media device the session belongs to.
> > > > + * @id: ID of the session.
> > > > + * @nonblocking_dequeue: whether dequeuing of buffers should be bl=
ocking or
> > > > + * not.
> > > > + *
> > > > + * The ``id`` and ``list`` fields must still be set by the caller.
> > >
> > > still in what sense?
> >
> > Based on the code below, I'm not so sure that the caller is responsible=
 for
> > setting these values. They seem to be initialized in the function.
> >
> > Perhaps Alexandre Courbot (the original author) would know more. Unless=
 he
> > says otherwise though I'm inclined to remove this comment.

Removed in v5

> > > > + */
> > > > +static struct virtio_media_session *
> > > > +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> > > > +                    struct file *file)
> > > > +{
> > > > + struct virtio_media_session *session;
> > > > + int i;
> > > > + int ret;
> > > > +
> > > > + session =3D kzalloc_obj(*session, GFP_KERNEL);
> > > > + if (!session)
> > > > +         goto err_session;
> > > > +
> > > > + session->shadow_buf =3D kzalloc(VIRTIO_SHADOW_BUF_SIZE, GFP_KERNE=
L);
> > > > + if (!session->shadow_buf)
> > > > +         goto err_shadow_buf;
> > > > +
> > > > + ret =3D sg_alloc_table(&session->command_sgs, DESC_CHAIN_MAX_LEN,
> > > > +                      GFP_KERNEL);
> > > > + if (ret)
> > > > +         goto err_payload_sgs;
> > > > +
> > > > + session->id =3D id;
> > > > + session->nonblocking_dequeue =3D file->f_flags & O_NONBLOCK;
> > > > +
> > > > + INIT_LIST_HEAD(&session->list);
> > > > + v4l2_fh_init(&session->fh, &vv->video_dev);
> > > > + virtio_media_session_fh_add(session, file);
> > > > +
> > > > + for (i =3D 0; i <=3D VIRTIO_MEDIA_LAST_QUEUE; i++)
> > > > +         INIT_LIST_HEAD(&session->queues[i].pending_dqbufs);
> > > > + mutex_init(&session->queues_lock);
> > > > +
> > > > + init_waitqueue_head(&session->dqbuf_wait);
> > > > +
> > > > + mutex_lock(&vv->sessions_lock);
> > > > + list_add_tail(&session->list, &vv->sessions);
> > > > + mutex_unlock(&vv->sessions_lock);
> > > > +
> > > > + return session;
> > > > +
> > > > +err_payload_sgs:
> > > > + kfree(session->shadow_buf);
> > > > +err_shadow_buf:
> > > > + kfree(session);
> > > > +err_session:
> > > > + return ERR_PTR(-ENOMEM);
> > > > +}
> > > > +
> > > > +/**
> > > > + * virtio_media_session_free - Free all resources of a session.
> > > > + * @vv: virtio-media device the session belongs to.
> > > > + * @session: session to destroy.
> > > > + *
> > > > + * All the resources of @sesssion, as well as the backing memory o=
f @session
> > > > + * itself, are freed.
> > >
> > > why @ here and `` above? And typo in the name.
> >
> > The `@` here was an attempt to follow the guide here for referencing fu=
nction
> > parameters:
> > https://docs.kernel.org/doc-guide/kernel-doc.html#highlights-and-cross-=
references
>
> Yes. This is part of Linux Kernel kernel-doc markup: when referring to
> struct fields, you should use @field (or ``field`` if one wants to place =
an
> asterisk on it, like ``*field``).
>
> >
> > That being said, I don't believe this file is 100% consistent with that=
. I will
> > spend some time cleaning up the comments throughout this patch set to g=
et them
> > consistent for v5. Thanks!
>
> Please use it on a consistent way along the driver.

I went through and cleaned up all of the files in v5 so they should
use kernel-doc consistently now.

> Thanks,
> Mauro
