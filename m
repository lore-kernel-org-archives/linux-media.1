Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851539;
	b=azLJMszBzIaAei9n7412EbuRrj9q5lWSAz+4Z1uPbHbvfW1j1rFT4fPXP51Zzm1FgYM2
	 CgqqxuE+EcaoosGy5aVwrKXfqNFJgedwA5OAV/0scSpGjVp806l1cr6gN4MM6x11VWcMn
	 FzteZLUebA4D8hpT8poz5NJP9SPW8zwoQGUTeKnoiE4VNkDGCtLSPioip5Vqegm2Zh99D
	 jpNJbze/TQvRvyBRAyQCw6nil0Mp9UNOlj6eXmqxfrqUazZJDE+/R5c3Zf5Gu8v4Ih9US
	 NjysfIBBx0n5e3jQoSJL8SNDg6boIeb7iYWgaVetYCpJmU99yqJ0X86bpGDUT0FXArQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Mybi2FfPRDyfDeC5velKUxV2mvI+QkF0VK4ji6bNsAQ=;
	b=P4wLB3Fyo80RwJYvcSgjw+r80VX+P4PEnWzJWuR0oZslBT6dN9VcQCDVJUbQzqpLgmVB
	 YaWmli7wnYz6ttyEaeK6Fuba0bYe5651sbHQU7Vc5pGo+GcAgMOVKPYG+iRi5un0aNytN
	 /N3Hrw29tkfPkrMJ5SDhkqRMu4OpTLW3+mttfntrO4llWeHISXdLjIiYRl8easrjid5jX
	 9/jm+bvo+lCQAHkXAyNMW7WI0FC5Fqlib7c/D+RbJ4GY1jN/7hgYsrpEZsCCKFDQg9nhL
	 xZHjvkk3zHIk4bz0U5cZqVRbojSXEjVtLee6xOHputhuWFsnena2lnoz9DWB6266FUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Cw2Q5Gvc;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F42F606A88B
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F42F606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Cw2Q5Gvc
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c10dc41270so3988767e87.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851536; x=1795456336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mybi2FfPRDyfDeC5velKUxV2mvI+QkF0VK4ji6bNsAQ=;
        b=Cw2Q5GvcXZUXyFxbX6kvaiwwK598oEfKRBEXZdMVZC0iMeCjklHqbLQPD3+pMYTQS6
         Hh2Ggh7R5gORayLRumN3cY7exJhza/VEiwSlhV94RgzqRibrpAgxYNXigvif9NOrqJih
         AVNFxlvvgqv3wzcmG7RHAmKjPgMzR58vwx60E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851536; x=1795456336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mybi2FfPRDyfDeC5velKUxV2mvI+QkF0VK4ji6bNsAQ=;
        b=n3n3tuteI5EBl2RCByOET1PA1kHXWgotPVvQujHH/icMD8ctX/Yc/T/DLmeaqa2YRt
         v7k1tW6iEDLug387nbJ4JqzXCtck4wUMdSm9TTSnv3yqLA9vyhmLUm2DhhJUXOjUMoZ1
         q0vtxOBLYdQ98j1qTt1nkU9c3C6nU1CYe6xcr24XHz1p9Y/nXO6lMxZ+Y1fimdVP0NoK
         mFInzdEfxAoTYcFR7TLuZL9vhb2H+dyNKHVOxUr/7Wq6etPXpdL20bNzAXUOvTVLAEwA
         a4110IVEB2Hoxgu117ix4/Ska+SXIGB/hLesCFbBRT6irKoOiRVD3gM0YZ0LG4dLOHEY
         QNeg==
X-Gm-Message-State: APuU4Z9PWERJQg3XBOrzb7THrIYdqKIwnbkuju0YEnaUt7rlMqYOtVEb
	XsHvJafKZ9VwI8hcxg+jfBR56j+9drklOemuW2/gssmsD6VEsPl36pyFlcTEB4b4rw==
X-Gm-Gg: AYBFou3iZbazG814IxcQdK8zVSO1kgNmFMiIC+jhW2Gq9wZ2l9nUV36JHHlVLlM6HA4
	YnqXuhIiog/2R+JK7O+/7IefH+6ehMmMf9h6xazp16NXXUvD3ehri2i2pJOMKfQb+avNEsicLBu
	iV63K6y/BAARxqVDHjRVOVRKZh0h+sz9a8ArbU/R0sYMZdUh1BcOoRYRJenmdL6UQhXLir4C/T9
	mFI9hCl5sb+1rbcBny5ub1UEvSwbqnVxdptxHdyq1PWoRZu4Wn/zy7LSEBwpViu4w2oIEINHudm
	PJW0mdEIThGm3anbMZt7+S3qtpncQiUsMgpiEEZt2BFfTBrSulorFbwQBaZFJquTTb5slShFVIT
	/vf5lIWJnxewyxn3seC92SagAeieFwwtZeGoMdAsYFaqKUdcf5iEtLXbx38kQ8jvsgrTFdEj79F
	t9WqESW28J2V5DRA6oKRqeL2iEqhhcvHVsvJkxxenJlBwU+YGJm0qQfe9JJByQx7+WFzZ1DpM38
	WNBd2K41Qqkg1TxszcZJNhjUqIW6bOniOXrwnNy8zbo6DwRimqSEvbgXz53UZtgnvjUZ0pRatIZ
	Jl6CianWigjY/5gAthdeNbkh5aYTHOAP+tWhw+90cvKGt9Z66iYIvnj3KZBGWGJla+M4m7HBk+s
	GS6om86jfgw==
X-Received: by 2002:a05:6512:3345:b0:5bf:b603:365d with SMTP id 2adb3069b0e04-5c1709d6b21mr4184157e87.10.1794851535707;
        Mon, 16 Nov 2026 09:52:15 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:09 +0000
Subject: [PATCH v2 2/6] media: uvcvideo: Fix unaligned and OOB access in
 uvc_video_decode_meta()
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-uvc-shortmeta-v2-2-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

meta->buf and scr point to packed metadata and USB packet memory that do
not need to be aligned to anything, and store little-endian values.

Also, scr + 4 is a 16-bit field, so reading it as a u32 could
potentially read 2 bytes beyond the packet.

Last but not least, the old code printed wrong values on big-endian
arches.

Fix this.

Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e801874e272e..8bae91af03ba 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1542,9 +1542,9 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 		"%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
 		__func__, ktime_to_ns(time), meta->sof, meta->length,
 		meta->flags,
-		has_pts ? *(u32 *)meta->buf : 0,
-		has_scr ? *(u32 *)scr : 0,
-		has_scr ? *(u32 *)(scr + 4) & 0x7ff : 0);
+		has_pts ? get_unaligned_le32(meta->buf) : 0,
+		has_scr ? get_unaligned_le32(scr) : 0,
+		has_scr ? get_unaligned_le16(scr + 4) & 0x7ff : 0);
 }
 
 /* ------------------------------------------------------------------------

-- 
2.56.0.679.gc527c65306-goog

