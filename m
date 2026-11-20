Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174211;
	b=mYhrG/pFDVvHBgpUmCgzw5FpfE5K591IfEqglEyXFBg+Od5wRcSgTGeNrjN/NgJYUdPq
	 cSubPxSBl+gVhbuqowwAVF3LJ49GgIwWdmD+R/q6kGFf0kLFkL7ZS13j83TJIsi7K5YtQ
	 DIkqAksj8d944TETr0XgQ7Qdv/1cdCqmr0/HpYonsOFXGQXYV3EPWFDE2nWcmEyQYm8g3
	 FrB/mKexLrvppCHPSUvDw+n8fuytexLiP9n6baicvKOOpKQQKOOxvgJQC9Je4S+tNLQA5
	 YNaFpril5QQI+CGcJtuwXeHa0K5MkQxhz+ebZd7/U9CONZFa53DBnw3EDeKg97huupA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174211;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=jhE8weqNYy0n4xKaMJDFdD/R5NpshsvyD+takwcLwVc=;
	b=B2sgVD6Ld6IyF6sMeUPbHiMhFeY5C+VYk1beEEaO4a5At01Iwm4f/fhQ/IhcEFXU61yJ
	 GqEjn35mt+5IIyy5P3WHnfOyqlAWbKFRz3zbfjw0oBFNAe25+MM2H498fDc8Ken1ykBCp
	 OXkFR2121102PJEU2lp62qnEzVjBl2ZWU/km+LUwgi+51C4SG/64HYPAyQ0AY/1wYW/k0
	 Xs5Z2j03922pCnbkSeNsqkO/KQxZaipRD0XXLp/m31Xb3kfFBd8Bwy/NKjOUz1z5Jfxqs
	 Mim7omeS4Tuh2iGsNZ6Jkp+pp9Va46VNsVk49G4QT5wJO2/rjo74htoJ+uZFnhhhWyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PinF9+nw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5A606A332;
	Fri, 20 Nov 2026 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PinF9+nw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174210;
	b=gggMt24qNJTyNG8ghgKICfXgRUow9ONYFql+B06KCpU2dr8MmYk762Rhw0lKZrks25iz
	 Kgw8WwjKp9xU5WCWI5F4O1SdXBDtvaurp5pU24uo95iIzAPWnaxCsdbiWwjwDhliafPRU
	 SonjnsrtzNKahX50jrhay8J9J5dj3w8uAkqPNvJyswrh4T9st2h2m1vGydwUJRhDBMY6k
	 6uENvomp0oNVWVt92GLxk04uCWySH00DMgODPgCokgXEkNa1M8xXCbIX6kIpY0pY6xSOz
	 1LLVwK7y649tUzOCSES5jQ3IEktxMetBcZrx/UUwar1YwoNw5eslMzWEA/FLMPura6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174210;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=jhE8weqNYy0n4xKaMJDFdD/R5NpshsvyD+takwcLwVc=;
	b=rbuX5km/adNDKS4oYcKYggEfv5uzNkrHJLghy2IVMXorvigyTsk3SOlaiPUM6QqGfG7H
	 sSLGfQx8h5KsOfciG6cd1keaJo69OzGsoqipBavb6KS8ox1UYZOW+l5NFRLCz01+WS6Hl
	 OqLCnvOU1ZhRFr9hFEogco54GMXnqv9yUqJhBnlyqDhY3JtCU9CZidU/tAeNp/ciHXEyJ
	 bpiFmwd3lAQePhBHlAVSYFzOzhD7cDsSbUnbKaksYehjay/8WYa0wCA+f7x1a8XbDB2Ag
	 wdnxdaeVK7WYXlM8sAOmt7zAwaO0AnqT/xBXq1QTfsJatsSsKY+jGzyhReF8qo8kgCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 178ED1F000C4;
	Fri, 20 Nov 2026 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174210;
	bh=jhE8weqNYy0n4xKaMJDFdD/R5NpshsvyD+takwcLwVc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PinF9+nwwP0NYITXY8jERw7YQQDvsAiZLrQdpIbyKTiq4KvFv9gEMrIhMCynKtuWP
	 tL8SD1oTujY4W9xp/XBrtP8ZG97ZPad36P+xaX1enK3TYj8pZO4eFm08v6PCIpeRWw
	 ECmjHUgF7xOo8D4Tqz4Dw9ARlCnEVvuA6CxNec8fvxHLU9wgdxwr2vYFJTGYt/GvMf
	 oKvWXJm/YTi51uTPrA35Nmm1LFUHQcEu0oIYMiW5wczY5Tz7YDsj44NXAFM1cYqpE3
	 P1xpk+v8fCXewY1yemOUtFGuvSOyZTZ69Wz3Ah/y9kMKweNYHdv5a3UBw7W501nghZ
	 ohzpLhZvtjGyg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9A60B49849;
	Fri, 20 Nov 2026 11:30:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] media: rockchip: Add the IEP2 deinterlacer of
 RK3568/RK3588
Date: Fri, 20 Nov 2026 11:30:05 +0000
Message-Id: <20261120-iep2-v3-0-e94eb9f629d2@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBQFf4V0bQ0tFCgr/8O4KO0VrpFHWmw0h
 H+3BU1YTnJmzkIcWARH6mQhFjw6HIcA2SkhulNDCxRNYMJTXjDGUoowcdpIJXUBZanznITpZOG
 O7y1zve3sXs0D9BzduOjQzaP9bD+exd0/me9Jz2hKVQXGgFCcAbu0vcLnWY89iUnPj5L4STxIm
 alKWWkjlRBHaV3XLxaagl/fAAAA
X-Change-ID: 20261110-iep2-b9a9c6e77c44
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174206; l=2896;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=R65zek14E7+PZ6+dhDe8b4DlafUNDeybXwhd5n/LjPY=;
 b=UNdXYNTz4DvcNhR0iYG1qIoq1f3xowbXK1kf1ZdCsz7eo2VwPi/Nyadw0seBLq/WduPSx6hY+
 zz3NAIc4mVMAqK58wcT8UDvehFwKl/yVQrmjvvwl5dSqB4GMzSVAgJB
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Add a V4L2 mem2mem driver for the IEP2 deinterlacer of the RK3568 and
RK3588, with its binding and the RK3588 DT node. The V4L2 side follows
Alex Bee's IEP driver.

Tested on an Orange Pi 5 (RK3588S) with a 7.3-based kernel (KASAN,
lockdep); build-tested on media next. v4l2-compliance 59/59, all four
modes at 1080i without IOMMU faults, s2idle and deep suspend while
streaming, unbind while streaming, forced watchdog and IOMMU fault
resets. Not tested: RK3568. DMABUF imports of exactly the image size
are refused, because of the 4 KiB OUTPUT padding (see 2/3).

One case is still open: a reset during a transfer, seen only with
forced watchdog resets, can leave the IOMMU busy. Jobs then fail
without DMA and the driver suspends at once so that PD_VDPU powers
off, which restores it. While another device of the domain, e.g. a
video decoder, keeps it on, the jobs keep failing.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

---
Changes in v3:
- Drop the vendor kernel notes from the commit messages and cover (Krzysztof)
- 1/3: drop the linux-media list from the MAINTAINERS entry (Krzysztof)
- 1/3: add Krzysztof's Reviewed-by
- 2/3: start the job and its watchdog under irq_lock (Sashiko)
- 2/3: soft-reset the core with the AXI side, CRU reset if the IOMMU
  stays lost, shared IRQ off during a reset; no DMA until the IOMMU is
  restored
- 2/3: return OUTPUT buffers before CAPTURE buffers
- 2/3: mask and clear all interrupts on completion and before a job
- 2/3: suspend at once when the IOMMU is lost
- 2/3: take the mutex in system suspend
- Link to v2: https://patch.msgid.link/20261115-iep2-v2-0-3d8798cd9a55@gmail.com

---
Arun Iyengar (3):
      media: dt-bindings: Add Rockchip IEP2 deinterlacer
      media: rockchip: Add IEP2 deinterlacer driver
      arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588

 Documentation/admin-guide/media/rockchip-iep2.rst  |   32 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/rockchip,rk3568-iep2.yaml       |   95 ++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   22 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/iep2/Kconfig       |   16 +
 drivers/media/platform/rockchip/iep2/Makefile      |    3 +
 drivers/media/platform/rockchip/iep2/iep2-regs.h   |  191 +++
 drivers/media/platform/rockchip/iep2/iep2.c        | 1320 ++++++++++++++++++++
 drivers/media/platform/rockchip/iep2/iep2.h        |  108 ++
 12 files changed, 1798 insertions(+)
---
base-commit: ad6549a46748d00818483b535e5cd2a704685c98
change-id: 20261110-iep2-b9a9c6e77c44

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


