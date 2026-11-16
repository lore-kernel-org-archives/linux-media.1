Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851541;
	b=xMIW+QqvrUGmT4Vowu73xQA3rw+zysXrKf+ubXn07cdbPu4k4nxabVAaHU4hqlfLNMnJ
	 aEXniM6c6SHO+HTZfxXE0qhJlja8ki2dVOAm15poHViIdNCxsGEDCAVu8w6Xtbob5uLQk
	 w2L1qWSzgiLw4zNBveNiXiniELA9/2GSDdK0hh5iQhhUomMdIBzo6vulSwheCihXVsfmU
	 gP7ALlMT7py57LK/rJD1g7xXENlEogOVr0JgTeHmG8OfL8coIDEQPy6bz508an1TX76K1
	 p2QLfaKwItVOdcKWq1meiarQEKNOBZiCfAjFO/hPeksMptDxGTEj1RecSM9FrAV3PPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=433xRDin6SERxQl4zr7qCG8UKdvmvBEfHT10lpucpws=;
	b=x3S7XltQwATdoyLvKfTDkZU5LLjMoUplzdDe0LNy4QGNHmP6NOPsF5wPjIwssVbPs2Ji
	 2QECc/plHHCdpdhDIQJIqmMTB54ztCuaIiD4JDE0vuY5L7RILWeS0HgCROcG6JcZMAz+g
	 KTB8MpBUkrejwIqo24Jrlmk/xxW8/uO+ijtH6kWsmSYD+1AneAmOHsb4+s/NvgSqZHqXG
	 WZoaajnA0CoDFuIhqhcn7aYBixRMz0pydED0gZS8aJhcnRGRnOIsqBsBpZ9wb75GDu549
	 KmGhw+x5Se4CHRRmI4C+/6YGuIXE/wJpCB+2iVQt995fJg+GrFqYMe2BrAD1SGcUJ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WiiQQwfv;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F74606A334
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F74606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WiiQQwfv
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be416e603cso2739614e87.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851534; x=1795456334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=433xRDin6SERxQl4zr7qCG8UKdvmvBEfHT10lpucpws=;
        b=WiiQQwfv3C1J+lYmCRVn+Rk4GZnRw+IphmS2VK6qOyfRA9YY4ipM2WuKUKlkI6ba/x
         2YqiFMyz00ABeyanHS/PS6TJRsN+Jj6RJHC4wnTyEbZxoEImDq411q8IKSuqnxrPQVv9
         Dc0l68dIxEIbm6whSJpHoVtUMz2t/3JXQhY74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851534; x=1795456334;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=433xRDin6SERxQl4zr7qCG8UKdvmvBEfHT10lpucpws=;
        b=sM12Qt12EnfnnNAxjzVSOu4e1YHq2fjVMhzzsceddVNmCe1jJP5yJ5XQGijMOZ2ArO
         8TcIX3kE6FwxQSgV90jYTrFp6HZMX1bbRziktTAws9060lJ9XisjPHxwXkDFwFrAjkAL
         pBT3uN8VyOFZq2HxPrMyhEn101FtQ9rSej2pihGK+OG5pBkpG4cXzG8IIsvnr1tjMexF
         wRMJOEANGBXrXFIftRwVjrgeOhMEKkWyvD0mkk6dyZemgnrjRE1tI8debW7XKfqN9MTZ
         Ezq2/iKf9gRmH+INVcawglbcFo+ZiRF50Y6+6J0pKmdKq2T0nipiuTtnb4MXOowS1J59
         V/Cw==
X-Gm-Message-State: APuU4Z9qwiWEF0uiRsTipmeKO4wh7pMZufmdZiOSI03uqR8FrBtsIakD
	pzk7zYMdIoYrkPznpiX4Yp3djjvG2NHo3m4jA/Em1V6MycMJv7Dt8SMvhMBucnw3bQ==
X-Gm-Gg: AYBFou2WuuI9hq1eoHDEsXkWrnmZRt/9q0wRTxthyD/WQ1ZPJEDCerbMsfGkCBtEhBm
	GKjI7ZnUCq2SsIeI3AKCmBICXPAtEdD2GTI5QKdUmEMeA6GH8EkXeRvTIOthG0rJPsTGJQlnf0D
	1Ip/jgw19i3qUU6LJ0IdqgDgkzTUWdEY9Jp1nDV9MA1E4gvt3Yy0kqvM5vVtMa9EGHZHtoxjcMz
	3ueYVGg4IIllAuCnW++1OShYwUSPalsLWnmFwSYZQNAi/OfTP7ldxD7vkB2oc2RD5VRNx1GWby2
	sfwCqQZtT6KkT+gkx9mYPdm4Jshe67IXiPGmuuQyFEX3BiMig+dzbx1/s6n0yxqjpgXikFlWa7P
	KAn3d2ibOIIT+CqQLLWBQ2ZN0PKM2kubFKaT3E29FnhiclyC4UIRJ5f/hbJuO6svRlJM/7KhEzL
	aZg9JyjFfC3UY4x08eGyADt87p7qB0f7Ty5rcKqERT9dtygo5berdS67mJTxq/fYavsdgnJyqQE
	8oIhP0Cy/k801RP8lUsW5DFLFcr5B5enXy0tkUeQNR5Bvwgfgmkr6Jyyair08vhFyf4obodsLJS
	terFGtgASLSCupU7J1yp5ymdeI0EsKk7bnfg/Cj48BsDHyBWwQGQMSeIfrwoMg0egjrCSzjiN/+
	1LK9U7Nsq/w==
X-Received: by 2002:a05:6512:2214:b0:5c1:57f7:f4f with SMTP id 2adb3069b0e04-5c170b36a78mr4191576e87.43.1794851533981;
        Mon, 16 Nov 2026 09:52:13 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: uvcvideo: Improve checks for payload header
 size
Date: Mon, 16 Nov 2026 17:52:07 +0000
Message-Id: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
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
X-B4-Tracking: v=1; b=H4sIAMdC+2oC/3XMQQ6DIBCF4auYWZdGiAXtyns0LiyMMgulGZC0M
 d691H2X/0vet0NEJoxwr3ZgzBQprCXUpQLrx3VGQa40qFppKaUWW7Yi+sBpwTQKc7P2qU1tXOe
 gfF6ME71P7zGU9hRT4M/JZ/lb/0lZilo0rbETNmoa2663nsNC23INPMNwHMcXyoY3160AAAA=
X-Change-ID: 20261116-uvc-shortmeta-75ccb6707d9d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Sinan Turunc <enscrpt@pm.me>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Payload header length checks against the PTS/SCR flags are scattered
through the driver, with different behaviour in each place, and
uvc_video_decode_meta() lacked the check altogether, which could lead to
out of bounds reads.

Validate the header length once in uvc_video_decode_start(), dropping
non-compliant packets with a warning, and remove the now redundant
checks.

While doing that, I also spotted an unaligned and OOB access in a debug
message, and two places in stats and clock decode that used the minimum
header size instead of bHeaderLength when checking if a packet contains
payload data. Fix those and factor out header timestamp parsing into a
new uvc_video_parse_pts_stc_sof() helper.

I have used an LLM to review the code and commit messages.

This work was triggered by:
https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Validate the header length once in uvc_video_decode_start() and drop
  non-compliant packets, instead of adding more scattered checks
  (Laurent).
- Drop "Check header length in uvc_video_clock_decode()", now covered by
  patch 1.
- New patches fixing stats and clock decode to use bHeaderLength
  (data[0]) instead of the minimum header size when checking for payload
  data.
- New patch removing the now redundant checks in clock and stats decode.
- New patch adding uvc_video_parse_pts_stc_sof() to factor out header
  timestamp parsing (inspired by Laurent's review).
- Link to v1: https://lore.kernel.org/r/20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org

---
Ricardo Ribalda (6):
      media: uvcvideo: Reject payloads with a short header
      media: uvcvideo: Fix unaligned and OOB access in uvc_video_decode_meta()
      media: uvcvideo: Use bHeaderLength for payload size in stats
      media: uvcvideo: Use bHeaderLength to detect empty packets in clock decode
      media: uvcvideo: Remove redundant payload header length checks
      media: uvcvideo: Add uvc_video_parse_pts_stc_sof()

 drivers/media/usb/uvc/uvc_video.c | 173 +++++++++++++++++---------------------
 drivers/media/usb/uvc/uvcvideo.h  |   4 +-
 2 files changed, 78 insertions(+), 99 deletions(-)
---
base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
change-id: 20261116-uvc-shortmeta-75ccb6707d9d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

