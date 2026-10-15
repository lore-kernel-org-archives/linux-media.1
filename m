Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB4D53C3DB
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079871; cv=none; b=ekVlwG3Hsa538AfovMRUChlAhHThPB+lPF/uGkipnE8wCCUCTdIRCWd+SrKEYbNFIxaKTEIo29Edaf+GXQd2e27fany2EIIEeGcb/NmBUzAWaDdN0b2LBLoHAHXHDJ94Ssg5WlL7A7iC75LoXNWuvUX1SU1tlBVtTbvddLd5vO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079871; c=relaxed/simple;
	bh=NI0x3cNqRQjYsJV4SD5iVBHH+lSnJhHj4wt3i9rW3GU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DGJ3ZvBqtdypvwRsTfeu53q3/MGVKLnLVVRgXOC8YQVfuVyAB2PTjAWojC9LiQw8qs4+HTez3khJEbt0sLKswz2WcL5NNHD6pSA0EjreC7m/jGyvHAoUIidkvS21AxEtnXgmL57RCDjefLUZhR5ivfaRaCbooRL4P30T2uFUqBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Jvk4m58N; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Jvk4m58N"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b042c0759so4072685f8f.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079856; x=1792684656; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rjPmk8yoU8WuCL9EyK95+qhydvwSKs+esazwJ5qKUvo=;
        b=Jvk4m58Ne8fLM++ww4VHykN0TloQAAxOiEqfcX4sba/80XwAOnvxYIkrx124P93WgO
         xmv8+kO7qR56AtHzkpgytFQHXPI54Mv429xPwo7VPsVCLs4zE3zSUrF+S14s4GamKZo9
         ksrBly1ALu8l7weapTREZuuicVpjOyGEYPvqtWKVIuwPuhw2KJBenI0DKxfofWo/XhEV
         gRurG8wqrtI/cPeo8Io0xSUefRiOjtId8F7scdVtSUXX+agdIw1Ekyv58fH2+oHWxSOn
         UhffClRQIHEZGmFL7inK/S8XW3YaeXDOE4a7yz6JksFSuThKR399t33+KZe+Y4ONTz6j
         VhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079856; x=1792684656;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rjPmk8yoU8WuCL9EyK95+qhydvwSKs+esazwJ5qKUvo=;
        b=TE2KdVVAI1cRgPe4rIgVT9ZGwA4bIfW1qzf4y0dLsHYgtpeMrSEjU3Y4pX/OnS0KDs
         91v0JHPswCuT+4v/MS7NV+/W01/XJdvwJNQaSVN7ljaBEwX7hWANdAtLKUKv7jErtPFe
         hcbyo9Cl+1TRSFzbRsHCMAparhwIDHzIk51wGdV44amKJJxoy7kL6293vKcc1ghI/6gq
         iL9FI3UVVneRySS2AUIOjU9J210XkHp/nQNX+n1mEFrK9mLt3PftvYXwis31s95kF+PE
         umIdg/pAPSn93Y0TG91RoBNjMnNqDN7xb9c71zQzd7tqGfy01yKB6Gn56TtmTQfO9s8a
         YOiw==
X-Forwarded-Encrypted: i=1; AKwUvBweJ5UYe0DFr3FMdnQ1lKT13dd376sGPSUIE+ZB6ORlIUPu7WyaUNHwz12o0DSnt7CzXPcs1hivGYNyHQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJAKAADJNcMIHTjehpb7KmR9VwXTnVZx/Bgc4K8/UkDlJPpBv53
	qO0v/umHBLTlWfCgWG6GkuVID/EWcrxmoC9o58fEgaH5BMfB5d0rL1oUEgcc6txNw5I=
X-Gm-Gg: AYBFou0fFi4C8U0z0w/itUaIuK8rYl8Q8eCk1ZeSJqhDsIFaXt439RZYPO0hq1uDfx1
	pd9/TEmX2EbQjXEa3Ju2lO5azw7Emudmfewd86ggBw2Xgke0jYgdu9bG/cyjOoEuJzhRHqJBsJ9
	zdVJwcL0BXBpzh0R9t9YCpaSdo+l+2mVStSoND4uOJ27w0kpZiHQQEnSfhbNUslqspsGfWn+f58
	hBJ3K4wsucPdjUMf9+zv5QyWHpSBS5Ahqw8pgMMQ2eM0tTUBBBs3gYIbsoiK9tdTz0gWh9dtNJo
	4+q1FY1yYYQNlRPgJv8966sYWhZoNHLKASHH5xvOBV+jhaK1Lby5GPRrFVcZ/QZ9+0JC0lZYI5A
	BxQ+vB8xMw9qLCUkmNMpFiBMjWa7ZHWNuKcdmXzQ0E2PkKQa6wS8GMWLTTsHNcmVF9Vg8X6iMJ6
	oIaIbjiiMqMML+YRuvD+fajF3zWp2brHw55RGwvmrIC+VE1E8aMMVPQh/01M0456+2iJ3mGM4At
	zlwHJHDQtgGHUEJb2xkannMpt0NH46o341Cjqr7pqMDvRrcFg==
X-Received: by 2002:a05:6000:2992:10b0:488:654b:ccd8 with SMTP id ffacd0b85a97d-48dba7819famr27536201f8f.6.1792079855874;
        Thu, 15 Oct 2026 08:57:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:33 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v4 00/16] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Thu, 15 Oct 2026 16:57:26 +0100
Message-Id: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOf30GoC/23PywrCMBAF0F8pWRuZTB6trvwPcZGko82iD5ISK
 KX/bhAUsa6GC/cemJUlioESO1cri5RDCuNQgjpUzHd2eBAPbckMAQ00oHhPbbA8zTaWMnKjrXZ
 egXa1YmXUhTSPcXl5WZRzfU/17zQLDvwkqCFFlpS6X6JNk6MYlykc/dizWwEzfhABQu4QLIg0N
 dSILWqw/xH5jeyeyLIg/qQbadDpFswe2bbtCRu7AXcsAQAA
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
Dave Stevenson (16):
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
      media: sony-starvis2: Add support for IMX585

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   38 +-
 MAINTAINERS                                        |   14 +-
 drivers/media/i2c/Kconfig                          |   19 +-
 drivers/media/i2c/Makefile                         |    2 +-
 drivers/media/i2c/imx678.c                         | 1447 ------------
 drivers/media/i2c/sony-starvis2.c                  | 2362 ++++++++++++++++++++
 6 files changed, 2416 insertions(+), 1466 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

