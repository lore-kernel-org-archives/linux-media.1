Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA8B3AFD1F;
	Wed, 22 Jul 2026 03:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691866; cv=none; b=nSxraCZJV6jnzcA6HJlpmD3ZTX+XLiGlAUTcJhV6NiD8DPR2XcXH6gquTH4eCZyzko1ngynqi020C2ua9CFlGcmOLf2AyUYx/QQ76G63GAS+Ai7u4RsupbbHbnQ8mwnz8jMXYZ57ucvQkOwtuluetXTrY1Vh+wXWByyMRv71D6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691866; c=relaxed/simple;
	bh=YFtj+AF6Y/2H4A9EKRMoL+7Dhr2IBvPopswELXhNU30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JTAp8GOJ48Ux/O+3hYff4AVHzzZpVZHNMjanSRYwC7vwSrUECVRA2ulVYUSZWLs3GR5Q/PncZpDu2QWxiB1z2Q2BvBsPzWJnIWL66yAcrMqh+Zt1n0YziVsZZ36YBFZefSA5u/RCPVScqb59MPYgvmpXl9N4ZoFed0dyEIySF8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVBHLmxL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVBHLmxL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A919C19425;
	Wed, 22 Jul 2026 03:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784691865;
	bh=YFtj+AF6Y/2H4A9EKRMoL+7Dhr2IBvPopswELXhNU30=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FVBHLmxLa7SfSmRFDibn/lsvSedjOl4laXW3qITBrtIb1bwS/o82MsEyD/FfPR9tr
	 97ZO601JcbZqNc2Bjn1qrI7CNG02mqbDqrlhMDE5XB83eUswYXaH0jsovyhTjW63Ow
	 SbmUh206657dZIetSgzpQoVfc3B4DPpbvvJCqS9RpljAAQgReSk/MEeAPgYvLmYkdP
	 SUq2VRHnaMBelhvidjE8EjuBRGGevQ08rXnbo9/2Uchgm9K2BuddKVrJ86aJwNqxOp
	 KqqV7gHiOZisC5MjkmLYt31dAhYbAsI/vPsh/mmZ74uaTsw/y6El6qhBJ0zTMcIjE8
	 DTiGClhtwhAog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59691C4452D;
	Wed, 22 Jul 2026 03:44:25 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v3 0/2] media: i2c: add support for ITE IT6625/IT6626 HDMI
 to MIPI CSI-2 bridge
Date: Wed, 22 Jul 2026 11:44:22 +0800
Message-Id: <20260722-upstream-it6625-it6626-v3-0-947e50f01764@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJY8YGoC/3XNSw6CMBCA4auQri3pu8DKexgXtRaZBY+0tWoId
 7egC12wmvyTzDczCs6DC6gpZuRdggDjkIMfCmQ7M9wchmtuxAhTRFOF71OI3pkeQ1SKyc9QWFV
 amEtlJCcS5ePJuxaeG3w65+4gxNG/tj+JrtsvycgemSgmWGhZU9ZqIWR9hOhKO/ZlfKDVTOzXo
 bsOy462ouVSCWt49ecsy/IGlyboPgUBAAA=
X-Change-ID: 20260716-upstream-it6625-it6626-6874ab8a5305
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784691864; l=2911;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=YFtj+AF6Y/2H4A9EKRMoL+7Dhr2IBvPopswELXhNU30=;
 b=0/G4r2S0O3DoxrFfDvLCISnltSH6g4Kzu+81kWIB+nEIBHRgHMe+amhqS7FuytN8bZql7BN0A
 3M3t0LALkKNAxvCA6NM7kdnRySQ05eISgJCT9yPcvFwItSX1G0n3GB7
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

This series adds support for the ITE IT6625/IT6626 HDMI to MIPI CSI-2
bridge chips. IT6625 accepts an HDMI 2.0 input and IT6626 an HDMI 2.1
input, converting it to a D-PHY (or C/D-PHY on IT6626) MIPI CSI-2
output. The bridge is configured over I2C, exposes an HDMI CEC
adapter, and supports EDID read/write, DV timings detection and
configuration, and HPD control via the standard V4L2 subdevice pad
and video ops.

Patch 1 documents the devicetree binding for the bridge, including
its three graph ports (two selectable CSI-2 outputs and one HDMI
input).

Patch 2 adds the V4L2 subdevice driver itself.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v3:
- Patch 2 (driver): fix further correctness issues found by automated
  review of v2 -- two banked-register reads still missing a lock, a
  CEC RX length TOCTOU and a dropped CEC TX interrupt on invalid RX
  length, it6625_s_edid() treating a successful write as a failure,
  missing V4L2_SUBDEV_FORMAT_TRY support, an unlocked active-format
  commit, and detected timings lumping the whole blanking interval
  into hsync/vsync instead of reading the real porch registers. See
  the patch's own changelog for the full list, including four other
  v2 review findings that were checked and are not being acted on
  (with reasoning).
- Patch 1 (dt-bindings): unchanged.
- Link to v2: https://lore.kernel.org/r/20260721-upstream-it6625-it6626-v2-0-7c4f3564ca38@ite.com.tw

Changes in v2:
- Patch 2 (driver): fix several correctness issues found by automated
  review of v1 -- premature V4L2 async subdev registration/teardown
  ordering, a missing-lock race on banked register reads, a
  status-poll interval bug, a dropped CEC interrupt, an unacked CEC
  transmit, set_fmt mutating active state on TRY, EDID blocks=0
  handling, and a couple of uninitialized-stack hardening fixes. See
  the patch's own changelog for the full list.
- Patch 1 (dt-bindings): restrict port@0/port@1 bus-type to D-PHY (4)
  only for "ite,it6625", since that chip doesn't support C-PHY (also
  found by the automated review of v1).
- Link to v1: https://lore.kernel.org/r/20260720-upstream-it6625-it6626-v1-0-475912f74459@ite.com.tw

---
Hermes Wu (2):
      dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge binding
      media: i2c: add driver for ITE IT6625/IT6626

 .../devicetree/bindings/media/i2c/ite,it6625.yaml  |  159 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   18 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/it6625.c                         | 2131 ++++++++++++++++++++
 5 files changed, 2316 insertions(+)
---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20260716-upstream-it6625-it6626-6874ab8a5305

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


