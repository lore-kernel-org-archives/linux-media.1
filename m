Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B23457E6F
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729638; cv=none; b=Zk8+ldgM7bgcyXyhKbcRhpZHJ6Up+PXGi2nDpirT4qZJMoyxGgEmI5equmubKGnpUDRq/4yF6f4pMFq67SaKUDlpS+mVPVPRFvSiN/+3LFjk69SQKcUHM+mWL0rEicsCENmmK+boXnuRvBcDHx/crbWKFekTO3iF0xZSxyX8sNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729638; c=relaxed/simple;
	bh=uQ9NkZ22azGDBkmUgdNaqiAmjYdCm0x9cOP0k1IKYIc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QHkzT2dD0zjIZpPFIEdPbTD8nkClOLpU+Q5VUZOMqGIL7Z5addkbjE3WH1kTjZ+bVgR2j4zL/n5a2Xa9DaNrDifkuXggUKzxRIzQxg3EUhjnfp9Cs9XcAe7uFUUo5llV0KLOX9MM4orii73DbY9kSh8/jS3x//qPC0Cmr7UAg+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=wrNZjx7v; arc=none smtp.client-ip=109.224.244.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="wrNZjx7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791729629; x=1791988829;
	bh=X+YV8xGm+QfoLPEzgmRbPkDhsMLwzTlzu7tEKUnZnm0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wrNZjx7vGNH/glJ347a0OO6OGTsYsIcXk7uZSe/oxOngpmnOy44ojTkKzLtpUkyfS
	 8U5JneBOfbGIv4WQ/ndog1FWdGFedTXxRo8YlzwqK4og3Osw5pzylXr26rNAJR21CX
	 pPDsqqm2HakC0A+Oay0fj8xfmr/yL0/NjVjyg2XxMspds1WOlvT/7Gcma5HY8NWRYp
	 G3Ts8NwUQl5eILAPmX+bw/rQ8BxaVAkJk4a9OqKMuhmvpSR0IPRrYwhXE3AE3WP6ZS
	 +KqlkkGkPFkNYyZ2rTCH3hTvyJZu8bBHIqGDxc3tZ3tYSJTBS+V7JlZ28jOE6wYpTW
	 BZkw6sVQ53sNQ==
Date: Sun, 11 Oct 2026 14:40:24 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 08/12] media: ipu6: Add IPU4P CSI-2 register definitions
Message-ID: <3jzO17qX_KHbLlgxyJv85A0CDnL871mobYq3NpuFm78SWh4MqC9ZmrIx7Z3WPx6kl2hk6bdpkT3DOxoMxUFCuH1LWlwRDPnXYIbnvq-Q3VI=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: f103e35a26cd814fbdb9d2c36b2ada008f94e485
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Define the IPU4P CSI-2 receiver, interrupt, and PHY sideband registers
needed by the ISYS driver.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h

diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h b/drivers/=
media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
new file mode 100644
index 000000000000..7f41bdb4150a
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef IPU4P_ISYS_CSI2_REGS_H
+#define IPU4P_ISYS_CSI2_REGS_H
+
+#include <linux/bits.h>
+
+/* CSI receiver registers */
+#define IPU4P_CSI2_RX_ENABLE=09=09=09=090x00
+#define IPU4P_CSI2_RX_ENABLE_ENABLE=09=09=09BIT(0)
+#define IPU4P_CSI2_RX_NOF_ENABLED_LANES=09=09=090x04
+#define IPU4P_CSI2_RX_CONFIG=09=09=09=090x08
+#define IPU4P_CSI2_RX_CONFIG_RELEASE_LP11=09=09BIT(0)
+#define IPU4P_CSI2_RX_CONFIG_DISABLE_BYTE_CLK_GATING=09BIT(1)
+#define IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE=09=090x2c
+#define IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE=09=090x30
+#define IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane)=09(0x34 + (lane) * 8)
+#define IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane)=09(0x38 + (lane) * 8)
+
+/* CSI receiver general-purpose registers */
+#define IPU4P_CSI2_GPREG_CR_PORT_CONFIG=09=09=090x14
+
+#endif /* IPU4P_ISYS_CSI2_REGS_H */
--=20
2.55.0


