Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C745563A
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930112; cv=pass; b=tJElSn2r+VU38ua9ebUuBnOasYJOPb5ARoKWgJM9SCwaoGm/FZytoosrZVWPIZIlFTfAkqVcvPws5VAyHx/+iU1ZNM64PGZM7f3wWe/fZXSSTw+RL74En1Ow7pdLtptIWUu3qMIXvBqcoKZszUJqtsMZxbkJlpvQNpVPbbOEkZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930112; c=relaxed/simple;
	bh=DppAKXqfuP6Qm/NxZ7m0YZf/1aabWVG+ScPkVR8a+k4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ldGCfNDHqj3R5a7WrQWsYDuhvArtSaqAeNFVIsLkb+64SB0e2ee4lcy8OmqLnmi5HtloaMUFebFbkFSLVuueFsXzanM0BuHgKdDM1hPHw8H5cuY9pR7RP1V9L6fvHX6EYeWjANOr4QDURIJKgW8cJWxTlzDvtULQ69h2ohrUTmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ2lX+bt; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ2lX+bt"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-822ab75c8f7so348376a34.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930109; cv=none;
        d=google.com; s=arc-20260327;
        b=QDJFFz7WgOsc3qSYRVae5zxZUlYUP9SHt6HVLgNMiXAKnZWNz7xPWWx5wTzjWX/fGr
         1bTJIn2wTJPncIR+PsH4bmcKSOuqTw7eY6vOmD8UEKIMB9QDb42485aF8AY7Cn6eGZVi
         Vt2RmLbopUx+E4lWdlQCa/+SZ8gDXQjZ9B3jpHi3JhBTCHyOk/K4IN/tj+ni7uMIG8af
         Vwfh9G9Jsaa34LxWRDtN//k3M5PuhYhGrr+jKCaoFu7y/x3bDgezpJFroAR+rA4Lgivq
         4QnvFugFTHYwXGCDQtY9H+FPpjYn0PSUGcPSv0EOGynkUywb6QU/zDClnW8rf2MZFfsz
         KkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        fh=vau6k3vvRLd0ElFecAIi3OlyAaC9Bla5FbkNJQoox10=;
        b=EQHoAvm7sZ3uybhAjg56LIEINnHVD7+bluipi1TTC+ZGqEGnAphtL8zTiWR/gvwYwl
         vbipavxjqIfQNoCUafEHXx0X9x2mow+PUxYMbcIgOYnv1qF22uF1nhN4evCksAYDEFBU
         8MkZEMGJ8tvjx5Eic6bA1occ8q0PAWvJjtYJYphRkGjb1TZwCN6+yCzZZ5telY4MzqOr
         4rWGY94x9szsJYp5axxfonA+/otNkaucSNP/8ylDL9d9e08f+VNWpHQEjAeN1MXf5zNc
         miWwxnwzj1jhnI9ypxKzifH96YFvNE+aJSJw0wqUpS5ijOdXfH/pUm06n1RWtvqRHEFL
         1ssg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930109; x=1791534909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        b=rQ2lX+btU/9FAaCHwfidJyHX/fXPjh3Sv2hAHdv04fNib7NbUGWTiXgRXXHHipolDV
         JmVMQn7bbw3mcZhFBtX6PyIp4GYPbk9lry7IDxdezgFQw4uvIUMl9JYIgGUZfhEuLNSI
         aUh4aI559qJMqd8Dx9o5+BNOj582D57uBgAC43BcYm4/oO2sWXomEpH75Qmj3XpJIR5E
         fKlM0/MsKFGBL1663VmeZUtjfngUqRmRmEzJwF8h86/VhZuTN9PIDNiZCVnw+rouNRUX
         DPZsNlpovi7Tzr4a+Z5s1pXSty3wbDweBJdLfrXekqjoxTrkXCT2rLTqXPGwxyXa7kWw
         fHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930109; x=1791534909;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JCwynQzQS8MrwMM0VoK+Vs1Cqa3o1VYlWRD5LT6E08U=;
        b=nRwrIApbrCjJ/vRdOfAHTc+bHu9vGzJdKNknVXlU9q5DMaXvpzfsxbVIYwEezxOZXY
         iwpEN6GHMKZiLxoNahI0Kj9d0+DmRrGAtDllVB7OTD4R/cS/W1TEOYd/6xWjnjoTUJxK
         yp3GZXnFHSFLFSBozLXU0zZTTouZnCMmGWThh4w1HeasCjCMwg/OBH+H4ZHyjDBR8taN
         La0Iud15Kv4rIsfDrha39Hr/TzRz70y1JXcvIC+YJAuF0iXMMX6aeFyal/TF+laifKQv
         e3eKi59JHcUE96h0XGTtCBH/cXCxOq0RTkfJHikeezRrxPRAI5tiiv1GXgR35KhBUh+U
         Fdxw==
X-Forwarded-Encrypted: i=1; AKwUvBy+uqCTmafN2tUm07YnQrBB+mntzFAMLb78Db0vqgynf3y614MDURXFEXXhj9gH/Fb5WBwUwogH960zOQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJB0G0hYJt9LAuRVR9Qf22vi+ntOHI4Zkfta0QlBX0YEedR2Ra
	E+smE3IvbfhkmG6MQm+V1ZLDkhNe+hxOU9Aj61UwsrnaDLZcU6GyCiw29BLQQKqRMpAMcbhjHJy
	AY951Tbej4wr6n7TIRvKI1nqSBJiaqBo=
X-Gm-Gg: AYBFou3ZWyTVTudZqyQ/KLrv0KJ6kTRd67zNGB4w24c+Dc/qej4jMbqtxsDG/SSWBef
	6DLFDGn4oBk5eAIgGvxe/nJVTRoCuPfQtSTl0EIgCdrbfaTd1SN7yNsrfCY+jFYmeLo2/vYdWDl
	+mL2Pos6NAHi2s/jp12g+8Q1MbbFq0hnaFjVNboqIE/JODUI/fN/1nTa4spdA/ZhLDd2Ms3dZLM
	NvfQ+DWh9hagekqaqtzhXSA3GAYvH+eLyufzOKfwYZ2cA+0nEjH/7q7kIO4t4P0nzW2Zn686Ln8
	dIGCZ9e2vHqmYA75eVLVslmGfDF3j4/RGYvGUY5t4b8Gcq3DuRqNJjPhGc2534Bd2s7EhYCiDpT
	AJ7O8dJVThAkgS/7tIcIppOfDt+42ylmK1w==
X-Received: by 2002:a05:6820:80c5:b0:6b7:46fa:1692 with SMTP id
 006d021491bc7-6df3448d782mr1629749eaf.39.1790930109359; Fri, 02 Oct 2026
 01:35:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:07 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:07 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Fri, 2 Oct 2026 01:35:07 -0700
X-Gm-Features: AclHuK_lIzkwVUGNC0A466c6EgUohcqWHY2f_jeQHwqYNNU_2ok-f3xdMwKP4tE
Message-ID: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Subject: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
and a WV517S rear-camera lens actuator.

The series adds the missing ACPI and bridge configuration, selects the
OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
capture and adds the sensor controls and actuator driver needed by the
hardware.

Runtime validation used the same functional 15-patch content on the
current media_stage.git master. The final media-committers.git next rebase
and review edits only change source formatting and equivalent frequency
notation:

- W=1 builds and sparse builds of all eight affected objects passed after
  the rebase. The OV8858 object passed both again after the v9 review
  edits.
- A full x86_64 Debian binary package build passed and produced kernel
  7.3.0-rc1-yogabook-media-v8-20261002-001605.
- The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
  8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
  both sensors bound and AtomISP registered two cameras.
- OV8858 digital, red and blue gains were changed during streaming and
  read back correctly. Continuous raw capture produced changing frames
  from both sensors (6/8 unique rear samples and 8/8 unique front
  samples), including front-to-rear-to-front switching without OV8858,
  I2C or CSI errors.
- Both front and rear cameras were also exercised successfully with
  Cheese.
- v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
  40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
  control enumeration, stream-parameter and buffer tests. These failures
  remain a validation limitation; this series does not claim to make the
  staging AtomISP driver fully compliant.

Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
24 MHz paths received build and static-analysis coverage but were not
tested on separate hardware.

---
Changes in v9:

- Express both OV8858 input-clock rates with HZ_PER_KHZ.
- Drop trailing commas from the terminators of all four new OV8858 clock
  register tables.
- Resend the series because the v8 mail transport wrapped patch lines and
  produced patches that do not apply. There are no functional changes from
  v8.

Changes in v8:

- Keep patch 2's commit message focused on the implementation, remove the
  invalid review Link and move runtime results to this cover letter.
- Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
  tables by their input and link frequencies, and remove platform names
  from the sensor driver.
- Explain that V4L2 exposes standard red and blue balance controls but no
  standard green-balance control, so green remains the unity reference.
- Replace the per-sensor link-frequency override with the IPU bridge's
  existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
  288 MHz entry before the generic 360 MHz fallback. This removes the
  associated AtomISP hand-off patch and reduces the series to 15 patches.
- Add the introducing commit to the OV2740 group-hold fix and mark it for
  stable backporting.
- Use the documented Assisted-by tag syntax.
- Keep the padding helper as a normal static function and avoid a
  single-use raw-format descriptor structure.
- Retain Andy's Reviewed-by tags only where the corresponding patches did
  not change materially. In particular, drop the tag from the redesigned
  IPU bridge frequency patch.

v8 (transport-corrupted):
https://lore.kernel.org/linux-media/CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com/
v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/

Maurizio Casciano (15):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and manual white balance
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: select OV2740 frequency by IPU ID
  media: atomisp: derive CSI-2 timing from sensor link frequency
  media: ov2740: release group hold after gain write errors
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 114 +++++++--
 drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
 drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  13 ++
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 14 files changed, 605 insertions(+), 129 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: 4a069a763e8a86821edac4159f7c59a20015631b

With Best Regards,
Maurizio Casciano
-- 
2.53.0
