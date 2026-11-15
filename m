Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823277;
	b=OAcpKfEaDBdh+iufgCBoq7zO8jJ6C4Em/j/kPyqtQXZgs+9WRVm+sIiZki8v7Eo13v2c
	 ga9t6utKhc0dm9EAsyhNUVYUAbKVCUvZANNMWR2hnJ5i7fLLuD271Uq/205HUdP/WVR99
	 y5PeejQJppXfyNeMxB0Zm3MtCUjaD2TY7QAON957i1MFfm4YHPG7KNar5EJ3/ECl5ExWw
	 xAiKmlC7DMKk5QktOHeUQP5Z/6mJpgOCny62QZb2sRpOBo7yvXH7LHuJmaWMkOkkjAsGA
	 y07R/f5ZPQdb+54gy2eD588Uw17P/PN1WA0bk09uuXEI+HUuhsOx95u1I16lzurzr6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HAPsj9EPt3xx3oOcKM0qxDAiWjAw9T5TeCGOtGfLqLg=;
	b=EADGw9xk62ldkzW5TFrF965HUh0cvP6czvnU9/yBLzwmxdNjU3O0Q7IPHzoRQSKzu1R8
	 hXcOeJ/XXhRGihQ0sfxRxqYU47Rm2DyqjDoQVAxEHxMmkX7IkaZ9hGByQQn9ptsk6Q+7e
	 E1VtXkBzF1HZzLtYBNVjoheLVobcetcDNRDr6jrbeWClD0NBp+1x3861k98oqOrk/nN4z
	 UY1lCvGTCznf7PlMPDF8ooytKjEWmTKvlXIrM+ecsK80Z7FckuNLbDwRFuvTHY/A9RlhB
	 DAUHxVROeMFiQf77OC0DFrjGSanzGkE5Z/SEOTC7SivPSyIMIJYDCWABSDL6aGxQhxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bV9SAvyc;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B2606A31C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bV9SAvyc
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922523d1afso1596232f8f.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794823275; x=1795428075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HAPsj9EPt3xx3oOcKM0qxDAiWjAw9T5TeCGOtGfLqLg=;
        b=bV9SAvycJRfeOYR8BIq1Be9Fy2zb8dvoTD/CZLfyMdaMIhqYAWlfdEs7nnWMPQK6SY
         59VF1W4oetFpA74tjXYeb+jVXg4rhkmv2jS0UyiikXKvatplOgW6EK6zQyKGBFGC75NJ
         DtjCaEudey2H2whw1e5tdv70hcgVLLwtSdp90FWpFmOZKyDt10wake8wgz7UkmIHjrdQ
         WZXKFQSh7x3PIHKhe/Dvx0qPY3s77iCwKpKfnNZxpIxMbAJiYEM0kQmveBI43Y92prmQ
         n9/WXtAmqCW5vIxfbZ3gBcw2+XxB/gqzutmy2UCIG59CZs5106wG50mvVcQFebKbhwfm
         eoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823275; x=1795428075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAPsj9EPt3xx3oOcKM0qxDAiWjAw9T5TeCGOtGfLqLg=;
        b=YJKTHUMZwfL9Ev+V5TD239RWIkr1ar3/CTTyhDKIiv5OMxYgOfDx2jkwMCMVkwpMER
         npMeFGhSOVpaEtnmQvxfZdRAqN4xuTPnJziX9xWRdYFSzBENZ5yxeqaMVaUME0hUyufC
         x9jsk6n3HwvtBR2tz4HcDklWpMFa/sTREXmRp6Kq878O3rjd6xWQ1b8gnyMkrs/0VTuy
         xzLHwEu1cxFT08/QuTwKBtguuD5RrO369vdxyVjgLHdxuR5uqEYaVHGuxE3mYQ0QKZ0l
         TMooax10IFHUw8u+nJy44y1nn07TKFD+ufKwMhBI5ILhTEdiG235vej8iSxzV8DDejvW
         7L/A==
X-Forwarded-Encrypted: i=1; AL+hErGQpfbk4iHv5FOZvJ1HEgaCMQmwy/yhd1BzHgdBjpBwgq845B8UYOvdukxAz3MG4RHOc34++i9uA3xqMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/vsHR6ahinoN8TnYmJsLdaRkpe3wJhHBO0qHOy+JHZueH2ujI
	2bU3kNrbSwt8dMkrGa2Hpu7TaN0lXqWOQq93XN9hN71hfe+lKc5MmO/4+3WtghKV
X-Gm-Gg: AZFdTZec0kELIqjce5yVFWsLl0A+06l0sgGaqs6Z8ly9Ct580cL8uXlBhl01BW/QKs9
	n06CjWZKQjKN7bGYnggzL0OI472vm17bTzph4keLDSNS1Pg18hmtNRbs0DSKpHitMhi/8hqVmP7
	5Wexi6voI4rXTc206yChKlV6cMKrHEMkyOMkophezgpjFUKYX/hxzssXLE8a7Kn74lp9kT6G5rs
	6KXy1cFmocawcdpLMtq03otc/jkRya47Bof98NqOTYxWEP8K3SwZw96pNnzQJ/4bUSxk+r9MUTd
	s1nto3kz55YvTxSyi9n6EJJFyO4so67/XHE8PuetlP9zfH4n0Nt4DUDiuGIsKOM2YBnEK3SQzkH
	bO46CE5aaIzm4gtq6UlXa1hurZuwtE0rCvE+7Pfd1a2UQCkkncKaNUBQT0kWTrZ9b4GcxdlxfZb
	e9s9B9ug9cM3OAAb24CLDDTzwFeFf5gXHAzU4sClmdOv0+4Er9Dy+1oioZekhqiUMjhJItlw5p8
	1+kW1eeti6/bx/ThPmDJs0BknRi0Z/+NCNfqHLEaRuwKaPZbZGAXMeheKPPKO/j08aCmnILHx+C
	PzKU1w0WmovmrHCs6CIeJtThA6Ex/Ljq4Y4D0Q==
X-Received: by 2002:a05:6000:26cf:b0:492:f6b7:f488 with SMTP id ffacd0b85a97d-49c6fc9dbf5mr23191710f8f.7.1794823274810;
        Mon, 16 Nov 2026 02:01:14 -0800 (PST)
Received: from foxbook (bgu85.neoplus.adsl.tpnet.pl. [83.28.84.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm22895243f8f.43.2026.11.16.02.01.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2026 02:01:14 -0800 (PST)
Date: Sun, 15 Nov 2026 11:01:32 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Jeffrey Hein <jp@jphein.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
Message-ID: <20261115110132.2b0bda47.michal.pecio@gmail.com>
In-Reply-To: <CAD5VvzC3ySh=fgdPsuftQt_C3kf8Ww5TYGbWTmx5E4S3FmaSbg@mail.gmail.com>
References: <20260331003806.212565-1-jp@jphein.com>
	<20260427083553.36ff4731.michal.pecio@gmail.com>
	<20260826134501.1726230-1-jp@jphein.com>
	<CAD5VvzC3ySh=fgdPsuftQt_C3kf8Ww5TYGbWTmx5E4S3FmaSbg@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

FYI, I had a *broken* Kiyo Pro available for a few days in October.
Starting a stream or autosuspend made it stop working altogether, but
it was responding to control requests normally until then. Under such
conditions, your stress test script ran at a rate of 2-3 iterations
per second for thousands of iterations without issues.

The only exception was ASMedia host controllers, where the script
triggered a known HW bug related to repeated restarting of interrupt
endpoints. Same bug is also triggered by toggling USB3 NICs up and
down and on a different USB3 UVC camera, but only if I slow down its
interrupt endpoint polling rate to match Kiyo Pro.

So I found no evidence of HW bugs in this specific broken Kiyo Pro
under my limited testing, but I found that UVC triggers HC bugs.

I'm curious if you could check how this camera works on 7.3 and newer
releases, because commit 7c0c31c66a7f solved most cases of the ASMedia
interrupt bug - it was caused not just by any repeated restarting of
the endpoint, but by repeated restarting while on a link TRB. It also
solved crashes of VL805 on repeated USB3 isochronous restarts. Looks
like some HW may not be handling No-Op and Link TRBs 100% right.

> - What has kept calls working in practice is never stopping the
> stream: an always-on OBS instance holds the camera open and
> applications read a v4l2loopback virtual camera, so stream
> stop/reconfigure never reaches the firmware. One stall under that
> setup was absorbed by a hub VBUS cycle with no visible interruption.

Well, that's possibly an HC bug triggered by stopping UVC streaming,
like on VL805 but with different symptoms.

> - The two cameras now sit on two hosts (Intel Cannon Lake 00:14.0 on
> the desktop; a Titan Ridge Thunderbolt xHCI on a laptop) with the
> same stack on both, so a remaining desktop-only failure isolates the
> host.

Not sure what you mean, is the Titan Ridge free of problems?

> Still open from my side: the A/B on your xhci-test patch. Is there a
> 7.x rebase, or should I run the 6.17 pair with the version skew?

Are you referring to what I posted on April 9th? Both parts of that
patch (fix soft retry after short transfers and override bogus
wBytesPerInterval values) are now in mainline.

OTOH, you could try the patch below, which is not in mainline. It makes
stopping UVC streams less stressful for buggy HCs and it worked for
those VL806 crashes which seem to be solved in 7.3 now.

Regards,
Michal

---

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a4399f..bc03e4b205e2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1901,7 +1901,13 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
 	 * will be prevented from resubmitting the URBs.
 	 */
 	for_each_uvc_urb(uvc_urb, stream)
-		usb_poison_urb(uvc_urb->urb);
+		usb_block_urb(uvc_urb->urb);
+
+	for_each_uvc_urb(uvc_urb, stream)
+		usb_unlink_urb(uvc_urb->urb);
+
+	for_each_uvc_urb(uvc_urb, stream)
+		usb_kill_urb(uvc_urb->urb);
 
 	flush_workqueue(stream->async_wq);
 
