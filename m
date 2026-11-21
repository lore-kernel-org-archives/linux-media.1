Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795271126;
	b=hNxaqQXGcQUQno/2nXHTdHhf3q32QaLxuKIHJab3NTgcEnPMYaNBeUY1XFh1hSXqynuo
	 B2moRiJ8s4lw39VludePJ2G4x01SXTNoSAI234SD1QrbQqUT7wPQewB9rLcX5i+EEEZpT
	 EVVME7K22/vrhTMrmq/sHHSadhcsf+uZEj25FYRxhq8FvEl0JpwDH2xcp2+5iPFmqXchp
	 PsEbj+t4D24Decu95w7arjO1iRg1Yf3sr8oaItzHHPpoWQ8PDa5kthEbInLBUe/xYd59J
	 jy07geq28kulbMGBve9WCM5kaZshg0SIIULF5G3cRJZwgEZSfi1ysLZkDb6RvZHqIxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271126;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=3CsdqCdeeJmuQ3XbtXPJLibFyHRpdZZGE1AIWlpXzNc=;
	b=f51ZHuDspNemtjG0QM46DnV5zhfpi2BMJrrP1+/IccIgYsHozss16d7ehv1I6xUauw4C
	 3HCT45NA0wTVb2Y1vA/ERS1/m95o2/Zdsybu3sXySnLNh4f+7+3iVt8yeL+os2vCWX8x0
	 AatjmycIrql9TR0+IiU/ilO15rdUcXD1o6ELRqwSk7/R8IL42b9fwz1rp6RS8fQz7wgor
	 vNdp75ynrOOL4AY4UeOIbXfgZr7Br8MLmi9/XusBg6mff1KtZYraW9OQY+zFjTOw4MTVY
	 RXhwDivolfP7p9w3oQnBlSRDnIKo3gnA0u5bY28QXw/bZ72A8YxmmjKSCpSvOf6Purw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqN8towA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF9606A682;
	Sat, 21 Nov 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqN8towA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795271125;
	b=k/gIu4xEndtbkSYpLLQmaz8vkwP5y73ngKzYU87s6BbRbzq1KV3tYGJcz9H2BsR7Eu9Y
	 Sb/2qXh9+hr+kuIYvxU8hHE8JWAobz3bVeKNoR5huuoAWqlgyFIhGYz47OA46fJN7yYBH
	 RW1MKf5Dpq9X4B3ihEJFS2jvEcLM0LCWBUtiFSXbOH29SBO4kHET234TWvk0/heTIlkAF
	 +CP6yWMQ55t6ugBL6KFHUU5mAR5zQ5XhJbI1bO0t8UzxfgOOwcsAWt+ojDX1R7PKVqoQT
	 OT5aWsNQ1uaJ0Avyo2QskkQtt6wNooZhz95dzp6fcCv6J3+XhtBRoELZI7qot45AgPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795271125;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3CsdqCdeeJmuQ3XbtXPJLibFyHRpdZZGE1AIWlpXzNc=;
	b=CoonuvnggpHrP5d7OETW5sJdnIyHKILDKOe6ams7Tkkx/v7Bd4dWp6IpyZHrwal3wMmm
	 rObLkc41q4EpakjamnZHvUQGNzG3WnW/dOUFAkkNERU1KBeM7YGQUhPvIhK8D28gh/L6j
	 tpSh1fF91MIPFoSLofmbl+P3CQMT7n0Kp7i6MyqldU4eZi4cx47WoM2i0wvAtOaHryX8W
	 l2GS/qfae/9FKboYu6Yz2IKC4Lz+38N/oKa2NIYA1dnuP1FVd1ebTlK04R/vK2BWH9lOL
	 axoDnw8ibFjM1EQ41Gvuzu78utfucIztCqGTdIm0HnIhZywcYFyEebe4SFl9/2TfWiQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E07FA1F000C0;
	Sat, 21 Nov 2026 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271125;
	bh=3CsdqCdeeJmuQ3XbtXPJLibFyHRpdZZGE1AIWlpXzNc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=VqN8towAVTbQuoHpQ8shvgdJ4DOUjusReniQ8zPaqdKa+EOddU7uZP6vxNnaSlEuK
	 YGvIHmVXuw2U32gq8e9HWPmrP/CK7fvC9ix5X68RJEA/3bqZbEm1JzjL0tgNjEssc9
	 743tPfkIr9EOY1aryRN1/cjK95wljOgdwaNiUd7FlFzdMjHMQBBD/N2ujMMRl6qnWm
	 HEH4a0cWasoi3vf3gyWnylkXFWwf4s9UIwDGb1o7kfH8c2LsFhFs9YbkJTft6+icHC
	 MNZZ77BNgxWiMnYPaBILXj68aQZNao7K918irq53GGoC0gq0im7vaLv5cYYUGqL41/
	 NgFFPV82R3O/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 40BEC4BCA7;
	Sat, 21 Nov 2026 14:25:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] media: rockchip: Decode monochrome H.264 to GREY
Date: Sat, 21 Nov 2026 14:25:22 +0000
Message-Id: <20261121-b4-h264-monochrome-grey-v2-0-ffe7f2383cbe@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBAFf4Xs2TVtbaDx5H8YDqVsaY2lpEUiI
 fy7gF49TvLezAKZkqcM12KBRJPPPvYbiFMBxum+I/TtxiCYKDnnEhuJTpQSQ+yjcSkGwi7RjFX
 LrW7sRTJRwfYeEln/Psz3+sv51TzIjLtuXzifx5jmIz3xfferCPa3MnFkqFTFmdClUra9dUH75
 9nEAPW6rh+wQams0AAAAA==
X-Change-ID: 20261114-b4-h264-monochrome-grey-7d1fabf34027
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795271122; l=2963;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=1AOZgIbbymLsepcyi/gXZ6yRt0VKzk+OlM1UFXxm2b8=;
 b=3ERUJbxJDYvzH/UaEKVOw3M5cAyVjzAefXCUw4H3a8KGOzweL/kzmUMT9pc/f4YHra7mkYjKs
 j4B/lRaEZwfA2S77mFfpFkPJbx/PHUOdaYrGZK/p8XTAAW4fZjjWNRC
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

The Rockchip Hantro (G1/VDPU2) and rkvdec decoders write no chroma for
4:0:0 H.264, but the drivers offer only formats with chroma. Offer GREY
for such streams.

Tested on an Orange Pi 5 (RK3588S: VDPU121 and rkvdec) on a 7.3-based
tree that carries my other pending Hantro series; build-tested on media
next. v1 passed fluster: JVT-FR-EXT HPCAMOLQ_BRCM_B and HPCVMOLQ_BRCM_B
on both decoders, other results unchanged. v2: format and control ioctl
cases, including a too small CAPTURE buffer and a refused request, with
the size check and request error path of patch 1 in the posted form;
4:0:0, 4:2:0 and concatenated streams bit-exact with a locally patched
GStreamer, there with the size check of [2]. All under KASAN. Other
SoCs are untested. Userspace without GREY support gets an error for
these streams instead of wrong chroma.

A change between 4:0:0 and 4:2:0 needs new CAPTURE buffers: Hantro
refuses the new SPS with -EBUSY while CAPTURE streams, rkvdec while
CAPTURE buffers exist (as before; the rkvdec concatenation ran only
with an out-of-tree busy check).

Conflicts with my pending [1] in hantro_try_fmt() and [2] in
device_run() (the same size check); I will rebase whichever goes second.

[1] https://lore.kernel.org/r/20261112-hantro-fmt-role-v1-1-e596d6f4828f@gmail.com
[2] https://lore.kernel.org/r/20261112-hantro-dec-size-check-v1-1-e5f1180b625f@gmail.com

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

---
Changes in v2:
- Hantro: GREY only for High profile 4:0:0, as the hardware does (Sashiko)
- Hantro: no GREY on open, SPS ignored for other codecs (Sashiko)
- Hantro: keep the 4:0:0 state across S_FMT(OUTPUT) (Sashiko)
- Hantro: no transient 4:0:0 state on variants without GREY (Sashiko)
- Hantro: fail refused requests and too small CAPTURE buffers (Sashiko)
- Link to v1: https://patch.msgid.link/20261120-b4-h264-monochrome-grey-v1-0-887102a688fd@gmail.com

---
Arun Iyengar (2):
      media: verisilicon: Decode monochrome H.264 to GREY on Rockchip
      media: rkvdec: Decode monochrome H.264 to GREY

 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |  4 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  4 ++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  1 +
 drivers/media/platform/verisilicon/hantro.h        | 11 ++++
 drivers/media/platform/verisilicon/hantro_drv.c    | 71 ++++++++++++++++++++--
 drivers/media/platform/verisilicon/hantro_h264.c   | 11 +++-
 drivers/media/platform/verisilicon/hantro_hw.h     |  2 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   | 22 +++++--
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 39 ++++++++++++
 9 files changed, 152 insertions(+), 13 deletions(-)
---
base-commit: ccf78740d63813c452c035b57d17a650492562fa
change-id: 20261114-b4-h264-monochrome-grey-7d1fabf34027

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


