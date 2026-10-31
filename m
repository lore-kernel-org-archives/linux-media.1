Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450178;
	b=L+/o6UjRdUTQa4Gt1yyTgC1D/ZvUMeBvG0XdN+PScDaIFiB+SQf4lnEZcEiC4K1g5vi8
	 LU4O+Abp/GeCBybkMIIMKzVMpSSgPloUHdnHM2zcDT19j5SFuPzPFIGFGNG4C3CryaQi3
	 MVWchbGroWN4DBGX9vtgoKNwo/hU9DtpIYIax/lAup9uYSw5xedhmRFr5PFk0hD1gPjPK
	 QlKYOzaVP8T3ExtRv/4Ek4S5H89ZP91Q0zfYoPPDsD7+Qd8JAGcCqnaz/FOhADIKZwETJ
	 1BjEeJ1XYEQWZ3ToEsLIOBVkRipfS8disjcbDIh99/Fy+FOHjL1IogZOkffYBjyPFAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450178;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9QjRcgFtVKKYp57x3ze0Dwrkgsr/iMIBBlUIP/WV0yo=;
	b=ba71OP7Te6uPcUyV+a3kGFIdqKn2RIrirD3a6YdVip659fBbkvW9y/ZzLsswxfh0RFHt
	 6poi/CGrac5i1enTVBaZaGbcCEuNriNlphtT8F7ukDPLrosCxmEbv2Ur5c87OjY5izdB/
	 fJUtELaB2RfbbADCmIcQyv6N7UMIoZQeSpFEuAfPnsMjG2HPACIjK7PyDACUW2oS+eYvQ
	 IkVBTTz/UMA2Xec7MDCfUBUJsETqOpSIrY+ArJfngLM8+RJ6TQtF6y4q+zsuhG+m1aREl
	 bz3z6M8DBA+rWEH//g6WgU3UrtyD5dkch/8ehW0IuElBtxgouivRtTvinpzVZdXwakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=sz7JEccx;
	arc=none smtp.remote-ip=109.224.244.31
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C67606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=sz7JEccx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793450175; x=1793709375;
	bh=9QjRcgFtVKKYp57x3ze0Dwrkgsr/iMIBBlUIP/WV0yo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sz7JEccx/qmEKMp8r8XziMlQIVNEKqrsYEqPO4P0pFBJLG6MFlysXaGtyyfRQBDAE
	 mHhXoxPAp1Uu1l5BvxbXLEjZwNhc4o7+B8JpLB49ji+J5Jn0se8UA2Wnvc76wAQ3r2
	 IHiQ2CaTq/q6C6UgTTYIP1L05v3ph2c0MZqAnApJB2MwmxBJ6gUNDEEOpFg/JILRoF
	 ptpU4c8uom1k7fw1+2Q+d31Nd4kS1l2DrdQrB22JRvthD9xnMlQWYFs1pwuokFmrVL
	 WTN+eUyEiU6YnQT73Fu5PyB1EiHL93XJfZImRcatmC95YBfXrtR/kKTOxrfHyjEjuU
	 7UmHEuMzRP8bQ==
Date: Sat, 31 Oct 2026 12:36:10 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 08/12] media: ipu6: Add IPU4P CSI-2 register definitions
Message-ID: <46prLlJOsVs3Byg7mPU7gRKnBQlzXMktgclZL4iXiVJMCNbP00l4FyddvKXnuMCiQw-8Xkn5Kja6I6lUihmgwrmB-nvfrEzWBbULVXtlJKo=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: c9144da7d91fb99cb0186b091c5d5dcca28649a8
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Define register offsets and control bits for the IPU4P CSI-2 receiver
and its GPREG port configuration register.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h

diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h b/drivers/=
media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
new file mode 100644
index 00000000000..7f41bdb4150
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
2.56.0


