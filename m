Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDCD3FD147
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294445; cv=none; b=Ncv4MStx4Kl8EcY2GtJCkQg6EB1od9MWortBaHUBnttcZmJqjKu2DIIYTzsOqRjkPJU81YpjtaBDNGqDpfUmlmi8rLdGTjsP8KpcagDwh2Wg9T7WQ7Nrt6miNC5EMhRLwwpVZiYPUMRiDoGVODj70Ld/K2b9mmGnno18/hkBvbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294445; c=relaxed/simple;
	bh=NUTLoZyN/tdYsma4CGebWjgdJR2UIHqZeKYPgdnv51s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UVHwnsZlh24zs553/s94lhhimKT5S/0mAHs5Rk57wTnYOBL2gck/ix0ViZ9qcjPjM6XXNO4irFN2GauKXTMLQ6MW+p+AINmq9hdT4eTLkKQi2sLmyqIF4NfDiXf0pbM7SUCBih7j1GFu2hA0M0iC12p9JHUrF+HUlxY+ZicMmYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siW3NmVR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siW3NmVR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3964679f8f.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294442; x=1784899242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmEh0b1AWjNzwz4y/z64I5zQpyXXlsU7mTp/CY11+hQ=;
        b=siW3NmVRq2ABnh6AoMUJprMEfp9zTW9i2shakkWQ6eEcDm9bHzevfFpsfrAyPO0RPl
         Lbgbh2FzDbFKQOnzUPy2L0B4H6o0sf54O6MHmyRueDNd919pYIBEhlFno58VQau11Y8X
         lY++Hrge7+p3QC8Ydfcmgc1w7W0rcmrnuf/hSNitZwIAtPTbVujiTKR1bf7caKUGCJyR
         Ph+fOUXk10AcjSAdGlo7CdlZfqiliYJSt2/pixBn6x3v1epelX+iXUkSpRKosFmvkehX
         ESkw+OyoCpyTaVRmiB60p1jkBrS/wYIG91WH7APdMAF3pL8n0K33jaL6PqVkzApYdDvl
         l+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294442; x=1784899242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmEh0b1AWjNzwz4y/z64I5zQpyXXlsU7mTp/CY11+hQ=;
        b=QFENvg/DLH/c+s/8+xuB0NMfl3qw1lhM3r7LKpRuKxpWvNE2fM4Mj5/qKgpq666lHO
         uDAJpA5XOr0Q9D+zaM3INsbGYw+mv/vQa5bYtT2a4lCAiV3Wmga1gfIqEPw/N09qJ0iM
         ESNh+yncEeTI7nZrfa2zdSdEa9aGKeEQgsUpT03gi4PFDZvOduGgHVbTGjN6bwvLzD33
         vYWYlUQF1Z2dQzyc6Zj0m6j6oKEDUAJR4kRYdwGm/GnBzLpX/ViJrj92Hecy3Rhozd4c
         o2+cy/VNOH1TWVa9UBi3x9CqVuy0r0EPJUctVkzCAPL/wHLkmZM63rQ2Y3VNQGu+RglE
         kX+g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4eeKDmSnafUa2gB4pLCa3BxoavdVxfvkjvZ4NHl20J9bA3NsrnfjUxNxrpw6IJHpJxMqCF1VJGeOjYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+oLrGRvWMrQhwey9LyYWywmCTa3tZbnfb5F4uRiLgBvW4RMJ+
	YU9SLyhcg51A81t3fomU/7ZQ5coCVdxKPaLJdqcx8IGGsyyHQCvMxhkh
X-Gm-Gg: AfdE7clDBrHoRtHu6IRYdAy9/ILMwMnBCXT1XPDNEwpAyGTbScdDvUHvdeUJbHXlMyK
	1+gr+2kv1CP32WiGcEgTM3WpHWDr+0WQVwIMGXG4cKC+oTVQaCKD3/c9P4BPhgfaRbcErfbdyW7
	81VizOQvQWeqX6ErPan34oOIh5I+0BwNKxRJ9ZrbIIlAznSt1UUZwwLEYcZuUSn47/rJ+QYnCqI
	wfoJdER9Hd4lQmcbvvcUwDJ+Rnxv4zk9m+2fsfwVKumsxWwrvgXC+az+80ekCzjHBy87Wl9eENK
	5s71ovU2kGyZK+AxQ1zxSedLa+db9yRmYWlpIme9gWKwARt71fguSc7pYwdwFmz0u5fwOVeeYKA
	0FhLgvyIbL/nR1E2H6yqWzsWWA2y5gccveS7d5Z/nEg0OuTpcwooB0D0bPzdPs+1n4a+o/fWB9z
	qk5Li2spNRE/m/XsTlcs+QV8D3ObKMHLY+CXgY/g==
X-Received: by 2002:a05:600c:ad7:b0:495:3c6d:f294 with SMTP id 5b1f17b1804b1-4954a402da3mr22916375e9.23.1784294441484;
        Fri, 17 Jul 2026 06:20:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:f8eb:f0df:1ea8:edb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2eddb8sm98841705e9.14.2026.07.17.06.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:20:41 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v2 0/3] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Fri, 17 Jul 2026 15:20:18 +0200
Message-ID: <20260717132021.18034-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708213633.18392-1-fernandorimoli11@gmail.com>
References: <20260708213633.18392-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies for the slow turnaround on v2, I wanted to properly
characterise the MIPI_CTRL00 register before answering, and I was
coordinating with Arsalan Naeem, who originally found the register write
(linux-surface PR#2171); the third patch is co-developed with him.

This enables the OV5693 front camera on Intel IPU6 Surface devices such as
the Microsoft Surface Pro 9. Three independent pieces are needed on a stock
kernel:

  1/3  ov5693: add the "OVTI5693" ACPI HID so the i2c core binds the driver
       (these devices enumerate the sensor as OVTI5693, not INT33BE).
  2/3  ipu-bridge: add the same HID so the bridge builds the sensor's fwnode
       graph.
  3/3  ov5693: gate the MIPI clock lane, which the IPU6 CSI-2 receiver needs
       in order to lock (this is the register write from PR#2171).

On the MIPI_CTRL00 value, in reply to Sakari's question on v1:

I swept the register on a Surface Pro 9 (IPU6) with read-back. The power-on
default reads 0x00. Every value with bit 5 (clock-lane gate) set streams
(300/300 frames, steady ~28 fps); every value with bit 5 clear, including
0x00 and 0x04 (LP11-idle alone), fails with "stream stop time out" and no
frames. So bit 5 is the decisive bit for IPU6, and 0x04 alone is not enough.
Bit 5 is not an IPU6-specific hack: ov5640, ov5647 and ov5648 all gate the
clock lane on every platform. Patch 3 sets bit 5 plus bit 2 (LP11-idle,
i.e. 0x24, matching ov5640's value); I have only been able to test this on
IPU6, not on IPU3 (CIO2) or Rockchip, so I have kept it to the conventional
OV-family bits rather than the vendor's 0x2d (which also sets bit 3 and an
undocumented bit 0).

Patches 1-2 are independent of patch 3 and useful on their own for
enumeration; patch 1 carries Dan Scally's Reviewed-by from v1.

Changes since v1 [1]:
- Split the single v1 patch into the two HID patches (1/3, 2/3), as
  requested by Sakari.
- Added patch 3/3, the MIPI clock-lane gate, co-developed with Arsalan
  Naeem, with the characterisation above answering Sakari's v1 question.
- Carried Daniel Scally's Reviewed-by on patch 1/3.
- Used named bit macros instead of a bare register value.

[1] https://lore.kernel.org/linux-media/20260708213633.18392-1-fernandorimoli11@gmail.com/

Fernando Rimoli (3):
  media: i2c: ov5693: Add OVTI5693 ACPI HID
  media: ipu-bridge: Add OVTI5693 to the list of supported sensors
  media: i2c: ov5693: Gate the MIPI clock lane for IPU6

 drivers/media/i2c/ov5693.c           | 21 +++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |  2 ++
 2 files changed, 23 insertions(+)

-- 
2.43.0

