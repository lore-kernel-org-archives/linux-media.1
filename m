Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919818;
	b=lFChf2LJZNFCdICLmSX7V5o4fVWgfxeckchwYPEPOBFO+fn+zqVkqcBh1OgnKV+Vtbdq
	 JDnUnm9DTNCTEUNZlllaeaRqReeXIOxjmADe+cftKIxsLcJVVXIEmgqZpkMFGfhHZiNcX
	 KQTKETpLBZQHUway8h8M2fyeUFQ5u8/5O64ggsGdZ+yn20VyR/3PevkKDpmAiv4L09mdo
	 nnAvHAYzAWZhwR0CjcLf8sohAuAdFxnVVgy1BvRE1eOXVvoR9fVXHce4/w1D40yDN+7ZX
	 p0jzNWfTlhLkwVHTgdXMGwHxYuiS3F0SVw/Bvw3YPk40jItoBDlTJaXy4BY4xd/zJrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GMEbp1fbDq/VpyUQIEOT75Vm1u36/6yC8nJytk1iDac=;
	b=STQHqTsd9EeTr31SNJX2+/BORyQPoz35yMgz8khQvg2HwKkYdZ13vKSVjij6igKL2rio
	 NR9yHjTYhU5defN660UTZB925OOHbCERUMo1Jb9jsdk59qjCTkjHObb2LkFsgfHByOzZs
	 wyha9rgpucG/ZKCFMXzOItn/aO2qTY5F0ILivATOW/DJFPU8aymOZt3cD4E5//AEpTvqG
	 HUVc2BB8Z0qEeT0SUlwJeOS03mH2hIrJ9m2UINTuyu1GCQtpAaO8rdvu0W5qdMegEn+LS
	 f8TN34DEFIE4B278Hh+vg5WRmsBVs8BwL7AVmW1xhOVlJBfpkgY9gR2dRMIxGN2Aqvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFFycAb3;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4241F606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4241F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFFycAb3
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so426395e9.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919817; x=1794524617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMEbp1fbDq/VpyUQIEOT75Vm1u36/6yC8nJytk1iDac=;
        b=GFFycAb3t4tTdKVmPcwISri5rIXnEwUjB/AayPPFL8duhmUJZ4+jBr1SqQKHFSpAkj
         sJU2LDKcVAEw1PMylTLU0KYEqOMGlDr+5wbHAZuhZGlxCH9i2x/u7YNt7roYz+9NpJN9
         iIPRjjl+pVT2t2Jr0MdBKhGdFwUPsqkXzg6DfXlBFoLPL+M5FvHSpah4RmMQFEfvSmdF
         amfdRzcLP05CxdW9u2OJdgRAK23+PLoKg7tcBvuWiArxqycjYr6zqs9J2rZDAGqHsKPO
         hWCx9glApHcCbYNYiDyfCdaDA9mOc7h/TO8EMTgmU9mUpk9wKTA2rlp7k7OMog3hoHcy
         3kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919817; x=1794524617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMEbp1fbDq/VpyUQIEOT75Vm1u36/6yC8nJytk1iDac=;
        b=dvtkevgZbD1JFGXiFL+HpV6vHBJoaluCyt6Xuk/NMi48VEk6pHo0EE5++bv+Q9utHh
         LSat8FY1mUvghtvQ2yD7UCnlHs5EyynCu8Z1qHo5ezXXhJyQSxUFsBqdMuj1pqJn4at0
         4+arTiy1I80VHOVwbsWbu+o1t1NOar3YYRrH20a0B/jL5A34CIdB/6/61TqAGtm0bW/B
         foT9+gsRWxd17QrWgg3bWZxitjiN1zny5MIDro96HQomMfApiSYz05x3cVEX5pfFwWJ0
         Ss//Jsc1W2InqmVY03sCCScbhWYmlRKp5C5Gtr/agMYgekdfyCmzLZh3elCq40bBTMG4
         tjoA==
X-Forwarded-Encrypted: i=1; AKwUvBzr0brdcrTblWmsmC6FxOzfg4Qp4HiL6NYXVfJoKzEtdtKo/B1xtTEP9SzXldTCMz9MfDsR8JDvGXLMpg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/41blE0ovGIGatXh8C9RjBy8AkD8rWbpTyrI95lwdfmB3iWmQQ
	iUcKZjuHB02nPAZWb8YcdU6M4SdPJF2FcyEyvpRmCbJLj16hFUucTxvC
X-Gm-Gg: AYBFou1AP6cfb65CRRHUhWRkqrTya9R6S/UHGEGObwZT8bou/IF579OmVUkmBNfdV4j
	CIy5utj7RXdvpLaHbNVEYJ1wyqaTefLvetSGdGqzBKFkMu9XbqL0a4oMYo0yaEk2n92IsRd5cU1
	cYOgASiJLCKFHawtQjfcWZk3Txpt82rXzcogxy2WzVQphZ5TyD/h46/MsPBgAenSETSHs6yhDQ1
	cJEN6FUWyWLJ76x1DIJSRnLc5IW/PE+1R+Ics3NI/wSeNNwIg05ILtbRnz/gLXFaQYiWtCLvNj/
	D64zsZUPlcERIO+L6sXd2sG1lZcxUz2nAZ6gWpYT0F18BU4Iptuzj6puz/mJqXrtsox6665aDqe
	vzc3d8stLVSOAmTaiYIb95ocTtR/YFHxf7EL0+iVvxxy7NuRey3MdneVbUucT154/A9UMTU89nd
	iI5XNR5abLsVjlXdm7F7oO4VMXlvDkH2s2Jlqd27IaGCAPFARZ4wLrPaqLrsi1kSEK2U9TczgWK
	VI0z818VrT7Z1efuRELFOrp0B/LWm9wr45lpd9lfExPGCNlp0piXQROihFyiS8P2sIo2z6yXeGD
	9USUoUU6ex+S8n4jmNoJAABpNYFY0LGgdXsxXyUi0xSCiUNfHclci7lh/mcBAUJzY1AoHw==
X-Received: by 2002:a05:600c:8712:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4b6dfba8b00mr8782285e9.25.1793919816475;
        Thu, 05 Nov 2026 15:03:36 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2029209sm12267215e9.11.2026.11.05.15.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:03:35 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: ov9734: Support the Microsoft Surface Laptop 1 front camera
Date: Thu,  5 Nov 2026 23:03:23 +0000
Message-ID: <20261105230327.10852-1-afonso.figuinha@gmail.com>
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

The front camera of the Microsoft Surface Laptop 1 is an OmniVision
OV9734 connected to the IPU3 CIO2. It does not work today for two
reasons. The ipu-bridge does not know the OVTI9734 HID, so no fwnode
graph is built for the sensor. The ov9734 driver relies on ACPI to
power the sensor, while on this laptop an INT3472 discrete device
(SKC1 in the DSDT) controls the clock and the reset line.

Patch 1 adds the sensor to ipu-bridge. Patch 2 makes the driver wait
for the endpoint that the bridge creates. Patch 3 adds the reset GPIO,
the supplies and the PM callbacks. Patch 4 adds control event support,
so v4l2-compliance passes.

The series is based on media-committers next (v7.4-rc1).
ov9734.o and ipu-bridge.o build there with W=1 and C=1 (sparse from
git) with no warnings.

Hardware tests ran on a Surface Laptop 1 with 6.19.8-surface-3, the
linux-surface kernel. Patches 2 to 4 apply to 6.19.8 with offsets
only, apart from the v4l2_subdev_client_info API change, which they do
not touch. That kernel also carries the linux-surface camera patches,
and I did not check which of them this result depends on. Patch 1 does
not apply there because the sensor list differs, so the same entry was
added by hand.
Results:
- the sensor probes and the chip ID reads back as 0x9734;
- libcamera (IPU3 pipeline) streams 1280x704 at 30 fps;
- the sensor is runtime suspended when idle and active while
  streaming;
- unloading and reloading the module works with no warnings;
- v4l2-compliance 1.32.0 on the sensor subdev: 46 tests, 46 passed,
  0 warnings. Without patch 4, the event subscription test fails.

Not tested:
- a boot of the posted base;
- probe deferral at boot with this exact revision of patch 2. The
  sensor binds at boot, but a deferred probe is no longer logged, so I
  could not confirm the sensor driver probed before ipu3-cio2 on that
  boot. An earlier revision with the same logic logged the deferral
  and then bound;
- platforms that power the sensor through ACPI, which the driver
  supported before this series. Where no reset GPIO is described, the
  callbacks only enable and disable the clock, and the supplies fall
  back to dummy regulators;
- system suspend while streaming.

libcamera also needs changes for this sensor. I am sending them to
libcamera-devel at the same time.

Tool disclosure: this series was developed with an AI coding
assistant (Claude Code, model Claude Opus 5.5) in an interactive
session on the laptop. I asked it to get the front camera working. It
read the DSDT, the driver sources and the kernel logs, wrote the
patches, drafted the commit messages and this cover letter, and ran
the builds and tests listed above on the laptop. I reviewed every
change and can answer review comments on it.

Afonso Figuinha (4):
  media: ipu-bridge: Add OV9734 to the supported sensors list
  media: i2c: ov9734: Defer probe until the fwnode graph endpoint exists
  media: i2c: ov9734: Add reset GPIO, supplies and PM callbacks
  media: i2c: ov9734: Support control events

 drivers/media/i2c/ov9734.c           | 115 ++++++++++++++++++++++++---
 drivers/media/pci/intel/ipu-bridge.c |   2 +
 2 files changed, 107 insertions(+), 10 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

