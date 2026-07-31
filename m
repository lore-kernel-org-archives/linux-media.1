Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DDC35C698
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486802; cv=none; b=sSiembJCS94a91RdnsH2CxR6Ji2um2aZteOy6aMQXV3puz/AHqEaModq2DTmsXCBOIpQbCZrxS8iLkfJRG8BWxPomFXSVqInuJpCpw2jMS5QW6c/DkOfOjYJFrCscBHd6ZiorkJtXJl+P45xBG7hBdFD0sWv3ZkFNkk1PSxeTKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486802; c=relaxed/simple;
	bh=/tYA+QrS46UfEIrHiWES/hvPt/EwbOUD39aSY8YCipE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgElBRUCpjHcDEXKDz9uDwB/VBpaGiW+h0wdDRqdZM60dyKNaUtXThY4mFvO3UhoxWIZHwRBnxF8LtlDgEdc+UL8+LDN9TahrrIP6JCST6UMojvkiyEKf2ycZAJzlXBmV33XPRwv1l8rp532EMjg5w4dIHGbCB7rXK2CU3HJpV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iwrQXToi; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iwrQXToi"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c160420289bso97867266b.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785486799; x=1786091599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkH6MVQpJyvxphiMlxxxWKOg1I8GNIpS9pkd/5hpEqw=;
        b=iwrQXToivJvEjqaaEtb0yNClNbK4FxvHMvEX607ZzJRKSbltSX//fQ14SIrcEEDOGP
         zTCE0XXbT40jcBAOmsKGmLMLQTBC9TauHqn8DPrrTlrkzD0GaYIifr6z2bdz7tK8PXz6
         /PE3Z2U19VfWgED/SPHUI9pY4FpUq2MaEvfVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486799; x=1786091599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tkH6MVQpJyvxphiMlxxxWKOg1I8GNIpS9pkd/5hpEqw=;
        b=iSCzrBV7K59B94jHmIlTCsxf7Npt2AG1S2/9hwBb8aAZsCyS0tNYSQUxkf2QzuuojZ
         CpR117rZYpzAjU3Q7aAJEDiwFWkmwndu41UjnAHpqna5evbhua6NiXjm84r4/jVLrQRT
         1yUI+wRNELSBESs2wZVWBa03RCME5DUBAKnhIyMa1YzjW2BGOwQZQ98Ah6wm1EUkH4yi
         Xw24PLoVeHyfFGJoV2jSAZmcfYi17/kiWiUZcrnxUm8VNeZrH5TPHPXnEPXTkuojWWLO
         xzwbJRZBQAcOld67iynDoO+4DdHv2rPx7eSxjv8mp+3GddB0XFeSVNKzHDqc/6mLj8hN
         iGFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOSNJXkIQ0nXmp45xy8yBujCw8Huy7/+nkVAHCzLQYHJEkH648LNlBQQvWZniTzm+UuaJHZ2E+wGAGCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIYb5vC3fCIQbJMnI51gwnux1asH0OUyivdZQU5IcIBUTAN9F2
	dwQ5n55QBwv+10A2SSITb1H3Xj9GMLqBoy8yJXa9qdlfvyWwIFsGVZuTjf4rHZVSrz/5bI6BNjV
	8NrgPEA==
X-Gm-Gg: AR+sD12LRaYldevYu7e5E6XIpJUyzNiG/OsEaU1d42FkSRIUaesJX7IG62tvFDSgI6t
	yxR3EfXekSB7B2D6N0BRxhbHFHmuFwWQlbhyVjmIMPH7k2J+sPgowM4+5lxJ414F8/6IQafggix
	mHfCXMA6h9JmOZrR0WZP1dWx2vKAdE3Z+WKb9/3PsjasVFqR9jl7MYWJozHqtBWAN81qx5IKTq1
	IvhBZ5+tfL/4PxtHHe2bQmrAbgfhHSn8rl7fhiau91dWTbJcaoGesdA5YQCyP7bGqcNEl0AxiVy
	tH9TxMX7iBvgZtcFPfCllKUyFpvVvwJvsTGfyexOu/VMIj+ZEe5dkSL9m5awjp1EIo4iCaZOFoU
	pDtY8NPtHbQwNsHLprqEeKRw/467j1hZ+nR+SNRyjpg7Gha+ddML9VTYPISpscKiXkKJW21gAqU
	SDbndkE/Ds6gYoIVagSqDl4w/UEcqu0ItAdLIKIeh4LXvvNa86l1KMa+P/Q0+gLsYUdK42HFwal
	cO9Z3IgEVo1KIsfUBbyu0O1Ow==
X-Received: by 2002:a17:907:808:b0:c16:5baa:8059 with SMTP id a640c23a62f3a-c1fd21c3486mr53524566b.39.1785486798766;
        Fri, 31 Jul 2026 01:33:18 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4534fc4sm60653266b.51.2026.07.31.01.33.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:33:17 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c160420289bso97858166b.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:33:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrlZHIAzkLATOPhOvCVz4BH04jRfrLVVhhNWsmEXldJgaLEIePfNQzmNPCbc3X947ZjqSXG/FfG0zOygQ==@vger.kernel.org
X-Received: by 2002:a17:907:6d2a:b0:c1c:24c9:997a with SMTP id
 a640c23a62f3a-c1fd1eccbccmr53101766b.17.1785486795882; Fri, 31 Jul 2026
 01:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725212332.64927-1-jordan.mymail@gmail.com>
In-Reply-To: <20260725212332.64927-1-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 31 Jul 2026 10:33:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com>
X-Gm-Features: AUfX_myXY1w0fN4-A6e0amZdwzUhdesrR5T_O_PPcKsWH1gC59NVg_8lcl4DAu8
Message-ID: <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: query pan/tilt position from the device
 on every read
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Michael Jordan

(I always wanted to start an email like that :P)

Thanks for your patch

On Sat, 25 Jul 2026 at 23:23, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> CT_PANTILT_ABSOLUTE_CONTROL reports the position of a mechanical actuator.
> On a motorised PTZ camera that position keeps changing for as long as the
> movement takes -- seconds -- and it can change with no host involvement at
> all when the camera repositions itself. The driver caches the value and
> serves VIDIOC_G_CTRL from that cache, so userspace cannot observe the
> movement.

I am not against the idea proposed by this patch, but I would like to
understand your use case a bit better. Do you want to know where the
camera is because:
- You want to do something continuously with that info (e.g., tagging
frames with the live position)?
- Or because you just want to know when the camera has actually finished moving?

If it is the latter, you could use V4L2 control events. That should
work perfectly for signalling the end of a move:
https://www.kernel.org/doc/html/v4.9/media/kapi/v4l2-event.html

You also mentioned that the camera can reposition itself. Do you mean
that the camera could be tracking something and decide to move on its
own?
We do not currently support that well, but we should. The problem is
that autonomous movement actually breaks the separate-buffer logic
proposed in your patch.

Let's think of a camera with PAN and TILT:
- We set PAN and TILT to (100, 100). (And UVC_CTRL_DATA_CURRENT is set
to those values).
- The camera arrives at (100, 100).
- The camera moves on its own to (200, 200) to track a subject.
- You want to change the TILT and only the TILT, so you send a command
to set it to 300.
- Because your patch uses UVC_CTRL_DATA_CURRENT for the
read-modify-write path, the control will send (100, 300). That will
unintentionally move both axes, yanking the PAN back to 100 and
fighting the camera's autonomous tracking.

What I think we should do instead is manage the cache validity based
on who "owns" the control. For ASYNCHRONOUS controls that have an
active handle (i.e., a user-commanded move that has not completed), we
mark them as "loaded". But when they are owned/updated by the device
autonomously, we never mark them as loaded.

This specific logic still doesn't support polling the live mid-flight
position of a user-commanded move, but maybe V4L2 events can cover
your actual use case?

Let me know what you think.

Here is some horrible pseudo-code for inspiration, which has not been
tested and does not even compile, just to hopefully explain better
what I meant in the text.

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83f1d..9ba16fc506ef 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1494,7 +1494,8 @@ static int __uvc_ctrl_load_cur(struct
uvc_video_chain *chain,
        if (ret < 0)
                return ret;

-       ctrl->loaded = 1;
+       if (!FLAG_AUTO_UPDATE)
+               ctrl->loaded = 1;

        return ret;
 }
@@ -2427,7 +2428,8 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
                 * explicitly set by the user.
                 */
                if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE ||
-                   !(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+                   !(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) &&
+                   phandle_not_set) // data is_not_flying
                        ctrl->loaded = 0;

                if (!ctrl->dirty)


>
> The cache is invalidated in only two places: uvc_ctrl_commit_entity(),
> which clears it for auto-update controls when the driver commits a
> SET_CUR, and uvc_ctrl_status_event(), on receipt of a Control Change
> interrupt. Neither covers a move that is under way. The first G_CTRL after
> a write does reach the device, but it then sets ctrl->loaded and every
> subsequent read returns that one sample unchanged until the move ends.
> An application polling the position sees a single value frozen for the
> duration of the movement.
>
> The Control Change interrupt does not fill the gap, because the mechanism
> is event-shaped and the quantity is continuous. UVC 1.5 section 4.2.2.1.15
> states that a SET_CUR to the Relative control "shall result in a Control
> Change interrupt for the Absolute Control at the end of the movement".
> Nothing is defined for the interval in between, and no reasonable firmware
> would emit interrupts at frame rate for the length of a pan sweep. A fully
> compliant device therefore leaves the cached value stale for the whole of
> every move; this is a property of the control, not of any one vendor.
>
> Add UVC_CTRL_FLAG_VOLATILE for controls whose value varies on its own, set
> it on CT_PANTILT_ABSOLUTE_CONTROL, and query the device on every read of
> such a control.
>
> The live value is kept in a buffer of its own rather than in
> UVC_CTRL_DATA_CURRENT, which continues to hold the value last commanded by
> the host. That distinction matters because a single UVC control carries
> both axes: the pan and tilt V4L2 controls map to 32-bit fields of one
> 8-byte control, so uvc_ctrl_set() performs a read-modify-write to preserve
> the axis the caller is not writing. Were that path given a live reading, a
> tilt write issued a few milliseconds after a pan command would rewrite pan
> with the position the actuator had not yet left, cancelling the move in
> progress. Keeping the buffers separate leaves the write path untouched.
>
> Values staged by uvc_ctrl_set() but not yet committed take precedence over
> a live read, so that reading a control back inside an uncommitted
> transaction returns what the caller wrote.
>
> Report V4L2_CTRL_FLAG_VOLATILE for such controls, so applications know the
> value must not be cached and that the value read back need not match the
> value last written. Since writes to a volatile control are documented to be
> ignored unless V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is also reported, and the
> driver propagates every write of a writable control to the device, report
> that flag alongside it when the control supports SET_CUR. This is the same
> pairing the control framework uses for a manual gain control while autogain
> is active.
>
> Measured on an OBSBOT Tiny 2 (3564:fef8) with this patch applied, polling
> VIDIOC_G_CTRL on V4L2_CID_PAN_ABSOLUTE while a 0 to 90 degree pan was in
> flight (values in arc seconds, as reported):
>
>   t+109ms    pan=0
>   t+284ms    pan=18000
>   t+459ms    pan=61200
>   t+811ms    pan=129600
>   t+1161ms   pan=198000
>   t+1513ms   pan=280800
>   t+1690ms   pan=324000   (physical arrival, steady thereafter)
>
> Without the patch the same loop returns one unchanging value for the whole
> sweep. A raw libusb GET_CUR trace taken with the driver detached shows the
> same progression, confirming the driver now reports what the device was
> always able to tell it.
>
> The read-modify-write hazard described above was tested explicitly:
> S_CTRL(pan=90 degrees) and S_CTRL(tilt=20 degrees) issued as separate
> ioctls 18ms apart, with pan still reading 0 when the tilt write was
> submitted, leaves both axes at their commanded targets (pan=324000,
> tilt=72000). The pan movement is not cancelled.
>
> The cost is one control transfer per read of an affected control. Polling
> the control at 5 Hz concurrently with an active 30 fps capture on this
> device showed no frame loss and no change in frame rate. On a device that
> merely echoes back the last setpoint the extra transfer buys nothing, which
> is why the flag is set on pan/tilt alone. Zoom, focus, roll and iris
> absolute share the same character and may warrant the same treatment, but
> are left alone here as they have not been tested.
>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>
> Notes:
>     Notes for reviewers; not intended for the commit log.
>
>     - UVC_CTRL_FLAG_VOLATILE is defined in include/uapi/linux/uvcvideo.h beside
>       the other UVC_CTRL_FLAG_* values, even though struct
>       uvc_xu_control_mapping has no flags member and userspace therefore cannot
>       set it. Keeping the whole flag namespace in one header seemed safer than
>       splitting it, since a later addition of bit 9 on the uapi side would
>       otherwise collide silently with a driver-private definition. I am happy
>       to move it to drivers/media/usb/uvc/uvcvideo.h if you would rather uapi
>       did not grow for a bit userspace cannot use.
>
>     - uvc_mapping_get_xctrl_compound() still reads UVC_CTRL_DATA_CURRENT and is
>       deliberately left alone. No compound control is flagged volatile, so
>       there is no bug today, but that is the second place this would need
>       wiring if the flag is ever applied to one.
>
>     - Only CT_PANTILT_ABSOLUTE_CONTROL is flagged here. Zoom, focus, roll and
>       iris absolute share the same character, a mechanical actuator whose
>       position lags its setpoint, and focus absolute under continuous autofocus
>       is arguably the more widespread case. I have not flagged them because
>       pan/tilt is what I can exercise on the hardware I have, and widening this
>       adds a control transfer per read across a great many devices. Glad to
>       extend it if you think the argument carries.
>
>     - Reading pan and tilt in one G_EXT_CTRLS call now issues one GET_CUR per
>       mapping, so the two values can come from instants roughly a millisecond
>       apart, where previously both decoded from a single cached sample. The
>       skew seemed inherent to polling a moving actuator and not worth a
>       per-ioctl generation scheme to share the transfer; flagging it in case
>       you weigh that differently.
>
>     - Testing: built and run on v7.2-rc4 (mainline); the posted patch is
>       rebased onto media.git next and compile-tested there. Hardware is an
>       OBSBOT Tiny 2 (3564:fef8). Verified that a live read tracks a physical
>       slew; that two single-axis writes issued ~20ms apart both reach their
>       targets, which is the read-modify-write regression the separate buffer
>       exists to avoid; that pan/tilt report V4L2_CTRL_FLAG_VOLATILE and
>       V4L2_CTRL_FLAG_EXECUTE_ON_WRITE while zoom reports neither; and that
>       polling position at 5 Hz during an active 30 fps capture costs no
>       frames. v4l2-compliance results are identical with and without the patch
>       on this device (45/47, the two failures being the camera reporting a
>       Power Line Frequency default outside its own min/max, present in both
>       runs). Also checked an integrated UVC 1.00 webcam (1bcf:28cc) with no
>       pan/tilt, to confirm ordinary devices are unaffected.
>
>  drivers/media/usb/uvc/uvc_ctrl.c | 57 +++++++++++++++++++++++++++++---
>  include/uapi/linux/uvcvideo.h    |  2 ++
>  2 files changed, 55 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83..c6e0c9958 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -30,7 +30,8 @@
>  #define UVC_CTRL_DATA_MAX      3
>  #define UVC_CTRL_DATA_RES      4
>  #define UVC_CTRL_DATA_DEF      5
> -#define UVC_CTRL_DATA_LAST     6
> +#define UVC_CTRL_DATA_LIVE     6
> +#define UVC_CTRL_DATA_LAST     7
>
>  /* ------------------------------------------------------------------------
>   * Controls
> @@ -302,7 +303,8 @@ static const struct uvc_control_info uvc_ctrls[] = {
>                 .flags          = UVC_CTRL_FLAG_SET_CUR
>                                 | UVC_CTRL_FLAG_GET_RANGE
>                                 | UVC_CTRL_FLAG_RESTORE
> -                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> +                               | UVC_CTRL_FLAG_AUTO_UPDATE
> +                               | UVC_CTRL_FLAG_VOLATILE,
>         },
>         {
>                 .entity         = UVC_GUID_UVC_CAMERA,
> @@ -1499,22 +1501,58 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
>         return ret;
>  }
>
> +/*
> + * Query the device for the current value of a volatile control, storing it in
> + * a buffer of its own. UVC_CTRL_DATA_CURRENT is deliberately left alone: it
> + * holds the value last commanded by the host, which is what the
> + * read-modify-write path in uvc_ctrl_set() must use to preserve the fields of
> + * a multi-field control that the caller is not writing.
> + */
> +static int __uvc_ctrl_load_live(struct uvc_video_chain *chain,
> +                               struct uvc_control *ctrl)
> +{
> +       u8 *data = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_LIVE);
> +
> +       if (ctrl->entity->get_cur)
> +               return ctrl->entity->get_cur(chain->dev, ctrl->entity,
> +                                            ctrl->info.selector, data,
> +                                            ctrl->info.size);
> +
> +       return uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> +                             chain->dev->intfnum, ctrl->info.selector, data,
> +                             ctrl->info.size);
> +}
> +
>  static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>                           struct uvc_control *ctrl,
>                           struct uvc_control_mapping *mapping,
>                           s32 *value)
>  {
> +       int id = UVC_CTRL_DATA_CURRENT;
>         int ret;
>
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
>                 return -EACCES;
>
> -       ret = __uvc_ctrl_load_cur(chain, ctrl);
> +       /*
> +        * A volatile control tracks a quantity that varies without host
> +        * intervention, so the cache cannot be trusted and the device is
> +        * queried on every read. Values staged by uvc_ctrl_set() but not yet
> +        * committed take precedence, so that reading back a control inside an
> +        * uncommitted transaction returns what the caller just wrote.
> +        */
> +       if ((ctrl->info.flags & UVC_CTRL_FLAG_VOLATILE) && !ctrl->dirty) {
> +               ret = __uvc_ctrl_load_live(chain, ctrl);
> +               id = UVC_CTRL_DATA_LIVE;
> +       } else {
> +               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +       }
> +
>         if (ret < 0)
>                 return ret;
>
>         *value = uvc_mapping_get_s32(mapping, UVC_GET_CUR,
> -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +                                    uvc_ctrl_data(ctrl, id));
>
>         return 0;
>  }
> @@ -1840,6 +1878,17 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
>             (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
>                 v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_VOLATILE) {
> +               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +               /*
> +                * Writes to a volatile control are documented to be ignored
> +                * unless EXECUTE_ON_WRITE is also reported. The driver
> +                * propagates every write of a writable control to the device,
> +                * so report the flag accordingly.
> +                */
> +               if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
> +                       v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +       }
>
>         if (mapping->master_id)
>                 __uvc_find_control(ctrl->entity, mapping->master_id,
> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
> index cbe15bca9..b22fee8af 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -31,6 +31,8 @@
>  #define UVC_CTRL_FLAG_AUTO_UPDATE      (1 << 7)
>  /* Control supports asynchronous reporting */
>  #define UVC_CTRL_FLAG_ASYNCHRONOUS     (1 << 8)
> +/* Control tracks a value that varies on its own; never serve it from cache. */
> +#define UVC_CTRL_FLAG_VOLATILE         (1 << 9)
>
>  #define UVC_CTRL_FLAG_GET_RANGE \
>         (UVC_CTRL_FLAG_GET_CUR | UVC_CTRL_FLAG_GET_MIN | \
>
> base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda
