Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DEC324B24
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365066; cv=none; b=fUc8U3gbnvvJqHtXskhchu08ihplA63fzkTc6KXV1abofpkI8Y2icsBN6jsJeZjZzWxVBlaOviRFifb0vmVNSn28wGwi3b32EF4Y+CUFF92QWtN7Xp57gmXTwQyqVVr57e256IWLEw4oZN50r52R09lzboRgfXgPnRBwZ4o7hmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365066; c=relaxed/simple;
	bh=fspTt8j9QiyODB3Ss0ezGfihmQ+Hda0Z/BB5cuslkfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3WssJ9RbiiXMnFSI8GUS6P2eDbErGmVEY6NYSldkOdm5b/RobP2cmgh8VX99gcyNBtBrV4HyR2cFCCcJ8rG9aTiCRMjI2fOYLqsSCukAYlgmQdDm+zWqzETG2ym+VDWcfappa94v0I6cZPepo4yJkiZGsLKcqc7tYU0gbBh0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rW5NCwz0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rW5NCwz0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954c08a7c8so1376635e9.3
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365063; x=1784969863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJFiBGt3rnsgbEqpBZLJArMrhdkhs48oNDcrYNrzXaM=;
        b=rW5NCwz0OE7Vf3wToZ1ewC8bLlb8gTAU+lgTBOwU4XOSPq/tqdWvYvIhRqTuXxlK5Z
         SO/+nGe54AdRK78g2Ws/7WQYr8LsWrAQLQlmgbb1lPVuV3vsIjv4DgF7Cb9n6nvSt8xn
         LUut/y9lqbhO0YHYM3GS6sven+C+TqiQo9xGHIjSwOkcP9dTsjB2sWPef+EvbUkDxAx0
         veJdEOtF67livuNyry6Qg0cEJNGLHXOfZj03sw/1XHnzOl0EmTTaH4efmwm+3eht5qd5
         cHO/NijniQnH5bMPzdzkhfGF9V1sag/tClCBnXDPcQu6tQarH3rOVakm7I3lrqXh6Hee
         Kj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365063; x=1784969863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJFiBGt3rnsgbEqpBZLJArMrhdkhs48oNDcrYNrzXaM=;
        b=QSn+DCkPI7lTR1WUN5doVcPgYy4J45o0CaNHY548jJs9E1y9Us44BJxlIsZpvmjHir
         UBkkNXrHcSn6K0y1aSrJzTQmm4xgCUYkYgFqcugrA/qkbivgY1idxKBe6R5Ywo85cUuP
         iIwPe0KQQYvFx8VsAHBloDlB6QZMR6wXARHHWJAkqBWTs+FvRSZLAPnJoeOewM/o4YSz
         fJp9Y3ti87y1nAXPv7dxdWjUgu7Gzs7nWi3y2mhMi9xOJNbAiCWsX2b8yfZjSjEMG8tY
         +Se3odCc1HyYhALw1x9slQkyvQwLvKezUJ2R0lbDPNSj1/xA/F3tsLlJZX37FNjPELyx
         Ve8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrMQP0XK4G69KfevO1cMgcogxs0bRUFOlgx0y5SZDiKFHZwLnERdLyFhgpKXE1WxXtsyBpMtSp55wo+uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8iiYhkmZrjQ4Z/mI9ptkgDx661xG1EHtK8aluXT44gxPKXkLn
	CDWS94fH3vI2CC4mcOFlvwe5LiL9G7kJI2p73TXENsfSguQ1zRyfv7a8
X-Gm-Gg: AfdE7ckj285eRGTVDLh1Z3aElT8o77XNlrOlaYPYcwQZispWJAeN9lDXmJrpYdj8Sbz
	tL5jHq5M2zjq+AWmUiREPciTZG7r8L2kUTx5ZZeWfvaWTUFKFP1SnWITq9dfaiEZB2L7huSJdah
	iebkSaLdb4hklQCIqaputjn1Wkdtyum1LRQ/ijazMTAuPuMgE5pfmQ4xTcRTe5T8f4OfnE1VFbp
	bn0RFzycAd0a1R1jJK1cn4RvA4duj1x2uPwnWQ2i2zXgWnuC+MAuOY3OxT5amgiGZiYMm0L6h/r
	jhY233bUplfyulu3KIAW72wYt9+eiJIEcovG7tkhRnDu/QNYyF8wfdER3Bu+o48MBnMqJt63Psn
	z+ANRp1zAVKNyHEGWlgOySJ1YcLdedV6TfmAqdfsXtIvFndUCxBTicB45RgVJSB4bYDPAHwwASF
	owuKGS9MzkxWE12qElVOOWNaPClS9rKQZ8jMQECmFcxBSCM8mGHLJYlGS+ocoCHUh4DJdsxNxKC
	81PYUe6wA==
X-Received: by 2002:a05:600c:4f4f:b0:495:4856:4308 with SMTP id 5b1f17b1804b1-4954a513fd8mr52027345e9.8.1784365063203;
        Sat, 18 Jul 2026 01:57:43 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:42 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Sat, 18 Jul 2026 10:57:24 +0200
Message-ID: <20260718085728.6797-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds audio capture support to the Synopsys DesignWare HDMI
RX controller used on the Rockchip RK3588: the controller's audio FIFO
is exposed through an ASoC hdmi-codec device, with a periodic worker
that keeps the local audio clock locked to the incoming stream by
tracking the FIFO fill level. Together with the two new dts patches
this yields a capture-only ALSA card fed by the HDMI input.

Validated on the Orange Pi 5 Plus against multiple HDMI sources:
capture follows the source sample rate (44.1/48 kHz switches
included), survives repeated stream start/stop cycles and SIGKILL of
the capturing process, and stays free of FIFO under/overruns via the
clock tracking.

Changes in v3:
- Restored the v1 audio teardown in remove(): the worker is only
  armed while a capture stream is active and audio_shutdown() already
  stops it, so the extra flag clear and trailing cancel added in v2
  were redundant (Dmitry Osipenko's review; the v2 change came from
  an incorrect automated-review finding)
- Renamed the ACR read locals and added a comment documenting the
  register byte packing that makes the swap correct
- Dropped the get_dai_id stub so OF-graph cards resolve the DAI index
  from the reg property naturally
- New patches 3 and 4: dts enablement, so the series is testable end
  to end (requested by Dmitry). Patch 3 adds #sound-dai-cells to the
  RK3588 hdmi_receiver node, patch 4 wires up the Orange Pi 5 Plus
  hdmiin sound card. Both can go through the rockchip tree instead if
  preferred.

Link to v2: https://lore.kernel.org/linux-media/20260715200834.8486-1-royalnet026@gmail.com/
Link to v1 (RFC): https://lore.kernel.org/linux-media/20260715051939.64652-1-royalnet026@gmail.com/

Igor Paunovic (4):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support
  arm64: dts: rockchip: add #sound-dai-cells to the RK3588 HDMI receiver
  arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus

 .../bindings/media/snps,dw-hdmi-rx.yaml       |   9 +
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   1 +
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   |  20 ++
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 271 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 5 files changed, 309 insertions(+)

-- 
2.53.0

