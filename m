Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311AD2FF675
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672839; cv=pass; b=GtCqJDX0uP/xR6+bksRg4R7ADhm53nxXfYrqCQ0KEnjjGKtNAF4TT9RUn/bZytnGpiM4Qt/yTkhR3HxgFF7Icjc45yzKbct6wpBqm4eiwk7y5TOxLXC30UBS0x6QafMtR6XJfb6HK4lVaTx645DqTJtfWdohnpu802vV/xdsYik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672839; c=relaxed/simple;
	bh=UIvYnp9nSpd5COlK3AdBUdQifHM9SuBaiIepUxn6xQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRGXABzwpVkZAWrXUguxJGB3Tq9blUX1LG/PhsDmfQ6jDFEi+JhKnhEiIyMUolpeqhEdCSWfQ212svpSai8L2dVPTSZD0C6nzzF5FFdI+HJnkqimmM8bJGGLggB4a96HMKJ6J2d2lpIgScJedHc7DqK5lEcAg6nMOp21NN40e5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PjFNRLjl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OKXfcFW2; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PjFNRLjl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OKXfcFW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787672836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apne2DS7UrNgm3YqL9oAT6ImJMMALIxHe7Sq7F9qxR4=;
	b=PjFNRLjl1tqeGS5T7BzQizw5KCOfkuo6qGpEtTpNwK//tNRriV01uGdrSgMsdeNNiMKQ+J
	Rsfc9HM8yB51bnmBVmFNzY3yKSLpnVTqLQ1RF/ZwmzPkHrwjBA7YBvRCZTVzhF2UlsmIEB
	ijrA+e7DEaIvP8fLlEwPu16r6LnJSKU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-SzvTJP3IN46i_GUPY-ZWbw-1; Tue, 25 Aug 2026 11:47:13 -0400
X-MC-Unique: SzvTJP3IN46i_GUPY-ZWbw-1
X-Mimecast-MFC-AGG-ID: SzvTJP3IN46i_GUPY-ZWbw_1787672833
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9fdc2870fso4020256a34.2
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 08:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787672833; cv=none;
        d=google.com; s=arc-20260327;
        b=RLpCaJEHxrNM0wgre7TtXsa4XjIchVGJgsddsrUZqKqx55ceFDzdzSwL6rBAR2WVLr
         OkxRC/xYbGgUUCuvtmAX4DZD1bx44Lcjy0+hF3A7RvM9M3OJEPt3IPQzn1v8RHNycsuZ
         cPMI5jHqLVPmzYnY1l9SvAKeTimJyjFLfbSAXEZvvNqC9G2esimG8+rTc5tnwHsNdidX
         5aI738VEbhk/GyXCyl6iWAqcrofoj6jf3INLQ6O8Dr1bddwjeFXZtJSAPoasaMB8KV28
         n4tYRWAcQ7bifn4Me4xSdUQY07etRyCqMWvy7IVSkNoVs6xu+7x6+Y6mureI1yGLH5iu
         W+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=apne2DS7UrNgm3YqL9oAT6ImJMMALIxHe7Sq7F9qxR4=;
        fh=k2V7Qcbp17gSFAiC56LdCyOIbPkq72iElSLOP2xZrQ4=;
        b=TippuqY4MmhT64nGSAhjKHfQ+dLYhgDAUP+RA0r0hkfIQ6SYE3S6yxC4AtZZJ+EifX
         Ws6uV6RZ9CLJIKwIzJaALSZjabI237NDbFLCgVzwQbURlGrX78szjSrHuHXXaFlDtYhV
         eDldk7Rl2wsPVrvYYbSTlTBs+6m6TqCtnk2dGfv9FSP/n2Cn8K9ialKYXgAoa/oVthc1
         sbKkGGno+Fm9Lg380onWG+3CjqE3n/QZANA3bCSyxxlZBEvWRYTZF4NRytyDmSynpzm/
         WqOTC2fLe0iWuGXDo1YBT1vN0P7OBfeVAejzV3rT6jXusiTm2mbsb7eJkoCcD8TDTMA+
         jHaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787672833; x=1788277633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=apne2DS7UrNgm3YqL9oAT6ImJMMALIxHe7Sq7F9qxR4=;
        b=OKXfcFW2HQ66vtouhQu8JPamVQVemNmCPuTWNv27y4MbjlqN/mwqcco2cqi+UK3p5E
         zjvKh8XboPgK8Ncln+Q7h0iPrz7aO6eC5UpCGC0tm1zmcgpIlbA//QUsmZx0Pv9HqF2C
         xh+9qvA7/4JmUQGthFYJyseZ/QzO1AJvy+imTmb3RDErQ74S5cX7OJ2C7/gGWIkq46qO
         Ngnx91zpLoa37oafkth+5PNI2BwqvFu8XQRAUYC2OrCVbLiuZF/cpb/dxrfjKKOTxD0v
         Cqa225d4QN6eF9No7xJCMwNGFpy4Gx7GXxP2Gfvu0SFuPcNz1x8Xv3sFL0mLu92nL2N3
         6KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672833; x=1788277633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apne2DS7UrNgm3YqL9oAT6ImJMMALIxHe7Sq7F9qxR4=;
        b=KH3rmzyUCkFVlulILtycplyj2Tc9PVGhLRFcD1+2zEojLENT30GRcK6GjbLjwg4e4z
         CwA4fQDFeDz7LmUe5ZokBPw+9aT09+zQt0qCguH/pUkOYpH09Uf3LeD29fh1kmIasQ2z
         cbBgBR3o4MgGTzIAV28as6P/h9n1ozTzvdp1pW4MGMRoP1WKOYRHt00BACK2XmGaa9Kp
         dAv9CKc5hyt4/mKovZGHKmS0MTqXnrTgPYF/seVbyMj2EMVYoWP9x7TGTlThHJvE+JTV
         uWotM4IHXb3Wp5Cnd5s73oMesb/nvuHGT7uecoVunMM9bO5bJXCDMTiO2lJvq1SFAc8C
         42OQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHO1zVePHrPE3pxiAw/OnPlVDQqogNcUC4W9GlVN4JyH72AKYWaqWPuNMFZYuM/q1MyBXTNJbutrDhkw==@vger.kernel.org
X-Gm-Message-State: AFuF++mXaHVlYRSeV5N3RNiBtWChIEBa1rwGJQb5DSUOK4uA8Xa92kqG
	CqtjG1K2fm+fiOhqV5OQBzA1WpfcEbBOhDWvGedZriftKExTG6G07/59FRJjWK2XHjPTMCNRh4k
	aQhROllPR4q2E7hr0gkxoot5K3CnGxcEf/kzZf2MZOhRUzIDHNNGHew6pP5Zp6zNWGU0tR2Ews0
	OB/7TdQIDeZMFRSA0uvYzVzmi76fE4sYsVlZ6KDrU=
X-Gm-Gg: AR+sD11n2gE+BO5gdXC4wOi+XVS8PFscamZuJEya0kA6hgOgeSqiGYbwI+vNlvCQamY
	fhaskHJ672yMm21av8TsQO0FGh4Vb+te7smtCIXfQ1P2jovLOO5z+4HRDkkHhM+y/z42Y5iF91r
	sZAh3wOBkz2kIOWf/cko72+n/pQ+mje1NY9f/Z+IlB4UKAH1k01SuWql62rUCzoVNOQHff4vWKO
	+R1xgB7wV8R+ZUa7VJby2CCzOLlZhsAbYjwuDTVbBbXWQ==
X-Received: by 2002:a05:6820:4b97:b0:6b0:19bc:fd14 with SMTP id 006d021491bc7-6b16b498d4fmr24020570eaf.32.1787672832430;
        Tue, 25 Aug 2026 08:47:12 -0700 (PDT)
X-Received: by 2002:a05:6820:4b97:b0:6b0:19bc:fd14 with SMTP id
 006d021491bc7-6b16b498d4fmr24020488eaf.32.1787672831716; Tue, 25 Aug 2026
 08:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813180026.2636879-1-briandaniels@google.com>
 <20260813180026.2636879-2-briandaniels@google.com> <CACzuRyzeX9E4VhW7zA=q6md4byzC_+ydB9hU=+mYjui_vkWVig@mail.gmail.com>
In-Reply-To: <CACzuRyzeX9E4VhW7zA=q6md4byzC_+ydB9hU=+mYjui_vkWVig@mail.gmail.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Tue, 25 Aug 2026 17:46:59 +0200
X-Gm-Features: AcwNN1X6Lb3XH2VOKWXUEjwwTUSA8KRv3VbMsEI0JI3wyHD-f8IOy9D794LjOjQ
Message-ID: <CACzuRyx7+o9AuqdzkR-EGmWj5_ptbVqUAb6EJbxcpkOWWqwnyQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] media: virtio: Add skeleton virtio-media driver
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

I've been backporting the virtio-media v7 patches for libkrunfw and hit
some failures on aarch64 when running make on the headers. The v7
patches has UAPI headers issues in include/uapi/linux/virtio_media.h:
1. It's using `u32`/`u64` instead of `__u32`/`__u64`
UAPI headers exposed to userspace must use the double-underscore
types.

2. It's missing `#include <linux/types.h>`
Without this, `__u32`/`__u64` are undefined when the header is included
from userspace.

causing errors like:
./usr/include/linux/virtio_media.h:27:9: error: unknown type name =E2=80=98=
u32=E2=80=99
  27 |         u32 cmd;
     |         ^~~

See patterns:

> +struct virtio_media_cmd_header {
> +       u32 cmd;
> +       u32 __reserved;
> +};

here

> +struct virtio_media_sg_entry {
> +       u64 start;
> +       u32 len;
> +       u32 __reserved;
> +};

here and more.

I've applied these fixes locally for the backport. These would fail
on any system that runs UAPI header validation during build too.

BR,
Dorinda.


On Wed, Aug 19, 2026 at 12:54=E2=80=AFPM Dorinda Bassey <dbassey@redhat.com=
> wrote:
>
> > From: Alexandre Courbot <gnurou@gmail.com>
> > This patch adds a minimum viable virtio-media driver that binds to the
> > virtio device and registers a V4L2 device and a video device, but lacks
> > any actual functionality.
> > It adds the UAPI header defining the protocol, internal driver headers,
> > Kconfig and Makefile entries, and MAINTAINERS entry. Many of the struct=
s
> > in the protocol add reserved bits. These are present to ensure 64-bit
> > alignment. They are not intended to be used as reserved expansion for
> > the protocol in the future, so more reserved space is not required.
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
>
>
> Reviewed-by: Dorinda Bassey <dbassey@redhat.com>
> Tested-by: Dorinda Bassey <dbassey@redhat.com>
>
> Thanks!
>
>
> On Thu, Aug 13, 2026 at 8:00=E2=80=AFPM Brian Daniels <briandaniels@googl=
e.com> wrote:
> >
> > From: Alexandre Courbot <gnurou@gmail.com>
> >
> > This patch adds a minimum viable virtio-media driver that binds to the
> > virtio device and registers a V4L2 device and a video device, but lacks
> > any actual functionality.
> >
> > It adds the UAPI header defining the protocol, internal driver headers,
> > Kconfig and Makefile entries, and MAINTAINERS entry. Many of the struct=
s
> > in the protocol add reserved bits. These are present to ensure 64-bit
> > alignment. They are not intended to be used as reserved expansion for
> > the protocol in the future, so more reserved space is not required.
> >
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > ---
> >  MAINTAINERS                                |   8 +
> >  drivers/media/Kconfig                      |  13 +
> >  drivers/media/Makefile                     |   2 +
> >  drivers/media/virtio/Makefile              |   7 +
> >  drivers/media/virtio/virtio_media.h        |  95 +++++++
> >  drivers/media/virtio/virtio_media_driver.c | 146 +++++++++++
> >  include/uapi/linux/virtio_media.h          | 287 +++++++++++++++++++++
> >  7 files changed, 558 insertions(+)
> >  create mode 100644 drivers/media/virtio/Makefile
> >  create mode 100644 drivers/media/virtio/virtio_media.h
> >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> >  create mode 100644 include/uapi/linux/virtio_media.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3785b8c1d..c3b5c5eb6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28573,6 +28573,7 @@ F:      Documentation/devicetree/bindings/virti=
o/
> >  F:     Documentation/driver-api/virtio/
> >  F:     drivers/block/virtio_blk.c
> >  F:     drivers/crypto/virtio/
> > +F:     drivers/media/virtio/
> >  F:     drivers/vdpa/
> >  F:     drivers/virtio/
> >  F:     include/linux/vdpa.h
> > @@ -28685,6 +28686,13 @@ S:     Maintained
> >  F:     drivers/iommu/virtio-iommu.c
> >  F:     include/uapi/linux/virtio_iommu.h
> >
> > +VIRTIO MEDIA DRIVER
> > +M:     Brian Daniels <briandaniels@google.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +F:     drivers/media/virtio/
> > +F:     include/uapi/linux/virtio_media.h
> > +
> >  VIRTIO MEM DRIVER
> >  M:     David Hildenbrand <david@kernel.org>
> >  L:     virtualization@lists.linux.dev
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index 6abc9302c..ce7d088e7 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -136,6 +136,19 @@ config MEDIA_PLATFORM_SUPPORT
> >
> >           Say Y when you want to be able to see such devices.
> >
> > +config MEDIA_VIRTIO
> > +       tristate "Virtio-media Driver"
> > +       depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || CPU_LITTLE_E=
NDIAN)
> > +       select VIDEOBUF2_CORE
> > +       select VIDEOBUF2_MEMOPS
> > +       help
> > +         Enables the virtio-media driver.
> > +
> > +         This driver is used to virtualize media devices such as camer=
as or
> > +         decoders from a host into a guest using the V4L2 protocol.
> > +
> > +         If unsure, say N.
> > +
> >  config MEDIA_TEST_SUPPORT
> >         bool
> >         prompt "Test drivers" if MEDIA_SUPPORT_FILTER
> > diff --git a/drivers/media/Makefile b/drivers/media/Makefile
> > index 20fac24e4..357e786cc 100644
> > --- a/drivers/media/Makefile
> > +++ b/drivers/media/Makefile
> > @@ -23,6 +23,8 @@ obj-$(CONFIG_DVB_CORE) +=3D dvb-core/
> >  # There are both core and drivers at RC subtree - merge before drivers
> >  obj-y +=3D rc/
> >
> > +obj-$(CONFIG_MEDIA_VIRTIO) +=3D virtio/
> > +
> >  obj-$(CONFIG_CEC_CORE) +=3D cec/
> >
> >  #
> > diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makef=
ile
> > new file mode 100644
> > index 000000000..09d9834da
> > --- /dev/null
> > +++ b/drivers/media/virtio/Makefile
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Makefile for the virtio-media device driver.
> > +
> > +virtio-media-objs :=3D virtio_media_driver.o
> > +
> > +obj-$(CONFIG_MEDIA_VIRTIO) +=3D virtio-media.o
> > diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virtio=
/virtio_media.h
> > new file mode 100644
> > index 000000000..7acb2b842
> > --- /dev/null
> > +++ b/drivers/media/virtio/virtio_media.h
> > @@ -0,0 +1,95 @@
> > +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> > +
> > +/*
> > + * Virtio-media structures & functions declarations.
> > + *
> > + * Copyright (c) 2024-2026 Google LLC.
> > + */
> > +
> > +#ifndef __VIRTIO_MEDIA_H
> > +#define __VIRTIO_MEDIA_H
> > +
> > +#include <linux/virtio_config.h>
> > +#include <media/v4l2-device.h>
> > +
> > +#include "uapi/linux/virtio_media.h"
> > +
> > +#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
> > +
> > +#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
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
> > + * @sessions_lock: protects @sessions and &struct virtio_media_session=
.list.
> > + * @events_lock: prevents concurrent processing of events.
> > + * @cmd: union of the device commands ``open`` and ``munmap``. The oth=
er
> > + *       commands are handled by &struct virtio_media_session
> > + * @resp: union of responses to device commands ``open`` and ``munmap`=
`. The
> > + *        other responses are handled by &struct virtio_media_session
> > + * @vlock: serializes access to the command queue.
> > + * @wq: waitqueue for host responses on the command queue.
> > + */
> > +struct virtio_media {
> > +       struct v4l2_device v4l2_dev;
> > +       struct video_device video_dev;
> > +
> > +       struct virtio_device *virtio_dev;
> > +       struct virtqueue *commandq;
> > +       struct virtqueue *eventq;
> > +       struct work_struct eventq_work;
> > +
> > +       struct virtio_shm_region mmap_region;
> > +
> > +       void *event_buffer;
> > +
> > +       struct list_head sessions;
> > +       struct mutex sessions_lock; /* protects sessions list */
> > +
> > +       struct mutex events_lock; /* prevents concurrent event processi=
ng */
> > +
> > +       __dma_from_device_group_begin();
> > +       union {
> > +               struct virtio_media_cmd_open open;
> > +               struct virtio_media_cmd_munmap munmap;
> > +       } cmd;
> > +
> > +       union {
> > +               struct virtio_media_resp_open open;
> > +               struct virtio_media_resp_munmap munmap;
> > +       } resp;
> > +       __dma_from_device_group_end();
> > +
> > +       struct mutex vlock; /* serializes command queue access */
> > +       wait_queue_head_t wq;
> > +};
> > +
> > +static inline struct virtio_media *
> > +to_virtio_media(struct video_device *video_dev)
> > +{
> > +       return container_of(video_dev, struct virtio_media, video_dev);
> > +}
> > +
> > +/* virtio_media_driver.c */
> > +
> > +int virtio_media_send_command(struct virtio_media *vv, struct scatterl=
ist **sgs,
> > +                             const size_t out_sgs, const size_t in_sgs=
,
> > +                             size_t minimum_resp_len, size_t *resp_len=
);
> > +void virtio_media_process_events(struct virtio_media *vv);
> > +
> > +/* virtio_media_ioctls.c */
> > +
> > +long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
> > +                              unsigned long arg);
> > +extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
> > +
> > +#endif // __VIRTIO_MEDIA_H
> > +
> > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media=
/virtio/virtio_media_driver.c
> > new file mode 100644
> > index 000000000..25f2ceaa6
> > --- /dev/null
> > +++ b/drivers/media/virtio/virtio_media_driver.c
> > @@ -0,0 +1,146 @@
> > +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> > +
> > +/*
> > + * Virtio-media driver.
> > + *
> > + * Copyright (c) 2024-2026 Google LLC.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/mutex.h>
> > +#include <linux/types.h>
> > +#include <linux/module.h>
> > +#include <linux/virtio.h>
> > +#include <linux/virtio_config.h>
> > +#include <linux/virtio_ids.h>
> > +
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-device.h>
> > +
> > +#include "uapi/linux/virtio_media.h"
> > +#include "virtio_media.h"
> > +
> > +static void commandq_callback(struct virtqueue *vq)
> > +{
> > +}
> > +
> > +static void eventq_callback(struct virtqueue *vq)
> > +{
> > +}
> > +
> > +static const struct v4l2_file_operations virtio_media_fops =3D {
> > +       .owner =3D THIS_MODULE,
> > +       .open =3D v4l2_fh_open,
> > +       .release =3D v4l2_fh_release,
> > +};
> > +
> > +static int virtio_media_probe(struct virtio_device *virtio_dev)
> > +{
> > +       struct device *dev =3D &virtio_dev->dev;
> > +       struct virtqueue *vqs[2];
> > +       static struct virtqueue_info vq_info[2] =3D {
> > +               {
> > +                       .name =3D "command",
> > +                       .callback =3D commandq_callback,
> > +               },
> > +               {
> > +                       .name =3D "event",
> > +                       .callback =3D eventq_callback,
> > +               },
> > +       };
> > +       struct virtio_media *vv;
> > +       struct video_device *vd;
> > +       int ret;
> > +
> > +       vv =3D devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
> > +       if (!vv)
> > +               return -ENOMEM;
> > +
> > +       INIT_LIST_HEAD(&vv->sessions);
> > +       mutex_init(&vv->sessions_lock);
> > +       mutex_init(&vv->events_lock);
> > +       mutex_init(&vv->vlock);
> > +
> > +       vv->virtio_dev =3D virtio_dev;
> > +       virtio_dev->priv =3D vv;
> > +
> > +       init_waitqueue_head(&vv->wq);
> > +
> > +       ret =3D v4l2_device_register(dev, &vv->v4l2_dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D virtio_find_vqs(virtio_dev, 2, vqs, vq_info, NULL);
> > +       if (ret)
> > +               goto err_find_vqs;
> > +
> > +       vv->commandq =3D vqs[0];
> > +       vv->eventq =3D vqs[1];
> > +
> > +       vd =3D &vv->video_dev;
> > +       vd->v4l2_dev =3D &vv->v4l2_dev;
> > +       vd->vfl_type =3D VFL_TYPE_VIDEO;
> > +       vd->fops =3D &virtio_media_fops;
> > +       vd->release =3D video_device_release_empty;
> > +       strscpy(vd->name, "virtio-media", sizeof(vd->name));
> > +
> > +       video_set_drvdata(vd, vv);
> > +
> > +       vd->device_caps =3D virtio_cread32(virtio_dev, 0);
> > +       if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_=
MPLANE))
> > +               vd->vfl_dir =3D VFL_DIR_M2M;
> > +       else if (vd->device_caps &
> > +                (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE)=
)
> > +               vd->vfl_dir =3D VFL_DIR_TX;
> > +       else
> > +               vd->vfl_dir =3D VFL_DIR_RX;
> > +
> > +       ret =3D video_register_device(vd, virtio_cread32(virtio_dev, 4)=
, 0);
> > +       if (ret)
> > +               goto err_register_device;
> > +
> > +       virtio_device_ready(virtio_dev);
> > +
> > +       return 0;
> > +
> > +err_register_device:
> > +       virtio_dev->config->del_vqs(virtio_dev);
> > +err_find_vqs:
> > +       v4l2_device_unregister(&vv->v4l2_dev);
> > +       return ret;
> > +}
> > +
> > +static void virtio_media_remove(struct virtio_device *virtio_dev)
> > +{
> > +       struct virtio_media *vv =3D virtio_dev->priv;
> > +
> > +       virtio_reset_device(virtio_dev);
> > +       v4l2_device_unregister(&vv->v4l2_dev);
> > +       virtio_dev->config->del_vqs(virtio_dev);
> > +       video_unregister_device(&vv->video_dev);
> > +}
> > +
> > +static struct virtio_device_id id_table[] =3D {
> > +       { VIRTIO_ID_MEDIA, VIRTIO_DEV_ANY_ID },
> > +       { 0 },
> > +};
> > +
> > +static unsigned int features[] =3D {};
> > +
> > +static struct virtio_driver virtio_media_driver =3D {
> > +       .feature_table =3D features,
> > +       .feature_table_size =3D ARRAY_SIZE(features),
> > +       .driver.name =3D VIRTIO_MEDIA_DEFAULT_DRIVER_NAME,
> > +       .driver.owner =3D THIS_MODULE,
> > +       .id_table =3D id_table,
> > +       .probe =3D virtio_media_probe,
> > +       .remove =3D virtio_media_remove,
> > +};
> > +
> > +module_virtio_driver(virtio_media_driver);
> > +
> > +MODULE_DEVICE_TABLE(virtio, id_table);
> > +MODULE_DESCRIPTION("virtio media driver");
> > +MODULE_AUTHOR("Alexandre Courbot <gnurou@gmail.com>");
> > +MODULE_LICENSE("Dual BSD/GPL");
> > diff --git a/include/uapi/linux/virtio_media.h b/include/uapi/linux/vir=
tio_media.h
> > new file mode 100644
> > index 000000000..280fbbe94
> > --- /dev/null
> > +++ b/include/uapi/linux/virtio_media.h
> > @@ -0,0 +1,287 @@
> > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD=
-3-Clause) */
> > +
> > +/*
> > + * Definitions of virtio-media protocol structures.
> > + *
> > + * Copyright (c) 2024-2026 Google LLC.
> > + */
> > +
> > +#ifndef __VIRTIO_MEDIA_PROTOCOL_H
> > +#define __VIRTIO_MEDIA_PROTOCOL_H
> > +
> > +#include <linux/videodev2.h>
> > +
> > +/*
> > + * Virtio protocol definition.
> > + */
> > +
> > +/**
> > + * struct virtio_media_cmd_header - Header for all virtio-media comman=
ds.
> > + * @cmd: one of VIRTIO_MEDIA_CMD_*.
> > + * @__reserved: must be set to zero by the driver.
> > + *
> > + * This header starts all commands from the driver to the device on th=
e
> > + * commandq.
> > + */
> > +struct virtio_media_cmd_header {
> > +       u32 cmd;
> > +       u32 __reserved;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_header - Header for all virtio-media respo=
nses.
> > + * @status: 0 if the command was successful, or one of the standard Li=
nux error
> > + *          codes as a positive integer.
> > + * @__reserved: must be set to zero by the device.
> > + *
> > + * This header starts all responses from the device to the driver on t=
he
> > + * commandq.
> > + */
> > +struct virtio_media_resp_header {
> > +       u32 status;
> > +       u32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_OPEN - Command for creating a new session.
> > + *
> > + * This is the equivalent of calling ``open`` on a V4L2 device node. U=
pon
> > + * success, a session id is returned which can be used to perform othe=
r
> > + * commands on the session, notably ioctls.
> > + */
> > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > +
> > +/**
> > + * struct virtio_media_cmd_open - Driver command for VIRTIO_MEDIA_CMD_=
OPEN.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_OPEN.
> > + */
> > +struct virtio_media_cmd_open {
> > +       struct virtio_media_cmd_header hdr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_open - Device response for VIRTIO_MEDIA_CM=
D_OPEN.
> > + * @hdr: header containing the status of the command.
> > + * @session_id: if &struct virtio_media_resp_header.status =3D=3D 0, c=
ontains the
> > + *              id of the newly created session.
> > + * @__reserved: must be set to zero by the device.
> > + */
> > +struct virtio_media_resp_open {
> > +       struct virtio_media_resp_header hdr;
> > +       u32 session_id;
> > +       u32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_CLOSE - Command for closing an active session.
> > + *
> > + * This is the equivalent of calling ``close`` on a previously opened =
V4L2
> > + * session. All resources associated with this session will be freed a=
nd the
> > + * session ID shall not be used again after queueing this command.
> > + *
> > + * This command does not require a response from the device.
> > + */
> > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > +
> > +/**
> > + * struct virtio_media_cmd_close - Driver command for VIRTIO_MEDIA_CMD=
_CLOSE.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_CLOSE.
> > + * @session_id: id of the session to close.
> > + * @__reserved: must be set to zero by the driver.
> > + */
> > +struct virtio_media_cmd_close {
> > +       struct virtio_media_cmd_header hdr;
> > +       u32 session_id;
> > +       u32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_IOCTL - Driver command for executing an ioctl.
> > + *
> > + * This command asks the device to run one of the ``VIDIOC_*`` ioctls =
on the
> > + * active session.
> > + *
> > + * The code of the ioctl is extracted from the VIDIOC_* definitions in
> > + * ``videodev2.h``, and consists of the second argument of the ``_IO*`=
` macro.
> > + *
> > + * Each ioctl has a payload, which is defined by the third argument of=
 the
> > + * ``_IO*`` macro defining it. It can be writable by the driver (``_IO=
W``), the
> > + * device (``_IOR``), or both (``_IOWR``).
> > + *
> > + * If an ioctl is writable by the driver, it must be followed by a
> > + * driver-writable descriptor containing the payload.
> > + *
> > + * If an ioctl is writable by the device, it must be followed by a
> > + * device-writable descriptor of the size of the payload that the devi=
ce will
> > + * write into.
> > + *
> > + */
> > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > +
> > +/**
> > + * struct virtio_media_cmd_ioctl - Driver command for VIRTIO_MEDIA_CMD=
_IOCTL.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_IOCTL.
> > + * @session_id: id of the session to run the ioctl on.
> > + * @code: code of the ioctl to run.
> > + */
> > +struct virtio_media_cmd_ioctl {
> > +       struct virtio_media_cmd_header hdr;
> > +       u32 session_id;
> > +       u32 code;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA_C=
MD_IOCTL.
> > + * @hdr: header containing the status of the ioctl.
> > + */
> > +struct virtio_media_resp_ioctl {
> > +       struct virtio_media_resp_header hdr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_sg_entry - Description of part of a scattered g=
uest
> > + *                                memory.
> > + * @start: start guest address of the memory segment.
> > + * @len: length of this memory segment.
> > + * @__reserved: must be set to zero by the driver.
> > + */
> > +struct virtio_media_sg_entry {
> > +       u64 start;
> > +       u32 len;
> > +       u32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_MMAP_FLAG_RW - Bit position of the VIRTIO_MEDIA_MMAP_F=
LAG_RW
> > + *                             flag.
> > + */
> > +#define VIRTIO_MEDIA_MMAP_FLAG_RW 0
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_MMAP - Command for mapping a MMAP buffer into the =
driver's
> > + *                         address space.
> > + */
> > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > +
> > +/**
> > + * struct virtio_media_cmd_mmap - Driver command for VIRTIO_MEDIA_CMD_=
MMAP.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MMAP.
> > + * @session_id: ID of the session we are mapping for.
> > + * @flags: combination of VIRTIO_MEDIA_MMAP_FLAG_*.
> > + * @offset: mem_offset field of the plane to map, as returned by
> > + *          VIDIOC_QUERYBUF.
> > + */
> > +struct virtio_media_cmd_mmap {
> > +       struct virtio_media_cmd_header hdr;
> > +       u32 session_id;
> > +       u32 flags;
> > +       u32 offset;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_mmap - Device response for VIRTIO_MEDIA_CM=
D_MMAP.
> > + * @hdr: header containing the status of the command.
> > + * @driver_addr: offset into SHM region 0 of the start of the mapping.
> > + * @len: length of the mapping.
> > + */
> > +struct virtio_media_resp_mmap {
> > +       struct virtio_media_resp_header hdr;
> > +       u64 driver_addr;
> > +       u64 len;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_MUNMAP - Unmap a MMAP buffer previously mapped usi=
ng
> > + *                           VIRTIO_MEDIA_CMD_MMAP.
> > + */
> > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > +
> > +/**
> > + * struct virtio_media_cmd_munmap - Driver command for VIRTIO_MEDIA_CM=
D_MUNMAP.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MUNMAP.
> > + * @driver_addr: offset into SHM region 0 at which the buffer has been
> > + *               previously mapped.
> > + */
> > +struct virtio_media_cmd_munmap {
> > +       struct virtio_media_cmd_header hdr;
> > +       u64 driver_addr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_munmap - Device response for
> > + *                                   VIRTIO_MEDIA_CMD_MUNMAP.
> > + * @hdr: header containing the status of the command.
> > + */
> > +struct virtio_media_resp_munmap {
> > +       struct virtio_media_resp_header hdr;
> > +};
> > +
> > +/* The values for these events are set by the virtio-media specificati=
on. */
> > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > +
> > +/**
> > + * struct virtio_media_event_header - Header for events on the eventq.
> > + * @event: one of VIRTIO_MEDIA_EVT_*
> > + * @session_id: ID of the session the event applies to.
> > + */
> > +struct virtio_media_event_header {
> > +       u32 event;
> > +       u32 session_id;
> > +};
> > +
> > +/**
> > + * struct virtio_media_event_error - Unrecoverable device-side error.
> > + * @hdr: header for the event.
> > + * @errno: error code describing the kind of error that occurred.
> > + * @__reserved: must be set to zero by the device.
> > + *
> > + * Upon receiving this event, the session mentioned in the header is c=
onsidered
> > + * corrupted and closed.
> > + */
> > +struct virtio_media_event_error {
> > +       struct virtio_media_event_header hdr;
> > +       u32 errno;
> > +       u32 __reserved;
> > +};
> > +
> > +/* This is set to VIDEO_MAX_PLANES defined in include/uapi/linux/video=
dev2.h.
> > + * It is renamed here to match the constant that is defined in the vir=
tio-media
> > + * specification.
> > + */
> > +#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
> > +
> > +/**
> > + * struct virtio_media_event_dqbuf - Dequeued buffer event.
> > + * @hdr: header for the event.
> > + * @buffer: &struct v4l2_buffer describing the buffer that has been de=
queued.
> > + * @planes: plane information for the dequeued buffer.
> > + *
> > + * This event is used to signal that a buffer is not being used anymor=
e by the
> > + * device and is returned to the driver.
> > + */
> > +struct virtio_media_event_dqbuf {
> > +       struct virtio_media_event_header hdr;
> > +       struct v4l2_buffer buffer;
> > +       struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
> > +};
> > +
> > +/**
> > + * struct virtio_media_event_event - V4L2 event.
> > + * @hdr: header for the event.
> > + * @event: description of the event that occurred.
> > + *
> > + * This event signals that a V4L2 event has been emitted for a session=
.
> > + */
> > +struct virtio_media_event_event {
> > +       struct virtio_media_event_header hdr;
> > +       struct v4l2_event event;
> > +};
> > +
> > +/* Maximum size of an event. We will queue descriptors of this size on=
 the
> > + * eventq.
> > + */
> > +#define VIRTIO_MEDIA_EVENT_MAX_SIZE sizeof(struct virtio_media_event_d=
qbuf)
> > +
> > +#endif // __VIRTIO_MEDIA_PROTOCOL_H
> > --
> > 2.55.0.737.g08866a6d13-goog
> >

