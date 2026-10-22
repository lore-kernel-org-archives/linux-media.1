Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690470;
	b=ORJkzc8gWN/0mgHjLXORXNmjolGvPjX79uFfKizNkp46hOxK9PUA7Q8bElDgpiiW4XIj
	 cYhWJ4xVizpTv4RXungwEDNSzYTFTE5uTbY/qnDskPJ92ZvTVm36Oezqw16UoJReGbCHQ
	 1FYmOKs/hNfze6omYx/Myn7A9LYDy+9ZFsX5UCX0qlJkHlcM5PONJNgSQPY4zdxeCjzFH
	 MWLaB4ljVQWpWkCjTnc7tlLYn++XoPUkmHI+1CnXpvlOT476fQu4Mvt0scz47G8jBHPB0
	 qiof3dp3LIX47OW1Sm2JcCGnDclRM0lnJ/6Phb8nTcmKVFgmNqw/u7Ht0Xq5XbVBI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=eNt51ERTHzWJfRV7jcAQw585b0hP8yWgGWiry/cAsUY=;
	b=0cVNZanEO6I0h6+bIUZQYzgJ+/TeBhooVGBRVb67UHadYlbQJJCwQWo5Bf8wJ9OFPA40
	 dKC1w/2Yy0Zw0pXiS+5YkpVHDPVygNyxX44ldhR7blqAEMXsbHPTvTZofHs04JwEeiiZP
	 5RqcyKNGxVaxvWJIX1Ef/LrIHcSMYl2dS8zwsFyA1R9yDh40SbUrpXlwEc40nihG+JcZS
	 Zn8gSvQ6J5d6XuxokaoUBr3WI+9A55z2/kTmYp8OK+Jgl1PmRSlzTqWfGGsHH4S/WnQ42
	 1ziXAbaXHLL0kfXzHnDqv7bkeXwmkhDlBPNU/e6uZcFHFB3rOSnDJ/TeZjmicIdVCqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=DEdOsYog;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13849606A319
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13849606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=DEdOsYog
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so671835e9.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690466; x=1793295266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eNt51ERTHzWJfRV7jcAQw585b0hP8yWgGWiry/cAsUY=;
        b=DEdOsYogoSDpZiFPBmnQjTLIMW+kGzKuDfo2ee5DCjfyeOeq9RK7N87Vh2WeYC0UpC
         t2isgkbM2bwSioapj58H0MazWDwgb2gfmT2/m5UbcR7pl+osGp+rRPfNh2G3SmI4hTYu
         /jz/hFqCN4Aob2HJA8IQ+juUv0iruOIVY8dzc3Km0iTnvE2gbPR7bC64HomNSK+Q6pwh
         LUCRoUnguxsUNQtmp4Ki2fyapM1dl17LWWabGwQD1ZAkL1mzNM9myUh2NMJ/cl0ba/aU
         RmL0pEZI0WRUUwo4aE07j1m1QL7+xR/M64O4decf5EAsArVsm74tu/mWGQKOysrpUKzs
         QPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690466; x=1793295266;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eNt51ERTHzWJfRV7jcAQw585b0hP8yWgGWiry/cAsUY=;
        b=QI+scc4YaYH6zm2qV459TQKQ5B7qK4PmBzxloF5JwA8IekHEBR3Ibi7SFprbeBHPms
         tRV5gLsXjhzue+H1N70SsFLpaBNHxBsevR1YYLoxUg6coKK9v2FE7KAADHs0YwszJ7j8
         56zgIAv7wjlllFzoRYO4XPiwIU/MFjY92NCAikbB4ZGOqxeRbn5hNvfKCbDdPxuDPTu/
         qed89bAlyZ/thanHEZEf9JGXFeyKjGakBbH2gh9nNcP2LK7U+4cc3+3k+5LpUrbnU181
         ISkBSS7YkAq3hC6Q95PVCCql8+PYIvvgfHZSJDJCGX1hIHQsAjWNzfZhSF054dbJfNvE
         JJgg==
X-Forwarded-Encrypted: i=1; AKwUvBzX7a1lCHH6Q0cqBTghIKJzDs+WxX2mIKlSxd8HRxbjZE2npVJIwd5kMVCR6OSN9NFP6uFKKTqXv8uoWA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEE1rkVOiDyDamAhnAyjH2CtiHF3Fb1FFytsTjHPhEUPiaFxn5
	W7khm/CY+x9bOOXmJmioz22jHgPuZNqCPSb7OWlCYW5DKOVgCooAyaG5kBweYuIk4rU=
X-Gm-Gg: AYBFou3VRq4Gw54dmreuWISN7S+tZOA8dkijKKfv8kR+Y7FPOz8dVs1yUy3g5/oqTDB
	W3iyd0gYAVrP1PQkpRniMLvTyyt3rwop0m50o0yCmhQenf6X+vDRqxKqaKqBovVE+qdJqH7IdNn
	+iEpGE5l4Xc5fxoebe7IE/ONEQ0UpyFryLa0/Ugob6cqA3boUvbgyD2AqJ3MODOHijrF1kgAeZr
	IiRbwbJDc7Rc/RvCPABR8ShnjTGpgyii3tSC4gtZCZhHpPkmDC2BsA7Zpb2or6S4VFlP/yau4eo
	3mYUb0/VuXGM20NtCcQAg75VntaOWqoDcQIq5sxd05feq8fqwdMTS01PqN+1Wy2ZBrfjUdyN471
	JtUDiTT1/zh8vwYW04G1vPtvRQ7LlmS79PqPIVSNQsPigkttK+K2XKZ2mR3Jsc/o1zbTMtcsWf5
	m/RfCK4cfhxQvos9za5gBGXRqRm6LVSgQQE6bZdQP6k9HrnexoLk0HJKFT1pBL+dNY1db4BIGkI
	QDtc5DXX7nsVhWebdV3oTO3xM8ykLXsh39LzOhINot66oyPMtXuAb+SpnFeNvf2pcrCkFmMDshx
	eh0UOozoPh525aNe6I/GvCNKhJg7EAY=
X-Received: by 2002:a05:600d:8646:10b0:4a2:390:712d with SMTP id 5b1f17b1804b1-4a203907493mr48509035e9.33.1792690466306;
        Thu, 22 Oct 2026 10:34:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v6 00/18] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Thu, 22 Oct 2026 18:33:53 +0100
Message-Id: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFJ2moC/23Py2rDMBAF0F8JWldFjxnJ7qr/UbrQY9xokThIQ
 RCC/71DocVUXg0X5h64T9GoFmri7fQUlXppZb1ycC8nkc7h+kWyZM7CKOPUpEBeKJcg2z1Ufjb
 SYcCYQGH0ILh0Lu2+1seP1zWfj98q/q92LZWcNU0EFAhgea+h3SLV+riV17RexCeD3fwhWmk7I
 IYR67zyxmSDKhwjdo8MI7plJM04WWciZuWOEdgj4xxgxOOScgTt7GKPEdwj84AgI0TLbNGCTzS
 PyLZt316SMSS2AQAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has already been accepted into the
kernel.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated. Subsequently I was able to
add IMX585 (8MPix) and IMX832 (1080p).

The Sony datasheets are rather lacking on the limits for HMAX.
They list HMAX (and VMAX) values for nice round framerates at
a number of the supported link frequencies.
These limits have been adopted for IMX662 and IMX832, but for
IMX675 and IMX585 they have been determined empirically by
observing values of HMAX that start to introduce image issues.

Now cleaned up over the RFC V1.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v6:
Addressing Sakari's comments:
- Updated CAMERA SENSOR DRIVERS in MAINTAINERS
- Used tabs instead of spaces in register defines
- Added myself to MODULE_AUTHOR
- Added Raspberry Pi Ltd to Copyright header
- Reworded dtbinding description to avoid needing a paragraph
- Removed unneeded parentheses and assignment to ret in link freq
  patch.
Sashiko:
- pm_runtime accounting error.
- REG_INTERFACE_SEL and the mono ID register have moved for IMX585.
  Now parameterised.
Jai:
- Added IMX676 support. Copied from https://lore.kernel.org/linux-media/20261022105623.4179467-2-jai.luthra@ideasonboard.com/
  with minor fixups due to the above changes.
- Link to v5: https://lore.kernel.org/r/20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com

Changes in v5:
Fix Sashiko issues that were present in V3 but it didn't report.
- v4l2_ctrl_new_int_menu failing for LINK_FREQ could avoid
  printing an error.
- Make setting common_regs_written conditional on all cci_write
  calls having succeeded.
- Please note that the checkpatch failure on the first patch is
  a false positive. starvis2_of_match does have the sentinel, but
  it's not shown in this patch as it's being renamed from
  imx678_of_match. I'll report the false positive.
- Link to v4: https://lore.kernel.org/r/20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com

Changes in v4:
- Added Krzysztof's tag
- Made the variant_def structs static (sparse)
- Put the sensor back into standby after identify in case PM is
  disabled (sashiko)
- New patch to enable pm_runtime_autosuspend.
- Not fixed a Sashiko report of potential use-after-free with
  v4l2_subdev_cleanup vs v4l2-ctrl_handler_free. It is a
  pre-existing issue in imx678, and many others are sharing the
  same pattern. There is no immediately obvious solution as the
  active state is sharing the control handler lock, so the
  suggested inversion of operations will use a destroyed mutex.
  https://sashiko.dev/#/message/sashiko-outbox-171674%40kernel.org
- Checkpatch error "missing sentinel in ID array" is a false
  positive, confused by the comment in the middle of the array.
  That comment was pre-existing in imx678.
- Link to v3: https://lore.kernel.org/r/20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com

Changes in v3:
- Sorted compatibles list (Krzysztof)
- Corrected exposure limits for imx585 via parameterization (Jai)
Issues identified by Sashiko-bot
- Fixed the Kconfig for VIDEO_IMX678 still depending on GPIOLIB
- Removed the remnant build rule for imx678.o
- Fixed sending the common registers if CONFIG_PM is disabled.
- Fixed potential NULL deref and lockdep in link freq handling.
- Fixed the duplicated active_area definition for imx585
- Link to v2: https://lore.kernel.org/r/20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com

Changes in v2:
- Switched from an RFC to a patch set.
- Add the dtbinding changes.
- Added IMX832 and IMX585. Tested and fully working on all 5 modules.
- Updated 2 lane handling so that the higher link frequencies achieve
  the maximum frame rates.
- Adds a patch that corrects the minimum exposure time.
- Allow userspace selection of all link frequencies specified via DT
  (makes testing all the link frequency options far easier).
- Link to v1: https://lore.kernel.org/r/20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com

---
Dave Stevenson (17):
      media: imx678: Rework into generic Starvis 2 sensor driver.
      media: sony-starvis2: Reorder link frequencies to remove lookup
      media: sony-starvis2: Always program the sensor in window mode
      media: sony-starvis2: Parameterise the configuration to allow for other models
      media: sony-starvis2: Rework 2 lane support for higher link freqs
      media: sony-starvis2: Allow runtime control of link frequency
      media: sony-starvis2: Correct the exposure range
      media: sony-starvis2: Put module into standby after identify
      media: sony-starvis2: Use pm_runtime_autosuspend
      media: dt-bindings: sony,imx678: Add other Starvis 2 family members
      media: sony-starvis2: Add support for IMX662
      media: sony-starvis2: Add support for IMX675
      media: sony-starvis2: Add support for IMX832
      media: sony-starvis2: Only update bits for window mode
      media: sony-starvis2: Parameterise exposure min and step
      media: sony-starvis2: Parameterise the mono ID register
      media: sony-starvis2: Add support for IMX585

Jai Luthra (1):
      media: sony-starvis2: Add support for IMX676

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   44 +-
 MAINTAINERS                                        |   15 +-
 drivers/media/i2c/Kconfig                          |   19 +-
 drivers/media/i2c/Makefile                         |    2 +-
 drivers/media/i2c/imx678.c                         | 1447 -----------
 drivers/media/i2c/sony-starvis2.c                  | 2566 ++++++++++++++++++++
 6 files changed, 2626 insertions(+), 1467 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

