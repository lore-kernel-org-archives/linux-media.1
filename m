Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C433D6F0;
	Wed, 22 Jul 2026 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719099; cv=none; b=GXHz0KzpEf1FEJfZqOqzKcBzvV4bLi+p2MPOQwZM1YDEN/HJVk9tUx1hArxm4aKtAWd/lfFSXAJC0tMJAgqET594VPK/IY09j1atittYQ10ZFdDZdtHrHn42DiiI/bOixyRBsxICXZwevmoOkoRxFjVm5Tyilgb3+ugetehN5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719099; c=relaxed/simple;
	bh=o6rYK/eNv8bcSFo7fL+857O+U9ALkmiDqUpHq8yoVvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xq1T1mSAvg96c/6PKGaGWBjw7lVOwlp+k1yRNmy4rMxPvigqTVMyVRf0KpHBn5x09aE0KrYUEzKJB9caSWi5rvsGnNq4Jk0KJyBQJe/OrxIdhryxZNZ05DSxSxunLTinlOaLt5nle6nDryNXGlEcZSIkO0kcYGrp3IO/4zLjOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0UNfG33; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0UNfG33"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77E7DC19425;
	Wed, 22 Jul 2026 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784719099;
	bh=o6rYK/eNv8bcSFo7fL+857O+U9ALkmiDqUpHq8yoVvw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=c0UNfG33lUZVuThTEiAZ+lf1eKbV2qgNfqW74+6n9hRGZi5PDcEZnxofZ06YSQc65
	 IOkJa6UqhVaKZrFSp0rw1rk3zFNKFdhAwWHDq04u74xnO7jw0y88XGJuajLBSJIyET
	 TN//JmiPPSaiCvrVJl0dpI9b0LfOIEQHq91O/l1ndWugXi1hBzzDpRrd0I2AwEmC5J
	 IsM13bfg+dwq6dvkxRrTp0BG8hYzKwQl984U98EkB896s4nK7MN7IDNy/4xeBCY5YB
	 zj7o6AZM1ZtcIrGSbpLoQvCnqdZugw3VJ7qFwt+fM4ek2IzEhb9TUcw6aOaxA+u307
	 tfow3ARXRVCGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF9CC44539;
	Wed, 22 Jul 2026 11:18:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v6 0/2] media: i2c: add support for ITE IT6625/IT6626 HDMI
 to MIPI CSI-2 bridge
Date: Wed, 22 Jul 2026 19:18:15 +0800
Message-Id: <20260722-upstream-it6625-it6626-v6-0-6117d4d96574@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPemYGoC/43QTWoDMQwF4KsEr+vgH0n2ZNV7lC4cV268SCbY7
 rQlzN3rpF2kDANZiSd4n0AXUblkrmK3uYjCU655PPVATxsRD+H0zjK/9SyMMqScJvlxrq1wOMr
 ciAz+DpLkHYS9D2gVil4+F0756wa/vPZ8yLWN5ft2Z9LX7R9p1Bo5aakkOBy0SQ4Ah+fceBvH4
 7Z9iqs5mXtHrzqmOy5CskgQg/ULx947ZtWx3RnAMaqktCNYOPCYA92JyloyvEeMYeHgYw52x3r
 HDj0kE///Z57nH0Ui2eXdAQAA
X-Change-ID: 20260716-upstream-it6625-it6626-6874ab8a5305
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784719098; l=6647;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=o6rYK/eNv8bcSFo7fL+857O+U9ALkmiDqUpHq8yoVvw=;
 b=72WCzJBrn65kMvTNcDltZYvaXnIFiNIX+lA2gDCMC/ZOQJv9qCu4N2ju8h7PW6QxhTpEq/Wm9
 /rWgzudEaxHCtXfKjnQ9Xrvy4duBIZG7AM5WLV78dgM7rFTL6byipUK
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
its two selectable CSI-2 output graph ports.

Patch 2 adds the V4L2 subdevice driver itself.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v6:
- Patch 2 (driver): fix two correctness issues found by automated
  review of v5 -- an ignored v4l2_phys_addr_validate() return let a
  malformed CEC physical address reach cec_s_phys_addr() and get
  broadcast on the CEC bus, and it6625_parse_endpoint() pre-set the
  fwnode bus_type to D-PHY, which made the parser reject every IT6626
  C-PHY device tree outright. One other v5 review finding (a
  concurrent-ioctl-vs-remove() race) was checked and is not being
  acted on -- see the patch's own changelog for the reasoning.
- Patch 1 (dt-bindings): unchanged -- the v5 review concern was
  checked and dismissed; see the patch's own changelog for the
  reasoning.
- Link to v5: https://lore.kernel.org/r/20260722-upstream-it6625-it6626-v5-0-387e7584f2c9@ite.com.tw

Changes in v5:
- Patch 2 (driver): fix further correctness issues found by automated
  review of v4 -- two debugfs read handlers could leak uninitialized
  kernel stack memory to userspace on an I2C read failure, TRY-format
  state could go stale or leak active hardware state into what should
  be an isolated buffer, a concurrent S_FMT ioctl could interleave
  with hardware programming because the lock was released too early,
  S_EDID's blocks==0 case didn't actually disable the EDID per spec
  and a failed EDID write left HPD disabled permanently, the mipi_reg
  debugfs write was unlocked, and the HDMI info control returned a
  hardcoded string instead of real telemetry; also wire up the
  previously-unused reset-gpios line during probe. See the patch's
  own changelog for the full list, including three other v4 review
  findings that were checked (one against the hardware author's own
  knowledge of the chip) and are not being acted on -- see the
  patch's own changelog for the reasoning.
- Patch 1 (dt-bindings): unchanged -- both v4 review concerns for this
  patch were self-dismissed by the automated review itself with sound
  reasoning (the endpoint/patternProperties gap matches an established
  single-endpoint convention already used elsewhere in-tree, and
  dropping port@2 doesn't weaken validation since graph.yaml's own
  generic port pattern still covers it).
- Link to v4: https://lore.kernel.org/r/20260722-upstream-it6625-it6626-v4-0-c03362eb55ca@ite.com.tw

Changes in v4:
- Patch 2 (driver): fix further correctness issues found by automated
  review of v3 -- a CEC RX interrupt left unacknowledged on an invalid
  message length could storm the IRQ line, set_fmt returned -EINVAL
  for an unrecognized format code instead of falling back to a
  default, get_fmt's active-path reads of the format state were
  unlocked against a concurrent set_fmt, g_edid/s_edid didn't follow
  the VIDIOC_G/S_EDID spec for over-capacity requests, and the two
  mipi_reg debugfs handlers were missing locking/offset handling; also
  mark the HDMI info control volatile so it is actually refreshed. See
  the patch's own changelog for the full list. Separately (not a
  review finding), drop a redundant FW-start register trigger from
  probe -- the firmware starts automatically on power-on.
- Patch 1 (dt-bindings): drop the unused port@2 (HDMI input) graph
  port entirely rather than the review's suggested fix of adding it to
  required, and require bus-type on port@0/port@1 endpoints for
  "ite,it6626" specifically, since only that variant's D-PHY default
  can silently mismatch actual board wiring. Both found by the
  automated review of v3, which also flagged one other dt-bindings
  issue that was checked and is not being acted on -- see the patch's
  own changelog for the reasoning.
- Link to v3: https://lore.kernel.org/r/20260722-upstream-it6625-it6626-v3-0-947e50f01764@ite.com.tw

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

 .../devicetree/bindings/media/i2c/ite,it6625.yaml  |  169 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   18 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/it6625.c                         | 2216 ++++++++++++++++++++
 5 files changed, 2411 insertions(+)
---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20260716-upstream-it6625-it6626-6874ab8a5305

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


