Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F12450911
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465649; cv=pass; b=R1c4e6SmvXQEDLXCf2aPUKRnIH3GLUFEg+0iCP1qqu/lnA+5uY1xVgnMLOjElRyXklplI9TC6DKQypt54KSHE3w5O3hRcry3k4zlhpcBxM03M9kXjjsWnhnbN4VwuahHrRs29MmUZhR6t82tWFCvlwUp08OXnKx4q9R2AZw7hfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465649; c=relaxed/simple;
	bh=aLXDPoPVuUMRZiJ53myck0fJWcJFj7YndQs+jDnnC78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EttdM+oCY2p0Od+OxexXWON1Dw0W9ZX78yEV9nlZkIkBXjEMB8hHm0ehbNk+SmmLFLKqxmjChH799GPoBo9jUprb1EGhctVopGRFQUQ4QGSezN0GIIO4bLFxp1GXJa6JLmiW89ZYsknBMJDxILsaeXsNfNI89GFavV7TUsitzPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KfH/PAgJ; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KfH/PAgJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccdf36f63dso122335ad.0
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 09:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786465642; cv=none;
        d=google.com; s=arc-20260327;
        b=TdYo7JU9ZLvmpFXsXQGbhQnn6iITd2O/oBnCPapiQvbeZX+zV+9QW6himi/F2Y9cC+
         eOL5SH84d+z8sV0MrdWeoOX2DeK5nQg7K1D2CgMv12fL5NsHNVGkxwuVaOPNVNW0qyGi
         szkigad1jNBoGKHBkZYV2D8oB/C9zGeDrpGPqtt90gmCCkMoIq1fKktDUSO2MindMF41
         OQSDrG0FHSgYtAa3uiKomCRRJrzdy2vbIZqlY/hZlgr/dhIqnT+VGUs2xlQ/hpSq7VN3
         +NYgam7Ze8yhthglueUFC0tNvx9L6zd1kaSP1Hj8J1aqFMhQdNzIYeqx/HxN3z8xVtSy
         RYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=06jbe9PRFYOXpCvqZFPSvd04zK3hcZg7QZCaqtRjY3k=;
        fh=4HnIUgUK9bHvSm0gZksgucQUxU2KVCh/zCsMHUzuTyM=;
        b=JzKTv1tSsxMWBl7YDn+993lE9rMvWCkw+OquZmRKzR0SnfirlVFwlFKIht+rnHdz2s
         qrUNCWLTrTVCsIPs9BERrZDWI+Ty6IbZAy4DkHlunH/Cr6qbgsmU4p3jySPKxrGKxYDi
         Hr8K0E8ZSqC+mWJ7gjPsC+SHVT1dBN38GFH/ANRIaHh/o4kDfN2Pf/lvjdBAhrCzEgNT
         5BtpNb04SGEVUPbdFD2e9ZmRlqWZuTf0CiMX/Xw2uWRHOxV9cCHF0BPYBa73t8kvwQw4
         EYEBaOtvCwafkjVhIR00C8hJxgdSP139whDbFXUXgQhRFAxprYCA8oTGlAIngo4Gus59
         ox7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786465642; x=1787070442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=06jbe9PRFYOXpCvqZFPSvd04zK3hcZg7QZCaqtRjY3k=;
        b=KfH/PAgJIDnbroPyfh9Lhu5+9yH9s3UUqRf6TyhUepkn4cyj89IRYlq+wwoShiqCWe
         swIuH6mbSEFbRyD3KTxry4fLvVNdlMc5UVYyrpOYv2ykPSRFSIt1tJMC2cGIjTy++vQS
         ykOnd3RVyXBy5R3kio/eRqQL+NHPCqiA2aquYRToZN+V1+p4DuGrhN+Nkqg96gbKCOtN
         2l3EA7Agl8936GdFv9ASRTc1f2rjIvZH0H+QX8YD8MqVEWI8UvB8c/99p3DYtKq6q+pN
         606DA1lW7TKYj5KHr9KcXJKDITT2+4nr1iMm/2yU1EaKXROANq0jGO8VDdxmbHwi8Pnb
         N4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465642; x=1787070442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06jbe9PRFYOXpCvqZFPSvd04zK3hcZg7QZCaqtRjY3k=;
        b=csQoWRPYfsqhFnfoaGh4NIS2UwJMxopI8DRgWOMc9b59uGsAxw1uXWkUVyIMCME4je
         IhNvlLfBENSUUrDGNnPKqfmko3eooyncmjwpjHmHiB2sUSdlI1aq6ccpsCmiRfPVyEHO
         cXqNKoaAqLC+IlGGbzropuH+VHmmfRstRE0gei99EmDD4AgR77saK9A5R7g7+B/4Xji/
         ArH2mkeBw87mSTk7851TxmvDHO38BUYMBct3tO656hwsku7/XWFjMXwZkPtAPrHJLMus
         BQwjZWmbslOYsZNEaArlvWKCT1mjNWb4C5zBg3MZuCTTzEi/ehZGUz81smGXPQV9ZvAJ
         K/8g==
X-Forwarded-Encrypted: i=1; AHgh+RpAo3OtRVmmBV+Druae8xeKSv8ViWA+6kzzKc6F73sg7u3x2zjByfHmW6mRo8zI1lt8/WmepW2SvmdSng==@vger.kernel.org
X-Gm-Message-State: AOJu0YytT1G3HtSrX0qQk6eyb49yErQUReWwAo4KPkI1rCyc3bexZxP7
	ogW0/PDwqblsG2EggHMYW87D+ocoOhScbmHaz3hGNjN9XL2ak4UBVpVUavu6vLVQcrwow+AoYQG
	AI2+QQH2r/qKwD3pYNwlWhmwJY9hvlfPy7wyQXp8=
X-Gm-Gg: AR+sD13YJB5GhUYVj8/Pozky9zj7sKuTm2rtc/iyY74bcPz9fxIknl/67Rp648mJSyf
	SAkXq8JBUsS0voOoW8oAX/9qA7F8Qn0FcrVgOpxySDPyN7wlfSYEPbNsLTmvUZiIZwBGjU9LkO8
	IATXRYE/rMY/KMQQlTlTQhgq+68/igcRgCTNFTgbbWwHNkF3bestLy2mTjrNN7JTQXIela59wAO
	Tot5l7068DgsodY/HI64Mjbj7KJUVjwvqlm0/OI9yy6dVNuB3Kjq1vGJhwuJhBJ6Pm7msQKr6mb
	6NTtFv68sPKkfhHM1Q3SyyCpL+NokZAKtX/qwZbEuEzTLmZjhtOkRD8e/99CzTgooVala8GTjoH
	MJKo=
X-Received: by 2002:a17:902:e948:b0:2c9:d89f:fd98 with SMTP id
 d9443c01a7336-2d3171e0aecmr6311705ad.1.1786465641017; Tue, 11 Aug 2026
 09:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723183219.737296-1-briandaniels@google.com>
 <20260723183219.737296-6-briandaniels@google.com> <20260810112143.GA2967445@killaraus.ideasonboard.com>
In-Reply-To: <20260810112143.GA2967445@killaraus.ideasonboard.com>
From: Brian Daniels <briandaniels@google.com>
Date: Tue, 11 Aug 2026 12:27:07 -0400
X-Gm-Features: AUfX_mylh3xEc22sZGEWPpcjtnrXgmrNi1Y52nWS4QRRaQ1Ah-VLGf9Q2QA4taY
Message-ID: <CAD4i_GSRAWxepyWrEDrNyPerzPr275Z=gWT+JF8Y8-HskOZ+Bw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] media: virtio: Add USERPTR memory type support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 7:21=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jul 23, 2026 at 02:32:19PM -0400, Brian Daniels wrote:
> > From: Alexandre Courbot <gnurou@gmail.com>
> >
> > This patch adds support for the USERPTR memory type to the virtio-media
> > driver.
> >
> > It adds the allow_userptr module parameter, implements the userptr
> > mapping logic in the scatterlist builder, and enables USERPTR in
> > reqbufs if allowed.
>
> USERPTR is deprecated, it shouldn't be used in new drivers or in new
> userspace code.

Good to know. Shall I remove this patch from the next revision then?

> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > ---
> >  drivers/media/virtio/scatterlist_builder.c | 64 ++++++++++++++++++++++
> >  drivers/media/virtio/scatterlist_builder.h |  3 +
> >  drivers/media/virtio/virtio_media_driver.c | 42 +++++++++-----
> >  drivers/media/virtio/virtio_media_ioctls.c | 11 +++-
> >  4 files changed, 104 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/media/virtio/scatterlist_builder.c b/drivers/media=
/virtio/scatterlist_builder.c
> > index 97925b277..85c6a36b4 100644
> > --- a/drivers/media/virtio/scatterlist_builder.c
> > +++ b/drivers/media/virtio/scatterlist_builder.c
> > @@ -349,14 +349,30 @@ static int scatterlist_builder_add_userptr(struct=
 scatterlist_builder *builder,
> >  int scatterlist_builder_add_buffer(struct scatterlist_builder *builder=
,
> >                                  struct v4l2_buffer *b)
> >  {
> > +     int i;
> >       int ret;
> >
> > +     /* Fixup: plane length must be zero if userptr is NULL */
> > +     if (!V4L2_TYPE_IS_MULTIPLANAR(b->type) &&
> > +         b->memory =3D=3D V4L2_MEMORY_USERPTR && b->m.userptr =3D=3D 0=
)
> > +             b->length =3D 0;
> > +
> >       /* v4l2_buffer */
> >       ret =3D scatterlist_builder_add_data(builder, b, sizeof(*b));
> >       if (ret)
> >               return ret;
> >
> >       if (V4L2_TYPE_IS_MULTIPLANAR(b->type) && b->length > 0) {
> > +             /* Fixup: plane length must be zero if userptr is NULL */
> > +             if (b->memory =3D=3D V4L2_MEMORY_USERPTR) {
> > +                     for (i =3D 0; i < b->length; i++) {
> > +                             struct v4l2_plane *plane =3D &b->m.planes=
[i];
> > +
> > +                             if (plane->m.userptr =3D=3D 0)
> > +                                     plane->length =3D 0;
> > +                     }
> > +             }
> > +
> >               /* Array of v4l2_planes */
> >               ret =3D scatterlist_builder_add_data(builder, b->m.planes=
,
> >                                                  sizeof(struct v4l2_pla=
ne) *
> > @@ -368,6 +384,54 @@ int scatterlist_builder_add_buffer(struct scatterl=
ist_builder *builder,
> >       return 0;
> >  }
> >
> > +/**
> > + * scatterlist_builder_add_buffer_userptr() - Add the payload of a ``U=
SERPTR``
> > + *                                            &struct v4l2_buffer to t=
he
> > + *                                            descriptor chain.
> > + * @builder: builder to use.
> > + * @b: &struct v4l2_buffer whose ``USERPTR`` payload we want to add.
> > + *
> > + * Add an array of &struct virtio_media_sg_entry pointing to a ``USERP=
TR``
> > + * buffer's contents. Does nothing if the buffer is not of type ``USER=
PTR``.
> > + * This is split out of scatterlist_builder_add_buffer() because we on=
ly want
> > + * to add these to the device-readable part of the descriptor chain.
> > + */
> > +int scatterlist_builder_add_buffer_userptr(struct scatterlist_builder =
*builder,
> > +                                        struct v4l2_buffer *b)
> > +{
> > +     int i;
> > +     int ret;
> > +
> > +     if (b->memory !=3D V4L2_MEMORY_USERPTR)
> > +             return 0;
> > +
> > +     if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
> > +             for (i =3D 0; i < b->length; i++) {
> > +                     struct v4l2_plane *plane =3D &b->m.planes[i];
> > +
> > +                     if (b->memory =3D=3D V4L2_MEMORY_USERPTR &&
> > +                         plane->length > 0) {
> > +                             unsigned long uptr =3D plane->m.userptr;
> > +                             unsigned long len =3D plane->length;
> > +
> > +                             ret =3D
> > +                             scatterlist_builder_add_userptr(builder,
> > +                                                             uptr,
> > +                                                             len);
> > +                             if (ret)
> > +                                     return ret;
> > +                     }
> > +             }
> > +     } else if (b->length > 0) {
> > +             ret =3D scatterlist_builder_add_userptr(builder, b->m.use=
rptr,
> > +                                                   b->length);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * scatterlist_builder_retrieve_buffer() - Retrieve a &struct v4l2_buf=
fer
> >   *                                         written by the device on th=
e shadow
> > diff --git a/drivers/media/virtio/scatterlist_builder.h b/drivers/media=
/virtio/scatterlist_builder.h
> > index 47bfd7ae0..53d964a48 100644
> > --- a/drivers/media/virtio/scatterlist_builder.h
> > +++ b/drivers/media/virtio/scatterlist_builder.h
> > @@ -90,6 +90,9 @@ int scatterlist_builder_add_ioctl_resp(struct scatter=
list_builder *builder,
> >  int scatterlist_builder_add_buffer(struct scatterlist_builder *builder=
,
> >                                  struct v4l2_buffer *buffer);
> >
> > +int scatterlist_builder_add_buffer_userptr(struct scatterlist_builder =
*builder,
> > +                                        struct v4l2_buffer *b);
> > +
> >  int scatterlist_builder_retrieve_buffer(struct scatterlist_builder *bu=
ilder,
> >                                       size_t sg_index,
> >                                       struct v4l2_buffer *buffer,
> > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media=
/virtio/virtio_media_driver.c
> > index c431c3eb2..b6f79593d 100644
> > --- a/drivers/media/virtio/virtio_media_driver.c
> > +++ b/drivers/media/virtio/virtio_media_driver.c
> > @@ -7,26 +7,29 @@
> >   */
> >
> >  #include <linux/bits.h>
> > +#include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/dev_printk.h>
> > +#include <linux/mm.h>
> >  #include <linux/mutex.h>
> > +#include <linux/scatterlist.h>
> >  #include <linux/types.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/vmalloc.h>
> > +#include <linux/wait.h>
> > +#include <linux/workqueue.h>
> >  #include <linux/module.h>
> > +#include <linux/moduleparam.h>
> >  #include <linux/virtio.h>
> >  #include <linux/virtio_config.h>
> >  #include <linux/virtio_ids.h>
> > -#include <linux/slab.h>
> > -#include <linux/scatterlist.h>
> > -#include <linux/vmalloc.h>
> > -#include <linux/workqueue.h>
> > -#include <linux/dma-mapping.h>
> > -#include <linux/poll.h>
> > -#include <linux/mm.h>
> >
> > +#include <media/frame_vector.h>
> >  #include <media/v4l2-dev.h>
> > -#include <media/v4l2-device.h>
> > -#include <media/v4l2-fh.h>
> >  #include <media/v4l2-event.h>
> > +#include <media/videobuf2-memops.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> >
> >  #include "uapi/linux/virtio_media.h"
> >  #include "session.h"
> > @@ -40,6 +43,15 @@
> >  /* Bit mask for the VIRTIO_MEDIA_MMAP_FLAG_RW flag */
> >  #define VIRTIO_MEDIA_MMAP_FLAG_RW_MASK BIT(VIRTIO_MEDIA_MMAP_FLAG_RW)
> >
> > +/*
> > + * Whether USERPTR buffers are allowed.
> > + *
> > + * This is disabled by default as USERPTR buffers are dangerous, but t=
he option
> > + * is left to enable them if desired.
> > + */
> > +bool virtio_media_allow_userptr;
> > +module_param_named(allow_userptr, virtio_media_allow_userptr, bool, 06=
60);
> > +
> >  /**
> >   * virtio_media_session_alloc() - Allocate a new session.
> >   * @vv: virtio-media device the session belongs to.
> > @@ -849,15 +861,11 @@ static int virtio_media_probe(struct virtio_devic=
e *virtio_dev)
> >                             VIRTIO_MEDIA_SHM_MMAP);
> >
> >       vd =3D &vv->video_dev;
> > +
> >       vd->v4l2_dev =3D &vv->v4l2_dev;
> >       vd->vfl_type =3D VFL_TYPE_VIDEO;
> >       vd->ioctl_ops =3D &virtio_media_ioctl_ops;
> >       vd->fops =3D &virtio_media_fops;
> > -     vd->release =3D video_device_release_empty;
> > -     strscpy(vd->name, "virtio-media", sizeof(vd->name));
> > -
> > -     video_set_drvdata(vd, vv);
> > -
> >       vd->device_caps =3D virtio_cread32(virtio_dev, 0);
> >       if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MP=
LANE))
> >               vd->vfl_dir =3D VFL_DIR_M2M;
> > @@ -866,6 +874,10 @@ static int virtio_media_probe(struct virtio_device=
 *virtio_dev)
> >               vd->vfl_dir =3D VFL_DIR_TX;
> >       else
> >               vd->vfl_dir =3D VFL_DIR_RX;
> > +     vd->release =3D video_device_release_empty;
> > +     strscpy(vd->name, "virtio-media", sizeof(vd->name));
> > +
> > +     video_set_drvdata(vd, vv);
> >
> >       ret =3D video_register_device(vd, virtio_cread32(virtio_dev, 4), =
0);
> >       if (ret)
> > @@ -890,6 +902,7 @@ static int virtio_media_probe(struct virtio_device =
*virtio_dev)
> >       virtio_dev->config->del_vqs(virtio_dev);
> >  err_find_vqs:
> >       v4l2_device_unregister(&vv->v4l2_dev);
> > +
> >       return ret;
> >  }
> >
> > @@ -900,6 +913,7 @@ static void virtio_media_remove(struct virtio_devic=
e *virtio_dev)
> >
> >       cancel_work_sync(&vv->eventq_work);
> >       virtio_reset_device(virtio_dev);
> > +
> >       v4l2_device_unregister(&vv->v4l2_dev);
> >       virtio_dev->config->del_vqs(virtio_dev);
> >       video_unregister_device(&vv->video_dev);
> > diff --git a/drivers/media/virtio/virtio_media_ioctls.c b/drivers/media=
/virtio/virtio_media_ioctls.c
> > index f0b82b5ec..88465f239 100644
> > --- a/drivers/media/virtio/virtio_media_ioctls.c
> > +++ b/drivers/media/virtio/virtio_media_ioctls.c
> > @@ -273,6 +273,12 @@ static int virtio_media_send_buffer_ioctl(struct v=
4l2_fh *fh, u32 ioctl,
> >               return ret;
> >
> >       end_buf_sg =3D builder.cur_sg;
> > +
> > +     /* Payload of SHARED_PAGES buffers, if relevant */
> > +     ret =3D scatterlist_builder_add_buffer_userptr(&builder, b);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       num_cmd_sgs =3D builder.cur_sg;
> >
> >       /* Response descriptor */
> > @@ -719,7 +725,7 @@ static int virtio_media_reqbufs(struct file *file, =
void *fh,
> >       if (b->type > VIRTIO_MEDIA_LAST_QUEUE)
> >               return -EINVAL;
> >
> > -     if (b->memory =3D=3D V4L2_MEMORY_USERPTR)
> > +     if (b->memory =3D=3D V4L2_MEMORY_USERPTR && !virtio_media_allow_u=
serptr)
> >               return -EINVAL;
> >
> >       ret =3D virtio_media_send_wr_ioctl(vfh, VIDIOC_REQBUFS, b, sizeof=
(*b),
> > @@ -752,7 +758,8 @@ static int virtio_media_reqbufs(struct file *file, =
void *fh,
> >       if (V4L2_TYPE_IS_MULTIPLANAR(b->type))
> >               session->uses_mplane =3D true;
> >
> > -     b->capabilities &=3D ~V4L2_BUF_CAP_SUPPORTS_USERPTR;
> > +     if (!virtio_media_allow_userptr)
> > +             b->capabilities &=3D ~V4L2_BUF_CAP_SUPPORTS_USERPTR;
> >
> >       /* We do not support DMABUF yet. */
> >       b->capabilities &=3D ~V4L2_BUF_CAP_SUPPORTS_DMABUF;
>
> --
> Regards,
>
> Laurent Pinchart
