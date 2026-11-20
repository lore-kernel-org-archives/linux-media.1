Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795137040;
	b=3VjT9maylznX28OafZIpd+Lttqc7A4TnMeHIAH53eFRVTeGN7ecEHUt+Th+e8cxQWbb0
	 p9q4fsOqORi34NTjHctvFLYqJm9eOJdHC2KwfeCF13dmnGckJMSzKxcaRkrmD8klZs9bA
	 rMqN0e9ncCj6sfKwJjqXm7z92QakOHpJJzvsTq5/AIJM5ovUI0LAyOOSRPdG127h3EYvu
	 Q1rI0weZadFx+rm0BR+iWUNM0yJIahmzw3lJ8qSNiUnlgTEIbCVIpqePQ08Dn2LiX7bnN
	 u7wBmLLtLHGQd5iW0cmifEwbPW1RNBr8Z1Aogm+SX2aTgDObUVRG9qFSNKc7wAmjzgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137040;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=OQjk4SN59ydnBMb0in1ObJBuPQ5T8CiyduJaWY6q+TQ=;
	b=pYuO+4GQil1h7uL7gwjSPUEobIfc+VOijwXjw1DkYvmgKTpEZi1p3xzIyvGelKUNxgbz
	 8GA0+1+a5N2qUlzTTfeKIt0jWNRv6Y9Bzvk2LJupvjvnfD4H7hBryG/uvxhqzUdsmhlqb
	 5Y+z/djXAzWUtoAaszFoSNzPuCbZUp8Olb2ZjwuM+aafj166illXtkBldsPJ/uQHX5mTi
	 xbmzs4S8V6KOv9nKeMrY0LG6NwynME5pqBneDrglcKGrkF5KviYH2ZIpZqLEMcOBODKe8
	 6qhwwuBL/AQMPB79FFNz7nrVgyuR1fSgS1TQOxptWUPflADUnnkbYUVhesgycF+hr7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHONfR8u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496C606A325;
	Fri, 20 Nov 2026 01:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHONfR8u
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795137040;
	b=LFbHlflP+4ern69iDJjG/nuV14JN7+XRzQN8Uv1pGXUPrSExuUGIyW0amYeTVchaa+ut
	 dYp6c7Q0UDzfmqToLjEn402ZYc27sOKlVwDJaGRiwO1dbMPLAhtGTgfey96SAdsb1UWov
	 o4aoXcm7MVGGqun9g7vQGYyfHDCJ6kRIj0PZZfFFaK/G6ymqxLjdWQ9IuFCYzHAsOK1re
	 Q0sxNrm/rk3BmRxwSqdE64eCYBtbSAaOD1PtsFabQGvOT2Ppl0JLjwMdlEOTel0LkdOVC
	 VS2No8LCxe5p0ALkDpU2AeR847b6dPyIyG0nFtlYZIYn5I5/K6vAGKKBWf1+wQIMjkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795137040;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=OQjk4SN59ydnBMb0in1ObJBuPQ5T8CiyduJaWY6q+TQ=;
	b=jP9y+WyHFdsBwYTDQbvylXmFne2BzZaqCeSElQ0Aq4M7nrovzdwVy3NMq+4i6qmRvJ1z
	 QTLLIBCq17H3WLGC9OfusOdKm3SvIGwoOupz/qz1ck8sCgInsPJu+l/fEA/h0Xfuire1/
	 gM4vWoLbRk3WdC7QtSelUA/5CcxmoC7fEtubsqBVRkfl2wqMuNujF4ofwaJdD0w2vkt20
	 EJ2oVx1mszbVREmCeEV002qOA7fPzfrNObsmDI0XmXkPXrFeuMCn/Eb+RyX1yfmNu9Pnc
	 NZAATH32lF/hP9ewSmnjXyRQitcMp9gTgsZFYsmg/W/yQUW173Ln5vJPc+Dvjd7r6xA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44E4C1F000C6;
	Fri, 20 Nov 2026 01:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795137040;
	bh=OQjk4SN59ydnBMb0in1ObJBuPQ5T8CiyduJaWY6q+TQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FHONfR8ukpxgZI6OMo3NK5+UYaZN6lvfuI1e41L1gj1D3DVLApcPVRmyoc/4YLGhq
	 1enXqyqGL6vCuTn5ynPZJM6YqFPKt6SvY6dYJOL8dAs3lcf8WJEsDhWi/OFqOipS1E
	 fintp1Yko/y5dWrGf8mptvk75+BMyqP3bhgi/aAQ4jzpIsycGWDVgmY0s2gFIIOShQ
	 0+qQfVSHDsiNleQnBwwhAxWw6CJYAm7SzL31uXF9C4xoi1rNlbBlmcqhE0LHL5tUom
	 HyFDmCo2yJRsGIds0fOjBP2yhAQ7m7wTVYwiR/J1Kb5MKSFf+yOLBDRJWLVPcZu9pY
	 T0UMbE7/f43BQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B9CBB425FF;
	Fri, 20 Nov 2026 01:10:38 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] media: rockchip: Decode monochrome H.264 to GREY
Date: Fri, 20 Nov 2026 01:10:38 +0000
Message-Id: <20261120-b4-h264-monochrome-grey-v1-0-887102a688fd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDvgpEHBq4gLEydmCiYyaUuLe
 Pem7fIt/j+gsAoXGJoDlJ9SJKcKujTg45xWRlmqwbSmIyKLzmI0ncUtp+yj5o1xVX5jv1CYXbj
 a1vRQ6105yOt3Hqe/y8Pd2N+/OzjPD5NJivJ7AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795137038; l=2385;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Kth308z9xet7HD14BaAuot7KC10IQsCGy3sPJ6BL+4w=;
 b=MD0JLxy134nHpzoALsF9cBnaF8xpguqRYHQBg1VjwtiVZPbB+c6gBF4eTyGUtLou/YFPT0Rh3
 TwGsKhSbL1wDCYyQd3hyNt/T18K5Y25KnkSnuOZi5dHKI6/9RetzYrL
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

The Rockchip Hantro (G1/VDPU2) and rkvdec decoders write no chroma for
4:0:0 H.264, but the drivers offer only formats with chroma. Offer GREY
for such streams.

Tested on an Orange Pi 5 (RK3588S: VDPU121 and rkvdec), 7.3-based tree
(patch 1 there differs in the control ops struct and an out-of-tree AVS+
format table; build-tested on media next), with GStreamer v4l2codecs
patched locally to map GREY and to renegotiate on a chroma format
change: JVT-FR-EXT HPCAMOLQ_BRCM_B and HPCVMOLQ_BRCM_B now pass on both
decoders, other fluster H.264, HEVC, VP8, VP9 and AV1 results unchanged.
Other SoCs are untested. Userspace without GREY support no longer gets
NV12 for these streams: unpatched GStreamer stops with an error instead
of showing wrong chroma.

A change between 4:0:0 and 4:2:0 inside a stream needs new CAPTURE
buffers: Hantro refuses the new SPS with -EBUSY while CAPTURE streams,
rkvdec while CAPTURE buffers exist (as before). Unpatched GStreamer
does not renegotiate for it. With the local patch a 4:0:0 + 4:2:0 +
4:0:0 concatenation decodes bit-exact on Hantro; on rkvdec it was run
only with an out-of-tree busy check.

Conflicts in hantro_try_fmt() with my pending "media: verisilicon: Only
accept formats of the queue's kind in TRY_FMT" [1]; I will rebase
whichever goes second.

[1] https://lore.kernel.org/r/20261112-hantro-fmt-role-v1-1-e596d6f4828f@gmail.com

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

---
Arun Iyengar (2):
      media: verisilicon: Decode monochrome H.264 to GREY on Rockchip
      media: rkvdec: Decode monochrome H.264 to GREY

 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |  4 ++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  4 +++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  1 +
 drivers/media/platform/verisilicon/hantro.h        |  4 +++
 drivers/media/platform/verisilicon/hantro_drv.c    | 40 ++++++++++++++++++++--
 drivers/media/platform/verisilicon/hantro_v4l2.c   | 27 ++++++++++++---
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 39 +++++++++++++++++++++
 7 files changed, 111 insertions(+), 8 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261114-b4-h264-monochrome-grey-7d1fabf34027

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


