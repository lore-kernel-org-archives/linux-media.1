Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4728C4CA28B
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603822; cv=none; b=H8310o+4nXKW1Sw8+dJw6GvMbaB7s/nh21ubQXOIgr8E4FIIJb6iO2nFp8E2wMIspWuVf71X5Y3/E1sTv4eHlcgT14ROQpe6HblddAlBk6oxPx/jwUZSK9VRxK+4J/mHRBKksP6ArO/+JfcVd2bSwXsbqJm08K4FKiC/j6uG+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603822; c=relaxed/simple;
	bh=hWqYRb69+DCt/qcQluQaaHpw9sjyPbe5mQshuj+4M1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9NS/yVXff/E9qvr+F/m9+isPtbhkqxMik8tBSK+WmBzvWWRFsb1nHDfGHjNxo8i7eYBRYLoRBCRIVrZdqXoMZI7Knrix1V8pJiFeJG0xs0AocCDI11klZv5c656uoSblbMwOZWqSJOHRq5ii0WC5SFD5InW4f1DzlPdfchZ3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PY8F7MxX; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PY8F7MxX"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-882c2bcef77so836623b3a.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790603819; x=1791208619; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crMdnE4crE3wlYwsJ81C9sapH51FewJi/fEzGFJVbvo=;
        b=PY8F7MxXD5imXIxzAg2kUk1Ad8eM8SAg6cJz8GCaS3pmvceCyKA+u28GO3IK9UM47q
         atiRBqLZ1dTjDodBZCMMNMEkvrgBdDYpMQIijFLtpFlxZiWQ5QKq2Ufo1ap1rhst5yZV
         4MSXwHDJaciBoI67mtCtlTPz5k/W+J1AHRvt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603819; x=1791208619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=crMdnE4crE3wlYwsJ81C9sapH51FewJi/fEzGFJVbvo=;
        b=og/BFl+BFcn8ok5GBNcmR/3LTakRKkGPeI/rvq5lxjKNeQ0O9xk7qIi6WNWxMOfs6t
         95QydTJIAHeXN4kcbEnWCRt2kfdE21faXCiRUqaapPJ9CnpqezqxoJgNVS3zVm8+ve4Y
         Z9Phj5mG/EoNred3BvE+921vwPnfXe5VSM+LhDFQZA1uAg7DJdOtrYzF6ESIAvlJp04T
         ltq/pzgOeHxDTjYSVrMSqSsDgnydTsbEkzGsj9b0yfz/sGSnGWxobfvMesbGAssxLWw1
         ai2VHulKwlPSue8w2NSbiDjGWnRdgREeyoebQuv/yneiDy5WGre6YAeDrEhltSO0oBHv
         exQg==
X-Forwarded-Encrypted: i=1; AKwUvByBKNJxQ/pPf8yQk01tqxEsf8+5QgZEJtxpt4s0dJ8jC4jq/4pg8ODHaOL3YQI5xZCEaZ1h8FdYZ7L9+g==@vger.kernel.org
X-Gm-Message-State: AFuF++l+00vwJmewhqyNyDG+FhcOTjx/ro/8Fulouxga5yF8lWdELwvC
	zbnwLqyiU2HS1fWSVtoLARa2tLmdlqDJKRNXOzI25nYxsXEncwiemQKPhSQneFf05cmn/beoQqu
	HJqM=
X-Gm-Gg: AYBFou19QcJadU8yvomWT2ol3WriEl1tI8EJZX2Av3eV3kEpFTh6/NafrGdkyJ8rrTW
	bGqqGFo9a6LkpKCbUTFPEjyIGwr3juRZQ3ou87YY/GhXcfVL6QXqIADxEL19wuuDLowWYnoo5G3
	+BynD/7wZGwK6RdXx6jMYNZJazZ4xIY0KkKp2JYUyvW8jB2TUsG9jU+dN/Mpc+fPtl21BPaFHpk
	DdjKaHFKlisS/FnPF3HAAOh4kZtZNms2/+5XYSs6hsVwh21KtO034cGLgkobG2oSGhIPJ4zr9+j
	OKl+s2MAWb4ssO5k49Aeurv1q1Mum73P+2x0lWd7WaySF0gT9t2JMdJ7tgMFrfWyQ/nSHCdmAHo
	oGjLdwaUITQE9TkVENIPhJXM0cc0DEhXElQsH6ScXHzSLj5+K8RMU+2PQLI8ZOyK0Lt5LEHDNNF
	dE+XosrNs5S32SqPQMmaGIwy1bWqJLENfNdce76cDK/jze2Og8SKmXv8NKSOd5qfGSnzpq5wWcl
	gSrePwDSrxqV7k0BHAIWREbRjz2P516VHIf7vxF0K+zEAGJ
X-Received: by 2002:a05:6a00:39a3:b0:879:2a08:99bb with SMTP id d2e1a72fcca58-8802d819e56mr7393475b3a.56.1790603819481;
        Mon, 28 Sep 2026 06:56:59 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88069bdf590sm3808746b3a.8.2026.09.28.06.56.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:56:58 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso1743518c88.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:56:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxsiZi/a78cwSjs5/i++ZahQSHPNBeMCNGTPqIV6aly2vjll6pOdfIQeDom9xvdj+pwUEcy6Khctrvwtg==@vger.kernel.org
X-Received: by 2002:a05:7022:b059:10b0:143:298e:459f with SMTP id
 a92af1059eb24-146d096cf16mr10003875c88.42.1790603816618; Mon, 28 Sep 2026
 06:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org> <20260928125242.GE4406@killaraus.ideasonboard.com>
 <CANiDSCtb9-LVTuhwdLYdTzNMbrq_TYCjKYOxc5TxhCqaWg2NCQ@mail.gmail.com> <20260928133531.GH4406@killaraus.ideasonboard.com>
In-Reply-To: <20260928133531.GH4406@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 15:56:42 +0200
X-Gmail-Original-Message-ID: <CANiDSCv0dXj6J35UL86UVDBJskc3oOnsPGtegOw+QrfpvS6GCg@mail.gmail.com>
X-Gm-Features: AclHuK-gdC7eYiTPvkQ8M26MWPdoERB-W73jMR1xJj4rAPXHd0De-SwtkHdyvxY
Message-ID: <CANiDSCv0dXj6J35UL86UVDBJskc3oOnsPGtegOw+QrfpvS6GCg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 15:35, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 28, 2026 at 03:22:15PM +0200, Ricardo Ribalda wrote:
> > On Mon, 28 Sept 2026 at 14:52, Laurent Pinchart wrote:
> > > On Fri, Sep 11, 2026 at 01:22:27PM +0000, Ricardo Ribalda wrote:
> > > > Currently, the driver expects that cameras properly implement the spec
> > > > version that they announce, and if they fail to do so, we do not continue
> > > > probing the driver.
> > > >
> > > > To make drivers more fun, some vendors decided to announce that they are
> > > > a UVC version that they are not. Until now, we handled those cameras via
> > > > quirks.
> > > >
> > > > Unfortunately, reality has shown us that there are more cameras out
> > > > there with an invalid uvc_version than we initially predicted.
> > >
> > > As far as I understand, this was triggered by the Avermedia GC515. Have
> > > you received other reports ?
> >
> > I have not, but we can agree that not that many people does the extra
> > mile to report to this mailing list.
> >
> > If multiple cameras, from different ISPs have this issue it makes me
> > think that Windows is handling this uvc_version more naively than us,
>
> That's likely a fair assumption. Who would have thought that we would
> still suffer from Microsoft's bad design decisions today ?
>
> > and unfortunately it is what most vendors use to validate their
> > cameras.
> >
> > I'd rather support more cameras than fewer.
> >
> > > > This patch tries to handle these cameras with an identity crisis
> > > > automatically. We still shame them in dmesg. But now they will work.
> > >
> > > If the vendors ignored the fact that those cameras didn't work at all on
> > > Linux, do you think they will read dmesg ?
> >
> > They wont, but distros might look into logs and keep track of warnings/logs.
>
> It was meant as a joke.
>
> > > Jokes aside, UVC version override was added in November 2020, and the
> > > Avermedia GC515 is the fourth device we list in nearly 6 years. Let's
> > > see if there are any drawbacks in the implementation below that can be
> > > justified by such a small number of devices.
> > >
> > > > Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++----
> > > >  drivers/media/usb/uvc/uvc_video.c  | 40 +++++++++++++++++++++++++-------------
> > > >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> > > >  3 files changed, 35 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index e289cc71ba98..ca75f8d1ec46 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -1169,9 +1169,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > > >
> > > >       case UVC_VC_PROCESSING_UNIT:
> > > >               n = buflen >= 8 ? buffer[7] : 0;
> > > > -             p = dev->uvc_version >= 0x0110 ? 10 : 9;
> > > > -
> > > > -             if (buflen < p + n) {
> > > > +             if (buflen < 9 + n) {
> > > >                       uvc_dbg(dev, DESCR,
> > > >                               "device %d videocontrol interface %d PROCESSING_UNIT error\n",
> > > >                               udev->devnum, alts->desc.bInterfaceNumber);
> > > > @@ -1188,7 +1186,12 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > > >               unit->processing.bControlSize = buffer[7];
> > > >               unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
> > > >               memcpy(unit->processing.bmControls, &buffer[8], n);
> > > > -             if (dev->uvc_version >= 0x0110)
> > > > +
> > > > +             /*
> > > > +              * We are not using bmVideoStandards, so there is no need to
> > > > +              * warn the user if it is missing.
> > >
> > > There's value in warning the user about UVC non-compliance though. I'd
> > > like to see a warning that indicates the device reports an incorrect UVC
> > > version.
> > >
> > > If I'm not mistaken, the Avermedia GC515 includes the bmVideoStandards
> > > field. This change is therefore not needed for any devices we know
> > > about, right ?
> >
> > We do not know if it includes the bmVideoStandards or not.
>
> Don't we ? The descriptors show a 13-bytes PU with bControlSize set to
> 3, so there's 10 bytes for the fixed parts, compatible with UVC 1.10 and
> newer.
>
> > Wihout
> > https://lore.kernel.org/linux-media/20260928124109.GF157191@killaraus.ideasonboard.com/T/#t
> > it might leaking the next control.
>
> It would then use the next byte of the next control, which is the
> bLength field, equal to 0x29. lsusb reports bmVideoStandards 0x00.
>
> > (this is how I started working on
> > the other patch).
>
> It makes sense now :-)
>
> > Luckily for us bmVideoStandards is not used.
> >
> > > > +              */
> > > > +             if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
> > > >                       unit->processing.bmVideoStandards = buffer[9+n];
> > > >
> > > >               uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index 2a3b7431cc68..2f3daa920ffa 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -273,6 +273,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> > > >       }
> > > >  }
> > > >
> > > > +#define UVC_VIDEO_CTRL_MIN_SIZE 26
> > > > +
> > > >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > > >  {
> > > >       /*
> > > > @@ -280,7 +282,7 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > > >        * on the protocol version.
> > > >        */
> > > >       if (stream->dev->uvc_version < 0x0110)
> > > > -             return 26;
> > > > +             return UVC_VIDEO_CTRL_MIN_SIZE;
> > > >       else if (stream->dev->uvc_version < 0x0150)
> > > >               return 34;
> > > >       else
> > > > @@ -290,7 +292,6 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > > >  static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > > >       struct uvc_streaming_control *ctrl, int probe, u8 query)
> > > >  {
> > > > -     u16 size = uvc_video_ctrl_size(stream);
> > > >       u8 *data;
> > > >       int ret;
> > > >
> > > > @@ -298,13 +299,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > > >                       query == UVC_GET_DEF)
> > > >               return -EIO;
> > > >
> > > > -     data = kmalloc(size, GFP_KERNEL);
> > > > +     data = kmalloc(stream->ctrl_size, GFP_KERNEL);
> > > >       if (data == NULL)
> > > >               return -ENOMEM;
> > > >
> > > >       ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
> > > >               probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> > > > -             size, uvc_timeout_param);
> > > > +             stream->ctrl_size, uvc_timeout_param);
> > > >
> > > >       if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
> > > >               /*
> > > > @@ -319,7 +320,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > > >               ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
> > > >               ret = 0;
> > > >               goto out;
> > > > -     } else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
> > > > +     } else if (query == UVC_GET_DEF && probe == 1 &&
> > > > +                ret < UVC_VIDEO_CTRL_MIN_SIZE) {
> > > >               /*
> > > >                * Many cameras don't support the GET_DEF request on their
> > > >                * video probe control. Warn once and return, the caller will
> > > > @@ -330,15 +332,24 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > > >                       "Enabling workaround.\n");
> > > >               ret = -EIO;
> > > >               goto out;
> > > > -     } else if (ret != size) {
> > > > +     } else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
> > > >               dev_err(&stream->intf->dev,
> > > >                       "Failed to query (%s) UVC %s control : %d (exp. %u).\n",
> > > >                       uvc_query_name(query), probe ? "probe" : "commit",
> > > > -                     ret, size);
> > > > +                     ret, stream->ctrl_size);
> > > >               ret = (ret == -EPROTO) ? -EPROTO : -EIO;
> > > >               goto out;
> > > >       }
> > > >
> > > > +     if (ret != stream->ctrl_size) {
> > > > +             uvc_warn_once(stream->dev, UVC_WARN_CTRL_SIZE,
> > > > +                           "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
> > > > +                           uvc_query_name(query),
> > > > +                           probe ? "probe" : "commit", ret,
> > > > +                           stream->ctrl_size);
> > > > +             stream->ctrl_size = ret;
> > > > +     }
> > >
> > > There are two other locations where uvc_version is used:
> > >
> > > - In uvc_fixup_video_ctrl() to implement a workaround for pre-1.10
> > >   devices that don't report dwMaxVideoFrameSize
> > >
> > > - In uvc_ctrl_filter_plf_mapping() to stkip the power line frequency
> > >   control on pre-1.50 devices
> > >
> > > None of those are handled in this patch. Furthermore, more usage of
> > > uvc_version may be needed in the future. This patch seems a bit fragile
> > > to me in that regard. Could we instead detect the version and update the
> > > uvc_version field ?
> >
> > Will send a follow-up to fix dwMaxVideoFrameSize.
> >
> > uvc_ctrl_filter_plf_mapping properly handes devices with invalid
> > uvc_version. It automatically probes the control.
> >
> > I though about parsing the uvc_version, but then I realised that some
> > devices might implement video_ctrl_size correctly but not filter_plf
> > (or the other way around).
> > So I decided that this was better.
>
> So you're thinking that the driver should implement some sort of hybrid
> version support ? That makes me fear for security as such a scheme is
> much more difficult to reason about.

I think it is more secure for the driver to use the actual data
lengths returned by the device (as this patch does) and rely on
probing (like we do for PLF), rather than blindly trusting a version
descriptor that we already know vendors get wrong.

I do not see this as hybrid versioning, I see it as defensive programming.

>
> > > Another option, given the small number of affected devices, is to just
> > > merge 5/5 (as well as 1/5 and 2/5 that are nice small improvements).
> >
> > I'd argue that 4/5 is also a nice to have.
> >
> > > > +
> > > >       ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
> > > >       ctrl->bFormatIndex = data[2];
> > > >       ctrl->bFrameIndex = data[3];
> > > > @@ -351,7 +362,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > > >       ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
> > > >       ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
> > > >
> > > > -     if (size >= 34) {
> > > > +     if (ret >= 34) {
> > > >               ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
> > > >               ctrl->bmFramingInfo = data[30];
> > > >               ctrl->bPreferedVersion = data[31];
> > > > @@ -381,11 +392,10 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > > >  static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> > > >       struct uvc_streaming_control *ctrl, int probe)
> > > >  {
> > > > -     u16 size = uvc_video_ctrl_size(stream);
> > > >       u8 *data;
> > > >       int ret;
> > > >
> > > > -     data = kzalloc(size, GFP_KERNEL);
> > > > +     data = kzalloc(stream->ctrl_size, GFP_KERNEL);
> > > >       if (data == NULL)
> > > >               return -ENOMEM;
> > > >
> > > > @@ -401,7 +411,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> > > >       put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
> > > >       put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
> > > >
> > > > -     if (size >= 34) {
> > > > +     if (stream->ctrl_size >= 34) {
> > > >               put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
> > > >               data[30] = ctrl->bmFramingInfo;
> > > >               data[31] = ctrl->bPreferedVersion;
> > > > @@ -411,11 +421,11 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> > > >
> > > >       ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
> > > >               probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> > > > -             size, uvc_timeout_param);
> > > > -     if (ret != size) {
> > > > +             stream->ctrl_size, uvc_timeout_param);
> > > > +     if (ret != stream->ctrl_size) {
> > > >               dev_err(&stream->intf->dev,
> > > >                       "Failed to set UVC %s control : %d (exp. %u).\n",
> > > > -                     probe ? "probe" : "commit", ret, size);
> > > > +                     probe ? "probe" : "commit", ret, stream->ctrl_size);
> > > >               ret = -EIO;
> > > >       }
> > > >
> > > > @@ -2231,6 +2241,8 @@ int uvc_video_init(struct uvc_streaming *stream)
> > > >
> > > >       atomic_set(&stream->active, 0);
> > > >
> > > > +     stream->ctrl_size = uvc_video_ctrl_size(stream);
> > > > +
> > > >       /*
> > > >        * Alternate setting 0 should be the default, yet the XBox Live Vision
> > > >        * Cam (and possibly other devices) crash or otherwise misbehave if
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index abcafd929c9e..8d99e857a69f 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -461,6 +461,7 @@ struct uvc_streaming {
> > > >       struct usb_interface *intf;
> > > >       int intfnum;
> > > >       u32 maxpsize;
> > > > +     unsigned int ctrl_size;
> > >
> > > That should be called video_ctrl_size, ctrl_size is ambiguous.
> >
> > Ack
> >
> > > >
> > > >       struct uvc_streaming_header header;
> > > >       enum v4l2_buf_type type;
> > > > @@ -662,6 +663,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
> > > >  #define UVC_WARN_PROBE_DEF   1
> > > >  #define UVC_WARN_XU_GET_RES  2
> > > >  #define UVC_WARN_QUERY_CTRL  3
> > > > +#define UVC_WARN_CTRL_SIZE   4
> > > >
> > > >  extern unsigned int uvc_clock_param;
> > > >  extern unsigned int uvc_no_drop_param;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
