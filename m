Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638996;
	b=oi3rJSBipoc3Ax9qiEshzl7M0kk379cWMrNpT8LVixZWuhdfFrrN+8Kx6RCgpFCoykjM
	 k/TThOHtijz/YEr61ErfTJ84S1KYyKDroGSN7FhEqPYxBX/ilm+8F1v6zb+a1Muj8Dbcv
	 iM0rnXTzPVkQXiJkpsv6RNgSeuNl7R6/enUYZL4jPOBanyGFm6n+vEoWBlapKjMaNrbZW
	 PbBASW6iPj/5SMbtmMjnyINWSkYwrXtpy+iNsn9XxpCDLzMqq4965/gA2fAWGUi5dm7vA
	 giWQb5z4/LVqLn/Q/CGgTmiKGMfGYj3M3cK/kd6dl0nyuLb90uEJak83nvRWqT5BMGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
	b=ikuI7Lm+OTEh021iA7TO94f1N1rX28YUk5jKApUTasXquyFxqQwtKYf/PfM4pDkglLZg
	 T6MdZoqSzTXholBwR48wJlH2fRyaBAjmVirtTIV0TmiidwX39Y2Ytd22NCyukzcdZwUBU
	 cy/oD8LeKobZ921kAl9pVDKqkSW5Dj8/TPYfFZfh9TrZKndSxL6UAz65prpw9dhcqgncV
	 /wbIS9eldzuTk33Oh+YBD10+3nRXphK7V3GAr5rrgiqsOybzQBpKGhVOhOxgQKOTSDidY
	 8ayGks4q0ksaFK6SmAVXGwPZjPLZZlqpjAAj4kdrQhWWfodhMggPgmt8Ib9/8DYqoxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLcwHB8e;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3147606A598
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3147606A598
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLcwHB8e
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso567035666b.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638994; x=1794243794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=NLcwHB8e2np0eq+L4OiMPgIc4+Cdw1WtWgJeb8nnaRBVLrW6GDfgJM6bobOROoYBlG
         jEfcSTLZsV/sj66GyUYRBi6QY5SHZNAxV8GEaoh5Uty6RZ0tLhpwFG3wN2wZxhsZyQhS
         krYhyzFecQRLjAIMwy75/dwG8KmpLao9arm5rTgR7mZS8gZ0llGfpAOeK7XPEeBrBqm7
         28VJfXqH0Xu/6X7Te8cXF6cVm3wRHE3BTa1UKBBPYu3NBWY3xkxy/WEuOvImlJlKDx8O
         PPPVwCmK9JX4QPHy0fkBPZRMr9jb6R0KDdpR4W/eqqvxFPPpHc0ArgJ2T2zl9dDivGNm
         5Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638994; x=1794243794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=LXrQD6BRCeIQbbptfUxD5wIghHYuXvqWAf3RCf53g58geb0PKHdVtZsPvGkZeLx0Lt
         Qzw6OglvOaNwreF0AvfJY4RhpHryRJl2IMz6ucCI00+iOUHB2XIKcV46f1Sr8SIxgcqQ
         P/lskwyyYzs7fCWXgCrw+uMN384FbnHGZo8no9lRw+PvriVAxS2kwLche7/7MMC4uiZ8
         S/HvOZhxplBCpXhpDXFj9fWea9rDMW51qD4jiSHQ3UiGkMfg8fZjlNmGjVQkR7Ex00DC
         jKLqz7HmnIOQB1XH91yk6ZwNq+a8p3WhMSQLvYPtNuZEQuHI+LznueJAzG/iDDc/NOGZ
         zU8A==
X-Forwarded-Encrypted: i=1; AKwUvBwe/clKCooqqVW/CLsAtK3HFTQqgJGM3DZ9n8B4ieXTsOiMkk8qnsIwY/Ls1lyOrRy6Wpjs/mapjgOUgw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHZA2Ch3C1S37pkFw5hPPaea3vOn1RSS6BjKwRHyE3LCSsBWbh
	Udfhkdg+zfDK+q0vfqCXRkED9QfEodNwYdF9df3SJkIliNTEy+mnqVPx
X-Gm-Gg: AYBFou02h+3Vv/xPZJDBC6xrj6s9JJG3WMQXdtkQQmPNTzRIa3snmkTtm9iSLkotXDb
	V3yQUQoLlESjmHGhj7x0URmKW1sXfvkbjluPTcymf3sMPobFNXL0DgTYhnDk2cbK2bG5DGQLMcB
	4SMfQkzPLWKYAeYyJEVOOT74GTl+7GIsJGv/IIEgtIRM4CsDTF6fk3VOty9LkesmByInGUgQw8Q
	w/khC2bgzzirp3Dk7XM/Vg/awQhIdlSOlQiQ7/REILNowx7+g2YILowaSGHNWOyNaARQ7WFHLq2
	MLPt431qKqQ7mJPgF/FA2QkDdP4qr51Tw5eqX9C/0e9RyBVUQDFlFl6wHRkQyl/cvyzYRFS0adb
	Nh26zyMm9th+CkgkNdAk8NoOgBhcrVi5/1In3iYk9UrVC1T02sTkvEgEj4xbm3uYy7vz/G7Ct+U
	OBIcUJW01WeojZZbjynYikQc06LtvGZnMjoF5RUWS9Ps5HYJTx/yNcWfqKCPWtg2bocgxYt0kQ+
	8CfZiPHxl6It9b25/CDxHwh44VUJ62W9ooMcTqfdiBLcegwnh2KrqwSgyJCuBDTZL1U/jC3a6bf
	P0tHHmhLQlwNLOPnU+O/rXLxFEeNJYNR+yog80XSREuMLCidEJ+tVvI0azB29wmAzeHtoWrWdQX
	IL/AkeOMYzkKehUKCv0qJHtrvBAT1GkvvPGLzH0sZsqPa+o7HPx17r1ca2gh4Um5hixv4ePDUmj
	Ik4Db4SR11GazJnlWPBjOJd6jPujRZDg4l8KDI6EyWrCAonSPHz10IiFYJ9tYEIL5CZBP7kSb21
	LCmw1E6qQG95/Rrr73+9Vu3Fx3BLNBuKt8cHY+WM7/44z8uLg==
X-Received: by 2002:a17:907:e8f:b0:c41:64c1:cc2d with SMTP id a640c23a62f3a-c4ca79353a4mr832997366b.2.1793638993799;
        Mon, 02 Nov 2026 09:03:13 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/10] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  2 Nov 2026 18:02:53 +0100
Message-ID: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes a number of bugs in the Cedrus driver, found while
running the conformance suites and comparing with the vendor library,
mostly on H616.

Patches 1-9 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 validate H.264/HEVC SPS and VP8 frame size against
  the hardware limits and allocated capture buffers, preventing memory
  overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8.

Patch 10 is new functionality: VP8 decoding of frames wider than 2048
pixels.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (10):
  staging: media: cedrus: free MV-col buffers in buf_cleanup
  staging: media: cedrus: reject too large H.264/HEVC SPS
  staging: media: cedrus: h264: mark long-term references in the frame
    info
  staging: media: cedrus: mpeg2: use the field height for field pictures
  staging: media: cedrus: mpeg2: derive the field order of field
    pictures
  staging: media: cedrus: mpeg2: fix the references of field pictures
  staging: media: cedrus: validate VP8 frame size
  staging: media: cedrus: vp8: use the vendor probability table size
  staging: media: cedrus: h616: use the 256-bit DDR mode
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 60 +++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 15 ++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 40 +++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 ++++----
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 ++--
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 72 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 66 ++++++++++++++++-
 10 files changed, 276 insertions(+), 47 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0

