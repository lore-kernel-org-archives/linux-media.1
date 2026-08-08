Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE273B27F0
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187139; cv=none; b=DEgbozbwloAUByCRO4IYbGrM0pQVPXaEIhtolqtu1cktlt1uNhLJhOSpuLnwbzwYfE7A/DEDVA8DFoz0e8VMcq1V+lS5BPKjv+nbOP9Ms6H6L/lFRDZmJ3/8d3AgzYXGNwbKqOAVIWFE1xP7v6X54KBBP5uocTEsizm4yzuXkEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187139; c=relaxed/simple;
	bh=ogdIvbW7aSb4932xDfimt07Z3LRdmf4GX30hP45/UL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IFJR/ToTq1BFQ63LNoG1tEwbyg6Ww5ISJehc53M4qRROpfdFjVm8IhTVbyo0RY0WYD41QUpmzS0+4wxyblrl+2CAnHVeihFbW+GBseVuKrW7V0UVRYn4tjvdm476Lc73wIg0JUE/8tuyjAJpN5SccigsR8qk5Pu02oWYJGl/EUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jdbe9jyU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jdbe9jyU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9e7391839cso322442a12.0
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187137; x=1786791937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vd3mCxZmxHBD2Xo74+SQgSYvrRmOoQOdDSC9aBG9aE8=;
        b=Jdbe9jyUHHCEz96IjgllbO/0jPqe5WO4S4irUyOAQbmMgBfgjHdSbOj+UUrrAKLIR6
         MpLOinJ4soF1X01DnQzt/d371EmZ6ZqmDzBBgBd8axUeM42oLutCmU175muF0AjdIOqO
         nllcIiYIzkf1aVrndDSssyDkI0lGluwWOVjZMk0kVef11TwETlYxlXm3w66wmnEXyM74
         KeahWTaJKpWw/Sf3UIFYgRm8613CfRONW3OTQl8ZhyIZJeoQ1SSsZkdcbj+H+BuABVr/
         e0CQsqf5oHS+61I4uG/hMHfXSj/YwnZCp7XgfYtm/V+bk1t4gWVkpo07Hkh5PDl/vvUW
         MMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187137; x=1786791937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vd3mCxZmxHBD2Xo74+SQgSYvrRmOoQOdDSC9aBG9aE8=;
        b=htSS1a3Au2ML8FcB9lyAAmKboVCTS6ASbIKkqlJGCEhUMSfwRJ/r/uPsL2L5l40+nr
         JHNkaWPGZ7txMOS7gkp6AeZ+IOLbWjQnMKMjTzai81jUL5G646STmUTolzeH0zuim9wA
         PrULuQRZDHMrETJPepVHl81QLVtUf0cxyHvJrx/9KsWd0qQsU1lxtlKe94eNz6SVmA4M
         b1DdpBQ6ahV+ei70ge12Brrmov49HcgREgwA1xZYwtqMOabh0LkKpiBNbDQPGCZR8Zj4
         /2Syq9m1uBc/RYcwqEaFsrKFeOTgxV4ap4z4PM/vwQTZo9zqAJi7xghiPu7cjq0mkvL+
         1TmQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3zHrMIQkYFnKVWt+qrtM++aIVE+T1QF4ZTOXmhwXxeGCIGktBz8nPVBXDpo80osPet42kMfEyX9WXzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTPewHEquFtmNzNm6d9u3sQslCR6LOmcdtmOLpBZeVvhabvDKr
	uliNWcMoBHf8AzyWuLUTfJm3XjkX5RnB5A+RsMb0lGWuriDPpvsTcNGQwyfUj4FzDl8=
X-Gm-Gg: AR+sD12AJL5of/wTJaHP8f1MjrL4+Ku1Uz3hT1Vf5Ixff+VLEBlH7KwReukzI/61liK
	Mfr/6ZhZGee/2JGR5nCVy9OYhGy2E5U7i0oMB8RtZ1AJXRVfFLZ/MN9e66o7U4EqvSKPQNS9HFK
	oKVhWbgsGvR3Hj9Nu98NEUcrS30NtHwFRffHLn2C1hnSeePWMvHEahEWmfmYnH5/JMZ+ZUu5Sqn
	qB00IPLAJlCBeStPZ26DPJXhH5tzb1/2W3EM+oK8yL3aVC5Lf5dQQp2hcw8FDyHpq3YsrnTQILJ
	R3Rw/VhlMy4qIitJKz9xDJUbBHeOLgJ+WKYm1sxYa7h7BVRkRARPIjg/9W9SZCaWqmGztwlZwQ2
	BODnwxFLcAtuer/fridwqRjZJ84gu8ugOHZP/xa+/KV5RS+Lalvk4BJyKfqndA6fJDfmFztpoH+
	p3mkA0JiSg+RcgI4WeUsDiJ5zVGeQzJp7mYHQU1SE/kAw7vmF2mK9cIfhqp+KzZDY033dI2VEzE
	SWLrpu3Wy+OkO0B
X-Received: by 2002:a05:6a21:6817:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cbc0490091mr12371196637.33.1786187137473;
        Sat, 08 Aug 2026 04:05:37 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm21643469eec.28.2026.08.08.04.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:05:37 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH v1 0/3] media: sun4i-csi: fix lifecycle bugs (leak, IRQ, unbind)
Date: Sat,  8 Aug 2026 18:05:26 +0700
Message-Id: <cover.1786184456.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While addressing an async-notifier cleanup leak in this driver, I audited
the surrounding device lifecycle and found three separate pre-existing
issues, all present since the driver was introduced. They are independent
of each other; this series groups them because they touch the same driver.

1/3: sun4i_csi_notify_complete() registers the video device and the bridge
     subdev before creating the media links. On a failure in the later
     steps it only unregistered the media device, leaving /dev/videoX
     registered. Since probe then aborts and the devm-managed context
     (embedding the video_device) is freed, an open() would touch freed
     memory. Unwind the registrations in reverse order.

2/3: sun4i_csi_stop_streaming() stops the capture engine but never disables
     the frame-done interrupt or synchronizes with the handler. A late IRQ
     after the block is runtime-suspended (on release) can access gated
     registers and crash. Clear CSI_INT_EN_REG and synchronize_irq().

3/3: The async notifier ops lack an .unbind callback, so csi->src_subdev is
     left dangling when the remote sensor is unbound; a later STREAMON
     dereferences the freed subdev. Add .unbind to unregister the video
     device and clear the pointer, matching stm32-dcmi/atmel-isi/mcam.

All three are marked for stable. Compile-tested (COMPILE_TEST) and
checkpatch --strict clean. I do not have the hardware, so testing on a
real A10/A20 CSI setup would be appreciated.

Cong Nguyen (3):
  media: sun4i-csi: fix video device and subdev leak in
    notify_complete()
  media: sun4i-csi: disable interrupts when stopping streaming
  media: sun4i-csi: add notifier unbind callback to drop the source
    subdev

 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 25 +++++++++++++++++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 11 ++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)

-- 
2.25.1

