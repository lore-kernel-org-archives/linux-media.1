Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090028;
	b=ivDSDPs2C4zu6nXDKkkBJ5WiB84JyLdbMAcHTnF6J5Wqe7/P09KB2gtmZeKlZiOttcjy
	 fffP4PIno/a2rzljv6LqGV1OWzcYE4oYcZGxnfRxZguZAWQNDZJVA67pGKM4pH4nfaxaQ
	 h+Q6xrQHn2HKx/NZlFlPRBT+WlUOLBy+EeoNgTMNWSWl9/eFkcmTq96JUPKokxQFRflJq
	 7Z0HPF/s8iC2IfqV02KYslFTIfRYpn2+/ynTSUHLgzjZhfKHcKcEsP+OxjM6BuyeCP70E
	 ODoobdjFROmdGjbDv8wvdVU5rdD5e2+SPDqgSouMygcV32BLiRgqjoj5J5kA7P2A9jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=24q4cmEurzIe18amc7z0k3Uuq3pJyF0XxrOE02jUc9M=;
	b=4o5d2mrdo4WnsP6Nq6GOLR6c8uubZhhclwW6s5WUQTQ3wQC38xAbm90qJnxQ4picShe/
	 N+vsmIfYxp4GebGmdLZBtUFxVEFF0f81OXUB/WUjOot8d2A2DGuZ3TReQURWgCXx6VUVa
	 F0xuKXNsfUs8boS2ryMFS808MFzMxDh23v4aBYxyARS6a92HhoiACF4GxN4xyRKVsmzV1
	 PaSElCu9+h2OH4pY0ujd7smcSPZ6gWjxpjrYL/vXRG6TX/MOCZPJZ1iOxyymMI6VxP4Jo
	 TO7mWiVT05cCxHrtUBRSjWq0lOaolpo1rt72KtpRhEYp3pARErAY34PhhEnjzFpbl/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JOa0uRWQ;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6382606A326
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 12:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6382606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JOa0uRWQ
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1286126a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 04:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795090027; x=1795694827; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24q4cmEurzIe18amc7z0k3Uuq3pJyF0XxrOE02jUc9M=;
        b=JOa0uRWQIhHTnf9wAj3ddpMSrwDNiiAIRKYiEGHQ+ogia2BSlresjGWBqiXLTa6nSB
         fHrDLr9CvNJ7YC8inJvjVrIrrmKlnASHfzzX6xAS0e+1aHq4SQadjv0m4ZhcncR0DW+A
         NAqsxZMe4a/eL6BC1v/GFdvJr3D5182mSEs3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090027; x=1795694827;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=24q4cmEurzIe18amc7z0k3Uuq3pJyF0XxrOE02jUc9M=;
        b=Eg32hbZOB2t0r7oB7h7Pmb44vDBHYej6XrQnP3NsKfsIC0BjSejjLJ4Go1o6j811h1
         Fqrsq1HhdG8DDg/UcY1sd2s/MsNsGdG6jDlOYXquZY/0x9HdYIpaczlX9+CcL65J7+23
         cQfo0i+dVH2nX/37A6jMRukgKuFEWLhTJOov1+L4e5moDRO06uATruomIBtdqqvPiJ4R
         bBiL0qHXgkIeKK/5B35/g+KkZQQh4I/o15w4gwfYYUK0QuVVNyzSGCXTRo9rQEdF6ps1
         md31NRqeKA8oxckDbwQGjjI88J3KZAk/YN/PqJWyxbgEVQhmXUNkbmLEN0YUWkHjRHH0
         1wTg==
X-Gm-Message-State: APuU4Z8btj7AGw/qOHTBjFE5o9QQ2ijZzl90OuDEhGYygUY2xVO3yxri
	KwohD34EQHlN0Rt4gDGSMPnRgRwTvqo5IvsiVOG1nHBRb/LCrCSq1vNAXijAvNo+8W4ysA8o6mf
	PaxQEYQ==
X-Gm-Gg: AZFdTZdwPQ/tvsoUlpCpWpCd0ETd+SkindBITGCSUa1lqCqlxf/VAdf3fcC+YLCIxLM
	kIGpgZJvAHzk77i7Fhi1evhE9WFhQIjivRQrKcdUOQb0MSoZ4vjpkaukAVIOOL6uZJwHwlEpHmo
	Lrj157oU+tfZVdKCsmOwg1pVf8jKcTn7OjyEqgGS72SFnaQYMJ7z4uHRkJAiUdstzQSS/j2UGvy
	xQ7rYTcOIGJTMviFIkMJl44AGsmqcIf9fjs8e7Od2d3v14/QYH2mdR6wjnRyM7FEKPqxuXQer+l
	hJGRobOEecJBPK6tq+eBV0qwszvJCW2EGwLfMzXNAmhFxKu/3duTyqwuNQ5AfxMrY2rEyC7BDdN
	i8uofBdkpkXHO2z2dHUhUJCZs82oio3HzwccgZMXtFcX9VBLEpME4UASQqT5UpgPmEI8SGO1j+R
	f28zQPmJ5L18gElyNYvRoc2zaWQgwcRSrPm1pdHr1qENd+D0q4wgfsBqD4SFm1X/cQ69qexgWdH
	JDyXxPenqBpnB4uKThnUDlcSrNMCVFlh+eruWRi8SM9gBGTv7/xeuWspOCL2k6hqWGwYW31i8XM
	lPuo5VZ5VcbehQzkDJ1doyJfQv+t4SVhPOaHLYgSN6DaCRCSd+dAgg6loR4Q4fc3ng==
X-Received: by 2002:a17:903:2303:b0:2ef:fb1d:f6ba with SMTP id d9443c01a7336-2effb1eb67bmr48256615ad.14.1795090027248;
        Thu, 19 Nov 2026 04:07:07 -0800 (PST)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com. [74.125.82.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03c4f3bd8sm581735ad.16.2026.11.19.04.07.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:07:06 -0800 (PST)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1890313c88.1
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 04:07:06 -0800 (PST)
X-Received: by 2002:a05:701a:cc82:10b0:1b5:22fb:848d with SMTP id
 a92af1059eb24-1b543cb3e8fmr5039059c88.16.1795090024686; Thu, 19 Nov 2026
 04:07:04 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
In-Reply-To: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Nov 2026 13:06:50 +0100
X-Gmail-Original-Message-ID: <CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
X-Gm-Features: AclHuK_6-kx4dLzWCqgcpOPpfIaOLcQS812PG4RzKdcZVof6cGBPVfLtVtNaR98
Message-ID: <CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS ASM2142
To: hi@yasunobu.dev, Michal Pecio <michal.pecio@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yasunobu

Thanks for your patch

On Thu, 19 Nov 2026 at 12:47, Yasunobu Sakashita via B4 Relay
<devnull+hi.yasunobu.dev@kernel.org> wrote:
>
> From: Yasunobu Sakashita <hi@yasunobu.dev>
>
> Stopping a SuperSpeed StreamCam can halt xHCI on the ASUS PRIME Z270-A.
> The fifth Stop Endpoint command timed out after an invalid type 15 event.
>
> For the affected StreamCam and ASM2142, block URB resubmission.
> Queue all unlinks before waiting so xHCI can coalesce them.
>
> The stock driver reproduced the halt on Ubuntu 6.8.0-149-generic.
> Three FFmpeg 720p MJPEG and audio capture cycles passed with the patch.
>
> I used Codex to help analyze traces and draft the patch and changelog.
>
> Signed-off-by: Yasunobu Sakashita <hi@yasunobu.dev>
> ---
> Built uvc_video.o on media-committers/next with and without CONFIG_PCI.
> ---
>  drivers/media/usb/uvc/uvc_video.c | 43 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a92a986ab..0ee5a7d17 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> @@ -1885,6 +1886,26 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>         return 0;
>  }
>
> +static bool uvc_streamcam_batch_unlink(const struct uvc_streaming *stream)
> +{
> +       const struct usb_device *udev = stream->dev->udev;
> +       struct device *controller = udev->bus->controller;
> +       const struct pci_dev *pdev;
> +
> +       if (stream->frozen || udev->state != USB_STATE_CONFIGURED ||
> +           udev->speed != USB_SPEED_SUPER ||
> +           le16_to_cpu(udev->descriptor.idVendor) != 0x046d ||
> +           le16_to_cpu(udev->descriptor.idProduct) != 0x0893 ||
> +           !controller || !dev_is_pci(controller))
> +               return false;
> +
> +       pdev = to_pci_dev(controller);
> +       return pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> +              pdev->device == 0x2142 &&
> +              pdev->subsystem_vendor == PCI_VENDOR_ID_ASUSTEK &&
> +              pdev->subsystem_device == 0x8732 && pdev->revision == 0;
> +}
> +
>  /*
>   * Uninitialize isochronous/bulk URBs and free transfer buffers.
>   */
> @@ -1896,12 +1917,24 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
>         uvc_video_stats_stop(stream);
>
>         /*
> -        * We must poison the URBs rather than kill them to ensure that even
> -        * after the completion handler returns, any asynchronous workqueues
> -        * will be prevented from resubmitting the URBs.
> +        * URBs must stay blocked until the workqueue has been flushed.
> +        * A completion handler can leave work that tries to resubmit an URB.
>          */
> -       for_each_uvc_urb(uvc_urb, stream)
> -               usb_poison_urb(uvc_urb->urb);
> +       if (uvc_streamcam_batch_unlink(stream)) {
> +               /*
> +                * usb_block_urb() keeps URBs blocked after usb_kill_urb().
> +                * Queue unlinks together so xHCI can coalesce them.
> +                */
> +               for_each_uvc_urb(uvc_urb, stream)
> +                       usb_block_urb(uvc_urb->urb);
> +               for_each_uvc_urb(uvc_urb, stream)
> +                       usb_unlink_urb(uvc_urb->urb);
> +               for_each_uvc_urb(uvc_urb, stream)
> +                       usb_kill_urb(uvc_urb->urb);
> +       } else {
> +               for_each_uvc_urb(uvc_urb, stream)
> +                       usb_poison_urb(uvc_urb->urb);
> +       }
>

Michal proposed something very similar not so long ago:

https://lore.kernel.org/linux-media/20261115110132.2b0bda47.michal.pecio@gmail.com/

He also mentioned that those crashes were solved in 7.3. Could you check if your
device works fine on 7.3, or if it still crashes?
(Note that even if a workaround is still needed, we probably wouldn't
want to match
host-controller PCI IDs inside uvcvideo.)

Michal, would you recommend applying something like what you proposed in your
email, or would you rather fix this at the USB level?


Thanks!

>         flush_workqueue(stream->async_wq);
>
>
> ---
> base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> change-id: 20261119-streamcam-batched-unlink-fb4a6e39626e
>
> Best regards,
> --
> Yasunobu Sakashita <hi@yasunobu.dev>
>
>
>


-- 
Ricardo Ribalda
