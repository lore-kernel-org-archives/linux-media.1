Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337BC3DE457
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169350; cv=none; b=hvH/H8mlbPIewtGGMpKrSCcP6wPMQPzxKH005rs5JfBkspOUVMh1JoRolrN3DGCTkDMw6ea52crjIbj71ZB9fdiXSzvF2zv4Xt229cjFA9fTVp/9i5r0EVpM0tKiFyPRpAHd4nTHs4VhrSWhKaAzbr/BBwa2TXPcPGC+2dM2wQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169350; c=relaxed/simple;
	bh=U5LnSUi2wHrcwYVfC75cSRN0FRvvdDzaxePvnYHJ/p4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFOvNJo0mpP2Fqm1LwQPoHKH+1jtTn5hrLB7Xvx1wP9Z183ZKiRub1AtHSXK3W69/SIt4iw074LPtj8rr5+OH5r4Ny3QIyV/6C5zLdKxBMqJKI45TXbv7cB842DILKSJOHuC7d2HhhrFdvKrgIubVYZYQXvhR7zrCMLV3fY177Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SRvU8vWp; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SRvU8vWp"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2124003a12.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788169348; x=1788774148; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Z2gWPFgv4n4jgrujxRMEWPQXnpDvopS8YwK5e2Ug0I=;
        b=SRvU8vWpZvIo9BDzYMY1ZEoHDnGOdgd0tp89lj+ENEOvypGq7cvunePp1Jrjh9i+vM
         P2Q7KKTslZwVdcjhuqdEfbgUENpPI0aWVuyZfd1o8hqPVY4ElzPYuD2dxt1WZ/PjeKCc
         hINQtBhKPQhWDzBVT4SVK0ZYGDA1df7h6zVaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169348; x=1788774148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Z2gWPFgv4n4jgrujxRMEWPQXnpDvopS8YwK5e2Ug0I=;
        b=PusQ6Vd9C6ZlvJCqdwm+WIgwfbHpzU6ohlMjptXxc86GOpFi/HoVgetewn3SaHWr3+
         j0KeSuXj4FiJQUkhm2nTQYCiAIfP871TlkcqIztae2LzhneOQpy0QyhUt7Er085+21WU
         bziuONsoqB4kgCgidYbCNME+oMiIgjRQC4ND+WHM5EN6kcDXh7mdZRXtbPiNPpoJd5ds
         fJloUpGlwhtn7Zx5OcaIdFSl0vwIrZdbe5psdHHUQRzf0tckwbjyNNALZv9XH7bg4Wtt
         z2HK2tSC/+HVBtcziIiEM+41geDGGZ9KqvGIGiM8QzrX/HSKK6OzymsGwujVKZKijhk5
         cynw==
X-Forwarded-Encrypted: i=1; AHgh+RrH5PdAeerofHZD9/B5gowHKZzCwu7ZpsAdgyW9fqMeC47BbOZwd27JsSrW+Lrh+29tvPySNk124eot4Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kq5qKZXdkIA5fHQhntGOOJRSidMxk1lNhTyrPYOQMGrHaACNrU
	j1Pwy8vmZXQskiuikVvVdJottbjEl8YacfNwHty2JdZA2ZGNdV3RN8gCTOX8jKJGuk/PdLsgu2a
	fyw/9q+x8
X-Gm-Gg: AR+sD10PmsfZY4HS1CM6tWkNkb02M3XHsNkrkD+T9wCzAYdnQpigIsBRvs7FjEnmlyl
	pWm5eHHJzSOfmEqLFoB2VGVsQkUUOZfq1mkA7AlwgNZVHdte1vxY4B7xXMll2ttlDzCexurASGI
	9WUJ2REC1l2SpGezlyqWhMzEc7p8HhjCapHiUX8NyzI7ALYGB2mt0EXXz3DHt4+Qt/pUKq4W2et
	5zb2ffdZNfxV28njPr54vupb3sfmic+WMOPjBMDctX4l7M6yIY1qm6+KIaqA/00q4vFqoGvG5lv
	M+6gMX+989KNc7qBnEioTJ4G1NVmDHQeutR+4I8uVHUWMvgFbbTtitsQxMWL5zspQhamyPoAn9e
	smFgQkVGr74liwsz4u4beO03K5IvhheoG7vLhgJu99HVxpGxfVjbQYmq+TVCRDvgcr3OAvcNpNN
	prSMa0l4oCsTsI3fmI7CBL2MvtmT94PUPBFaPcIoN+s+wEt00qqw5qXvIq4aZwEKT0hqpVaBZbq
	s6Jac6g1Wl9CoLnBIJ+vcGewHAZXIoXDtsc
X-Received: by 2002:a05:6a21:7a9c:b0:3d3:ae1f:d7f3 with SMTP id adf61e73a8af0-3d3ae2013b3mr24951434637.19.1788169348157;
        Mon, 31 Aug 2026 02:42:28 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36ea9d8sm3937889a12.27.2026.08.31.02.42.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:42:27 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2625171a91.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:42:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzo5HSqWkJCW9VLK63HJNS7BLzaqTMJx3UJv583N0ddzk7XOEpOpW11zAST4D6o6zVBdOcS+F93DTi1IQ==@vger.kernel.org
X-Received: by 2002:a17:90b:4acf:b0:398:b17b:3bd2 with SMTP id
 98e67ed59e1d1-398b17b3dd4mr18739337a91.4.1788169346536; Mon, 31 Aug 2026
 02:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828152557.653475-1-jordan.mymail@gmail.com>
 <20260828152557.653475-4-jordan.mymail@gmail.com> <CANiDSCsL0kffzysq-9ttk_po6T1uYA5+JwDriMbdD62K1zZQLw@mail.gmail.com>
In-Reply-To: <CANiDSCsL0kffzysq-9ttk_po6T1uYA5+JwDriMbdD62K1zZQLw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:42:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCufacRzHcKaotop47qz+0rFXixLM3u5pgNzfWJDzR86BQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vd-cihvDm2lWbx8kHE9zY6JVweyDZTTIEunkYzDBe1rdUhZu2BUfCihls
Message-ID: <CANiDSCufacRzHcKaotop47qz+0rFXixLM3u5pgNzfWJDzR86BQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on OBSBOT
 Tiny 2 pan/tilt
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi again.

Sashiko [1] has pointed out that there might be other controls that
will benefit from the UVC_CTRL_FLAG_AUTO_UPDATE.

Can you double check if that is the case? Feel free to add is a v2 or
as a follow-up patch.

Thanks!

[1] https://sashiko.dev/#/patchset/20260828152557.653475-1-jordan.mymail%40gmail.com

On Mon, 31 Aug 2026 at 11:40, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Michael
>
> Thanks for the patch, and for contacting the vendor.
> Could you reply to this patch with the full output of lsusb -v instead
> of a cropped one?
>
> We keep that info for future reference.
>
> Thanks!
>
> On Fri, 28 Aug 2026 at 17:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
> >
> > The OBSBOT Tiny 2 (3564:fef8) answers GET_INFO for CT_PANTILT_ABSOLUTE
> > (entity 1, selector 0x0d) with 0x03 -- GET and SET capable, but with the
> > AUTOUPDATE bit clear. It returns the same 0x03 for every Camera Terminal
> > control queried, so the firmware is not computing the byte per control.
> > uvc_ctrl_get_flags() takes the flags from that byte, so it clears the
> > UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entry sets for
> > this control. Without AUTO_UPDATE nothing clears ctrl->loaded after the
> > first read, so uvcvideo serves the control from its cache indefinitely:
> > VIDIOC_G_CTRL returns the last value the host commanded, never the
> > actuator's live position. On a motorised PTZ camera the position keeps
> > changing during a move, and changes on its own under the camera's
> > autonomous subject tracking, so userspace cannot observe it at all.
> >
> > Add a flags fixup entry restoring AUTO_UPDATE, alongside the flags the
> > control already has, for this camera's pan/tilt control. With
> > AUTO_UPDATE restored, the rollback at the end of every
> > VIDIOC_G_EXT_CTRLS runs uvc_ctrl_commit_entity(), which clears
> > ctrl->loaded, so the next read re-queries the device and reports the
> > live position. The fixup replaces info->flags wholesale rather than
> > OR-ing, so the entry spells out the full flag set for the control.
> >
> > Tested on an OBSBOT Tiny 2: without this, a read taken while the gimbal
> > is moving (or after the gimbal is moved by hand) returns a stale value;
> > with it, VIDIOC_G_EXT_CTRLS tracks the physical position on both axes.
> >
> > The vendor has been asked to fix the firmware (support ticket #8220,
> > 2026-08-04); no fix is available at the time of writing.
> >
> > lsusb -v (device descriptor and the Camera Terminal):
> >
> >   Bus 003 Device 006: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
> >   Device Descriptor:
> >     bLength                18
> >     bDescriptorType         1
> >     bcdUSB               2.10
> >     bDeviceClass          239 Miscellaneous Device
> >     bDeviceSubClass         2 [unknown]
> >     bDeviceProtocol         1 Interface Association
> >     bMaxPacketSize0        64
> >     idVendor           0x3564 Remo Tech Co., Ltd.
> >     idProduct          0xfef8 OBSBOT Tiny 2
> >     bcdDevice            4.09
> >     iManufacturer           1 Remo Tech Co., Ltd.
> >     iProduct                2 OBSBOT Tiny 2
> >     iSerial                 0
> >     bNumConfigurations      1
> >   [...]
> >         VideoControl Interface Descriptor:
> >           bLength                18
> >           bDescriptorType        36
> >           bDescriptorSubtype      2 (INPUT_TERMINAL)
> >           bTerminalID             1
> >           wTerminalType      0x0201 Camera Sensor
> >           bAssocTerminal          0
> >           iTerminal               0
> >           wObjectiveFocalLengthMin      0
> >           wObjectiveFocalLengthMax      0
> >           wOcularFocalLength            0
> >           bControlSize                  3
> >           bmControls           0x00023e3e
> >             Auto-Exposure Mode
> >             Auto-Exposure Priority
> >             Exposure Time (Absolute)
> >             Exposure Time (Relative)
> >             Focus (Absolute)
> >             Zoom (Absolute)
> >             Zoom (Relative)
> >             PanTilt (Absolute)
> >             PanTilt (Relative)
> >             Roll (Absolute)
> >             Focus, Auto
> >
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index b16a5cc0d..379ee51bd 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2876,6 +2876,15 @@ static void uvc_ctrl_fixup_flags(struct uvc_device *dev,
> >                         UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> >                         UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> >                         UVC_CTRL_FLAG_AUTO_UPDATE },
> > +               /*
> > +                * OBSBOT Tiny 2: GET_INFO on CT_PANTILT_ABSOLUTE_CONTROL is a
> > +                * stub that reports GET|SET only, clearing the AUTO_UPDATE the
> > +                * driver's own control table sets for this control.
> > +                */
> > +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> > +                       UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> > +                       UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> > +                       UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
> >         };
> >
> >         unsigned int i;
> > --
> > 2.43.0
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
