Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795271139;
	b=pmeSy0QyDcXssuc2KLc8tVcP8GkKcIN//3pOYs8ererk5Xw39fP4+bQCIblvRCJBRAoq
	 o3QMXJCrYKpjMfZeoPCy2Mq/FdIPTm3H+hnxPEACp/9yBQmLTbXrojBaK/9OJjem9GnZC
	 6HJolQckPulC732NjIYgg4jPsUS6fD6ZcRAa3rXpbaEuTFHKJcCCBtGMY7iVpLWQYRU+m
	 btnLvsNANERm5Xx9td8vaR8YQbxJA1iRpC/nTa/bpcBINxyH+C5EBKXI1Elq2j5dt6caZ
	 jMCxNOs5d9ObRPuLHelVCDc18UPz4pYnBIQ/fYg1Bd6zRlc5G6piUZTbgJ5GUvu1xBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271139;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=D02QCZ4m4lcM6wMx2nh3xb3J/nnJjgLqNKP5V5qS1WU=;
	b=AuSLgGDMtQNKSiwmjh//h/KS863bc5fHWEuwvOjO7yQh4KhTLwdLzxakCF2XY8BK3R60
	 neoCv7lzPBwW/QzRVBY54FayhN+NGeIlOMOc9HVVlZOASZkC8HJ0TmOCXNiSS9PVaV5GA
	 ubPVki5pk5qeIwXn6/72SacbDgkFFcpAJJP7OHBrbrffUhwYgLemEuFzam+WQAhuX7A/x
	 xXzjBt6Tc2RifHgrBobrmH8qA/yyYa6Izi/X6IMKH5qpOfl2rC17ATu6Q+Mzro+cLFuO4
	 og1jnlF4EmGxdfBzYS5yfFRbMh2eGc/qtSJhmhyGcnNBR62TBRo6bGIM6mgdr7QhfXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lL7Ila/B";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7986606A32C;
	Sat, 21 Nov 2026 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lL7Ila/B
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795271139;
	b=XjGRV1LIdnKoaw6n71sxPigg4pLpSQCN9BhB2RPV95udScAWZQXbmrEsFpxgRxst1QgA
	 hlCNQFnIH6LNa9FhWN2iZ3SQiL8qkAoDiDBEkZu1IEGqxXr0dbg6/T9JtYotUXh3Pr9jb
	 H3lQ50Hqf/fN37zhkW7KQIjwjquHswv2vfDnihu0hUEWOwk9VN31w09Tct49gPR+lOYco
	 BbWavdp+mLgc1WFlJmMM2v0Qu6aqY5StT8S5uo51RunYYM//fAqortn6jZn1lFCTKO/Nr
	 dX/BgWAJA0Xe5ILU7cwt4VKOX0jVIpQyujSk0NX/ojAWqh2bH18FO8+2IyCDb0KL9ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795271139;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=D02QCZ4m4lcM6wMx2nh3xb3J/nnJjgLqNKP5V5qS1WU=;
	b=FQmzPfN0Yc3yRESK3zzaNZ9AmNpxfL6/kXyacM4ZgNNMuT1Hmvz4BHgiB9IWJy4YACBe
	 4rWFYoE/T/Bw7ZGmTdUM3RBnl40mXOl/eFSaTs0JtHr5d7nx/gfACQQLptA6SplC3q5lP
	 NGutofFxdBdj8paz4Oo6kEwpzx3+F3tH6x4BSEMlzXNNnHUoZ3eYNhV4D6PY2irj6N6TI
	 aPy2Nj6uMyLLKWAcSXcz7LUyfRt5z+T4eR+oHSZlBFWMGvEFOvilcpn0MmCb1YuRgjmkJ
	 52JQvhJefYGGsHf/jc3Y3DZ8WpAMH468nHGTuQ8WVrUea9yjPsBh4BkSFc7GrShaeZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 374191F000D1;
	Sat, 21 Nov 2026 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271139;
	bh=D02QCZ4m4lcM6wMx2nh3xb3J/nnJjgLqNKP5V5qS1WU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=lL7Ila/BEZQ7XJTVO4pw9y7aYhd9xKgyUHSiqkrrz7mop/yVabACgNIwuS/9TnlzV
	 AfEOeYupercC0wrUTeXwg2L4XCn1GFUCcDESdYpUawdE9/13IZh1G1zrc2oLo0i+uE
	 sNgnHxoka4ifdWghS+2EErWClffOU7K7fdZUafYY+Fh8r+xJDUHClt9LB6aZyqPgK5
	 jW43juciTNMIqGHXJo5kUJzohNfLmNuOc+pYm7CFPqrK0L1j17DDNcIciLyovtCCEe
	 qZ+X+u8GQ4pjt5f8HrZWRdcjVWQzAOoVCTPgAJWxn8v5ik5LdadLKzfx+Hp+2vlbjm
	 LEhqMTTTyDIww==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BAF414BCA1;
	Sat, 21 Nov 2026 14:25:37 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v4 0/3] media: rockchip: Add the IEP2 deinterlacer of
 RK3568/RK3588
Date: Sat, 21 Nov 2026 14:25:36 +0000
Message-Id: <20261121-iep2-v4-0-760cf25f322b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13Oyw6CMBAF0F8hXVtDh/KoK//DuCjtADXySIuNh
 vDvlocJcXmTe+7MRBxag45coolY9MaZvguBnyKiGtnVSI0OmUAMGWMspgYHoKWQQmWY54pzEqq
 Dxcq815nbfcvuVT5QjYtdGo1xY28/6x3Plt5vkm+TntGYygK1xlQCQ3atW2meZ9W3ZJn0cETpj
 iCgRBe5KJQWMk3/UXJAsD/vk4BQcCxFlYHQcETzPH8B7n4B2hQBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795271137; l=2350;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=G5R9VMIFiJU1tJNOmYpfUElrCWf6JYYQ7tduXHilQTo=;
 b=ZF5lg+BDUPoifHZlr601YFWm6SGCsP1AN87K283TtzRWDsLlHl5SL2TGW2Lv9oYTFxeFc4gKc
 hTIQcAzvEloCEcX2AMsVyk/x1pUuoIzYGbygGRUlUAdbcJPa5q9B+Oz
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
Changes in v4:
- 2/3: fail the probe if the IOMMU domain allocation fails (Sashiko)
- Link to v3: https://patch.msgid.link/20261120-iep2-v3-0-e94eb9f629d2@gmail.com

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
 drivers/media/platform/rockchip/iep2/iep2.c        | 1319 ++++++++++++++++++++
 drivers/media/platform/rockchip/iep2/iep2.h        |  108 ++
 12 files changed, 1797 insertions(+)
---
base-commit: ccf78740d63813c452c035b57d17a650492562fa
change-id: 20261110-iep2-b9a9c6e77c44

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


