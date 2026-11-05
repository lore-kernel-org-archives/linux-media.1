Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921016;
	b=qs7EQ3FkZMMCr268DW+ZSKYYO3LwW5LvZO0Sq3pF4z7N3JQlJUuSezRciS+I7ZarjluN
	 kbDbbYdxUyrvgOm3UvEEL1P4rqIpp5mXy/h7XC8bhv9SrHvxTjXG/JkSK/iKMXB9BsnlV
	 swUTFuHUkCoB6QrP1LpLDn1/t/WsQrqiNVyrAW7Eh+L/+l3RqILYh33GAJjvdduqC2Pjb
	 82QZnTzYFXrn6YA/TsjMegPotvqnoPLncqN/OFQzioRc3T1WgswUc5wrvsDD7xIY8hcHc
	 mS3lu7i8jP7cBqnGU/K3Zj0A2uqdU7B8CG4HFxbxD3gR6NeFGQgS3v+AfBTRDd9/kOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=;
	b=J1lyYlZS0G9a48qGo65DRJvTHjm7UH2mc9x3vkdmbR4/HQipF02H/5uxxrH2YQJ41xAw
	 07FpM/DCSAm9MniyGn7ZHCBZwSaiKkySjiXVzsw8JX78wWzMQPF82ibN1paLiTsk0HcV1
	 J2XxOLmwZWFSsOerFjVDpgwgGpjNHTiL+i6CZ7cKJAc8pcRbxSa2YCo76JpKc65UY6XOD
	 MV6yy1t4LUmR2oNuim2NAY62xoUvX5HIgxwog1/EUtOH/TYMA7g2JvcEYCYD1dzo47aqx
	 qlye7ZQ5CaaaV+IwaMKgFPHbOOgpuKmrB7EPcjb6AoTRdkpeNw/fvPWxOtMEbRnll7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwEhz+cv;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FF606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 248FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwEhz+cv
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0b6cae44aso17369a91.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921014; x=1794525814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=;
        b=lwEhz+cvmKxY+3AyfjBFSx/KuYZciYjwvWqjEpzgONTUQWMMjbGXC/myBcx3WrAci4
         DtXOMPIC6dCJaB14U+9KcT9yJs0B7ZFFnphmYMcJWbL7twfS9T50PtRp3phmaMufiDMH
         LLXdGtnC1zZRoprf7APyggElz6MRxkd/Hjfdu1dNfFnsuN4uStAr2OXt07yUsndQmNfd
         cQdtVjcYaZ1yPYsLhs0uHEDpJPZFbaE7HN4iuOPQGgorBhUUYthJKnA7G4osbEDGv9uu
         AoQfQrf75KCp4agb0EQ1ZrQDa1YoC+Tq3PjJ49lJxpaSjJy0xPn/s+4ap6/3x8DGBZ3H
         lP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921014; x=1794525814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++VDHdPlpTNkCnA4mn1+LWZP5PXeiA0pzKCa5Fy4gJ4=;
        b=ZOYO7+TcybyYtZG8pQu3Pya/ZPC/nC1yUYsdk0S4BLPgxyQj0OIJO7a1kiIXPvAzwl
         dTTDKnXsHsaUiWPh/4AoPE9Tta8TFSN6FVmHhzq9pWtL+g+Bn9SQBzOnvcxHeKYPPF0Z
         BvPvXl47n7tYGm+nZaVynyhkLhswFEk0E1DxUn52SdlBUXNGfV4qFwnzQR2ZgmJHZ2ht
         4+OIYMnh3sze1LEHvn3QiBJmcb8jrUw0tRsWokuKQ9eJNpcNkHa3zUsZgItGktoKuUSM
         KhyibztYNgAoXHgJy/q3PD6676ni3u5WuqU2KdP6z2/2kaY+vDhBqKG/24vQ0qZ57Z5V
         O66g==
X-Forwarded-Encrypted: i=1; AKwUvBzTtdCEyA48AVTPOje7lkF99p2QPawrN+WpwST6iouKJkZUAhID4BXjkF+YoPr/EV7Z+0Gh+BfSU8jIpQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8ycjJtysVs1FxG2YrIcwZu9DtqjLYn8wjlDJHXPaTqb4GGMHM
	INgJ1D4YmJjy4Yr9pSRk4HCq9N0ualNF3IpEVnHiDYlDEb6wJ6u8dby2
X-Gm-Gg: AYBFou0UbO94tiADSBhJj+6Oh2y6xLNk9YgwZ4d/PA2duSKO85kJymUiBdAZalf0RNz
	xG7FCppmJe2cxjRn71/9m7T1NZiqcPYQlO3e9Rxei94L3GBZP73c5H5KslTSw32FtykIOFktaGc
	zNiZ4boSiqebCMNXqgroxr7wiJ2kOqv2OCgWQ554bcXpDuRdTrDUf1o8ePdt8dNsGm1sygkKU8U
	NvllIODjj7c0SLyGIgDh+1Uh9iGoEs1sxOuR/4H36tpZdPcvnbWZLTGbh7lXkA0RQfkhLR9Dw35
	UuaGywbJ8HJbGU0/WhLRk4sYNh/7rvuEVMVQuAmK4aTlSgCTZvXRMJ52re0+laMymDb7ulJCL6Q
	v4kDx8pIV8IrGLX8asEwfjcemPzq6J0xSdxQTmgpNO4TLUDPl559JXH4g/apbH8UFVH3SldKSzI
	Hr+MMIY6mfdcboshaysYnCfNM06IX9DpaOpA7Aw0H2PY1GVYFmp9SkOLDfRP8vdc53VVMPDoO1m
	FBmTP/l5aQ+NUuopIzAaC6Jc0VKjqNMfSZcaZ9ZQYjyPDd2+kWaItAwtmjszRlvQvp4M5HhYgrt
	o2mOULhENFrC0IT07sx/+ZuQQIBCtOqhEQBwCM8SenqAOlRIISlNQcvfuY4wTsC5JXdhdLbm9+S
	0m5Ypt4Q=
X-Received: by 2002:a17:90b:2590:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b0db014274mr896768a91.0.1793921014532;
        Thu, 05 Nov 2026 15:23:34 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:33 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 0/2] media: rockchip: rkcif: ENUM_FMT and bytesperline fixes
Date: Thu,  5 Nov 2026 16:23:08 -0700
Message-ID: <20261105232310.385463-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes two issues in the rkcif MIPI capture path, found while
using the libcamera simple pipeline handler with a Sony IMX415 on a
Radxa ROCK 5B+ (RK3588).

Patch 1 makes VIDIOC_ENUM_FMT honour the mbus_code field, as required
for V4L2_CAP_IO_MC devices. Without it, userspace can select a pixel
format that doesn't match the media bus format, e.g. a different Bayer
order, and the captured images have wrong colours.

Patch 2 aligns bytesperline to 8 bytes, as required by the MIPI DMA,
and honours a larger value requested by userspace. This allows the
capture buffers to be imported as DMA-BUFs by the libcamera GPU
software ISP on Panfrost, which needs a 64-byte stride alignment,
instead of copying every frame.

Tested on ROCK 5B+ with IMX415 (SGBRG10, 3864x2192): correct colours
without any userspace workaround, and a stride of 7936 bytes accepted
and used for zero-copy import. The corresponding libcamera change is
under review at:
https://patchwork.libcamera.org/patch/28662/

Faizel K B (2):
  media: rockchip: rkcif: Filter enumerated formats by media bus code
  media: rockchip: rkcif: Honour the requested bytesperline on MIPI

 .../platform/rockchip/rkcif/rkcif-stream.c    | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

