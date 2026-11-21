Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267969;
	b=utGRyoK5/5geiTVRk+dnw9MDkJsNr05UrnklxYZtBovC42aWENkuqPh/Mrher8sJuTBg
	 svhVpagq5iDnuXGE2xfKqz8OJ+E2/ZdqO0fAGajMwyJQNi2OaLj2rzyRqKBfYMMAclQq+
	 LIgY5IabmgP7weJQiJfz0EJ63Ktaq57KOX7F15Sc73z7TvanzsorOFY889rNbUnulXAh2
	 jD8CitxzHI+a60kjm3GXPf4QwYVv+feVqYZD57gwJ2QADbTCxkJLjrLzMcBtjgAd9jCg5
	 KwfGGkotFfOVY9UEGxU9XGnqEjZ8AMsAcPJ42vdC7cTV/Aueffcu46OMQhEX0t1x+Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
	b=3Jy8HqT/h4orgM/0Nm0mSBkk5y/pOiHMmxbL/mM8otpfFknit5ywqZmp5bPiFstIgPbq
	 Y77+YB2L2VwkXo/kOIdiEGvxygyT5C9y63FRqXSSLDNu87uDvm7aDChZ8zFyScY5nk0cw
	 6N5X4c032sBkWQIGGG3EnZz3SOXHL0+TgxxxbM7nRi2euVVu0XGFPrBLIPqTUnvKHrFS6
	 TsIDMa+Ld+3PfCYYbdxRMhOoeZPj77QnqQu5b8hAxm7HyQmL7emK96Yi8aJa8+qy2W0Sq
	 mXaKe9bF8k5Cez75iobxY+3h91+5xWSw7eYeu7Oyb5cUYSQ9dUYSJD/RCXgOrBLLT/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QoWu65Ne;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10016606A336
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10016606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QoWu65Ne
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so22227325e9.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267967; x=1795872767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
        b=QoWu65NeGhSeAkEovw3/LCMVojAy7azK7BS9FdJzBCU3BwWwgbrk1XnqR1k8+CBcF0
         OCrPc50SgPTHd4heTdC+WBRN5vbBL5YR0F4yN6TOHNA4sECpguKqfc/OPNdX9WGxkPcF
         MK0/HZFN6KooROGZIOG6KWBycdKubcUUioanCuPslBJv3vGFnkXarTaXtCs2ElXAfhFQ
         xiQclC7WUt/E9oFdTxWsvx9oc26QmUOXa99QA7m3s5ubxYDI6P19Xz+j8aSMmy8bcCl7
         8hgGACmv6ip+PTxqMvo1U3ui7QOpIfhKUHea//euZDvvDNnBZ1sDl4Ji+0NlLEWWhyf9
         zmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267967; x=1795872767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
        b=mZ67n6L+ZZc/HOeVHaTKdf6+dmbL9MRGj+jHIN/8e+awcLiajrFVa5YLFPIPZBsNuA
         T+ZX9EPjLzZYrUE6PbBhIv93y9mgjPNjGeF8mKiqE9don8tbtYm4Ycca316De40I89pV
         eSl61YaoZ0XaBxrxHavPtLjALz+KzJZIE5momX0H/IGc8qxAana0J3o6MKJkzptAvYAt
         DEzFAO1ZR3T2dATuczD5CNioAxznhCZbbdELC+TDSfQ0QY8YsVbbwNO4DVWV5+fA8gFK
         3Glxoa9B1gs/FMzcVEnQfr8RRC5hwDwT9xGZ3rlokjG6W0ehCuhEuDpWv6xoCTQjdqYj
         RcUg==
X-Gm-Message-State: APuU4Z/N1LyQCLaNrM5a9tT8REq1wILPprJMTgsCYpXJidUorsYciUdH
	Omk71nbZwygCzUl7ofqVtjYsxhaU8iOKPQQ1C/4/ercZhgVqIsqLRfv5lVYgsQ==
X-Gm-Gg: AZFdTZf2TVaKcDoPalDeOyrLOPlLn241TNXhbT0tn1nGPbWQDL8BhETP/f8OlxJtBu4
	3An2TbuOmGPt7+/erqxPbfa5WM3ijIoGjM7mAFvqPHSk+hfTeqqUfgazpa4idl8yC4IKHCIozI9
	vGwGXtzdd8f2hb9OCef/iQDIFJZWERxCz6vdG5Il1FKkheFedmtIGderuKMQl5s29UF+vO0MP3c
	3nUWxTe3h9xk5EmeAeOFSKtEQjAjB93tEWCdL0L2g28nIqpndUNndH2D3bCR5thDzXh/LoPmiuJ
	G22Np6qADvROQrR5V8/B65NPnMbFdfzF0T9JIPPzoMLbWP5jNvmrwjfaf9todBvLrLgQm3BAEaR
	FUK75oUn8CZNp+8eFNWMANH3q8j1Pgm+mayETHadd14Jm4M14iHkcm1CTFSeUgb86wiMYV2KYnl
	1iQJQr1L4PO6JBR4Ar0gEc0hrCYP/XjXb5pzHNHv/chUlCw1brNTJMsHKMH88eHaVrb1Ps9mXfV
	Zt4XSSkolxwItH6ljhQPjzmJTnX+IRBt6rLgvgT6hhd7DHXr3ODcxYDcBbvPEBQBkxFP4/ux1oI
	lrgNw/0LvULy09uqkHBZWayfhunYXYr5sqlh4cqGOFuOCucvzqj1kgbG7SmJXWJkIQSLI/yTT4x
	/PVba43qYxOIS
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr132597455e9.9.1795267967020;
        Sat, 21 Nov 2026 05:32:47 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:46 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 00/14] media: Add Lenovo Yoga Book camera support
Date: Sat, 21 Nov 2026 14:31:30 +0100
Message-ID: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add front and rear camera support for the Lenovo Yoga Book X91L.
The front sensor is OV2740 and the rear sensor is OV8858 with a
WV517S focus actuator. AtomISP ISP2401 can capture RAW Bayer from
both cameras.

This review series is based on media-next. Apply David Heidelberg's
posted V4L2 subdevice release fix first. The prerequisite patch ID
below identifies that patch. WV517S needs it before the V4L2 core
can release the actuator's final reference.

Changes since v10:

- Drop the upstream ACPI initializer and INT3477 ID changes. Reuse
  the existing rear IPU bridge entry and shared Cherry Trail PCI ID.
- Limit OV8858 19.2 MHz support to four-lane R2A. Carry the 2014
  Intel OV8858 notice and record the sources of the register table.
- Drop the per-component white-balance controls from both sensors.
- Use div64_s64() for CSI-2 timing and make AtomISP RAW negotiation
  and enumeration follow the sensor's advertised formats.
- Defer WV517S I/O until use and hold its state through final release.
  Preserve existing camera nodes if registration of a new node fails.
- Keep the OV2740 probe retry as a separate diagnostic patch. The
  cold-boot logs did not show a natural I2C failure or recovery.

The revised sources built the full x86-64 image and modules. The
focused Sparse checks, i386 AtomISP object link and WV517S build
with CONFIG_PM disabled also passed.
The mocked registration test reproduced the previous rollback and
verified that existing nodes survive each simulated failure. The
format and notifier fixtures also passed.

On the X91L, the exact revised 7.4 image bound both sensors and
WV517S at boot. Each camera delivered 30 distinct RAW and 20
distinct Preview YU12 frames before and after lens rebind. The
capture and sensor nodes survived rebind, focus controls worked,
and the actuator returned to runtime suspend. Physical focus
travel, 24 MHz OV8858 hardware and X91F lane configuration remain
open.

Codex drafted the rollback fix and cover text and consolidated the
previously tested follow-ups. Individual commits describe its role.

v10: https://lore.kernel.org/linux-media/20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com/T/
V4L2 prerequisite: https://lore.kernel.org/r/20260917-v4l2-release-fix-v1-1-acbac7f9b78e@ixit.cz/

With Best Regards,
Maurizio Casciano

Maurizio Casciano (14):
  media: v4l2-core: Preserve existing subdevice nodes on rollback
  media: ov8858: Extract digital gain programming
  media: ov8858: Support a 19.2 MHz input clock on four-lane R2A
  media: ov2740: Add OVTI2740 ACPI ID
  media: intel: ipu-bridge: Add the Yoga Book OVTI2740 entry
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: select OV2740 frequency by IPU ID
  media: atomisp: Derive CSI-2 timing from the sensor link frequency
  media: ov2740: release group hold after gain write errors
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: Allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver
  media: atomisp: Preserve the capture graph when a lens rebinds

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    |  65 +++-
 drivers/media/i2c/ov8858.c                    | 172 +++++++---
 drivers/media/i2c/wv517s.c                    | 320 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   9 +
 drivers/media/v4l2-core/v4l2-device.c         |  26 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 103 +++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  24 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  36 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 117 +++++--
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/v4l2-device.h                   |   3 +
 16 files changed, 748 insertions(+), 153 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: ccf78740d63813c452c035b57d17a650492562fa
prerequisite-patch-id: def08de8e36aa31f6d2360428b29f6b0f4c8e1c8
-- 
2.53.0

