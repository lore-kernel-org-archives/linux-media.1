Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570332;
	b=0E/tox2InM1crKS7jHFtdHRoerJgSmX42UCOYmYR2mYMpcZuLIjKzY1mRWLeDxnVv1A0
	 4jQwaruiR37lOwfxhsR7ctpuo66PRIJhITdk2Wdg9416b6M+58mYR7VbbmwAOZP9gHma2
	 YAM1U0K6hPSc+UBJXTvOrRwrmNeox9c5EtYWIrG1aeE7yD5IbTzNjEXkJfClSDmA3Klt8
	 //Zvd9IWiQBhCr0OT+hN8RFY3AcCmE8Cm1FeAH5zS/hpqwcDM1k73yr2nV8IsxMX+FKdQ
	 rDL8JEqvINUMIYrWkfSoM70h/pJ2UQYmblvee7EHJYaRF02pUUXlBQAv3B4Qs28CX5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=8FnVDeklpgH5D1UxB4Hf6R3WJOIkvjDCIubRgPnYPDw=;
	b=xobiLIobf4+R525HnFUTMnCvAQpk+xtEndEhemyeAQYcMl8pNkihVlLEMMFNs3XB2i3r
	 rmp4K5cVjlOtwp9o03PaG6UwCL73m7b87u3BoGK58ET2U1WzwWTGYXRYsYH8vg8UVt52G
	 lUKL9nQTqna3C1WSBTkdhbzRoCwqXKfnYwnmrR45932OUCteUph7R7mDo0URwfePUGuJP
	 x/AZ7XGm/ElgYz/wMOLGF3X/roKBcnJoKLSuR9jXKozgsHnBGoY/a/p1L0A8g+p2F8tXz
	 rzsbwlD9LtN/gMcVTIhuU8lfnDndps/PlAjO5PuXRDeEazjB6V9cjYHEtJXd2alFWDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g8/Q8Efo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C05606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 01:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C05606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8/Q8Efo
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53ec2cc397aso2688168b6e.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 17:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795570331; cv=none;
        d=google.com; s=arc-20260327;
        b=sqzOFiz8/5Jbs78PvRmhxQc25R1H3obtdtvPceJEL/LIKuw3NQCgQxzV7mybkmntNx
         co9w/lAXFb42oM+aPwq3JLewpwS2abl31WdafNbSBOHlu/WH4MZ29xdhcKvY7/1BlB0i
         qPnWYRYxv5Noi9HoTnDhmTbp+CBAs02xmRWv1qVM6OdODxQ4PyxHekbwxojvbxq6npoH
         wHh2npKJKkcdLOhe3LRbf/9y+GS0KqFE9HGoa0pps2JVOyAw6Mm6h3NPZGfLG1Ztsc5K
         9jBXrgfp3tYrOp7hQ/gZ0jMv3UKX2p7Tx9yg+BjtZ6lghIywR4APxW2Kl/k1zAlEaSRf
         cVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8FnVDeklpgH5D1UxB4Hf6R3WJOIkvjDCIubRgPnYPDw=;
        fh=Za0JxYqIh047OEZ7RgbJrMjwMXcvBB54DitIt+ELIHQ=;
        b=Q3I+5nt3RJekFyYdpr/C9JtBOK5oQexB7GJdgzERWb6iKs6Y0dBZlgCQy89qo6g2fV
         PFN4dUnlWysGxR2vLXa92NtLz7Q9eXCiJWKp1gAz5uyCfP93rBlMjs6EvFeG8DrAGf7w
         ncOLTVUw0Vdiex7BIy8GmHi6PacwRVNKeUlqLYfPWscAaRcFEt4VTliCkQfgcs39SsDI
         Tt0MYiKFNX8/Tikn6hcmVOgT0YT+t3KkXFBXqFkWQaNNgOVcBF6gJdkVecL9l5yALmKH
         m81TegLVmAb4zRrmj2MmzooAkLn3T9v4kSFLZ0YkrtV0kyjiVfV9jnsbnpYkYoKsyjO6
         Lg4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795570331; x=1796175131; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FnVDeklpgH5D1UxB4Hf6R3WJOIkvjDCIubRgPnYPDw=;
        b=g8/Q8Efo/QY2t7iLRiBM2vGd4lD3jX3bMLOA67AIhFcc+dAh3swlSROYMvtrPipPqQ
         zV4YeMjAHOz4iEQ4QJT77Ufmk2WUC2YXhUQgcByluKVKHVWcD4CEARoPu5VTj7XluUqN
         OSJycq/eyQ80HB1/HjZlXbAQrT2+xfOjBAES9D5qlqcMqPovrxs69qXZ8cfSvg1M/CJ+
         Qj46v+42VhPtSSJTupr1mjZZYBTooFyKeZ3NIwbsD+VNkKbxIuBn7Xajbu1ongu0gwOa
         gWuj/eIkY6Z0joFKqYdyaclySeeF/CRApOdEZceuM6Bm3nEJjq4rA31lC34EYHXE4Q8K
         mr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570331; x=1796175131;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8FnVDeklpgH5D1UxB4Hf6R3WJOIkvjDCIubRgPnYPDw=;
        b=dOqSKcGruZCd6bu3cETaNs79Q+AoCUpIBxv4u2ry22i2+WTRk6ndaaR/r3l+Oyr97m
         t6TGUgVOe2FPMPUz8vXf5OYyQcAp+SihZeiacwhdWAbHXJGv/6dsqblEuUTHBl9OhKgC
         ubE9lH13vPtBrjgtbraB6V6SDd2avIz8B+dttG6iJT+gXCM9Gk46nNh7aOdN6LRUIHAA
         cMrx3jtF6ElRbhY7Gk/R1JPUhu0dKocmtk4MLqW7DHjUB5c+L+mzJKV0Fe1ziskkkbx5
         5IDBoiq250NjKa9KZ4GskoiIYaUrkUFrrgPvJ4LZ9OiSVe6L/MN7oyzmTzR38VEAxN38
         HnVw==
X-Gm-Message-State: APuU4Z/ejeE3+CQrQUCiwua3F9nUk+HIwMAU5hwGbtVrTZn+l9dY//7b
	OHL1hw0nmMHAUfcmDT6jUvC6z3dAwFDuFtmZOZaEJ9z/nmORx2MPV4uEFQrm08c1iGMubOfSTtt
	SBlrVU7x8ASR8+5qLs8Grqcg4u7YpZalnSOEhVu/wmQ==
X-Gm-Gg: AZFdTZcgE7zH9iqJkW89Z8hEJskYL7sZj79EGwf8csbUt8dfXhu5I59tkHU8vrEVqNu
	FdeLF+dKFN4dJoV+wJf3lfkeJkwxBQSMAhH4++TM1jCpbpWVuyisVIrNbheXTXKGw3TNqDHv4Km
	QuYcAWxCuWWnXdxwDo810K1q6hwHLVpeu8xgKTPwiv0htrYIoChEJ8rvM69hK+OiYUTxL9f1j/f
	yqMANafwjqt+2oPpHI3BOnuh1QGBlw8KmpPvjAci944cXFabuW/QCXPn1JMqf9xxsD/nDfxcXGk
	hEm61juf85pTpVFR1YUXvHDtMAOHl9BdpvkpvvX75XUhQkvwua68naVCSsPuuxEI3uD8O2WC7rL
	Px4zoLlYqxpF8Q7OuxwJp7Q2wPTO3iNuaQI0+24A=
X-Received: by 2002:a05:6808:199b:b0:4f9:bc36:fc5d with SMTP id
 5614622812f47-57a0ab2f5eemr19573068b6e.35.1795570330996; Tue, 24 Nov 2026
 17:32:10 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Nezul Tairus <radwolf.83@gmail.com>
Date: Wed, 25 Nov 2026 02:32:00 +0100
X-Gm-Features: Aa3M54obOpD14v2Fd8jkY163YlUg3yO4b93_9ehsx1kxfTOPxSdLbRZ_Qjs6wiE
Message-ID: <CAFDWN6LPcz6CBOZzBVN-VbCce3g2wOrPZ8V45_=8xv16VCqzsg@mail.gmail.com>
Subject: uvcvideo: AUKEY PC-LM1 (0203:145f) gets Auto Exposure permanently
 disabled and VIDIOC_G_CTRL returns -EIO
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org, laurent.pinchart@ideasonboard.com, ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"

Reported in Bugzilla as https://bugzilla.kernel.org/show_bug.cgi?id=222325

Device: AUKEY PC-LM1 USB Camera, Sunplus, ID 0203:145f, UVC 1.00.
Host: Ubuntu 26.04.1 LTS, kernel 7.0.0-44-generic (Ubuntu
7.0.0-44.44), pipewire 1.6.2.

The device does not answer correctly the queries the driver makes for
the exposure
controls. On plug, or on the first open by the session manager:

    uvcvideo 3-1:1.0: Found UVC 1.00 device AUKEY PC-LM1 USB Camera (0203:145f)
    uvcvideo 3-1:1.0: UVC non compliance: Error -5 querying master
control 9a0901 (Auto Exposure)
    uvcvideo 3-1:1.0: UVC non compliance: permanently disabling
control 9a0901 (Auto Exposure), due to error -5
    uvcvideo 3-1:1.0: UVC non compliance: Error -5 querying master
control 9a0901 (Auto Exposure)
    uvcvideo 3-1:1.0: UVC non compliance: permanently disabling
control 9a0902 (Exposure Time, Absolute), due to error -5

What changed in 7.0 is the reaction to that error.
__uvc_query_v4l2_ctrl() now retries
the master-control query MAX_QUERY_RETRIES times before warning, and when
__uvc_queryctrl_boundaries() still fails it warns "permanently
disabling control" and
sets mapping->disabled, which only adds V4L2_CTRL_FLAG_DISABLED. No
value is cached
and __uvc_ctrl_get() still goes to the wire, so a later VIDIOC_G_CTRL
for 0x009a0901 or
0x009a0902 returns -EIO again.

That gap matters here. The intent of commit 649c033711d7 ("media: uvcvideo: Set
V4L2_CTRL_FLAG_DISABLED during queryctrl errors") was to keep a
failing QUERYCTRL away
from userspace. The goal is met for VIDIOC_QUERYCTRL, but not for the
value read, and
that is the path PipeWire uses.

Consequences measured on this machine:

- Streaming is fine and the image is correctly exposed for the
available light, so this
  is not a dead camera. /dev/video0 enumerates MJPG and YUYV at
640x480, 320x240,
  1280x720 and 1920x1080, and ffmpeg reading /dev/video0 produces frames.
- Frame rate never goes above about 6 fps, which is the camera's long
default exposure:
  60 MJPEG frames in 9.56 s and 30 YUYV frames in 5.40 s, against the
30 fps the camera
  advertises.
- Userspace: PipeWire's spa.v4l2 walks every control to build
SPA_PARAM_Props and gives
  up on the first errno other than -EACCES. With this device the v4l2
node exposes no
  properties at all and the daemon logs "spa.v4l2: error: Error de
entrada/salida" at
  v4l2-source.c:323 impl_node_enum_params(). GNOME's camera
application shows no image.
  Rebuilding pipewire 1.6.2 with commit 458b8b18 ("spa: v4l2: keep
reading the other
  controls when one cannot be read") makes the properties come back
and the camera
  application works again, which confirms the failing control read is
what breaks
  userspace.

Source history, checked against kernel.org:

- v6.8: drivers/media/usb/uvc/uvc_ctrl.c already queries the master
control, but it has
  no MAX_QUERY_RETRIES loop and no "permanently disabling control"
path. A failed query
  returns the error for that control only and the mapping stays usable
afterwards.
- v7.0 and current mainline: both the retry loop and the permanent
disable are present
  in __uvc_query_v4l2_ctrl().

Suggestions:

1. Do not forward VIDIOC_G_CTRL to the device for a mapping already
marked disabled, or
   keep the last successful value. If the read must fail, -EINVAL is
what userspace can
   skip; -EIO looks like a transport error and is fatal for consumers.
2. Consider not marking the mapping disabled on the first failed
query. 6.8 returned the
   error per query without disabling anything, and this device needs
the control to
   survive. I cannot boot 6.8 on this machine to prove the frame rate
difference, so
   treat the 6 fps as an observation of the current state, not as a
regression claim.

I can test patches on this hardware and report back.
