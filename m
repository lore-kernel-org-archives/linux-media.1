Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851541;
	b=Rew1NN9GQiNGIfiS7siPnrgwaW3LQdC5DI4rdO66hIDof05D0RAQxXvcBXIHq92v3LmC
	 ld84FWkz72VYU0DvyNcIKa8KZ7UFA7tKHmnegqMUM74W/j1cOhgXWBszhdABGMahOVHQa
	 AEh9uFvKSw5WoHdDiuoYvi6aERpcfCebMkMmSxoelNqHIsY2L1XWdDgbx4Fbk4qqyCChn
	 aOGAR6wSJH3L9R3/RiHqJwSnJ65PQppNi9gjA65j5ZlkuSCAk9yLOTxQkTaWcUGJz9GRA
	 K1TUdaK1TbR+uxO2jn9CiZwRAf7t0fQcKYz/XEMCNSJ3OOxyIS7OQfsAYKvH+thbXiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
	b=KDGDqH9q6pbGz1rY8As3b5FJ1QxJLWawqtPvJpiEydUlU/BEYf5G1d4Ncj/ZPpyW1YCs
	 RMzhoUR5J+ZcCi/MBexNo3UMUwsf4kQOfgSjY6uNFO44Z9uVo2U04ZpY+JuDbzJG4O9G/
	 rx7r9RET3Ri70SlCyALAJnBBhQNrpb48uOqS0a00tScAa3SCyKjxmuBZ9Q6dYlNYBbC/3
	 92b12P3judRvSNEWtOMyAoGhktTop1aD985ovd8FUdTrhNnDpxLM99PXwlOQVEcolppoq
	 VV+nVib00y2TTiALFrQfrBIjN/k7LLfFSZWzsOzVkov/GacwXFKZnFRBFP04tBDTp0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C/3qvP62";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98074606A88E
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98074606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/3qvP62
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so13871935e9.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851534; x=1795456334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
        b=C/3qvP62ZW3XwZhzlMvPSTq73p2kBWmBNzJvw4KxhVyG7smi3XI5JasK+bjtYj5v1k
         FnobMzeQHR5zJsncPlX+JcwGXg7tC5Cgc/U6XNKcQ8t/rsFlIMHbhfAyQLBZ6Wqob3Dd
         w1ekyIe3VaUQ6cV6yDpxU8Dnb8TtSJQdnVveHFR2PPeQ+6UENTrN0IxBAYRKMUJcC6sk
         gzgvzcAUtXhC/YOsf0k2f1gz1tF0h5/7J7KOu53XQCJMfPiOlvkgCObS2zohWNztxiPn
         yHw9mT1Y387wM5Lz1HGQ49YTVLN1f/8unWfxMmNhLLQB8ZjK5rH4mCYxVhJOOyuYfBdv
         uc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851534; x=1795456334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
        b=O/wORnPCvZZ9Y6nzw65DuGuBHKEXGA6lmYnN6cRSM+yb8ZggwvwAxLKkVvDK8cYi0S
         bwdsiaOx/lPmcY2c3Amik+sycR6JDmaOlzFVewm4YfX/Kc4trGFQfEWIf+HarbY11wmH
         4lLdSkmUVm7FDwoVZOn5YY+DCgA+YZfVNm0Qy3bqk7bxnWubxnkMixdtu+7MtA9e5+sa
         0lp9NwlmqTVluvHZNLiysx/hH5RQqTuuo3CVmApMJHAEfo+D5ze3RazIIdNNhAwei6J/
         nLb2ZBYzrrdftLYgqE0dxPV+Ae4Ztx74rl1Z3x0HsogiWmX4cHFDVjolf8+wkqR2t83L
         basQ==
X-Forwarded-Encrypted: i=1; AL+hErErvGCVp4/Gbe39W0MtuHAnN581Ops9g4gJZQKvUWsAiktW1FzMRehUNMG+Xw1K9oXD3LduSZTj6K9kbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9zfRP9zmnp48hzTh8e6xHbXC/B2wbriErH1q/7W0m2JcPuYPY
	GFDsh6cUWscJDH+WhlQSZTw58TtL5daflNm9s4A5aFAxNgAkiokKxHjQ
X-Gm-Gg: AYBFou232DtiIINiPy/5k5Nye2pZ506iRKZu+8tRcR62TtV6/gDIL0GC4WUeVTbXU30
	0XHQ6Uy71GBGE1hnd3NNQNKPK+Voy0ndo8ajcMczjZwCQmfJHqf26H+8TjGtFlqttXmgbZ0UNp1
	hMpXaGXxIzxVN3/ci72dsiyYiqnWAnb8e1A0tvQxs9nlGsrls9ZTGPOVryAM16owX9Ewc7KOY/g
	s3Y5sleJWQd6I7C85FcRzqON7NVr0GwpordeRHWmM4Gz07XiVL9njkjH8y3cPA5Znw+nqvGeVp6
	J+GX7Dn8NJCPhdX9WI1tjwAkk8p1xe1RzygRJxs4fe1QKqB3dFpG41YqNlxIm1z3HHKuqJ06nCm
	b179x4xCalVjqNAS+rtdb1PaieuNlcEWnJbiFVEK5nyr/XwocReJ7fGF0xy/jtqxV3sVyZ0bmJh
	4ZCi3I+6CBJ1BQIq0L9W1noYH0rq29wNq05U8zpIWRFuiLEtdNRB511mx1PRaYVL51c/kh8JUIR
	UQ6cAqDpYErAPxxxB26qNxD4fry0Inm/tBW2o7CO7bn8/Izba5lFwzlIsdA/sR/RQ68C2+jOgse
	XGWKjtGTF6ghVbat4HeyolgPsFT2oFo2Mkaob6AsmUbSLg==
X-Received: by 2002:a05:600c:b86:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb55a67c61mr252740735e9.26.1794851534022;
        Mon, 16 Nov 2026 09:52:14 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:13 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
Date: Mon, 16 Nov 2026 17:51:50 +0000
Message-ID: <20261116175151.20150-3-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175151.20150-1-volodymyrchapman@gmail.com>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
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

Add the ACPI HID which the Lenovo ThinkPad 10 (20C1/20C3) uses for its
Sony IMX175 rear camera, with the 320 MHz link frequency supported by the
imx175 driver, so that ipu-bridge creates the fwnode graph for it. On
this Bay Trail machine ipu-bridge is used through the atomisp
csi2-bridge.

Tested on a Lenovo ThinkPad 10 (20C3) together with the rest of this
series: the IMX175 is found ("Found supported sensor INTCF1A:00") and
streams through atomisp.

This patch was drafted with the help of an AI coding assistant (Claude)
and tested on the hardware by the submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5e419c7b9..880b06d71 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -94,6 +94,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 	/* Lontium lt6911uxe */
 	IPU_SENSOR_CONFIG("INTC10C5", 0),
+	/* Sony IMX175 */
+	IPU_SENSOR_CONFIG("INTCF1A", 1, 320000000),
 	/* Omnivision OV01A10 / OV01A1B / OV01A1S */
 	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
-- 
2.43.0

