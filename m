Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F323CB56D;
	Mon, 20 Jul 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534294; cv=none; b=oYACu+y7xUneBT4KZph+6Y6twcmcRN/hbw20aCfmh4iY+m5Ijn7Qy4aH38TTVxEZ1ZEAYwivvSzYA25YLsrNIRtz/zs/Ws3Dv8FreCOSZV2Gk17hacS/brbX2C5cRpyGbj1cPEqaZ4M3K27CNz0bUd7eyvwl+LZsvntMoXsKXZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534294; c=relaxed/simple;
	bh=om9Z0znRE3p24CehzGI9n1x1Swl0bLKrLB53xSQZXKs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dfNJVn47dYk4ToPCGX7PkD2REkHkIrL0S4B1JllMNh0ZIViP8kjQyKweWU3QGIc1eMOuPvkJxurRmMCMexWeGJowAHt6nY+ve7drd+1/YnQbG8o/PgDzrz92Xy1v5u2tbqCLbbn1+7seicFMUkyp1QNKw+E1JRuBiam94tyJAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sAF8Wl/v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sAF8Wl/v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4213CC2BCB8;
	Mon, 20 Jul 2026 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784534294;
	bh=om9Z0znRE3p24CehzGI9n1x1Swl0bLKrLB53xSQZXKs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sAF8Wl/vYrq6VMXaqWfMikXegSklhkrA5adl24804V7PzVcYc1SF9gxD94QtwCOHK
	 CUWs19cw5VHQ5u5xK0SiOKZnQt+5boc7iC4bpMeWU0P224VVbfow+SmNg4N99QAq+8
	 KUREJOnzcG+ZeCyRNzJLF6EiQR0ZObfK01GDMc6oCuF8rEiSbYeRFYRId8fn/FfwO0
	 JUZJz7lTviANwGAw0pss1laZ3VBZ6NI2TpaenNn0yNdynDH8bV73v3JApWuwE5GukH
	 rRucO4x374/VIInZ4V1uolu4eTgOFvqioZ/G0A+fCQcuHauTO8hpEXs10d/AC2rX21
	 3Q+RoKru4y6yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1864DC4451B;
	Mon, 20 Jul 2026 07:58:14 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH 0/2] media: i2c: add support for ITE IT6625/IT6626 HDMI to
 MIPI CSI-2 bridge
Date: Mon, 20 Jul 2026 15:57:44 +0800
Message-Id: <20260720-upstream-it6625-it6626-v1-0-475912f74459@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjUXWoC/yWMQQ5AMBAAvyJ71qQtXeIr4lAs9qCkLZGIv2s4T
 eYwc0MgzxSgyW7wdHLgzSVReQbDYt1MgsfkoKVGWSkUxx6iJ7sKjoja/ECBdVXavramkAZSvHu
 a+PrGbfc8L/m2ES1oAAAA
X-Change-ID: 20260716-upstream-it6625-it6626-6874ab8a5305
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784534292; l=1353;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=om9Z0znRE3p24CehzGI9n1x1Swl0bLKrLB53xSQZXKs=;
 b=Wg8c8qFgkns5cReMKTZE5mwlNvUhFMiQ07Qc0aHTgVB2Om8M5rwpIJgX14HOGpdkJ0qkbQ5D0
 +ztQUpAjZquBHP5dVu0pnxeL6at7OnylY9MNLB/ZOEIu10J+/MN8qsC
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
Hermes Wu (2):
      dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge binding
      media: i2c: add driver for ITE IT6625/IT6626

 .../devicetree/bindings/media/i2c/ite,it6625.yaml  |  136 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   18 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/it6625.c                         | 2088 ++++++++++++++++++++
 5 files changed, 2250 insertions(+)
---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20260716-upstream-it6625-it6626-6874ab8a5305

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


