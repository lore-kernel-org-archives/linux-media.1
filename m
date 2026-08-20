Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE736212F
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242199; cv=pass; b=POYthDjE9SDygQ4RO5REJBGYn3cjW+xsorXp7oKpThA0p4ZSUlD2VuBwGUAOj2/barinDmWOPjvPUuZcSUtBHWjN3Ulz9xrgifWcXFJusZKYuPve76+40ubcjnuNkGgS1nntL882TxycVXnpxYIfSzPcNo/JjRXv7sRCWBPDCnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242199; c=relaxed/simple;
	bh=Y6RPEM1Blku2Dyj4+uza45Nl5+NM/PUL0D825PFBkV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXuPpohrDDpRc1J46OdMlJPxWq33HPvM16zHj25ADZs20QsAoPwWjjtiKyUo6c2NGh5RxEeNzWrH4GYIBWdjFzDLd4jd3rawzI5MRu9iX3yusRNkpPDObFKW7f/ZXEZoTIPCEwzvy/GaK8SpysuZ+mR4+A9fvnwW+0yKl+aQ9rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=2IHsiV1U; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="2IHsiV1U"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-836eac5682bso24347337b3.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787242194; cv=none;
        d=google.com; s=arc-20260327;
        b=F/gHePwkdp2i9EGlG/RS+VVH9JVll98sxFBIwiduMild2TyFm52X2JaQIEcCxxg39B
         STQpKPzl3YJPQnBMivY6koPBKTVIktm5yctS0QOMD3Gz5lsgYnaKXVUJb5oj9h06sZG4
         oFjVMyOx3ZcQaIqQfk+yLYH37fW3G7e9hPUmKA+RpDQMrtW8Qu4NBOvA65xNMiB59ZAm
         n2j7nIm1TTyHKNGnFLcbcoOqAOwNLIUkwflI8scrqRxjS0zoGDsz2mrjvEGuvWB/UH0X
         8ELTsjKeRZI0XcCimC4qVoMCrp5vbvStwXoOxb3xhw53VSTzSXPQ/f8dSl9k4zYEvvi9
         /lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7vzOjfOc6pSb8Ngj/YAUTx3eiRQtNgqHkaD4GObEGL0=;
        fh=iX9BeXQi+pyvoiL+lKp4bU2kX/mUKy0V5HKW+8nZ5/k=;
        b=R3ytz4UmzHcV2DYImuSaGa4NUS2u93eIpQxFftW/Wm4DvtAsjSsedLfXMZ5CFESZh2
         T5WNTINyIytP7Zt+CWHl+t2/0T9FERDjEyLDQAdZXSKnehIXFDwzsz/ZSX/mdLTiFu7e
         UCiYGl7TAEYI+czycWKOo35HB8I3YcBWDLH1Rb/7wAuLQ0IZAj91d934/SVY8MLKMiFC
         ZZY/FCCTfLUd1tuPR2g+J0ZTa2MBziFejBF0LHq8XVbeYPsPvOtPXR5bjCzwxb4An5qt
         91x8lTNc7AJq8gzMkUWMSP+QVctKC2yz/Fp8Cwn7aTTyi/MMxTqgsIGgawwAgjmc5fHw
         rTQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1787242194; x=1787846994; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vzOjfOc6pSb8Ngj/YAUTx3eiRQtNgqHkaD4GObEGL0=;
        b=2IHsiV1UIXfPmSryqZDB6G4JN4zIrGqcqv8Our5pFx4zQ08pAaCMTZIItczC6udPB7
         /3JhPpHLiIaap7RU99z7o5YiELPheHGtME81zaUaNDVadQS92cKsM6p+jn9X0kEj5JJO
         hW918HXTvZxqXeVGbVActYbEfx5VatvpF7rCPCi1bjs4Fxh/Mzvk/yTi+tBLMurZAE9N
         gagyyknIsN4FTFPcIKxWim0MmZUPHagg91WuRFRCyeLg3CIdRix7BeEMj1xNt6bbE+Op
         7d+mP73U0L8ttKMKgblfIkbKvzBtYVBNpfFCh/OW4WyaBLQzHvEGtgDj6CcfZv38Wfiy
         /YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787242194; x=1787846994;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vzOjfOc6pSb8Ngj/YAUTx3eiRQtNgqHkaD4GObEGL0=;
        b=oc3AmblMCYjpx4F2HtBpMEQuHPCxuwDqBDT0Vaf9rMi7HUV43blIPXNueF46W6HYap
         F5DWGIwQ6xBRMQ3fys0E85NGc8N3nLba4H7UY4IR+1icJUN8qxPcPn7AURX92T+7QQBY
         iHbKTP27Fsq+iaOQm+Rfje+vALVk6pmBNQMERadWN3RX8J9hcvqfUAFUIjmzW5vQs9ky
         tCIo6AlocMONyFgtwxJ+ZtnhtGQoKlVtrGbP01KX4YtUOvfokWasaBa9TAsF/GoVN1py
         +V2exvlqzEXqU37XseTkuCGmki3JAx1NsCw+qCnGHyMZo24babns+ioi+sz+7CeaUW3s
         yp8A==
X-Forwarded-Encrypted: i=1; AHgh+Rog2hhtvySYiuSYm3b2aFJIf3gVFVWptaxHZVpjdt4O4nbGq+U5cbR9nzpPXxdFons+LSgsidRvUevksg==@vger.kernel.org
X-Gm-Message-State: AFuF++ldL0MGdSoxQ71zvthGIMDwh8tn6NY+if7yv3yoBXtQPTl8rSnM
	jDHI25Qtu28BYbaoYHphV8wEAYEgwrROvi5wIdfErP+A1j+Rc/eGxFziYwN2L8FHM5IlfxZ7uqt
	oFdprMeD3FXEqul99o21Saitmi2bEdxOU+4M7ZQN0eg==
X-Gm-Gg: AR+sD119ZW4GqwzYqwTgJFhfQ54680gUJu22Wis0ScIN63QtUNooMgtFobuX4FDlj4Z
	VLHWtiy094qdtmOywt9qPC0Y13tGgLg1iSVQ11mBy/+k60Fz6a7Yl6QzX9DJAmJy9SWOSRhWpxM
	bpTld9cBGH/PVRFXF2OByPKu10VaQiI/ckd00pk06Yb0AGrTSAlbDYNNvRZYhQ37eyMs2go9DtG
	Sc/1TiWmoRJ38nzAAcenh74ElwBIlnCE92+Xm7FX0l4/1gE45VVKbw9h5J9bUFiRX2ixW4JnvYO
	AVONZ33ZQTv+VuvpqFBB9W5Qat88LH6Tw005ufk+C44=
X-Received: by 2002:a05:690c:368d:b0:81e:bc7a:df50 with SMTP id
 00721157ae682-847073bfb74mr30025847b3.3.1787242194117; Thu, 20 Aug 2026
 09:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
Reply-To: jc@kynesim.co.uk
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 20 Aug 2026 17:09:41 +0100
X-Gm-Features: AcwNN1VgmVOYcrk7bMwBzs9TxTriEzLAFAfw5e5S7lqbNmSbT0-zJcMx5yXZZGg
Message-ID: <CAFyCYyMC-j+9CxyJ+POOC55eHsv7cB9jKogpLF5KVv6TZouFcg@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] media: Add support for multi-context operations
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

>
> Modern ISPs are designed to handle multiple "streams" of data, not necessarily
> related to the same image or video stream.
>
> The hardware resources are generally time-multiplexed between different
> execution contexts at the hardware or firmware level and in order to operate the
> ISP with multiple video sources it is necessary for drivers to keep track of
> per-context data and resources.
>
> In V4L2 the M2M framework supports multiple contexts through multiple opens of
> the same video device. This doesn't however support drivers exposing multiple
> video devices and sub-devices. Several out-of-tree drivers implement
> multi-context support by registering multiple 'logical' instances of the same
> media graph, one for each context. This effectively multiplies the number of
> video device nodes and subdevice nodes. Userspace applications open one media
> graph instance and operate on the corresponding video devices, under the
> impression of dealing with a dedicated instance of the sole underlying hardware
> resource.
>
> This solution is however a short term hack, it doesn't scale well when the
> number of contexts grow. ISPs such as the Mali C55 have been designed to process
> 8 cameras concurrently, and other ISPs may do more.
>
> For this reason, a solution to expose and manage multiple execution contexts
> without duplicating the number of media, video and sub-devices registered to
> userspace is needed to improve support for multi-context devices in V4L2.
>
> The series enables userspace to multiplex the usage of a media device and of
> video devices without duplicating the number of devnodes in userspace, by
> introducing the following concept in the framework:
>
> - Media Device Context: a context created at media-device open time and stored
>   in the media-fh file handle. To a media device context is associated a list
>   of media entity contexts which are 'bound' to it.
>
> - Video Device Context: represents an isolated execution context of a
>   video device. By storing the data and the configuration of a video
>   device userspace is allowed to effectively multiplex the usage of a
>   device node.
>
> - Video Subdevice Context: represents an isolated execution context of
>   v4l2 subdevice. It stores that subdev state which is now available in
>   three locations:
>   - in the file handle: for TRY formats
>   - in the subdevice: for ACTIVE formats to support operations of subdevices
>     drivers that do not implement context support
>   - in the subdevice default context: for ACTIVE formats to support
>     operations of subdevice drivers that implement context support and
>     are operated by non-context-aware userspace
>   - in the subdevice file-handle context: for ACTIVE formats to support
>     operations of subdevices drivers that implement context support and
>     are  bound to a media device context
>
>   Both the Video Device Context and the V4L2 Subdevice
>   Context extend the Media Entity Context base type so that the MC and
>   V4L2 layers are kept independent one from each other.
>
> - A Video Device Context is created by a new ioctl VIDIOC_BIND_CONTEXT and is
>   stored in the v4l2-fh file handle.
>
> - A V4L2 Subdevice context is created by a new ioctl
>   VIDIOC_SUBDEV_BIND_CONTEXT and is stored in the v4l2_subdev_fh file
>   handle.
>
>   The VIDIOC_BIND_CONTEXT and VIDIOC_SUBDEV_BIND_CONTEXT ioctls associates a
>   Video/Subdevice Context to a Media Device Context. By binding a set of video
>   devices and subdevices to a media device context userspace can create several
>   isolated 'execution contexts' which can be operated independently one from
>   each other.
>
> - A V4L2 Video Device and V4L2 Subdevice default context is made
>   created to allow drivers that implement multi-context support but are
>   operated by userspace that is not context aware (IOW doesn't call
>   VIDIOC_BIND_CONTEXT).
>
> The first 20 patches implement the above described changes in the
> framework:
>
>   media: v4l2-subdev: Validate media links with context
>   media: mc-entity: Add link_validate_context
>   media: media-entity: Support context in pipeline_start
>   media: v4l2-subdev: Get state from context
>   media: v4l2-subdev: Add subdev state accessor helpers
>   media: v4l2_subdev: Introduce default context
>   media: Documentation: Add VIDIOC_SUBDEV_BIND_CONTEXT
>   media: v4l2-subdv: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
>   media: v4l2-subdev: Introduce v4l2 subdev context
>   media: videobuf2-v4l2: Support vb2_queue embedded in a context
>   media: v4l2-dev: Add video_device_context_from_queue()
>   media: v4l2-dev: Add video_device_context_from_file()
>   media: Introduce default contexts
>   media: v4l2-dev: Documentation: Add VIDIOC_BIND_CONTEXT
>   media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
>   media: v4l2-dev: Introduce video device context
>   media: media-device: Introduce media device context
>   media: media-entity: Introduce media_entity_context
>   media: mc: Maintain a list of open file handles in a media device
>   media: mc: Add per-file-handle data support
>
> For testing the implementation I used a Raspberry Pi5, implementing
> support for multiple contexts in the ISP driver. The PiSP BE driver
> however only implements video devices, as the single ISP subdev is not
> exposed to userspace and doesn't require any configuration. To test the
> V4L2 subdev context operations I had to first expose the ISP subdev to
> userspace and implement link validation and pipeline allocation for it.
> This is implemented in the following 6 patches NOT FOR INCLUSION in
> mainline but just here for reference
>
>  [DNI] media: pisp_be: Register devnode to userspace
>  [DNI] media: pisp_be: Implement link validation
>  [DNI] media: pisp_be: Implement set/get_pad_fmt
>  [DNI] media: pisp_be: Add support for subdev state
>  [DNI] media: pisp_be: Start and stop the media pipeline
>
> Finally, the last patch (again NOT FOR INCLUSION) ports the ISP driver
> to support multi-context operations and provides a reference for the
> multi-context API usage by drivers:
>
>  [DNI] media: pisp_be: Add support for multi-context
>
> The multi-context support has been tested with a version of libcamera
> that binds all video devices and the ISP subdevice in an execution
> context and allows to stream two cameras at the same time using the same
> media graph.
>
> In order to validate the fact that introducing context support in
> drivers doesn't break existing userspace which is not context-aware,
> capturing from a single camera with [mainline libcamera + ISP subdev
> configuration] has been tested as well.
>
> CI pipeline:
> - https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1472617
> - checkpatch errors are due to "DNI" prefix in last patches
> - static check errors seems unrelated to this set of patches but to
>   existing code
> - checkpatch error are due to the usage of "Generic" which checkpatch
>   doesn't like
>
> Branch for testing:
> - kernel patches:
>   https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/multicontext/mainline/2025
> - libcamera multi-context:
>   https://git.libcamera.org/libcamera/jmondi/libcamera.git/log/?h=multicontext/rpi/mc
> - libcamera single context:
>   https://git.libcamera.org/libcamera/jmondi/libcamera.git/log/?h=multicontext/rpi/subdev-no-multi-context
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Changes in v2:
> - Add "media: uapi: Add 'flags' to media_device_info"
> - Fix robots complaints by protecting users of symbols only defined if
>   CONFIG_MEDIA_CONTROLLER with pre-processor guards
> - Link to v1: https://lore.kernel.org/r/20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com
>
> rfc->v1 Compared to the RFC version sent in September 2024:
>   - Implement support for V4L2 Subdevice context
>   - Implement context-aware pipeline start and link validation
>   - Break out from Sakari's media lifetime series the only 2 required
>     patches that introduce media_device_fh
>   - Test the BE ISP subdevice by implementing support for the ISP
>     subdevice in the BE driver
>
> ---
> Jacopo Mondi (25):
>       media: media-entity: Introduce media_entity_context
>       media: media-device: Introduce media device context
>       media: v4l2-dev: Introduce video device context
>       media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
>       media: Documentation: Add VIDIOC_BIND_CONTEXT
>       media: v4l2-dev: Introduce default contexts
>       media: v4l2-dev: Add video_device_context_from_file()
>       media: v4l2-dev: Add video_device_context_from_queue()
>       media: videobuf2-v4l2: Support vb2_queue embedded in a context
>       media: v4l2-subdev: Introduce v4l2 subdev context
>       media: v4l2-subdev: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
>       media: Documentation: Add VIDIOC_SUBDEV_BIND_CONTEXT
>       media: v4l2_subdev: Introduce default context
>       media: v4l2-subdev: Add subdev state accessor helpers
>       media: v4l2-subdev: Get state from context
>       media: media-entity: Support context in pipeline_start
>       media: mc-entity: Add link_validate_context
>       media: v4l2-subdev: Validate media links with context
>       media: uapi: Add 'flags' to media_device_info
>       [DNI] media: pisp_be: Start and stop the media pipeline
>       [DNI] media: pisp_be: Add support for subdev state
>       [DNI] media: pisp_be: Implement set/get_pad_fmt
>       [DNI] media: pisp_be: Implement link validation
>       [DNI] media: pisp_be: Register devnode to userspace
>       [DNI] media: pisp_be: Add support for multi-context
>
> Laurent Pinchart (1):
>       media: mc: Add per-file-handle data support
>
> Sakari Ailus (1):
>       media: mc: Maintain a list of open file handles in a media device
>
>  .../media/mediactl/media-ioc-device-info.rst       |   6 +-
>  .../userspace-api/media/mediactl/media-types.rst   |  13 +
>  .../userspace-api/media/v4l/user-func.rst          |   2 +
>  .../media/v4l/vidioc-bind-context.rst              |  80 +++
>  .../media/v4l/vidioc-subdev-bind-context.rst       |  81 +++
>  drivers/media/common/videobuf2/videobuf2-v4l2.c    | 139 ++--
>  drivers/media/mc/mc-device.c                       | 213 +++++-
>  drivers/media/mc/mc-devnode.c                      |  20 +-
>  drivers/media/mc/mc-entity.c                       | 220 +++++-
>  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 775 ++++++++++++++++-----
>  drivers/media/v4l2-core/v4l2-dev.c                 | 158 ++++-
>  drivers/media/v4l2-core/v4l2-device.c              |  11 +-
>  drivers/media/v4l2-core/v4l2-fh.c                  |   1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  72 ++
>  drivers/media/v4l2-core/v4l2-subdev.c              | 414 ++++++++++-
>  include/media/media-device.h                       | 230 ++++++
>  include/media/media-devnode.h                      |  21 +-
>  include/media/media-entity.h                       | 163 ++++-
>  include/media/media-fh.h                           |  37 +
>  include/media/v4l2-dev.h                           | 252 +++++++
>  include/media/v4l2-fh.h                            |   3 +
>  include/media/v4l2-ioctl.h                         |   7 +
>  include/media/v4l2-subdev.h                        | 293 ++++++--
>  include/uapi/linux/media.h                         |   6 +-
>  include/uapi/linux/v4l2-subdev.h                   |  11 +
>  include/uapi/linux/videodev2.h                     |  11 +
>  26 files changed, 2890 insertions(+), 349 deletions(-)
> ---
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> change-id: 20250716-multicontext-mainline-2025-3479c7c24b7a
>
> Best regards,
> --
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks for this patchset - I've been writing a driver (not ready for upstreaming
for several reasons), and it works well to enable processing several streams
at once. I would be interested in seeing it finished. I have however spotted
a number of issues which I will address against the relevant patches.

Regards

John Cox
