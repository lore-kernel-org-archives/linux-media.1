Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3FC3A6B6A
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041886; cv=none; b=j7EqRSnCcsPjGniOAPpZg1ewLE02u0t4yC00o5wGp8sT6QBx5KLP/q5BdciY1zeygzVaBgD2guyf6kMdnhH2wp25xaIwEMwGYdlhZ1ITTN82eVdKgcAT1DrgMYtqXgzIgoRsbwfsRUsFjcaUcUUbrRO4yZ8vdHdh0XiWC4MAnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041886; c=relaxed/simple;
	bh=JVpa+XKAXdW8tPT4/TJQgtPGyMX/g28tNZeDF7xq9W4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YR2GJFGEprjXLzE29DkYzEQO682qgHomhmLXZf4ovtJSFUIMyCxXJw4CAsCMAslF78MQkiuOXhK0Tat1dUK72Sf76MbZEZVgn0T/HYqzT3LDtmuGK8NuEyWjo+1+Jsn52xRa/ZrUosM24b1tGPhxiBWPwHAKUTeQLCIaCmIgLjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ham5lZn0; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ham5lZn0"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso1136503a12.1
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 01:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787041882; x=1787646682; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBlvLLFWUjGV9E351Iv/aL6f4RkTFzkSlY64W1wSwYc=;
        b=Ham5lZn0XUdwlQ1tDSsxRQu8SnY7oijL+K8UEcE9wq1zNEIVE06hcNHRh15LU7GdQy
         vQ9bgNxVZfEoD9KL5Uuz64rQpOlAioeBmxUTmg0wl2WytrmXnIkzLmdnspfqm9L9qtGr
         fRQh+2HC1u+AkBSsKIC1Lx6A7/miCrnBRsSyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041882; x=1787646682;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EBlvLLFWUjGV9E351Iv/aL6f4RkTFzkSlY64W1wSwYc=;
        b=MVi5iq30WLZ8BJBcgBB0rCop2mFUpRaD6056u+8pPTykIQhZ7P7mXkbIZH3gonzk1D
         upnceLFNQktZ4OFWkQRVElYB7YGOVU/gP/Z4M98dfC6AKRoj6ywB4utbI4bonluo67rW
         rpZDI4AwbwKpvP2qcY/OQIN3sr7DLon+7y2hwk8koi8WZrjFzFPpj1dZLKuZbRYaZxNb
         4ATjl6Aqq/p6PvStujT5vhTv4lRagh8Q+9UAdDBYrv1lCAAhtIRhsdyz6EdzwqD3FqFs
         2k2+43wF+OKmrusA2Nbd2QJr+EjhuN0k3Kkoe91oxSCWwa+rC1EemNfLgMqbOvLu2odH
         hCsA==
X-Forwarded-Encrypted: i=1; AHgh+Rpjmq8QoJf1ysiADPoAa0b5TeFA+ITa4LIfJ3l9PFoMrjaX6X0QZEefdlJdt9UFDQslzQAeikQHTxp8Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2fCZfA9C23HHe1km96j0UIcec2EqWCiFUcmN2HtHRunYxPUwo
	ZW+c3RRGi5BUjL7ju8fMEvGUr7aMZ/a2fF5sa+ic61HrTjyQ7eT/9C+HGocbzAhslI267lUEEg8
	KmAxNQFVq
X-Gm-Gg: AR+sD13ifaU/3Jm0FjfmgKEj7Im1TphP6Gwxw5VZfKI2ENfwqLpjaAtjiTViukKPI3D
	5ILWLbpLdtO1pbTJf31esndjh93EdTglcv7vu8w4QSZZZ+a8Hvxlbqdtxv3jNBU83Qcd5wVmgpg
	yJgMfY1Ea9ubkXuscfQhZLsXjKrO5OAFOGRJlkz2+tP6mhJFgCe9o+9n87QhIDXVb1NN71W0Vqn
	pJEqu64W9eA9658DzQbtxbrpEk+d5iyebpGnwgRVxMda6FfSJdojCqEmPIMwNIbXUjx9b+Ev020
	5H6Eb8cdH8IXLOWovt1Bkl3N2l9QysgX7gn4epyqCIfLezGdSo7ZvVAIwejHZW0sAVRprfYIHIZ
	Je1bgiPOIlkOLoHRpexuC2jIXEjis0wVrIhhmpS55FqS83vhl/9NKztllUJubSTxJrm0dp4xkAN
	8pQb4d5wEq6QJB9rvg0El+POc7Ufq71M9mOxBoLAKCaVzY9BBa0lSrcnEO3EY8Gnhg6Y2y6bTzW
	f5ksElKD4oOET6nBhsR+fmGeQ==
X-Received: by 2002:a17:907:6b05:b0:c20:74db:50c7 with SMTP id a640c23a62f3a-c21885150damr401312766b.13.1787041881967;
        Tue, 18 Aug 2026 01:31:21 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97aa1sm118868166b.46.2026.08.18.01.31.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:31:21 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so5352615a12.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 01:31:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpw3IfhYTDta7g06y9NM2mlSq2LDtWPEhX7T2u6q/FqTmc/32qDVtfOGp//jkk0EjZKwlZG42U9JG2xRA==@vger.kernel.org
X-Received: by 2002:a05:6402:90f:b0:6a3:691a:9d69 with SMTP id
 4fb4d7f45d1cf-6a3e0fccb72mr4092793a12.4.1787041878857; Tue, 18 Aug 2026
 01:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812103251.18309-1-noambs2999@gmail.com> <20260818075956.212624-1-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260818075956.212624-1-natalie.klaus@runtimeverification.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Aug 2026 10:31:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
X-Gm-Features: AcwNN1Ub98U_r2N4cfzmBOGLmDJwr-0GyP2qE57rljo-_TfCljGHJhh4PIzqsPo
Message-ID: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Skip frame descriptors with a zero
 computed size
To: Natasha Klaus <natalie.klaus@runtimeverification.com>, 
	Noam Ben Shimon <noambs2999@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha, hi Noam


On Tue, 18 Aug 2026 at 10:00, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> For uncompressed formats uvc_parse_frame() recomputes
> dwMaxVideoFrameBufferSize from the frame dimensions and the bits per
> pixel. All three operands come from the frame and format descriptors and
> none of them is validated: wWidth and wHeight are read at
> uvc_driver.c:254 and uvc_driver.c:255, and bpp at uvc_driver.c:382.
>
> The computed size is therefore zero whenever any operand is zero, and
> also whenever the product is below 8 and truncates to zero on the shift,
> for instance bpp=1 with a 2x3 frame.
>
> A zero size is not harmless. It is copied into
> ctrl->dwMaxVideoFrameSize by uvc_fixup_video_ctrl() and reaches
> uvc_queue_setup() as the vb2 plane size, where it trips
> WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
> drivers/media/common/videobuf2/videobuf2-core.c:951 and fails
> VIDIOC_REQBUFS with -EINVAL. On a kernel built with panic_on_warn that
> WARN is fatal.
>
> Such a frame can also become the active one without any application
> asking for it: when no frame matches the device's default bFrameIndex,
> uvc_video_init() falls back to frames[0] at
> drivers/media/usb/uvc/uvc_video.c:2298, so a device that also has
> usable frames can come up unusable.
>
> Skip the frame descriptor instead of rejecting it. Rejecting the
> descriptor would discard the whole streaming interface, including every
> valid format on it. Skipping follows the convention introduced by
> commit 81f3affa19d6 ("media: uvcvideo: Don't expose unsupported formats
> to userspace"), which drops a format descriptor the driver cannot use
> rather than failing the parse, for the same reason: to keep an unusable
> descriptor from reaching userspace and triggering a WARN_ON. Extend the
> existing "return 0 means skip this descriptor" handling from the format
> loop to the frame loop so parsing continues with the next frame and the
> rest of the format survives.
>
> Frame based compressed formats are not affected. They legitimately
> carry a zero dwMaxVideoFrameBufferSize, set unconditionally at
> uvc_driver.c:265 because the frame based frame descriptor has no such
> field, and they never enter this branch because it is guarded by
> !UVC_FMT_FLAG_COMPRESSED.
>
> Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
> ---
> Applies on top of Noam Ben Shimon's v2:
> https://lore.kernel.org/linux-media/20260812103251.18309-1-noambs2999@gmail.com/
> It sits directly after his overflow check and will not apply without it.

I think we need to have some consistency. We cannot have  one
condition returning -EINVAL and the other skipping it.

How does this plan sound to you:

1) Refactor a bit uvc_parse_frame (warning! not tested)
diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..6cbeaf10d2e0 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -243,10 +243,10 @@ static int uvc_parse_frame(struct uvc_device *dev,
        n = n ? n : 3;

        if (buflen < 26 + 4 * n) {
-               uvc_dbg(dev, DESCR,
-                       "device %d videostreaming interface %d FRAME error\n",
-                       dev->udev->devnum, alts->desc.bInterfaceNumber);
-               return -EINVAL;
+               dev_warn(&streaming->intf->dev,
+                        "UVC non compliance: device %d videostreaming
interface %d FRAME error\n",
+                        dev->udev->devnum, alts->desc.bInterfaceNumber);
+               return -ENODATA;
        }

        frame->bFrameIndex = buffer[3];
@@ -312,6 +312,8 @@ static int uvc_parse_frame(struct uvc_device *dev,
                      frame->dwFrameInterval[0],
                      frame->dwFrameInterval[maxIntervalIndex]);

+       // Your overflow and zero checks go here and return -EINVAL
+
        /*
         * Some devices report frame intervals that are not functional. If the
         * corresponding quirk is set, restrict operation to the first interval
@@ -329,7 +331,7 @@ static int uvc_parse_frame(struct uvc_device *dev,

        *intervals += n;

-       return buffer[0];
+       return 0;
 }

 static int uvc_parse_format(struct uvc_device *dev,
@@ -492,11 +494,12 @@ static int uvc_parse_format(struct uvc_device *dev,
                        ret = uvc_parse_frame(dev, streaming, format, frame,
                                              intervals, ftype,
width_multiplier,
                                              buffer, buflen);
-                       if (ret < 0)
+                       if (!ret)
+                               format->nframes++;
+                       if (ret == -ENODATA)
                                return ret;
-                       format->nframes++;
-                       buflen -= ret;
-                       buffer += ret;
+                       buflen -= buffer[0];
+                       buffer += buffer[0];
                }
        }

2) apply a modified version of Noam patch with the fixed error message

3) Apply Natasha's patch

If Noam is okay with this, perhaps Natasha could prepare a patchset
with the 3 patches? (keeping Noams author on his patch)


WDYY?

Regards

>
> One consequence worth naming: if every frame of the default format is
> zero-sized, nframes ends up 0 and uvc_video_init() fails probe at
> uvc_video.c:2286. This cascade is not new here. 81f3affa19d6 already has
> it one level up, where skipping enough formats leaves nformats == 0 and
> trips the same guard at uvc_video.c:2226. Such a device has nothing to
> stream either way, but the outcome is no node rather than a node that
> fails at REQBUFS, so it is a judgement call I would rather leave to you.
>
> This does not cover compressed formats. For UVC 1.10 and later
> uvc_fixup_video_ctrl() does not overwrite dwMaxVideoFrameSize, so a zero
> in the device's probe response reaches vb2 unchecked and no parse-time
> check can see it.
>
> Not tested on hardware or a UVC gadget. Built and verified against the
> isolated expression only.
>
>  drivers/media/usb/uvc/uvc_driver.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 29e23f94751c..e5858cec7ee4 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -309,6 +309,20 @@ static int uvc_parse_frame(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> +               /*
> +                * A zero-sized frame is unusable: it reaches vb2 as a zero
> +                * plane size, and it is reported to userspace as a 0x0 frame
> +                * with a zero sizeimage. Skip the frame descriptor, the
> +                * caller moves on to the next one.
> +                */
> +               if (!bufsize) {
> +                       dev_warn(&streaming->intf->dev,
> +                                "UVC non compliance: FRAME %u has zero size (%ux%u, %u bpp), skipping it.\n",
> +                                frame->bFrameIndex, frame->wWidth,
> +                                frame->wHeight, format->bpp);
> +                       return 0;
> +               }
> +
>                 frame->dwMaxVideoFrameBufferSize = bufsize;
>         }
>
> @@ -506,6 +520,11 @@ static int uvc_parse_format(struct uvc_device *dev,
>                                               buffer, buflen);
>                         if (ret < 0)
>                                 return ret;
> +                       if (!ret) {
> +                               buflen -= buffer[0];
> +                               buffer += buffer[0];
> +                               continue;
> +                       }
>                         format->nframes++;
>                         buflen -= ret;
>                         buffer += ret;
>
> base-commit: bae860246e920a7d24256858b69133c9c5f1f6a1
> --
> 2.34.1
>


-- 
Ricardo Ribalda
