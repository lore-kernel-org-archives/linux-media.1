Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449109;
	b=gsaRYqTVZ6wdzVNlRAfosYMyD/uzytzNVtEE4gSONRnNV8/Ti9HtYMuTh92jvw/asB8O
	 2AVVYmE8z4ZUokbv75Wop2Gg33/J8/Lk+s8oBk9aQ2GFTrx7imqMhNrHjVY/ow9n+hOok
	 19yZE/XDsHaqsKNnbBuFfUBS38hFbvAXlU+JSqeYBEOgrqu69krRV2AFeV452iGn4XJMZ
	 lobOoVx0ylduhZaJ+noCrJfCLa/bnApwm88kSqNGtW64TVV/aY72XB8H56lcsUyaL/Ofu
	 0eQi2qpDMYMC9C9l+tb7NjwBy50xSN+0fDp2J9093I/hCJJfGddvjxgt/Bp4wQW94qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449109;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GCrYl8sywpqxhBUS8jhhCG3KEUZlBWl0SsQl9umyP8A=;
	b=0xj4lvMmuUNJzHq3lt9+Wi22fzTKgIkCcAzWIJR3uyKd27EhpvWCZsB48DUEUxQMdD29
	 MuyL3Yn2mFmwVmXp0FeBzQyfVWKryM0+0m+LSpHb6OELqhmpWfZizd/eNrtj0efcGe7bF
	 3cnenq0mH87rkACjxvrjpaDRAL7PGY0eIRK8Z57RwSGdLyPLEkoTx56G7oQo0S2AVOSEK
	 Kd44UOY3LnBp263JC+eLCmfoRjhCIY9ZBxvZembaXQlfM57FFlJjoNTHNH5l/bN1Efm+W
	 shS9EB8srpaSdoxWQtnAJnb7mf5K2EJWlu+brSy5eB1BHDk4E0uzDPEj4PfAjqtp04Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=eza+nUBb;
	arc=none smtp.remote-ip=109.224.244.30
Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94300606A31E
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94300606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=eza+nUBb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793449105; x=1793708305;
	bh=GCrYl8sywpqxhBUS8jhhCG3KEUZlBWl0SsQl9umyP8A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eza+nUBb07Vz53WyOBf8d0832aR9x++3kc7DAwmXdrca0k00IDRZgi02zzoH/gXL8
	 8eWm9ezDyuuGeTOvtOYgX7SVkCuNTMKJBZg+8jmQO6/+uEyC/kD3Dk83vJ0ksRCqGY
	 meBcKzc3Yo1nwE08QjSk2u5rV69TQb2bzppwX5SKznNz0FkzquK7s+OWnK2eMvDOmu
	 wd7vWYYf+MlQr21JDYYMoApCUYg+MUq0Zf3zX+3cBUJuYR1i7q229h7emjbt3ndEqI
	 F2ndvd6/ve695ESOnXo5ToWDhTMFpyMoLwACrZdYZyHcbKZFV3ah7Url11r1TI+i2o
	 uj99E1UF+5/Ew==
Date: Sat, 31 Oct 2026 12:18:19 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <2MQDQgaaKZ4HAu3U6zhMj_Muf_H8tsVGLh_CSXM_kxcTL51pE14U9-brGqLYwPPJfDXHog_jWWWOTgToPYLMVZN-KW80t9sDIlEw1uwg-FA=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: bd8bf43906c794aee37e37041d90d13e26c8155b
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

This series adds IPU4P support to the upstream IPU6/IPU7 driver.
The IPU4 family includes IPU4 (Apollo Lake) and IPU4P (Ice Lake);
this series supports IPU4P only.

Most of the groundwork was done by Antti Laakso in the IPU7 support
series [1]. I added the IPU4P-specific parts, using Intel's downstream
driver as a reference [2]. The code mostly generated using AI.

Image capture was tested on a Surface Pro 7 (i5-1035G4) with
both the front OV5693 and rear OV8865 cameras. Test logs: [3]

Thanks to the linux-surface community and the libcamera developers for
testing the downstream driver and sharing their findings.

Changes since v1:

- Addressed review feedback on:
  - IPU4P buttress handling and register definitions
  - Firmware ABI declarations and structure layout
  - ISYS interrupt setup and handling
- Simplified the Surface Pro 7 CSI-2 timing workaround.
- Refactored the IPU4P implementation to better align with
  the existing IPU6/7/8 driver codebase.

Links:
[1] https://lore.kernel.org/all/20260907113004.2489993-1-sakari.ailus@linux=
.intel.com/
[2] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-android_t-2=
51103T063840Z/drivers/media/pci/intel
[3] https://github.com/ruslanbay/ipu4-drivers/tree/3c7c0b623f99a90b32c50691=
195612172be30822/assets

Ruslan Bay (12):
  media: ipu6: Add IPU4P hardware identification
  media: ipu6: Add IPU4P MMU support
  media: ipu6: Add IPU4P buttress support
  media: ipu6: Add IPU4P ISYS firmware ABI definitions
  media: ipu6: Support DMEM-based SysCom in ipu6-fw-com
  media: ipu6: Add firmware-specific ISYS response dispatch
  media: ipu6: Add IPU4P ISYS firmware operations
  media: ipu6: Add IPU4P CSI-2 register definitions
  media: ipu6: Add IPU4P ISYS ISR handling
  media: ipu6: Add IPU4P CSI PHY driver
  media: ipu6: Fix Surface Pro 7 CSI-2 capture timing
  media: ipu6: Enable IPU4P PCI device

 drivers/media/pci/intel/ipu6/Kconfig          |   8 +-
 drivers/media/pci/intel/ipu6/Makefile         |   2 +
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c  | 996 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h  | 406 +++++++
 .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 225 ++++
 .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     |  72 ++
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |   1 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  59 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  48 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   3 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  64 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |   4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 103 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  36 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  12 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 136 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  36 +
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    | 114 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   7 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   1 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  30 +
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  14 +
 drivers/media/pci/intel/ipu6/ipu6.c           |  49 +
 drivers/media/pci/intel/ipu6/ipu6.h           |  20 +-
 include/media/ipu6-pci-table.h                |   2 +
 26 files changed, 2361 insertions(+), 89 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
--=20
2.56.0
