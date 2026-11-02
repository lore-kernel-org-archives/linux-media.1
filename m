Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650427;
	b=H9XJ/lAaPT6cSNpMV469sQ3YLv7rTDmXK2GhMImhxwq9za8xuV4zE5yRsexhH1SqSNJ3
	 f1EGZmJyc5oXkFNhvGD8rCuGbz8tPhHO1f1AmK5L7VJ/EG+dzRmDHLy2i/e7auFODA3hT
	 mH0qMJPFJGf1i8DMwbaFZgnc+Hf89oWPTuZhbNQHwVgDfVCxToehZyZcRIt9ilODIyukq
	 l4fDphlykDvvTfJpDP+2/s45R+mp5u0rwhtnJlCtrx0KoVoP/lmGxIJflZ+A1hcP/j55O
	 5IyMX5KO6Wb9GD8kGqm3bXjCFs9tZ6XUfOqpAPSCHCaWUM4yBbY47Pc0v7cNhZE/Npg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Qc8PK8+/O10m6VtJJvpZberX9cTiU6oSN01rBzhKGIw=;
	b=jn62ZkRWjbw2y+u/cHvhnErTqiODSi3AYZ1ea/BofuZIc6TNqZvVKw1yy3kxHQpftCU1
	 +lk6vr+vxrDiQOERKKlpmlxM9nNApmdrV2McluH9v1H7G6POEfq3jvGbdoc5zkTUklJZ8
	 U3vO3nRYvA8WoyAZKLEkx9kCFYWRt3GO6kjEUmdhclv5qj7JMqjM/fzLnWm4HP07krHqk
	 NnOmE6d/nHiaWwHmLpo2ZKfgjJXoByLlzv8oEMQyuJ/d8x0hZfp8cSOIeA+iSw4nivtm/
	 KM2XlEDyCT9oKz4XItsjcBMbIlynxZqvCEN6DVX1/D3WxdcKG6UsW0piXFCV19ZjD3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxW3bpx+;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD7A606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD7A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxW3bpx+
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ad98c3fb15so29291347b3.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 12:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650426; x=1794255226; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qc8PK8+/O10m6VtJJvpZberX9cTiU6oSN01rBzhKGIw=;
        b=yxW3bpx+rF1L539z0piZy0xhtfIXhlEkuKT40jmhvy10wOGlqLgvwrcCHvB3JaXhGA
         icGslHDlPimA52iKv0a80fenRdnuuDspB9+ogzYACd/VEk6QTlgDC0ttfA2YCXW82uoR
         YNOuKP7FSeF8lEa/reEvB3geSSXzsgbCbg4hcJUvefVSajARHU8UK1dasvvNYGUVZfDC
         /AoiFEC6C5SIwUN2b3TWPlsrJ763OtJB/U0d2ECWuoWC/4wsaDOlcPh5bC9TeFRI4hnZ
         kJXmxbaxbv6yyY7JgUBlEBzrIZwMGGOMiFdRZJGgyXvknD0FzWGiFsbH5TtXw9BPCnT7
         zXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650426; x=1794255226;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qc8PK8+/O10m6VtJJvpZberX9cTiU6oSN01rBzhKGIw=;
        b=DgoYckj0Cexzr72li23ntGgs/4p/dUSv56BBRnPfStLh8+ZkssI4yPCBD6+9JI6nAt
         An8Ju4/2pVRNC1D3aiWnp2b2KqhPXBXoFFKSgeV5K5KNGemJPnUriWxnzlgc/+jqGRPO
         nx12TjPJf9qXSdxcOh2x8T/WH29vhqG1GR2XiEoM7noV31zEBLxCbYWJiZgkxvrNkhQW
         St1Umq6oGIdVHKmnXc+mZx3Elpi/HqvmKkovENKz69ljMrrOgfKkSzUSSMQsqZ14nBB1
         AlWWLPBU4I17MvDG1NVGK8UhCacdnjyMRYm5KSZqnKSF9Ie2hc9sGjBg7r1ijdJv3YMj
         f4sw==
X-Forwarded-Encrypted: i=1; AKwUvBykqFsPHXtbUfklO2SxroD8Dwn9DuJh7vTqSplDlxd5rxa5SbmIbgrFzndTG1oYJYSzWlsgIpgXA0YEwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/OpF8dUinnOa9hge5fo1Bi8Fmyh7wua99KKz/n2+WsarmUXkGF
	SUheal8SpzEPMR/IVVNnZYZE7kclNZwQn1VVa7Mg6SJRUQEtLDZwNqfp
X-Gm-Gg: AYBFou3wRgtkcaQpeUN73Yi+CJpDlLVjfYn80sXs1L8i6plsL6ThhPejC7+pBx5rnf0
	DPU6vnJneyDSX2Yww8LjuS5nYmMMFA4JY7If75nmIuBs+qg54X4fqCDENv096iua7b/tLREz0oY
	XhT2+Km94HMYJiGHLLfIr/+SdbDKvwaok3FVu3IZ+xV4amphB4l8RLBUwrmvRxyPddOTRmBejPh
	7W+66F/ARWxdgFCgChoFCsOKUT363uXzT36tOu0GCg3Jzs9zY5vLS0lE/mCkZROVp5Bi0wpzZ2g
	/OkLLZxEJu/xX5AgjbgtnheHf1fe2szuqTo5G9czt+il74+i3Xz+zyLLtTT2pOxF97Jp4Sc2K0E
	sPwxnKWKdO8pu3SVrrBJgsxHFoP3OBDNBvYlPwe6hEftgrpUEQnJ+V/01gAzAkj7w00L3yYkeXU
	QjFyvfYdCa+P3Tmy4FKU4mmKvMUrN3n+6FqC+mS2PFyaf+DPw0ycMmNuN2up3sVwpkyFIdJIWpe
	77Yd++sOvaASLUWOuCLYhP/U2N4yOUP0DWNsTpUh9KmLmPsKLp5AyPnwLY4r7WzGeYD0da+u0U6
	CmKlha5m36xFTLTJgUW4e5mChPGuA7IJTLXJkbGusWsJwDgUC8sLexC3DQ==
X-Received: by 2002:a05:690e:43c6:b0:677:adc8:b1ea with SMTP id 956f58d0204a3-67ba5010450mr6242676d50.75.1793650425680;
        Mon, 02 Nov 2026 12:13:45 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.200])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2aa655sm5705646d50.10.2026.11.02.12.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:13:45 -0800 (PST)
Date: Mon, 2 Nov 2026 15:13:41 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: media: radio: corrected comments style
Message-ID: <auju9S2V1Od_6Y_O@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Updated comments to align with the kernel
comment styling standards.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/media/radio/dsbr100.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/radio/dsbr100.c b/drivers/media/radio/dsbr100.c
index b8e0835a1998..87c37b4634b7 100644
--- a/drivers/media/radio/dsbr100.c
+++ b/drivers/media/radio/dsbr100.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* A driver for the D-Link DSB-R100 USB radio and Gemtek USB Radio 21.
+/*
+ * A driver for the D-Link DSB-R100 USB radio and Gemtek USB Radio 21.
  * The device plugs into both the USB and an analog audio input, so this thing
  * only deals with initialisation and frequency setting, the
  * audio data has to be handled by a sound driver.
@@ -19,7 +20,7 @@
  * Fully tested with the Keene USB FM Transmitter and the v4l2-compliance tool.
  *
  * Copyright (c) 2000 Markus Demleitner <msdemlei@cl.uni-heidelberg.de>
-*/
+ */
 
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -50,8 +51,10 @@ MODULE_VERSION("1.1.0");
 
 #define TB_LEN 16
 
-/* Frequency limits in MHz -- these are European values.  For Japanese
-devices, that would be 76 and 91.  */
+/*
+ * Frequency limits in MHz -- these are European values.  For Japanese
+ * devices, that would be 76 and 91.
+ */
 #define FREQ_MIN  87.5
 #define FREQ_MAX 108.0
 #define FREQ_MUL 16000
@@ -140,8 +143,10 @@ static int dsbr100_stop(struct dsbr100_device *radio)
 
 }
 
-/* return the device status.  This is, in effect, just whether it
-sees a stereo signal or not.  Pity. */
+/*
+ * return the device status.  This is, in effect, just whether it
+ * sees a stereo signal or not.  Pity.
+ */
 static void dsbr100_getstat(struct dsbr100_device *radio)
 {
 	int retval = usb_control_msg(radio->usbdev,
-- 
2.51.0

