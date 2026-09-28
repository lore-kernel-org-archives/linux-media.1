Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2485A4BD782
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601758; cv=none; b=djcA76c85d+qatM+Bq7Q8dVmS6AaGFM/5AL0Ed4vklbRoLWzWWz0c0Ak4bEPV425Gx+oPmCo9vtTlE0p8JiMLDbXKldEBDnrHrxZH79TUefjbRb4hyZrD+eBTS7heKjYCvcD9SsXxGFpbZGclxOtQ7Ud+eKE4QHCfGAEQyJkyB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601758; c=relaxed/simple;
	bh=E1+5UqElEpQ5P+0984SRmM5eJBgCjPMCC5ACMcP2rVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGjBAlJX0PSmtLlthnzuz6kwWQEhMd5OnVO7fM9pq3MHfsfTI7hzsF/O1zyo0W0/Oby7Wy1Pf7mrHezDjWSfkCqVsNSB6ItOIhIaqiGTYxjNaekfdjhRjYEegk34aVtkW0RmM3hyrqAFfki9OVcNkCZuUwq6/xtqh+wgMuM7x94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T96lA88M; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T96lA88M"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso1627309a12.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790601755; x=1791206555; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RPcRKGYr1XZHwGm79pP3hdZM5YXoo/M6t9gIRk53wQ=;
        b=T96lA88MvPoDgUMaV/YKVht+sjae4+kUJZqCnEqpvXGGLCY3UrQGtvW01nDwZBav7/
         JAcFM5lTxFipzvh/N6hxOMdeVsFAz9E8Hqq8t+baHWpyt28MC9wcAD7ubPTFm/8VCp+F
         GL2H3iPgHoHmvqyCbW809D+VFKxJgIHvsJ0ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601755; x=1791206555;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8RPcRKGYr1XZHwGm79pP3hdZM5YXoo/M6t9gIRk53wQ=;
        b=TktKZIyKknUzzXierNsKlkUfMnxryroy91dKXmUT7W7uS4STtHNzEbJcq7Bpdw9FU9
         BBOM/C83g/G9KxCyfWTKI6x2bEZtqrYwL9t9QZ8az6tWSFa2YaShfXIDYC/d0VnDvveZ
         /QgsvkiYmavrtpbyYLWIUUFaVwzsReKdvmq+zWeLiBl5qkHVZIAeMGe8SDyUghhTKaQX
         NexuiYzVXK/U4a2hrS+/LH2dbTnJMrF7UUAXmHrkagDf7Uoz4oO5VbjDkwMEIix8smQS
         xjL9X6B9ZIIQZGxvhg/Sf9hLTYwZj0H1Dx1hOkdHPYgMevPIF298P/J1L7KKR7HFG+K5
         yjhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzrk5ySFc7xLNxNsuzNoiXIeYkCbD2hfIGL2BToiQu/s+XWIBfmp2HLOEynoKFt/yAybA5+CZIDLorjA==@vger.kernel.org
X-Gm-Message-State: AFuF++nL2sPIIpcu8+SVnIdgnN1MGb/uu8FCAeeN+MWktHh4wDOoDxdZ
	m5zrHYNDhhrFNcadnZ7xPy2EPihm+6Nfmn+iLDQ1d6ph0fYnjnRj2YQja03mwhhnez7qybiD4cW
	PrQs=
X-Gm-Gg: AYBFou3nAPMJCQ7VaDiLiexqS+8DNvkguE1xS3TNriQ2f4PvcYF6Y3ZBYfvGkv6znxS
	9VaTkVGjJWQeloG8Gh5OzxckIrEx66mOcLzPjASTRSZF5GCf/HSZRh3S9auGQfRMW6v8efN2pJz
	UUaKnVaxSwyrqRwjmN7hCyj4AciE2ljql5mFGLoHJ11MrRAShJKHT/11r1YVQqloY0Zk7r1kxf6
	4opOW43/RxN78kS8fqFC5mdZa0CzRhkzomxZv6U5cQjbjwsytaqk5INt+fEspoMNXCYFYxSLhOq
	jXSiD72YmP26QHc21ICf17lTFTasK2aqob1nkVEQNXFLNrAdlSuisbzlOv8eivKzUsDW5UxD+U0
	/BUfRfnUrJmyQ7Vm4PALY7fy4yVm9EqPfcrgS5xfcFo6OC+aNlWflBnA6ZX4UmpnFw1iBlt4IvJ
	ys2qs8zPFkaqVD2K2xBw/uGewUJVInBU1zcBO9cHoQWofrQ4FzAVTSIwbDQd6+AcQMJrp6ZPP0o
	HQ/ytDuX9QClXY7QdA2xIld99luf+z4rUKchPX0c4TCFHnK
X-Received: by 2002:a05:6a21:910c:b0:3dd:85a9:55ab with SMTP id adf61e73a8af0-3de26db3402mr8475392637.36.1790601755011;
        Mon, 28 Sep 2026 06:22:35 -0700 (PDT)
Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com. [74.125.229.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feaf8516esm4076582b3a.43.2026.09.28.06.22.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:22:34 -0700 (PDT)
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so2515421c88.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyJTamgWzRVd3+gSj5PS+dPr+rvrjwX2ovt9KvJQPO4Ni6iB+RJs8xxlOZChOcer9W3TgQ8H8OxRfwBg==@vger.kernel.org
X-Received: by 2002:a05:701b:4252:10b0:143:298f:33b6 with SMTP id
 a92af1059eb24-146d096d31fmr9984470c88.46.1790601750263; Mon, 28 Sep 2026
 06:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org> <20260928125242.GE4406@killaraus.ideasonboard.com>
In-Reply-To: <20260928125242.GE4406@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 15:22:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCtb9-LVTuhwdLYdTzNMbrq_TYCjKYOxc5TxhCqaWg2NCQ@mail.gmail.com>
X-Gm-Features: AclHuK8oVZSlYIBQO6ij5u2sY0EUmnZWXqwfIgQBb-dk-zqNmpS46gemuFgKR64
Message-ID: <CANiDSCtb9-LVTuhwdLYdTzNMbrq_TYCjKYOxc5TxhCqaWg2NCQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 14:52, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Sep 11, 2026 at 01:22:27PM +0000, Ricardo Ribalda wrote:
> > Currently, the driver expects that cameras properly implement the spec
> > version that they announce, and if they fail to do so, we do not continue
> > probing the driver.
> >
> > To make drivers more fun, some vendors decided to announce that they are
> > a UVC version that they are not. Until now, we handled those cameras via
> > quirks.
> >
> > Unfortunately, reality has shown us that there are more cameras out
> > there with an invalid uvc_version than we initially predicted.
>
> As far as I understand, this was triggered by the Avermedia GC515. Have
> you received other reports ?

I have not, but we can agree that not that many people does the extra
mile to report to this mailing list.

If multiple cameras, from different ISPs have this issue it makes me
think that Windows is handling this uvc_version more naively than us,
and unfortunately it is what most vendors use to validate their
cameras.

I'd rather support more cameras than fewer.

>
> > This patch tries to handle these cameras with an identity crisis
> > automatically. We still shame them in dmesg. But now they will work.
>
> If the vendors ignored the fact that those cameras didn't work at all on
> Linux, do you think they will read dmesg ?

They wont, but distros might look into logs and keep track of warnings/logs.

>
> Jokes aside, UVC version override was added in November 2020, and the
> Avermedia GC515 is the fourth device we list in nearly 6 years. Let's
> see if there are any drawbacks in the implementation below that can be
> justified by such a small number of devices.
>
> > Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++----
> >  drivers/media/usb/uvc/uvc_video.c  | 40 +++++++++++++++++++++++++-------------
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  3 files changed, 35 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..ca75f8d1ec46 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1169,9 +1169,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >
> >       case UVC_VC_PROCESSING_UNIT:
> >               n = buflen >= 8 ? buffer[7] : 0;
> > -             p = dev->uvc_version >= 0x0110 ? 10 : 9;
> > -
> > -             if (buflen < p + n) {
> > +             if (buflen < 9 + n) {
> >                       uvc_dbg(dev, DESCR,
> >                               "device %d videocontrol interface %d PROCESSING_UNIT error\n",
> >                               udev->devnum, alts->desc.bInterfaceNumber);
> > @@ -1188,7 +1186,12 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >               unit->processing.bControlSize = buffer[7];
> >               unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
> >               memcpy(unit->processing.bmControls, &buffer[8], n);
> > -             if (dev->uvc_version >= 0x0110)
> > +
> > +             /*
> > +              * We are not using bmVideoStandards, so there is no need to
> > +              * warn the user if it is missing.
>
> There's value in warning the user about UVC non-compliance though. I'd
> like to see a warning that indicates the device reports an incorrect UVC
> version.
>
> If I'm not mistaken, the Avermedia GC515 includes the bmVideoStandards
> field. This change is therefore not needed for any devices we know
> about, right ?

We do not know if it includes the bmVideoStandards or not. Wihout
https://lore.kernel.org/linux-media/20260928124109.GF157191@killaraus.ideasonboard.com/T/#t
it might leaking the next control. (this is how I started working on
the other patch).

Luckily for us bmVideoStandards is not used.

>
> > +              */
> > +             if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
> >                       unit->processing.bmVideoStandards = buffer[9+n];
> >
> >               uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 2a3b7431cc68..2f3daa920ffa 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -273,6 +273,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >       }
> >  }
> >
> > +#define UVC_VIDEO_CTRL_MIN_SIZE 26
> > +
> >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> >  {
> >       /*
> > @@ -280,7 +282,7 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> >        * on the protocol version.
> >        */
> >       if (stream->dev->uvc_version < 0x0110)
> > -             return 26;
> > +             return UVC_VIDEO_CTRL_MIN_SIZE;
> >       else if (stream->dev->uvc_version < 0x0150)
> >               return 34;
> >       else
> > @@ -290,7 +292,6 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> >  static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >       struct uvc_streaming_control *ctrl, int probe, u8 query)
> >  {
> > -     u16 size = uvc_video_ctrl_size(stream);
> >       u8 *data;
> >       int ret;
> >
> > @@ -298,13 +299,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >                       query == UVC_GET_DEF)
> >               return -EIO;
> >
> > -     data = kmalloc(size, GFP_KERNEL);
> > +     data = kmalloc(stream->ctrl_size, GFP_KERNEL);
> >       if (data == NULL)
> >               return -ENOMEM;
> >
> >       ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
> >               probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> > -             size, uvc_timeout_param);
> > +             stream->ctrl_size, uvc_timeout_param);
> >
> >       if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
> >               /*
> > @@ -319,7 +320,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >               ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
> >               ret = 0;
> >               goto out;
> > -     } else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
> > +     } else if (query == UVC_GET_DEF && probe == 1 &&
> > +                ret < UVC_VIDEO_CTRL_MIN_SIZE) {
> >               /*
> >                * Many cameras don't support the GET_DEF request on their
> >                * video probe control. Warn once and return, the caller will
> > @@ -330,15 +332,24 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >                       "Enabling workaround.\n");
> >               ret = -EIO;
> >               goto out;
> > -     } else if (ret != size) {
> > +     } else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
> >               dev_err(&stream->intf->dev,
> >                       "Failed to query (%s) UVC %s control : %d (exp. %u).\n",
> >                       uvc_query_name(query), probe ? "probe" : "commit",
> > -                     ret, size);
> > +                     ret, stream->ctrl_size);
> >               ret = (ret == -EPROTO) ? -EPROTO : -EIO;
> >               goto out;
> >       }
> >
> > +     if (ret != stream->ctrl_size) {
> > +             uvc_warn_once(stream->dev, UVC_WARN_CTRL_SIZE,
> > +                           "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
> > +                           uvc_query_name(query),
> > +                           probe ? "probe" : "commit", ret,
> > +                           stream->ctrl_size);
> > +             stream->ctrl_size = ret;
> > +     }
>
> There are two other locations where uvc_version is used:
>
> - In uvc_fixup_video_ctrl() to implement a workaround for pre-1.10
>   devices that don't report dwMaxVideoFrameSize
>
> - In uvc_ctrl_filter_plf_mapping() to stkip the power line frequency
>   control on pre-1.50 devices
>
> None of those are handled in this patch. Furthermore, more usage of
> uvc_version may be needed in the future. This patch seems a bit fragile
> to me in that regard. Could we instead detect the version and update the
> uvc_version field ?

Will send a follow-up to fix dwMaxVideoFrameSize.

uvc_ctrl_filter_plf_mapping properly handes devices with invalid
uvc_version. It automatically probes the control.

I though about parsing the uvc_version, but then I realised that some
devices might implement video_ctrl_size correctly but not filter_plf
(or the other way around).
So I decided that this was better.

>
> Another option, given the small number of affected devices, is to just
> merge 5/5 (as well as 1/5 and 2/5 that are nice small improvements).

I'd argue that 4/5 is also a nice to have.

>
> > +
> >       ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
> >       ctrl->bFormatIndex = data[2];
> >       ctrl->bFrameIndex = data[3];
> > @@ -351,7 +362,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >       ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
> >       ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
> >
> > -     if (size >= 34) {
> > +     if (ret >= 34) {
> >               ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
> >               ctrl->bmFramingInfo = data[30];
> >               ctrl->bPreferedVersion = data[31];
> > @@ -381,11 +392,10 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >  static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> >       struct uvc_streaming_control *ctrl, int probe)
> >  {
> > -     u16 size = uvc_video_ctrl_size(stream);
> >       u8 *data;
> >       int ret;
> >
> > -     data = kzalloc(size, GFP_KERNEL);
> > +     data = kzalloc(stream->ctrl_size, GFP_KERNEL);
> >       if (data == NULL)
> >               return -ENOMEM;
> >
> > @@ -401,7 +411,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> >       put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
> >       put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
> >
> > -     if (size >= 34) {
> > +     if (stream->ctrl_size >= 34) {
> >               put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
> >               data[30] = ctrl->bmFramingInfo;
> >               data[31] = ctrl->bPreferedVersion;
> > @@ -411,11 +421,11 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> >
> >       ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
> >               probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> > -             size, uvc_timeout_param);
> > -     if (ret != size) {
> > +             stream->ctrl_size, uvc_timeout_param);
> > +     if (ret != stream->ctrl_size) {
> >               dev_err(&stream->intf->dev,
> >                       "Failed to set UVC %s control : %d (exp. %u).\n",
> > -                     probe ? "probe" : "commit", ret, size);
> > +                     probe ? "probe" : "commit", ret, stream->ctrl_size);
> >               ret = -EIO;
> >       }
> >
> > @@ -2231,6 +2241,8 @@ int uvc_video_init(struct uvc_streaming *stream)
> >
> >       atomic_set(&stream->active, 0);
> >
> > +     stream->ctrl_size = uvc_video_ctrl_size(stream);
> > +
> >       /*
> >        * Alternate setting 0 should be the default, yet the XBox Live Vision
> >        * Cam (and possibly other devices) crash or otherwise misbehave if
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index abcafd929c9e..8d99e857a69f 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -461,6 +461,7 @@ struct uvc_streaming {
> >       struct usb_interface *intf;
> >       int intfnum;
> >       u32 maxpsize;
> > +     unsigned int ctrl_size;
>
> That should be called video_ctrl_size, ctrl_size is ambiguous.
Ack
>
> >
> >       struct uvc_streaming_header header;
> >       enum v4l2_buf_type type;
> > @@ -662,6 +663,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
> >  #define UVC_WARN_PROBE_DEF   1
> >  #define UVC_WARN_XU_GET_RES  2
> >  #define UVC_WARN_QUERY_CTRL  3
> > +#define UVC_WARN_CTRL_SIZE   4
> >
> >  extern unsigned int uvc_clock_param;
> >  extern unsigned int uvc_no_drop_param;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
