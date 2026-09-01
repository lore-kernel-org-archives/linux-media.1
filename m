Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DB49DB8B
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289484; cv=none; b=uc+7J9dDdKbYEcN/dQ9R+yrwJnMsVnwqRSqSGRZazRqAcaNNibwtVXxNEXCBuhnAdUBt35ylNWnGSX/bNOrXfH5ubMvTdEPt9HbUhPjU2/XVPFL3MpnECOSKmWa0Mw5NeHNtwHToYZ6fRUgdYlhgh9vtyre59PjBIYpiCjwEc9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289484; c=relaxed/simple;
	bh=gzIQy72QBFoZIr/pfo2orqCu1axS9UAIZzvLJ4iyoVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y8ifL+keI38EM2DgZee58eOVvi1uTgYCEpIzyTR5dRpKdgU8xGq8QvDSK0pjuOF7UqSEO+sTK2MN+mDY67wGIvONJB9bJ2mNTEtAN0o83aIsurrgtde9G4AUWrSDhTW6M4yKtRRvTDEUmJ1NHABA4k9bi78AvvnblfhJ4eTZCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyVv56sR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyVv56sR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso1204665e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289481; x=1788894281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9fdaCTkKj4WNIMNGeorqq84Uvidoc3ziXoB8yKwkBTU=;
        b=PyVv56sRU2x7o+6iG0uWTZ5uek1KJcnuwxCBa9pEmnFN5mwi0YK/mz1+XkniFbOEyW
         mWmU5bNcSdAaDj7kCYClh/4EwsqMpfBoKxsBA9kODmdCtsWP4L+X/Lpw9nHFxfAwPt+2
         lX6ondhoYJ6w4QK3c47DiG1u37WRFdG5SAW/HRWrwt1+VaP44AUzmyJU2RBj/+qLsaAb
         OIDVzjUj6TFfPk+LCVZOI8Vtkdjh/VI89ZvWxg2PmiylCweoax3EuPIw/DU1AgIAEq4X
         Nss+4rj8boOtlDJqUVOpjeoTCVpeKtGihRb28iH3/g/J0uWNFnkSMlMUu1iCGknU63dS
         hWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289481; x=1788894281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fdaCTkKj4WNIMNGeorqq84Uvidoc3ziXoB8yKwkBTU=;
        b=ch/AHU647mtu/wMGhiPnj6ryY92dYG5ymFfcXqEYsDRF28xJZfxv6cMgj+sNayU80o
         4v0zObCZO/+U49vOc2GGDqamsyByj/qTovZ97oc8EDquCFIJPrI7iSVzbql7G4jExFns
         4ye6LmQ3FrusbEsxD4v9X4T4Vj+s/3IHXHXmzv+4V2cYLCs0rtBW/uAJ0myu74qw+6Yj
         fH0V/ka69X3j5UlIUWSiRj+NsCTG2QbZDtdhsmqw6o46GYwZGcw1baBVk1nZmdrwydX9
         7ClowzVqtU5wWTKaqctMn42flNpNl0O1i+wFtmUKuGNQrbMwqywo1OQKsoOY11S0c4+w
         ugHw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3oZ2TuLsU4Iyyg5q0xR0+L421BC5mBjHH9og9Cn4Al/3vr6GKflROjrLSoq1KGkAsr9Y04MTxpapG3w==@vger.kernel.org
X-Gm-Message-State: AFuF++m0QdgFff+OaVuk/5PeHJ9GDP9kPBl5fw9KvWBFR52bmvMOsiKI
	lqvQlFN4ls3DkgsUaQuESzV0eHkeyYK0TZ7WunRP1N2Jbmrj3RfwFkRi
X-Gm-Gg: AR+sD114565zCOkfAE6e0XwCsqO7rMf2T0B6s6A/xuFH4UfH2E+HNAG58PddkUzOb8S
	akMQMvMlTBba0huOs7KopNhep7PiX2/kyWJS0gnXo4VJo8is7Nbq9SaNKyxLGH3SnoC4JK9KLHR
	7p5TFWxOCapzOEOj5nkVGjmscsBFreLPpj65UTbyizmIsMiHThkPY5C445SBmeWmTrwn6oVzvJ4
	wYWSOeHkYUMz+IbBT/hKOk+3zcjz6iqi6cdFlKDb8z+7zN8mlR+tjt9ov4qhf6K+G0Uff0kqfiN
	3mniKRRnTe+lmSRMiPpRfswKhA4dGmVB1OsYeb1RlqD1a5JxAa7l28H+8D0NRkQUX0iRhHBtTWJ
	8Gthky2mRVIUTKAejho8SzrS0Uwo1PGQQqCb8mvVDjTze9jnGPtviM8ukAVRZHbeGT4hvMel3wy
	k7bcl5C4fki5LHiTmYA+jyp2rPcJFt6y4Rn4h28lBX6OWdsEZSlWJ4u+wkNT4qdEBkjG39b8WMl
	uIk84ydp6qB7NVGe6NxNXwz+3c0qxZPK56KbKeCKLQZG8TSXBKdcw==
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr485874005e9.3.1788289481032;
        Tue, 01 Sep 2026 12:04:41 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:40 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/16] media: Add Yoga Book camera support
Date: Tue,  1 Sep 2026 21:04:22 +0200
Message-ID: <cover.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds the sensor, bridge, AtomISP and lens-actuator support
needed by the front and rear cameras of the Lenovo Yoga Book YB1-X91.

It covers the OV8858 19.2 MHz clock and Cherry Trail gain programming,
OV2740 288 MHz link frequency and manual white balance, firmware IDs and
IPU bridge data, AtomISP raw capture and CSI-2 timing, and the WV517S lens
actuator.

Changes in v6:
- In patch 2, replace the arithmetic MHz expressions with direct Hz
  constants, as requested by Andy Shevchenko.
- Give the supported input clocks distinct names:
  OV8858_XVCLK_FREQ_24MHZ and OV8858_XVCLK_FREQ_19_2MHZ.
- No other code changes from v5.

Validation:
- Strict checkpatch over all 16 patches: no errors or warnings.
- W=1 object build of drivers/media/i2c/ov8858.o.
- Sparse C=2 check of drivers/media/i2c/ov8858.c.
- Front and rear cameras previously validated on the Yoga Book with real
  raw Bayer capture.

Maurizio Casciano (16):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and CHT gain setup
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: allow sensor-specific link frequencies
  media: atomisp: derive CSI-2 timing from sensor link frequency
  media: atomisp: provide Yoga Book OV2740 link frequency
  media: ov2740: release group hold after gain write errors
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 114 +++++++---
 drivers/media/i2c/ov8858.c                    | 166 ++++++++++++--
 drivers/media/i2c/wv517s.c                    | 206 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  80 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  30 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  34 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/ipu-bridge.h                    |   3 +
 15 files changed, 588 insertions(+), 110 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c

With Best Regards,
Maurizio Casciano

-- 
2.53.0
