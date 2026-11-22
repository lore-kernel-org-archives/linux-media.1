Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327479;
	b=LpdvbskccLdGgvKlDXVOsQl2vU57tOohAMwGYvXuUrfdoTqJCY3b/Qj+wQpB4v9mnt+0
	 rUUAU2VGjL71X1sCNJpz+ow4W/DKnXGRKDbFDelbJEDyApaJuFsmaPshsftArqxgAE3Hu
	 211CI5PNRQuafKWjxnxJxuZw4jsS0oxtkcsxKb+Ckd3IjvDCR0YRpn3rmVG6dmbpyzYG/
	 2Ec3eHTayNtYTR85SlP4qtVt/pPp4G0Hqr+XQEbHYooHg/FKk25q9wN3SBM/Nqx5pkR3v
	 w0xAdwsUU6QnZrw/VIzWKWPc/VDti5xC3WchNtURA3m2COXLYaqBGr0IUQMwLraCbNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YXKyVQ+76/7q5c8PfbdutMsRsLibNeBsWkcrh/eq+Z8=;
	b=H1m+xlvcpDWRTJGNrXdvtXs+4B6mEFZ8erUccuX+aL4bqlCT7+sezkxurhkeZg7DMxgA
	 u7M0LWE9IYyYOB6w/l5hYoOSZhSmIqYNF3pZcg8556fd/34usXiUo9whJ/BGc+tbZ/01Z
	 DufezUrksyfXAUYOPUcOboSvKmS9H1ygWTzoOnQG2+byEWKFNUnQI0lqor5gWkaZSIa2p
	 mhzkJ/w7D/Fu8qtlq08Pq6xZb0Z7FnuKVa7iaz1LsfLCn0PO5aw2BaAN+o+cd8f04J3ff
	 6FY2Za9uExSHRjT+dJDmlZDoBTh9AFXcuVRIcRzt+eHej4TlH990xT1IeFZnwTUX0vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NpVQj3u0;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A687606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 06:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A687606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NpVQj3u0
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so5075331c88.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 22:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795327477; x=1795932277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXKyVQ+76/7q5c8PfbdutMsRsLibNeBsWkcrh/eq+Z8=;
        b=NpVQj3u0DgcyeAJxGv4P5X7KV/zluSwFGJNztpLsrvXusEWD5jjNSrtiiCx0yFcl2K
         0HHqosJoGNaUq73rNWBdyMFXFxNlpjhdlpot+gWX5iPSGMhxTJleE2YwbTVkzq3pO37V
         Tb7OypfIZpxjn7upzNb5HD2i4R6YoNPJ/9Djx+fTxVwEDCat0Wz+r0sTxy/XlNEsnlqn
         y+OHwX9zmzXBRyhiBktY9PlXD5MlwMoLvqoZL+1n1NlsiC2WeUcP4Szulz12Zu1dxYR+
         AhP/kUCBAioNAd/n/7lQd14/+xNrzXmWeMzHDpMQnWQqqUAMl5wyCQ13oU2nWf6SUA+T
         14XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795327477; x=1795932277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXKyVQ+76/7q5c8PfbdutMsRsLibNeBsWkcrh/eq+Z8=;
        b=V43aipiVtXkPEM5+oH8DGQEyrXN8od8YhznyFHqs6pPrQKu4dkGx9OnezJUrjTMI3S
         Ion8AzSuiAIV5cPSZdJ2Ug+Jkb+LXN7DfslRJlkdJWl/YbOb68K7Px3NwEt2BSAvIEjB
         PGMRFRKNI8wqVxQc+mPGMs1RpTyjKbfTq68GFX6KMoEDUtug84NuxTpteeGLRU7z7KiP
         Z6UAm/FNbHYg7nd1T+Db/N2mixVcmPB/6xEzgIimK09u4tNYK6d0b/6uVNk0ohiGMbVM
         PqMlZMdMjhe5nmWjvE5eZls5BuDaGjLY2ATUGo8xy3rcFsZ8T3ajyoD8CKqHlI9y8auJ
         uYoA==
X-Gm-Message-State: APuU4Z/k1T9WOq2Z1iqAbEbScNuO0XMgzUijK580bQIuQEztjqIYZ142
	wUeNRk/nryl9OPTVNG9WERIlrWOz7ds0KEMz55oPmBSrLpqD9Z6ZZeSaAuk14XCr
X-Gm-Gg: AZFdTZcSD8zRE76w/rZcWF8Hr6ck7QdDUvwm8B0qzYa6I1qo1UGiu0CWoVu0QhkTHPh
	jE2YI4jqKs6NB8/wwZqpDpy2tuUOkNLCpYe3Y75BY74mKzwrtvdCd1LgniAd0BjLeJ2x/PtS0qs
	t5m0qeH96EM8esj1Xg7jxby3zCKHOvMTW7+Pcv4s6VPgJc2NJVFO4nlW8CnWlO9y38ujvPawG9E
	2VdGvCedrDX4ym7KHR7DlMvixQOpsBVIrwJXnIHU5mTEQDJ30LLV8JbQ4bB7RhgdGwltHIHnTqF
	fLD32S0bnEE5gjf2iFeI8zo8j+L+cqpzkvXk4nOLQswGdbDg+gteexBwIklerfFlFRGYlSy5rKT
	LKklKNeVfKtRdgwtCBJckr2XuZ/bgl4/5e7vqJavXJ6g1jZgwZee0xYu8PyGfMU/X6am1PHUYa5
	ZuoWz9yz0ZKpR1suibPrdFpdqxwTqJygYU1vdKsfwL935wbQ3CRI++WwzgCCJOIUPTBOOAmwe3M
	Pt7JcwUyocTvOwJeVXaVuqV6ZQ0YFnnww6xr2bw4JLHSpoPKIn+D501P42I4DXtnXIKYQ6UAutf
	xSH9/woQ6iOBiOi9eenKttAeRLuKYHhIUJ2miW8xl5jd5eMab1yl1YMgMCHd85iBduDp+Q==
X-Received: by 2002:a05:701b:2087:20b0:1b4:fa58:9d8 with SMTP id a92af1059eb24-1b5568e76a5mr8112580c88.20.1795327475924;
        Sat, 21 Nov 2026 22:04:35 -0800 (PST)
Received: from hp-envy ([2407:7000:b098:4a00::6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm26704718c88.14.2026.11.21.22.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:04:35 -0800 (PST)
From: Parmjot Singh <parmjotsinghrobot@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: uvcvideo: skip GET_DEF(PROBE) for HP True Vision 5MP
Date: Sun, 22 Nov 2026 19:03:08 +1300
Message-ID: <20261122060309.105714-2-parmjotsinghrobot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
References: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP True Vision 5MP Camera (04f2:b767, revision 0.05) was observed
returning zero format and frame indices in GET_DEF(PROBE). The driver
can send those indices back in SET_CUR(PROBE) during initialization.

Use the existing UVC_QUIRK_PROBE_DEF workaround so initialization
reads the current probe settings without replaying the default. Match
the UVC 1.5 VideoControl interfaces used by the color and IR streams.

OpenAI Codex (GPT-6.2 Sol) helped turn the reported USB trace into a device
table entry and checked the reported protocol on both interfaces.

Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>

---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc145697..99c28991b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2754,6 +2754,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
+	/* HP True Vision 5MP Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x04f2,
+	  .idProduct		= 0xb767,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
 	/* Alcor Micro AU3820 (Future Boy PC USB Webcam) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.56.0

