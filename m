Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430384;
	b=hJrW1fh9gUwkK56TJ09GYlhxf+/GYW+TpPc3tKV32OYlCRo7hI3zpCM/WbV+ojDcB8aw
	 N2ogRrkZD28dq6qPyKEu70lrydejm2KpPPEELmZOAp1Pgk1JuS6XQf7cpNjrR1lfcH1zl
	 gIVPuwG09HMplEHOKjccLpwf9zwRfGtI/K8WrkJUfU5DpNaDDWYddnIP3/jIObAkxO3uR
	 t/raKsHMfaatXjdIYWsSUsrotlOFORHBrFMh6i/QZW6iwkxCDLQWSerBKcCNt9pqOEPP+
	 J0aprpW/s6FMNjb8vEeqyKgdoGGeUk7wPrsLYwaEGnefU5dzeDV5Jaa6LJiO6+KR7nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430384;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kuf8fmDgxDr3JyXYZnu3k9WLBwofHk3/d/D7dViPaT8=;
	b=gg3A0gNM907xf6gq8QS+MYkBRx8xF79Ij2mZVMgZlxaSTbAdQ+shg1ph4yWHg1Qga9qP
	 8tatu/2cH7CW363/00dbp/GIw062SXS5UbCqwmeaS06gzMg0YD/rho5TOQEt7ogfL1w8g
	 L8sOEiccm7xwWsgAAyCKmlhqMYQUJJU5eL2wFLPNaO+4kr3sBAGismlpSPz95PdX2SZId
	 EuFeuRBZ/VCz50wZD1hevf/71IZXPnH9pzzr46r2F0PTmliYiRV7IwnXdfWoWaL5VeuLH
	 ihqmNCzAL7X4hrWecJ/348ku+b5U17DcYwEXtqF5bLKioGSyqnlJSXgM+rVh8S9N7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="MqLK3+0/";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995C3606A31A;
	Mon, 23 Nov 2026 10:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MqLK3+0/
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13628177;
	Mon, 23 Nov 2026 11:37:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795430230;
	bh=z83Er38DfHX/dIcXcj3NEmOSBpL2e1SxGTjIG+PecGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqLK3+0/8USVxOQR3mPJH6hLUxVmdNTeaGMcZ3JbSRSDuylkuSz0Ftba3RoE9N6hL
	 vp22JVgz0UVdSGmoUSxA6OocL40TSlFUVFj8DfkB9E3JgLzjqrHPrIbf+It0SUxj6d
	 INspm0O3d6fmhlpd9aeRfeqWk1ROvzW25oXSy0jE=
Date: Mon, 23 Nov 2026 12:39:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Parmjot Singh <parmjotsinghrobot@gmail.com>,
	linux-media@vger.kernel.org, hansg@kernel.org, mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: delay HP True Vision 5MP
 isochronous start
Message-ID: <20261123103940.GA3010398@killaraus.ideasonboard.com>
References: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
 <20261122060309.105714-3-parmjotsinghrobot@gmail.com>
 <CANiDSCuE=WOpDFqVtM2wXue5TDqvQgg6OeHZXfv_Bvzf2QmCDw@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuE=WOpDFqVtM2wXue5TDqvQgg6OeHZXfv_Bvzf2QmCDw@mail.gmail.com>

On Mon, Nov 23, 2026 at 11:30:28AM +0100, Ricardo Ribalda wrote:
> Hi Parmjot
> 
> Could you provide the whole USB descriptor of the device
> lsusb -v -d 04f2:b767
> 
> Is it a internal camera (it looks so based on the name) if it is not,
> could you try connecting it to USB2 hub?
> 
> On Sun, 22 Nov 2026 at 07:05, Parmjot Singh <parmjotsinghrobot@gmail.com> wrote:
> >
> > The HP True Vision 5MP Camera (04f2:b767, revision 0.05) accepts
> > COMMIT and SET_INTERFACE, then may disconnect shortly after starting
> > isochronous transfers. A 350 ms pause between SET_INTERFACE and the
> > first video URB allowed color streaming in MJPEG and YUYV modes.
> >
> > Add a per-device isochronous startup delay and apply it to the color
> > interface.
> >
> > On Arch Linux 7.2.14, FFmpeg decoded 90 frames each in 720p MJPEG,
> > 640x480 YUYV and 2592x1944 MJPEG, plus 300 frames after a 720p
> > restart. The infrared stream still disconnected during the delay
> > experiment, before the first video URB was submitted.
> >
> > OpenAI Codex (GPT-6.2 Sol) helped design and analyze the USB timing
> > experiment and write the driver change.
> >
> > Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>
> >
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
> >  drivers/media/usb/uvc/uvc_video.c  |  4 ++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >  3 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 99c28991b..cfc626a15 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2754,6 +2754,20 @@ static const struct usb_device_id uvc_ids[] = {
> >           .bInterfaceSubClass   = 1,
> >           .bInterfaceProtocol   = 0,
> >           .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
> > +       /* HP True Vision 5MP Camera (color) */
> > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO
> > +                               | USB_DEVICE_ID_MATCH_INT_NUMBER,
> 
> Why dont you add this to the previous quirk instead of adding a new fied?
> 
> We usually do not need to match int number.
> 
> > +         .idVendor             = 0x04f2,
> > +         .idProduct            = 0xb767,
> > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   = 1,
> > +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > +         .bInterfaceNumber     = 0,
> > +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > +               .quirks = UVC_QUIRK_PROBE_DEF,
> > +               .isoc_start_delay_ms = 350,
> > +         } },
> >         /* HP True Vision 5MP Camera */
> >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index a92a986ab..e20330998 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -6,6 +6,7 @@
> >   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> >   */
> >
> > +#include <linux/delay.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/highmem.h>
> >  #include <linux/kernel.h>
> > @@ -2103,6 +2104,9 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
> >                 if (ret < 0)
> >                         return ret;
> >
> > +               if (stream->dev->info->isoc_start_delay_ms)
> > +                       msleep(stream->dev->info->isoc_start_delay_ms);
> > +
> >                 ret = uvc_init_video_isoc(stream, best_ep, gfp_flags);
> >         } else {
> >                 /* Bulk endpoint, proceed to URB initialization. */
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index af8cef94f..eb949c6d8 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -545,6 +545,7 @@ struct uvc_device_info {
> >         u32     quirks;
> >         u32     meta_format;
> >         u16     uvc_version;
> > +       u16     isoc_start_delay_ms;

Adding a new type of quirk requires a root cause analysis.

> >  };
> >
> >  struct uvc_rect {

-- 
Regards,

Laurent Pinchart
