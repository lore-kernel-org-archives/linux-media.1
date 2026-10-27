Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099499;
	b=umrSI2of3HgrOxU9f1QKgw9O6m/ID3qezaNLxv+WsKhPVuhT1PZQxuklYV8tgZR3hBRF
	 nusg5k5kPbuFUxE7nODzypdoMSjUXyZBTADHdHZVw/OA11S0RBYhdWsCbtXltZlGDEvow
	 N3D0+/M4OZ1KEboHcsEEYl7zVvnhYV6t18047wTo+7ajSBktisVwsF73HD68McOlWuv3v
	 hEcElLjCvjJk2caWmlSf4QRHYFyGfpTGOpWuFusWi1lcr28fTplyx7+gDXC6JNu/9PA+n
	 1s9IyZ7Vrlff1nOx73Qc9OzoBCd0Z02YYjbrCxXrbYaOMgRtYlgTRcfHREZHdPix70Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099499;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=g3P3ROdUa1PE9DKlgSm4XNG3FysvTRIq5QVw6nc+8s0=;
	b=b6Y0Q9/N0603ATyEXo44r4d3LQPNa+oE2Hq/eOIvYmm6K6lD6eLxOEEinBB53oznys+I
	 61zNHDXXGtyU4dmX/RJWjfALtAjioQaHGWUZDS+L+EsTjKdGrwTncNqkSPHK3mXnUCEbK
	 62PAoQgSxAuqr0ivPGxiQI2Nv/hBg9n/SLlmn9GU2zGbXnc6p99bG2jLyo/AbSrYrAZBg
	 7Y/z2haSR/hZ54xxS/eoww6K98GjPV3OfzkCt8va4eSJRgcWxn+JuK64Caw24xovylNrt
	 ExOgDiIPC04ThRpZUzOoZkvsqcFiTl7d3K83gIoz2R0EdARYgHLBHej4YrdxcO/obCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=runtimeverification.com;
	spf=pass smtp.mailfrom=runtimeverification.com;
	dkim=pass header.d=runtimeverification.com header.i=@runtimeverification.com header.a=rsa-sha256 header.s=protonmail header.b=SNSRHk7s;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86D8606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D86D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runtimeverification.com header.i=@runtimeverification.com header.a=rsa-sha256 header.s=protonmail header.b=SNSRHk7s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1793099490; x=1793358690;
	bh=g3P3ROdUa1PE9DKlgSm4XNG3FysvTRIq5QVw6nc+8s0=;
	h=From:To:Cc:Subject:Date:Message-Id:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SNSRHk7sekEz0JtdoPAm7O5xRvtgmDWgK+9mP2B3iGIj9wTdAeSNI+Yb/GnuZGvy6
	 J91HudKBVvOy/ivUG1Gszi/tNo1tmBLcQKVgroS8B47kZ50szssPtBNz47I0dkIpSp
	 8TTXR+Eo8eaOofFEIuDHdqdx1P200D1cf6s3I9o2eJujjJEzInkPU3uJwWeTvElWmv
	 pLu2N9AmcDVVjoc8KWGqydYgucH4qkLZrWPYwTVlU49+T5sEdSBCAkYw+G/KBv5ZXs
	 vXSHjWMfPFNllsOrBQYrzeM0hMTGf2SaP+G9hXPRqTDCy/h5Jpwv1qZqoHkfW4RPjW
	 x/DDrULzqa8+A==
X-Pm-Submission-Id: 4jDSVQ3kRyz2ScjB
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: ribalda@chromium.org,
	noambs2999@gmail.com,
	david.laight.linux@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH v4 0/3] media: uvcvideo: harden the frame buffer size computation
Date: Tue, 27 Oct 2026 14:11:13 +0300
Message-Id: <20261027111116.119182-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_parse_frame() computes dwMaxVideoFrameBufferSize as
bpp * wWidth * wHeight / 8 in int, from unvalidated descriptor
fields. The product wraps; the stored size is wrong and can be zero.

1/3 lets uvc_parse_frame() skip one frame descriptor instead of
failing the whole streaming interface (Ricardo's suggestion).
2/3 is Noam's overflow fix, adapted to skip.
3/3 skips a frame whose computed size is zero.

Stable: 1/3 carries Cc: stable without Fixes: because 2/3 needs it.
Both or neither.

Testing: Noam, UVC gadget over dummy_hcd, on v3 code; the >> 3 in
2/3 does not change the result for his inputs. No physical camera.
-ENODATA path not exercised. Builds W=1 on x86_64 and i386
allmodconfig.

Tools: prepared with Claude Code. It applied Ricardo's design in 1/3
and fixed the build, wrote the code and comment in 3/3 and found that
case, drafted the commit messages and notes from my outline, and did
the call path analysis. I reviewed and built everything. 2/3 is
Noam's; he found the overflow with Claude's help and wrote the fix by
hand (confirmed off-list).

v3: https://lore.kernel.org/linux-media/20260820111556.232652-1-natalie.klaus@runtimeverification.com/

Changes in v4:
- 2/3: >> 3 instead of DIV_ROUND_UP_ULL. Per Laurent on v3 2/3, width * bpp
  is a multiple of 8 on real devices. Keeps the stable fix minimal.
- 2/3 and 3/3 changelogs say how each case was found.
- No Assisted-by tag: removed from the docs in 1e035297ffda. Tool use
  is in this cover letter instead.
- Rebased onto d135ab453a74.

Changes in v3:
- Tested-by from Noam on all three.

Changes in v2:
- 1/3: check -ENODATA before counting the frame (Ricardo).
- 2/3: DIV_ROUND_UP -> DIV_ROUND_UP_ULL (Ricardo).
- Reviewed-by from Ricardo on all three.

Natasha Klaus (2):
  media: uvcvideo: Let uvc_parse_frame() report a skipped frame
  media: uvcvideo: Skip frame descriptors with a zero computed size

Noam Ben Shimon (1):
  media: uvcvideo: Fix integer overflow in frame buffer size calculation

 drivers/media/usb/uvc/uvc_driver.c | 52 ++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 13 deletions(-)


base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.34.1

