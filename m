Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7A4FD29D
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744272; cv=pass; b=QgMm7t8jVZpOtAh2avGyCbbOnodphUWfWw3XSFbiChCq468K26y+TqmfXtiLqpz5LD9OQd5iS+skiwRvavtJQ016ZEMdcVFkEw3W1sgud41xEscZLFZJA4Wzen4PkpwSXcrMPGeh5wYcUnVZknfEWXIZnZtUAl9V3DQPRLZw5YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744272; c=relaxed/simple;
	bh=nAucdYe0uiXwfT0TFxaF+xrGZfzsbpsbO/VguXlbIsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+WV5NWbX1yRnW5BoXUDe9cPSU5y6fX6e19+oNl3+DMp6SbI11BurnglUqS2RoCFUhKnC70dQxFwEEg7SFJBCkKBRyr9CasmLF0OcK3ZawA0BylPo3EnpiToUEjRN0dAzzoXZYiu+lib7aEzkNX5ZyNNfvhuBUIH3ALPqg5P3Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffaHPguV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6/wyKPm; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffaHPguV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6/wyKPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789744268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9AVV/t82Ku2QvcdUIHu5ctrrQuWnhPhVKIwRE5Q2QM=;
	b=ffaHPguVSV9Fz3nyUodzQsAhjNFIVZ+z4M6NcgVQu8WHsmIPlQlhqxRErJxiQSd5rViQOC
	za0BdDKbxU/d6JTd5IlVHGqad+682O5wjzCgj2e8KzngtZ/OvPV7elsuiVfvkBz8OH/bcx
	Xernu0TM+N+wGcLphH+wm/Rt/KLITtg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-7eeeqRCcOXGTNA-QJST0gw-1; Fri, 18 Sep 2026 11:11:06 -0400
X-MC-Unique: 7eeeqRCcOXGTNA-QJST0gw-1
X-Mimecast-MFC-AGG-ID: 7eeeqRCcOXGTNA-QJST0gw_1789744266
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8563c2a53dbso9472197b3.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 08:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789744266; cv=none;
        d=google.com; s=arc-20260327;
        b=H1LvJ5e7Cbm8fNv1H8P2lVc/dgmWB3EIc78m9EZEaW4JULV0u9KTxL/0NKBB2pTfii
         Yp1NG/iTJFN8Vmnqk61yFqRGMEXfPRH56y7vwsRMbonomJQkV6W82II8WHOYSJO5ExDu
         pHAH6kBaJmTovCIEXDEWGh91praaW4bcJCb3PM75SinsvE4PpFkySSYmYSlZeEAbXk4s
         ltIP0DOrUFNxPBKZwMg9bTwVbEkQ3MCYZaRyBse8WWiGsyrVUKOYEZEP4iulboEgSjLI
         W/8PMR1NUHi+3QA7FIeCytxcbjNREx/AVAGh/tMCKQhyuHS6mXg2xgaaEmrdvsEiIKRN
         Kdag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9AVV/t82Ku2QvcdUIHu5ctrrQuWnhPhVKIwRE5Q2QM=;
        fh=KQV9E5FMalNmapawQxKm4Vt+RnqeFnhC86KnC7iK/hk=;
        b=c/gjqT/NKjfN3FcFPTcvP7RLUMpZssNbo/GgReSaRMIfUMffpNB36rr0hxDVEeWNIA
         xi/nAsIiOwtcrombIQN7P19DWqJnMG5LXsw7y5wpURdpMuU4eN9W1fDyf/k6AudlqfHY
         ZVyZOaxFIJSn2L/17eJHPvIW+w36lpktvRhCxBt56xcUdPJ7piLW/ZUStvd8FayE/3Ly
         s73gjen+KO+y7Ujbm5+Pa0AlioJvNVrAA7YZTZh6z8WjFpR43eK4W+hWPV2Zn4avKSqC
         hh74TTV/YlFluPHzRu40l/Ocr6fOZScN+1mCE0gbA1NeeZXe49PYeQ0riQRQiaZoSB7j
         8rCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789744266; x=1790349066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d9AVV/t82Ku2QvcdUIHu5ctrrQuWnhPhVKIwRE5Q2QM=;
        b=a6/wyKPmSUo4+Im0xUhSM2EWHUdB6BXqnD2Q31ZwFKeVD1DEHrTY2475GPWTffw92o
         wW6j9cHPDI/ZY7ZSFobkHQfb7+9OlpoqkPFoU7XondXF4LEKpcFUNS+14pa+gpt59WJr
         B/zp+GWNwjkbzSejNYJfN/xgf3K+Hvvh/VCMENncptGArKdsHZEPc1SUgihnCIYwxGtM
         OqpsoD/xktFcIzyMKBgiH197U/rU/F2191tXdphK5DBf6aL2VAyjmss++YolF8nLL+X3
         tQrvmtfZHE9i5gYk5kBjYszYT9DTiPeC+GttOtQBVAuzkq6iaDKAceoBucXLW7nqHxbk
         O4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744266; x=1790349066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9AVV/t82Ku2QvcdUIHu5ctrrQuWnhPhVKIwRE5Q2QM=;
        b=S/FU4l3YooTOYeAtLJIJhbpskF5SbkJnkXwt6giKe4MaRlX6IECAw1AtyEOjF5yXPd
         B5diV1GTTayxGRrpUBO/qo+KW8RsvpMEk286XXAP/qIAnzw0aHWSccsuw39+lucikORw
         dlws1T2hX3OErIxU1C4vPVTXkgmnDnWClHQAS931yodi07bY4mGjwjC2eFckjlaub7pR
         WjzCvUYxOAVIfd22Ib8Z2QiflBiqH0brC0ncvbAaJC6HOw94b/j1tQLrsKlfjiiFbjt2
         ukvaErGWoZZ4+39Vhr5E6z5NXsXDzsMrrFIcc711I1B7x3lt9fncTKwOWpQX+mgT+ESu
         V9ag==
X-Forwarded-Encrypted: i=1; AKwUvBykpyEugg3fxtTtGQvLPHxC881tQ+Fsmn4OKLUYfQRPew+z3akqaFZ3qgRq3w7O1HLmS2NseC3GBPRw0g==@vger.kernel.org
X-Gm-Message-State: AFuF++knVrsY7yHtP3ZKc9nF0hIdJ1cj3k49ur7d/+E/RQb7TLQahnju
	BljmmQ8T61qO4OstPzfYhf1cbDLs97RWrI4zk1Xn7iXVqHVRFba4kvXB6j+zhcywFfHtM9S/xYo
	XfeOk5DmWHuIITTT26DUMpn8emN2c54ykHHgkmqQtNnPkVwCfCzbPHy0Dfpx7IUNUJHGJbxUwnt
	ofICJ0ls25LyKZeuDjJTmyH2U9ai4vCg6lavk36b8=
X-Gm-Gg: AYBFou2kO3Jex6EWdkYEKUQ3q1IM2OYr3JZMFycwhctI1nfa6LQKPvUhmoEhT/vBwkd
	aR40nbfbRWimLMhnkWeg1Ib2lWUmVzZj/UmWiLGs2J59HxNALJmrd71l/OdPzU4Y1FbPW4bQT4O
	3p+XjGH2TdtWgD4n7vXLAbKSSaEB+thr5BzIHiqf5gO9BcAfhZIfRi/w==
X-Received: by 2002:a05:690c:c61b:b0:887:f24e:cb60 with SMTP id 00721157ae682-8973655013bmr7999557b3.38.1789744265256;
        Fri, 18 Sep 2026 08:11:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c61b:b0:887:f24e:cb60 with SMTP id
 00721157ae682-8973655013bmr7999157b3.38.1789744264542; Fri, 18 Sep 2026
 08:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917171921.2810550-1-briandaniels@google.com> <20260917171921.2810550-2-briandaniels@google.com>
In-Reply-To: <20260917171921.2810550-2-briandaniels@google.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 18 Sep 2026 17:10:53 +0200
X-Gm-Features: AcwNN1WIb7JEZHof9bDPMIMVfa3Th_bdS_mHkAP_e9tJg5d3vCfewTEkcoMdWQk
Message-ID: <CADSE00++bx4Jn_sGdME5f6qhHURH9phmV9ZNGrWwd82nPvOXrg@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] media: virtio: Add skeleton virtio-media driver
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	dbassey@redhat.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:19=E2=80=AFPM Brian Daniels <briandaniels@google.=
com> wrote:
>
> From: Alexandre Courbot <gnurou@gmail.com>
>
> This patch adds a minimum viable virtio-media driver that binds to the
> virtio device and registers a V4L2 device and a video device, but lacks
> any actual functionality.
>
> It adds the UAPI header defining the protocol, internal driver headers,
> Kconfig and Makefile entries, and MAINTAINERS entry. Many of the structs
> in the protocol add reserved bits. These are present to ensure 64-bit
> alignment. They are not intended to be used as reserved expansion for
> the protocol in the future, so more reserved space is not required.
>
> The UAPI header includes videodev2.h, which itself does not currently
> pass UAPI header validation (CONFIG_UAPI_HEADER_TEST=3Dy). I've added
> virtio_media.h to the same test exception list.
>
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> Assisted-by: Antigravity:gemini-3.5-flash
> Co-developed-by: Brian Daniels <briandaniels@google.com>
> Signed-off-by: Brian Daniels <briandaniels@google.com>
> ---
>  MAINTAINERS                                |   8 +
>  drivers/media/Kconfig                      |  13 +
>  drivers/media/Makefile                     |   2 +
>  drivers/media/virtio/Makefile              |   7 +
>  drivers/media/virtio/virtio_media.h        |  95 +++++++
>  drivers/media/virtio/virtio_media_driver.c | 146 +++++++++++
>  include/uapi/linux/virtio_media.h          | 288 +++++++++++++++++++++
>  usr/include/Makefile                       |   1 +
>  8 files changed, 560 insertions(+)
>  create mode 100644 drivers/media/virtio/Makefile
>  create mode 100644 drivers/media/virtio/virtio_media.h
>  create mode 100644 drivers/media/virtio/virtio_media_driver.c
>  create mode 100644 include/uapi/linux/virtio_media.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d..d6b1e0b30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28886,6 +28886,7 @@ F:      Documentation/devicetree/bindings/virtio/
>  F:     Documentation/driver-api/virtio/
>  F:     drivers/block/virtio_blk.c
>  F:     drivers/crypto/virtio/
> +F:     drivers/media/virtio/
>  F:     drivers/vdpa/
>  F:     drivers/virtio/
>  F:     include/linux/vdpa.h
> @@ -28998,6 +28999,13 @@ S:     Maintained
>  F:     drivers/iommu/virtio-iommu.c
>  F:     include/uapi/linux/virtio_iommu.h
>
> +VIRTIO MEDIA DRIVER
> +M:     Brian Daniels <briandaniels@google.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     drivers/media/virtio/
> +F:     include/uapi/linux/virtio_media.h
> +
>  VIRTIO MEM DRIVER
>  M:     David Hildenbrand <david@kernel.org>
>  L:     virtualization@lists.linux.dev
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index 6abc9302c..ce7d088e7 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -136,6 +136,19 @@ config MEDIA_PLATFORM_SUPPORT
>
>           Say Y when you want to be able to see such devices.
>
> +config MEDIA_VIRTIO
> +       tristate "Virtio-media Driver"
> +       depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || CPU_LITTLE_END=
IAN)
> +       select VIDEOBUF2_CORE
> +       select VIDEOBUF2_MEMOPS
> +       help
> +         Enables the virtio-media driver.
> +
> +         This driver is used to virtualize media devices such as cameras=
 or
> +         decoders from a host into a guest using the V4L2 protocol.
> +
> +         If unsure, say N.
> +
>  config MEDIA_TEST_SUPPORT
>         bool
>         prompt "Test drivers" if MEDIA_SUPPORT_FILTER
> diff --git a/drivers/media/Makefile b/drivers/media/Makefile
> index 20fac24e4..357e786cc 100644
> --- a/drivers/media/Makefile
> +++ b/drivers/media/Makefile
> @@ -23,6 +23,8 @@ obj-$(CONFIG_DVB_CORE) +=3D dvb-core/
>  # There are both core and drivers at RC subtree - merge before drivers
>  obj-y +=3D rc/
>
> +obj-$(CONFIG_MEDIA_VIRTIO) +=3D virtio/
> +
>  obj-$(CONFIG_CEC_CORE) +=3D cec/
>
>  #
> diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makefil=
e
> new file mode 100644
> index 000000000..09d9834da
> --- /dev/null
> +++ b/drivers/media/virtio/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for the virtio-media device driver.
> +
> +virtio-media-objs :=3D virtio_media_driver.o
> +
> +obj-$(CONFIG_MEDIA_VIRTIO) +=3D virtio-media.o
> diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virtio/v=
irtio_media.h
> new file mode 100644
> index 000000000..7acb2b842
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_media.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> +
> +/*
> + * Virtio-media structures & functions declarations.
> + *
> + * Copyright (c) 2024-2026 Google LLC.
> + */
> +
> +#ifndef __VIRTIO_MEDIA_H
> +#define __VIRTIO_MEDIA_H
> +
> +#include <linux/virtio_config.h>
> +#include <media/v4l2-device.h>
> +
> +#include "uapi/linux/virtio_media.h"
> +
> +#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
> +
> +#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
> +
> +/**
> + * struct virtio_media - Virtio-media device.
> + * @v4l2_dev: v4l2_device for the media device.
> + * @video_dev: video_device for the media device.
> + * @virtio_dev: virtio device for the media device.
> + * @commandq: virtio command queue.
> + * @eventq: virtio event queue.
> + * @eventq_work: work to run when events are received on @eventq.
> + * @mmap_region: region into which MMAP buffers are mapped by the host.
> + * @event_buffer: buffer for event descriptors.
> + * @sessions: list of active sessions on the device.
> + * @sessions_lock: protects @sessions and &struct virtio_media_session.l=
ist.
> + * @events_lock: prevents concurrent processing of events.
> + * @cmd: union of the device commands ``open`` and ``munmap``. The other
> + *       commands are handled by &struct virtio_media_session
> + * @resp: union of responses to device commands ``open`` and ``munmap``.=
 The
> + *        other responses are handled by &struct virtio_media_session
> + * @vlock: serializes access to the command queue.
> + * @wq: waitqueue for host responses on the command queue.
> + */
> +struct virtio_media {
> +       struct v4l2_device v4l2_dev;
> +       struct video_device video_dev;
> +
> +       struct virtio_device *virtio_dev;
> +       struct virtqueue *commandq;
> +       struct virtqueue *eventq;
> +       struct work_struct eventq_work;
> +
> +       struct virtio_shm_region mmap_region;
> +
> +       void *event_buffer;
> +
> +       struct list_head sessions;
> +       struct mutex sessions_lock; /* protects sessions list */
> +
> +       struct mutex events_lock; /* prevents concurrent event processing=
 */
> +
> +       __dma_from_device_group_begin();
> +       union {
> +               struct virtio_media_cmd_open open;
> +               struct virtio_media_cmd_munmap munmap;
> +       } cmd;
> +
> +       union {
> +               struct virtio_media_resp_open open;
> +               struct virtio_media_resp_munmap munmap;
> +       } resp;
> +       __dma_from_device_group_end();
> +
> +       struct mutex vlock; /* serializes command queue access */
> +       wait_queue_head_t wq;
> +};
> +
> +static inline struct virtio_media *
> +to_virtio_media(struct video_device *video_dev)
> +{
> +       return container_of(video_dev, struct virtio_media, video_dev);
> +}
> +
> +/* virtio_media_driver.c */
> +
> +int virtio_media_send_command(struct virtio_media *vv, struct scatterlis=
t **sgs,
> +                             const size_t out_sgs, const size_t in_sgs,
> +                             size_t minimum_resp_len, size_t *resp_len);
> +void virtio_media_process_events(struct virtio_media *vv);
> +
> +/* virtio_media_ioctls.c */
> +
> +long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
> +                              unsigned long arg);
> +extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
> +
> +#endif // __VIRTIO_MEDIA_H
> +
> diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media/v=
irtio/virtio_media_driver.c
> new file mode 100644
> index 000000000..25f2ceaa6
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_media_driver.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> +
> +/*
> + * Virtio-media driver.
> + *
> + * Copyright (c) 2024-2026 Google LLC.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/module.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_config.h>
> +#include <linux/virtio_ids.h>
> +
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +
> +#include "uapi/linux/virtio_media.h"
> +#include "virtio_media.h"
> +
> +static void commandq_callback(struct virtqueue *vq)
> +{
> +}
> +
> +static void eventq_callback(struct virtqueue *vq)
> +{
> +}
> +
> +static const struct v4l2_file_operations virtio_media_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       .open =3D v4l2_fh_open,
> +       .release =3D v4l2_fh_release,
> +};
> +
> +static int virtio_media_probe(struct virtio_device *virtio_dev)
> +{
> +       struct device *dev =3D &virtio_dev->dev;
> +       struct virtqueue *vqs[2];
> +       static struct virtqueue_info vq_info[2] =3D {
> +               {
> +                       .name =3D "command",
> +                       .callback =3D commandq_callback,
> +               },
> +               {
> +                       .name =3D "event",
> +                       .callback =3D eventq_callback,
> +               },
> +       };
> +       struct virtio_media *vv;
> +       struct video_device *vd;
> +       int ret;
> +
> +       vv =3D devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
> +       if (!vv)
> +               return -ENOMEM;
> +
> +       INIT_LIST_HEAD(&vv->sessions);
> +       mutex_init(&vv->sessions_lock);
> +       mutex_init(&vv->events_lock);
> +       mutex_init(&vv->vlock);
> +
> +       vv->virtio_dev =3D virtio_dev;
> +       virtio_dev->priv =3D vv;
> +
> +       init_waitqueue_head(&vv->wq);
> +
> +       ret =3D v4l2_device_register(dev, &vv->v4l2_dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D virtio_find_vqs(virtio_dev, 2, vqs, vq_info, NULL);
> +       if (ret)
> +               goto err_find_vqs;
> +
> +       vv->commandq =3D vqs[0];
> +       vv->eventq =3D vqs[1];
> +
> +       vd =3D &vv->video_dev;
> +       vd->v4l2_dev =3D &vv->v4l2_dev;
> +       vd->vfl_type =3D VFL_TYPE_VIDEO;

vdev->vfl_type is overwritten below with video_register_device(), so
this is redudant.

> +       vd->fops =3D &virtio_media_fops;
> +       vd->release =3D video_device_release_empty;
> +       strscpy(vd->name, "virtio-media", sizeof(vd->name));
> +
> +       video_set_drvdata(vd, vv);
> +
> +       vd->device_caps =3D virtio_cread32(virtio_dev, 0);
> +       if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MP=
LANE))
> +               vd->vfl_dir =3D VFL_DIR_M2M;
> +       else if (vd->device_caps &
> +                (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE))
> +               vd->vfl_dir =3D VFL_DIR_TX;
> +       else
> +               vd->vfl_dir =3D VFL_DIR_RX;
> +
> +       ret =3D video_register_device(vd, virtio_cread32(virtio_dev, 4), =
0);

I feel it'd be nicer to pass -1 to the third argument so that the
'first free' device node number is assigned. With that it would
support multiple virtio_media devices without warnings.

Also, the virtio_media_config struct is not defined in the series. I
think defining it would be nice so that it can be imported and used in
QEMU/other VMMs. And it would allow to do `virtio_cread32(virtio_dev,
offsetof(struct virtio_media_config, device_type))` here instead of
hardcoding the offset.


> +       if (ret)
> +               goto err_register_device;
> +
> +       virtio_device_ready(virtio_dev);
> +
> +       return 0;
> +
> +err_register_device:
> +       virtio_dev->config->del_vqs(virtio_dev);
> +err_find_vqs:
> +       v4l2_device_unregister(&vv->v4l2_dev);
> +       return ret;
> +}
> +
> +static void virtio_media_remove(struct virtio_device *virtio_dev)
> +{
> +       struct virtio_media *vv =3D virtio_dev->priv;
> +
> +       virtio_reset_device(virtio_dev);
> +       v4l2_device_unregister(&vv->v4l2_dev);
> +       virtio_dev->config->del_vqs(virtio_dev);
> +       video_unregister_device(&vv->video_dev);

virtio_reset_device() documents that the caller must already have
stopped other contexts (syscalls, workqueue...) from using the
virtqueues. Here reset and del_vqs() run while /dev/video0 is still
registered, so an open fd can still ioctl/mmap and kick commandq.
video_unregister_device() only happens afterwards, and sessions are
freed in remove() even if a file might still be open.


> +}
> +
> +static struct virtio_device_id id_table[] =3D {
> +       { VIRTIO_ID_MEDIA, VIRTIO_DEV_ANY_ID },
> +       { 0 },
> +};
> +
> +static unsigned int features[] =3D {};
> +
> +static struct virtio_driver virtio_media_driver =3D {
> +       .feature_table =3D features,
> +       .feature_table_size =3D ARRAY_SIZE(features),
> +       .driver.name =3D VIRTIO_MEDIA_DEFAULT_DRIVER_NAME,
> +       .driver.owner =3D THIS_MODULE,
> +       .id_table =3D id_table,
> +       .probe =3D virtio_media_probe,
> +       .remove =3D virtio_media_remove,
> +};
> +
> +module_virtio_driver(virtio_media_driver);
> +
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +MODULE_DESCRIPTION("virtio media driver");
> +MODULE_AUTHOR("Alexandre Courbot <gnurou@gmail.com>");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/include/uapi/linux/virtio_media.h b/include/uapi/linux/virti=
o_media.h
> new file mode 100644
> index 000000000..ac3d75c75
> --- /dev/null
> +++ b/include/uapi/linux/virtio_media.h
> @@ -0,0 +1,288 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3=
-Clause) */
> +
> +/*
> + * Definitions of virtio-media protocol structures.
> + *
> + * Copyright (c) 2024-2026 Google LLC.
> + */
> +
> +#ifndef _UAPI__LINUX_VIRTIO_MEDIA_H
> +#define _UAPI__LINUX_VIRTIO_MEDIA_H
> +
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
> +
> +/*
> + * Virtio protocol definition.
> + */
> +
> +/**
> + * struct virtio_media_cmd_header - Header for all virtio-media commands=
.
> + * @cmd: one of VIRTIO_MEDIA_CMD_*.
> + * @__reserved: must be set to zero by the driver.
> + *
> + * This header starts all commands from the driver to the device on the
> + * commandq.
> + */
> +struct virtio_media_cmd_header {
> +       __le32 cmd;
> +       __le32 __reserved;
> +};
> +
> +/**
> + * struct virtio_media_resp_header - Header for all virtio-media respons=
es.
> + * @status: 0 if the command was successful, or one of the standard Linu=
x error
> + *          codes as a positive integer.
> + * @__reserved: must be set to zero by the device.
> + *
> + * This header starts all responses from the device to the driver on the
> + * commandq.
> + */
> +struct virtio_media_resp_header {
> +       __le32 status;
> +       __le32 __reserved;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_CMD_OPEN - Command for creating a new session.
> + *
> + * This is the equivalent of calling ``open`` on a V4L2 device node. Upo=
n
> + * success, a session id is returned which can be used to perform other
> + * commands on the session, notably ioctls.
> + */
> +#define VIRTIO_MEDIA_CMD_OPEN 1
> +
> +/**
> + * struct virtio_media_cmd_open - Driver command for VIRTIO_MEDIA_CMD_OP=
EN.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_OPEN.
> + */
> +struct virtio_media_cmd_open {
> +       struct virtio_media_cmd_header hdr;
> +};
> +
> +/**
> + * struct virtio_media_resp_open - Device response for VIRTIO_MEDIA_CMD_=
OPEN.
> + * @hdr: header containing the status of the command.
> + * @session_id: if &struct virtio_media_resp_header.status =3D=3D 0, con=
tains the
> + *              id of the newly created session.
> + * @__reserved: must be set to zero by the device.
> + */
> +struct virtio_media_resp_open {
> +       struct virtio_media_resp_header hdr;
> +       __le32 session_id;
> +       __le32 __reserved;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_CMD_CLOSE - Command for closing an active session.
> + *
> + * This is the equivalent of calling ``close`` on a previously opened V4=
L2
> + * session. All resources associated with this session will be freed and=
 the
> + * session ID shall not be used again after queueing this command.
> + *
> + * This command does not require a response from the device.
> + */
> +#define VIRTIO_MEDIA_CMD_CLOSE 2
> +
> +/**
> + * struct virtio_media_cmd_close - Driver command for VIRTIO_MEDIA_CMD_C=
LOSE.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_CLOSE.
> + * @session_id: id of the session to close.
> + * @__reserved: must be set to zero by the driver.
> + */
> +struct virtio_media_cmd_close {
> +       struct virtio_media_cmd_header hdr;
> +       __le32 session_id;
> +       __le32 __reserved;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_CMD_IOCTL - Driver command for executing an ioctl.
> + *
> + * This command asks the device to run one of the ``VIDIOC_*`` ioctls on=
 the
> + * active session.
> + *
> + * The code of the ioctl is extracted from the VIDIOC_* definitions in
> + * ``videodev2.h``, and consists of the second argument of the ``_IO*`` =
macro.
> + *
> + * Each ioctl has a payload, which is defined by the third argument of t=
he
> + * ``_IO*`` macro defining it. It can be writable by the driver (``_IOW`=
`), the
> + * device (``_IOR``), or both (``_IOWR``).
> + *
> + * If an ioctl is writable by the driver, it must be followed by a
> + * driver-writable descriptor containing the payload.
> + *
> + * If an ioctl is writable by the device, it must be followed by a
> + * device-writable descriptor of the size of the payload that the device=
 will
> + * write into.
> + *
> + */
> +#define VIRTIO_MEDIA_CMD_IOCTL 3
> +
> +/**
> + * struct virtio_media_cmd_ioctl - Driver command for VIRTIO_MEDIA_CMD_I=
OCTL.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_IOCTL.
> + * @session_id: id of the session to run the ioctl on.
> + * @code: code of the ioctl to run.
> + */
> +struct virtio_media_cmd_ioctl {
> +       struct virtio_media_cmd_header hdr;
> +       __le32 session_id;
> +       __le32 code;
> +};
> +
> +/**
> + * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA_CMD=
_IOCTL.
> + * @hdr: header containing the status of the ioctl.
> + */
> +struct virtio_media_resp_ioctl {
> +       struct virtio_media_resp_header hdr;
> +};
> +
> +/**
> + * struct virtio_media_sg_entry - Description of part of a scattered gue=
st
> + *                                memory.
> + * @start: start guest address of the memory segment.
> + * @len: length of this memory segment.
> + * @__reserved: must be set to zero by the driver.
> + */
> +struct virtio_media_sg_entry {
> +       __le64 start;
> +       __le32 len;
> +       __le32 __reserved;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_MMAP_FLAG_RW - Bit position of the VIRTIO_MEDIA_MMAP_FLA=
G_RW
> + *                             flag.
> + */
> +#define VIRTIO_MEDIA_MMAP_FLAG_RW 0
> +
> +/**
> + * VIRTIO_MEDIA_CMD_MMAP - Command for mapping a MMAP buffer into the dr=
iver's
> + *                         address space.
> + */
> +#define VIRTIO_MEDIA_CMD_MMAP 4
> +
> +/**
> + * struct virtio_media_cmd_mmap - Driver command for VIRTIO_MEDIA_CMD_MM=
AP.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MMAP.
> + * @session_id: ID of the session we are mapping for.
> + * @flags: combination of VIRTIO_MEDIA_MMAP_FLAG_*.
> + * @offset: mem_offset field of the plane to map, as returned by
> + *          VIDIOC_QUERYBUF.
> + */
> +struct virtio_media_cmd_mmap {
> +       struct virtio_media_cmd_header hdr;
> +       __le32 session_id;
> +       __le32 flags;
> +       __le32 offset;
> +};
> +
> +/**
> + * struct virtio_media_resp_mmap - Device response for VIRTIO_MEDIA_CMD_=
MMAP.
> + * @hdr: header containing the status of the command.
> + * @driver_addr: offset into SHM region 0 of the start of the mapping.
> + * @len: length of the mapping.
> + */
> +struct virtio_media_resp_mmap {
> +       struct virtio_media_resp_header hdr;
> +       __le64 driver_addr;
> +       __le64 len;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_CMD_MUNMAP - Unmap a MMAP buffer previously mapped using
> + *                           VIRTIO_MEDIA_CMD_MMAP.
> + */
> +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> +
> +/**
> + * struct virtio_media_cmd_munmap - Driver command for VIRTIO_MEDIA_CMD_=
MUNMAP.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MUNMAP.
> + * @driver_addr: offset into SHM region 0 at which the buffer has been
> + *               previously mapped.
> + */
> +struct virtio_media_cmd_munmap {
> +       struct virtio_media_cmd_header hdr;
> +       __le64 driver_addr;
> +};
> +
> +/**
> + * struct virtio_media_resp_munmap - Device response for
> + *                                   VIRTIO_MEDIA_CMD_MUNMAP.
> + * @hdr: header containing the status of the command.
> + */
> +struct virtio_media_resp_munmap {
> +       struct virtio_media_resp_header hdr;
> +};
> +
> +/* The values for these events are set by the virtio-media specification=
. */
> +#define VIRTIO_MEDIA_EVT_ERROR 0
> +#define VIRTIO_MEDIA_EVT_DQBUF 1
> +#define VIRTIO_MEDIA_EVT_EVENT 2
> +
> +/**
> + * struct virtio_media_event_header - Header for events on the eventq.
> + * @event: one of VIRTIO_MEDIA_EVT_*
> + * @session_id: ID of the session the event applies to.
> + */
> +struct virtio_media_event_header {
> +       __le32 event;
> +       __le32 session_id;
> +};
> +
> +/**
> + * struct virtio_media_event_error - Unrecoverable device-side error.
> + * @hdr: header for the event.
> + * @errno: error code describing the kind of error that occurred.
> + * @__reserved: must be set to zero by the device.
> + *
> + * Upon receiving this event, the session mentioned in the header is con=
sidered
> + * corrupted and closed.
> + */
> +struct virtio_media_event_error {
> +       struct virtio_media_event_header hdr;
> +       __le32 errno;
> +       __le32 __reserved;
> +};
> +
> +/* This is set to VIDEO_MAX_PLANES defined in include/uapi/linux/videode=
v2.h.
> + * It is renamed here to match the constant that is defined in the virti=
o-media
> + * specification.
> + */
> +#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
> +
> +/**
> + * struct virtio_media_event_dqbuf - Dequeued buffer event.
> + * @hdr: header for the event.
> + * @buffer: &struct v4l2_buffer describing the buffer that has been dequ=
eued.
> + * @planes: plane information for the dequeued buffer.
> + *
> + * This event is used to signal that a buffer is not being used anymore =
by the
> + * device and is returned to the driver.
> + */
> +struct virtio_media_event_dqbuf {
> +       struct virtio_media_event_header hdr;
> +       struct v4l2_buffer buffer;
> +       struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
> +};
> +
> +/**
> + * struct virtio_media_event_event - V4L2 event.
> + * @hdr: header for the event.
> + * @event: description of the event that occurred.
> + *
> + * This event signals that a V4L2 event has been emitted for a session.
> + */
> +struct virtio_media_event_event {
> +       struct virtio_media_event_header hdr;
> +       struct v4l2_event event;
> +};
> +
> +/* Maximum size of an event. We will queue descriptors of this size on t=
he
> + * eventq.
> + */
> +#define VIRTIO_MEDIA_EVENT_MAX_SIZE sizeof(struct virtio_media_event_dqb=
uf)
> +
> +#endif // _UAPI__LINUX_VIRTIO_MEDIA_H
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index ee69dd9d9..df106b5d9 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -37,6 +37,7 @@ no-header-test +=3D linux/usb/audio.h
>  no-header-test +=3D linux/v4l2-mediabus.h
>  no-header-test +=3D linux/v4l2-subdev.h
>  no-header-test +=3D linux/videodev2.h
> +no-header-test +=3D linux/virtio_media.h
>  no-header-test +=3D linux/vm_sockets.h
>  no-header-test +=3D sound/asequencer.h
>  no-header-test +=3D sound/asoc.h
> --
> 2.55.0.1082.g2b9226bbc0-goog
>

