Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E39F1A683E;
	Wed, 22 Jul 2026 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704813; cv=none; b=s19uzCb/0W2DyIFD8fal5XsJ/llsXOGEPB4pt7/ewe5dAlSrEvBZztBpdSMpqBPcbYn4XYONnhhX4VCCRCfZByvpIksZsfZMw89yqg8ePWvkJy7jmjQ8pU8uSc9OJB5Zq3vDscCfOQQasSV+DdJyksxIywqIEAlokuUBTmjhhxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704813; c=relaxed/simple;
	bh=/EgEB+1tc9COcTS4TL2bIEnOqFyGfjatQ4DEGOraLuA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ixLIJjedsgZzB/95dsdulUdZSngOIZIQ05wbBNqUM0a0NGZgGUfhoJJXgnFtCEgoPfoUUW2BJKeuM/lnYKiGNYa1PIomr7MD0uCud27SmOdQ/cpJludVoyUuFX5/5+AWN16gnNUpNen0KXpSeWDzWUSc/VOJ8M1EZ3HfJFf8Rs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBKMcO0k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBKMcO0k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39F54C2BCF6;
	Wed, 22 Jul 2026 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784704813;
	bh=/EgEB+1tc9COcTS4TL2bIEnOqFyGfjatQ4DEGOraLuA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GBKMcO0krcIeU6DgbXp8JoUISCkClx9/2+Q6/XzkXA824kAELZZZnv6H3Wu3k6+kR
	 Yy0wvuP6PSnj0+XQKzjr3rgfWfxiRz1ZmXg8QO2UmfqZ/NQkFP1NhNPugfcV/Z1JIm
	 CBUp+NKGzBM6j9FoK7UqsiIK/ZXT2GdKBaBmUi5qrGGdzVODLWE5UnY53EelClyHYV
	 PPcVg+AzcA7deeH2gVLH7v9S3sVR9JCT5mns9A0xxwmWiPycWpfI/lim5yLyc4POmK
	 mPbHN7B/FIp0TmRWmaeVLMOEQKlNmNCVOfhXXb1e+9XLvyksumMGTdhgwXd1dH3g0+
	 Lq604Yb2sKRKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39B2C4452D;
	Wed, 22 Jul 2026 07:20:12 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v4 0/2] media: i2c: add support for ITE IT6625/IT6626 HDMI
 to MIPI CSI-2 bridge
Date: Wed, 22 Jul 2026 15:20:10 +0800
Message-Id: <20260722-upstream-it6625-it6626-v4-0-c03362eb55ca@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACpvYGoC/3XNSw7CIBCA4as0rKXhMUDrynsYF4jUsqhtAFHT9
 O7S6qLGdDX5J5lvRhSsdzagfTEib5MLrr/lgF2BTKtvV4vdJTdihEmiqMT3IURvdYddlJKJz5B
 YVgr0udKCE4Hy8eBt454LfDzlbl2IvX8tfxKdt1+SkS0yUUwwKFFT1igAUR9ctKXpuzI+0Gwmt
 nbopsOyoww0XEgwmld/Dl87bNPh2alBWUEaQpWEH2eapjffdOrPTQEAAA==
X-Change-ID: 20260716-upstream-it6625-it6626-6874ab8a5305
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784704811; l=4332;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=/EgEB+1tc9COcTS4TL2bIEnOqFyGfjatQ4DEGOraLuA=;
 b=CiKl0Xd2Wsdb7r56TcG/evVEQt7HpX5HUe1oYdQ7M9I10O4xSxGu3NfNA7Vq+gxgT7U2eA/et
 aDnFEBTklW8BAxMdjzBlldn3TIb0vYO4mJ5pHBCa+1wkqIq1yKrXw3j
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
 drivers/media/i2c/it6625.c                         | 2155 ++++++++++++++++++++
 5 files changed, 2350 insertions(+)
---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20260716-upstream-it6625-it6626-6874ab8a5305

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


