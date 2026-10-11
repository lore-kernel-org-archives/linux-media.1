Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209D2BEC2A
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728675; cv=none; b=DJHxwmmXq3uluW9ANUlAbtIkxxjPLgMS17aWinAJDaz0oau4rJr6pOucBaWg64PsfJU97j6qwf3MPeuVEpnVi4bHLAqB083qPhe/txzbd8MOT7tL9TnwxVpXn53dHZDkMML6meocfnO08zL1vPyaCj3wskKsz8Y8XzFk9RGDcCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728675; c=relaxed/simple;
	bh=x9wNfludcXEkqtEmZ8x+yTRNpQORzxVzq7h2z5osZwA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KX6430Bzd70mdxu2COjRiNiuEWVi12Ar1ELdqzW0Fk1OQjcdzavKuMyRFkFSTdkP9UYL9pC7bN2i8g8ZBl7h3uS+SXHf7p49zk+E4Je4kk6HZNpXOHLARotbHsJNcd9ROVQe5E5lbBtaBMHkS3Rg0aySxM5YU6kUWouz0XLP8B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=efklaRUZ; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="efklaRUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791728662; x=1791987862;
	bh=04E/rl0hIQdarmYsQj9SmUFdRDlopPSrLbR7a7KPUcg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=efklaRUZTzfUu/nG6kKeg6HaEVq8yrTDPgKS/SPjHQZ5C6xvlniWEUR/kHmOGTwuK
	 VWn4Yb4gv4NaLagyxh7F38GXZUZ7JQy0tYWHseWLhFukg23x5kv4A77ayiH6G7yM9H
	 z+vcCoghGQ3DbD33px1GrC9Xeot1Z2ATzKPEgeKjp7Fyc/hTNjExBAn1CmCniIt3nT
	 FqyiuMv/PthoUIAfYSAFUl0L/psBJ/IyNM1bu6TKHoBeM9Z8DbBPCZkfIjZZpm2ks9
	 lsioRd4VIMshTw8QNxoOyMMEVOwbKdTjtSFRdYghdPt49mRv7FVbK/BYUBZWISZIwr
	 g1yLMqSZOYFDQ==
Date: Sun, 11 Oct 2026 14:24:15 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <5oAFQQK4aV42L5EWnypG-lloKyb1XF33Qcd8JU3xf9Ik0JjBNXuPkx0f5mvFZzd4jDkt7orjqgppZJJUrH2UePK9HvAfIYfxyWVG4HYl7rU=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 792e835293b2cdb88b1e305af8cddea6e1aefad0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series adds IPU4P support to the upstream IPU6/IPU7 driver.

Most of the groundwork was done by Antti Laakso in the IPU7 support
series [1]. I added the IPU4P-specific parts, using Intel's downstream
driver as a reference [2]. Development was assisted by GPT-5.6 Luna.

Image capture works with front and rear cameras, but a
rear-camera stream-off timeout remains under investigation [3].

The media device name is intentionally kept as "intel-ipu6" so the
unmodified libcamera Simple pipeline handler can recognize it [4].

Tested on a Surface Pro 7 (Ice Lake, i5-1035G4).

Review and feedback are welcome.

Thanks to the linux-surface community and the libcamera developers for
testing the downstream driver and sharing their findings.

Links:
[1] https://lore.kernel.org/all/20260907113004.2489993-1-sakari.ailus@linux=
.intel.com/
[2] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-android_t-2=
51103T063840Z/drivers/media/pci/intel
[3] https://github.com/ruslanbay/ipu4-drivers/tree/c8176a3656a98552bed3703a=
edeeb8aa4c40a869/assets
[4] https://github.com/libcamera-org/libcamera/blob/8103c3f29fba61dbd1d3bbf=
1a099280c5f3217e3/src/libcamera/pipeline/simple/simple.cpp#L261

Ruslan Bay (12):
  media: ipu6: Add helper to identify IPU4P
  media: ipu6: Add IPU4P MMU support
  media: ipu6: Add IPU4P buttress support
  media: ipu6: Add IPU4P ISYS firmware ABI definitions
  media: ipu6: Support DMEM-based SysCom in ipu6-fw-com
  media: ipu6: Add firmware-specific ISYS response dispatch
  media: ipu6: Add IPU4P ISYS firmware operations
  media: ipu6: Add IPU4P CSI-2 register definitions
  media: ipu6: Add IPU4P ISYS ISR handling
  media: ipu6: Add IPU4P CSI PHY driver
  media: ipu6: Work around IPU4P CSI-2 port 2 timing
  media: ipu6: Enable IPU4P PCI device

 drivers/media/pci/intel/ipu6/Makefile         |   2 +
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c  | 688 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h  | 411 +++++++++++
 .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 207 ++++++
 .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     |  64 ++
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  48 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  51 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   1 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  41 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |   3 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  93 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |   8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 139 +++-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  27 +
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    | 109 +++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   7 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   1 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  32 +
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  17 +
 drivers/media/pci/intel/ipu6/ipu6.c           |  48 ++
 drivers/media/pci/intel/ipu6/ipu6.h           |   5 +
 include/media/ipu6-pci-table.h                |   2 +
 23 files changed, 1957 insertions(+), 49 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h

--=20
2.55.0


