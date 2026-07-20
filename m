Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDC43D51D
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565518; cv=none; b=cNGCBP6EhERW4xojs1mK3Qln+OzJP+TeLOZGPebk1enGNTXrMNf/DbOM/rtp96A8kSPsFJ48oy8lFI/9TEpqYlQ8uM53OusnQjvg/gmpn0DkQTK4b+Pyr6gMgzrWuMNW4IpK5mL9v/CpBa135QpIIFuUUYAfykzQZ2mifBzTV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565518; c=relaxed/simple;
	bh=iD5GYL9qn0xhNuhvUgU58wuPsBGAwlPP0y2l4fwf1ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdMRybZR5RO/c3w8+EVGEjCjXpzavEiZC0/vDexp6ZrXLycF4a1/6PVFso3ysBuMAVr7hL2tSEs7aepNHqfQw3OzHvsZokoEs6wD01RD/3B8d1luYC4JQUysmLeIGyKB9WAhmMt5SDmJcy+qqCdcnnv/x6Ft0ggh4BKqkUxjkUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kn1R+PyD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kn1R+PyD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso33056525e9.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784565512; x=1785170312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Nr+ZtT5dOzfrLwnKN+KTzxadvEy2VHEbwO+C0bmDvs=;
        b=kn1R+PyDAtluVaaGTSDby3LpJ4t4F8jth5GI6Fj35sSv4IhECCUbpNnFfm5ynsAiug
         /6WX373lBfmnW/Cch7hm61DXPKx+QYy/Wqse47qkguiQCzdmB4X1h430xG4/uutXqtug
         sHMFgrD3omDFRWj7WqiCHdDExdnGY+JNGVRlghhbOYQxJAWs7JS3kicNMYTy2m1iZ3sY
         Ekm9xBF5qWpFVfFao+WZQZ5gtGGQcdmPIijyrezdRhYk+efo9R/pwOY/fpJRHHh/PwjA
         3vyxVEfwHaIc5hLly4pP5/cKcufdJG5WvIdWbq9GgG+I5FAy2z1TZbUwxw8VVVc/Vvbj
         Ivxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565512; x=1785170312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Nr+ZtT5dOzfrLwnKN+KTzxadvEy2VHEbwO+C0bmDvs=;
        b=cuFJ8ZmyL4JhIVtBvXno/PY/TxWnHVOF8W8YqOVvvrJxlJe65M4tTXAthNkHiHfR5P
         QTz45fDMTKYiIurqOW27ggpCTC0PM0xfEOZSyOUeZIqB09/dpHtIREK+lu/ZzNhuwFNc
         bjcWBHjbV5ftnj3KMaQcsw5OcOdMlplIS4T5sciae/+CdqTF2f+5Br79cC0aZWatzEus
         0iOyFkrGDOjz0ZmVMPsKFNmXQD68a8IAXfe/zRuRsSu/0OwiLeAJnNmmcGDVmoeBW32V
         tIBVVH5ficn0lscRtn/Ui9vNUoFxSR/M0bWh9qy86zWpuY/NXEIo5di00jQq7sFRNHI6
         gbKw==
X-Forwarded-Encrypted: i=1; AHgh+RpoCzsDKiMCBRNEyO6hpna/HCrvgLKvYxyiYmtPiqBPe0G45z21xR7DLvxSBL4mgJJNA1QhgqSixUwRbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLzXo6x7iBBevE7y9VcqCWkBCBYETjaIAlWaeJ9RALlQx4xTf
	KQKpsuylNpHSHxQHJZVwwSwaGfxX8Z3/xXCTR4/t0pwHOj2MuSwyo2x3
X-Gm-Gg: AfdE7cmQmnM44EI+zuwyiGDhHAEOIXnsoIEjvG5L3zK7cSR0uAc31qubiXY1xIyajtT
	8VhXHzLIstfBMo5wVcA2GfCjkHjRiIYxKYvSmDYwual0YWA4zaqFsev7pdFG2HguJCrNjb+lXj3
	cFX8ebWpImegrg4tz6FjYkMv7euYaqrxCUagIaYeMi58BefhpYNg5oQJ+xeD6SNwAaNjz8sP+MW
	Hj3zdWewYN4OWgl1wQjMYeg9l1ErSLLeICdRQVJT+QDtFPnJsp+Td1x+aclwNH+2tuE7htjn/zv
	ItYuQaTVOpYhvh7MzhXjm686ubbQ1KgfzCEmdvNzQyL8gQkRla2lWYFGkopS13sInXORx2RCExo
	Un3wpcgsmAqUF++SQdDtgCMLHg1nv0q5Ab3vVi6x7DG42imB1IHFEI/LwVqHaCBcZQQg1tBw3Er
	vzHsdNDlNHrL7eJVPJkhqxpUltTGo=
X-Received: by 2002:a05:600c:1c28:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4954a3d0be6mr174298155e9.3.1784565512146;
        Mon, 20 Jul 2026 09:38:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:4352:bba7:6d7f:5f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565373608sm2105325e9.6.2026.07.20.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:38:31 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v3 0/4] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Mon, 20 Jul 2026 18:38:15 +0200
Message-ID: <20260720163819.104130-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717132021.18034-1-fernandorimoli11@gmail.com>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enables the OV5693 front camera on Intel IPU6 Surface devices such as
the Microsoft Surface Pro 9. Four pieces are needed on a stock kernel:

  1/4  ov5693: add the "OVTI5693" ACPI HID so the i2c core binds the driver
       (these devices enumerate the sensor as OVTI5693, not INT33BE).
  2/4  ipu-bridge: add the same HID so the bridge builds the sensor's fwnode
       graph.
  3/4  ov5693: gate the MIPI clock lane when the endpoint requests a
       non-continuous clock, which the IPU6 CSI-2 receiver needs to lock.
  4/4  ipu-bridge: request the non-continuous clock for the ov5693, but only
       on IPU6 (matched against ipu6_pci_tbl).

v3 reworks the clock-lane gate per Sakari's review of v2: instead of writing
MIPI_CTRL00 unconditionally, the sensor now gates the clock lane only when
the "clock-noncontinuous" endpoint property is present (the
V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag), the same way ov5647 does, and the
ipu-bridge supplies that property, gated on the IPU6 PCI IDs. The property is
set only for the ov5693 HIDs and only when the bridge sits on a PCI device
matching ipu6_pci_tbl, so IPU3 users of the same sensor and the non-PCI IVSC
bridge path are left untouched. I scoped it to all ipu6_pci_tbl IDs since the
gate is confirmed needed across two IPU6 generations (see below), happy to
narrow it to specific IDs if you would prefer.

On the register value: unlike ov5647, patch 3 sets bit 5 (clock-lane gate)
and bit 2 (LP11 idle) but not bit 4 (line sync). I re-swept the register at
runtime on my Surface Pro 9 (IPU6) to check bit 4 specifically: 0x24
(bit5+bit2) streams 300/300 frames at ~28 fps, but adding bit 4 (i.e.
ov5647's 0x34) collapses the stream to a couple of frames, and bit 4 alone
fails outright. A bit5-only value recovered to 300/300 in the same run, so
this is a value effect. This matches your point that the IPU6 PHYs differ
(ov2740 writes this register to 0 on Thinkpad IPU6), the ov5693 on IPU6
wants exactly bit5+bit2. Register read-back confirmed the power-on default
is 0x00.

Patches 1-2 are independent and useful on their own for enumeration; patch 1
carries Dan Scally's Reviewed-by from v1.

Changes since v2 [1]:
- Reworked patch 3: gate the MIPI clock lane on the "clock-noncontinuous"
  endpoint property (V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) rather than writing
  MIPI_CTRL00 unconditionally, following ov5647. When the flag is absent the
  register is left at its reset default (IPU3 and others unaffected).
- New patch 4: ipu-bridge sets "clock-noncontinuous" for the ov5693, gated on
  the IPU6 PCI IDs (ipu6_pci_tbl), skipping non-PCI bridge instances.
- Characterised bit 4 (line sync) on IPU6 and documented why the value stays
  bit5+bit2, differing from ov5647.
- Patch 3 was reworked but is functionally identical on tested hardware (the
  same register value is written whenever the bridge sets the property), so I
  kept Jakob Berg Jespersen's Tested-by; Jakob, please shout if you would
  rather re-test v3.

The two IPU6 units the gate has been tested on: Surface Pro 9 (IPU6EP_ADLP,
0x465d) and, via Jakob, Surface Pro 7+ (IPU6, Tiger Lake, 0x9a19).

[1] https://lore.kernel.org/linux-media/20260717132021.18034-1-fernandorimoli11@gmail.com/

Fernando Rimoli (4):
  media: i2c: ov5693: Add OVTI5693 ACPI HID
  media: ipu-bridge: Add OVTI5693 to the list of supported sensors
  media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
  media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6

 drivers/media/i2c/ov5693.c           | 28 ++++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
 include/media/ipu-bridge.h           |  2 +-
 3 files changed, 61 insertions(+), 1 deletion(-)

-- 
2.43.0

