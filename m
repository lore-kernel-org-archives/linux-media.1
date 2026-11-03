Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717779;
	b=ZXKEdNZZFDe5tl7SrgNaPPhiTvDedB3xJ2OTpj8MxK9dely+yBHjXUosx7bDByMNl3iX
	 TT1YtUpaH1QPbQ8woGiv/f6qr0/qMhYeMCfuCpXfEERHWM3Zt63eQfV+nX7j96OA4XXkI
	 Xw1yS6D06xplGNbRAbeoqTDOgn3InAqvFwvv1Tb20MV9sPItCK4ntu+nrGFjTiZ/G0Why
	 XqdB/Y3CoUtBU0+56+NYDHKV9FLEW8gxlWu0Plljj0sOsjdkZ63+iQYV0evll6srk7bBZ
	 rD5OPOZ80kBYOjuiX7mqjiSjvyGZTZe3u+3wVB4Plhbq6Tj9uN+zRP+Zthet6sWNvVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=LikyN3ozrT/DE7xxvLKNqwx4AoYBeMfpRQuMhrwC9OI=;
	b=x+7DXPlPubecI5YeOzDtnqlpVfex7IK3DDUTHcm0k4YoX8Pi64JzsTS3yow/G7c/iL+b
	 LvGwRS9qC6CGtCeofWxeEP6Zkr7aAlxYkV0x6kMHxL77vp0/hVEcjzjflC2qiMWxO6LFD
	 fF3KtfzFR9u0fwPPS6w4OtP2QiMBC9pNyWMXljhKcjPr0OEeh4Vvkdv29y+7HHUnqR8/p
	 A7rIK57jzroW+hqV7lY1sJP32PbmTUV0fR0ENCwvDJkKLXmJJRFiYJ67Yaq/Uqs0iW/1Y
	 O5KxwcdI+B5KV1wdxBd05MTJNCYdrepIHprg8fIgNLRq+X1qc/sG4jXH80yxfcBXoMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PlDwjO28;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A54606A33E
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A54606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PlDwjO28
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so860888e87.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 06:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793717777; x=1794322577; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LikyN3ozrT/DE7xxvLKNqwx4AoYBeMfpRQuMhrwC9OI=;
        b=PlDwjO286Dh/w0brTAx7LFOQt1F3ospHclP4ow2NMiuVJNTCZ/vBihxXiuGAB5kUh1
         VnCJtMqYN3ta4E5m14/tXrt3NG3mJI9OxJ98Xxh5Qf7nW+7fDunUx37/4MCTINBK1m/2
         tHHyK71PIKuC8yj1DmK2Ky2Ls7gD42laQ4Plk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717777; x=1794322577;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LikyN3ozrT/DE7xxvLKNqwx4AoYBeMfpRQuMhrwC9OI=;
        b=vQv9s4MP7dJGNnjE8qwlepjtbr5RKIKat6OcZRU0hFZg1cNXAaPEV9quLwyoLj8diu
         qJtvUJGhCyiBJomZ3neuEmfsteiafTv+RPylMFrmQ/eLFkWEun4Vm3e3ubqrEW3dNfX/
         JFqu+5r7F82wMyt6MJbWWb2L+r0NCW0at5AEx0bEn1MLOx01jIHZCLHorPfAZr6kh+oD
         VFGec31+1YrUNUsgWIeTpBDEHebl0UL0CP6zUXTzgcqmfEL0qbLNIBShWj9ooTSuLFiV
         rEdS+LewRaRQaWin6CxtuZd/ZwlXoyo4MhzI8oduBLigPbzEYVxgyAg3GiIUV8rlPJfi
         NmVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUMxr83R4rFZSJqSkcHbZeun8flkMWs5HlAygUU0Y0LwM0sCanDxD/yzdAc3l8wxSAq3ZWdtmv0yOdzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/McVCBgVBReKkE6R3q9LMqC4iCFVM10jThrRl9tpdaHOgt5W6P
	J17jsSLwara+Rfv5qujJxBtcrnewXwMwhdfUWS4tWTi5Fa7EALy6AG67JOt+BBZ3rw==
X-Gm-Gg: AYBFou0610vHRNuYzOLfybWtRngSEX0VLBGRs13mLjbyakTq34Q6OLXHrjGR7DkqjZm
	yQ83l6PXOx1jTnpe8JrK783DzekvLMzfhweF4SnQtjGVsEBNwIs0WiUqhNQhyNfw1KrW2piCxbn
	TzRbIIHwENCiir1bWYrssquemicj2t+AuDzoKbhSctevSDNsJJr8fib+w+zi6U1KBx8rAunB+gf
	ufRzfkxzGZ1yhnl71hZIaABaegGAzlczfNagrpfAnHpRqheqoQdez/QGCmwBJAHdQT7+CRPXJ6c
	39v63Q4PgkS0fUaQUt+uKnFwTq3RXhQtSqJadSNSwbr8BbCUAwipeZ0KvSIm22Fa2gkvmjNkKyI
	LrOGyiAZ+4HGtlkG2xHz4++Bjia8gyhJZSDiZDUzebOaooRcn9F9ZHi8oN8mIh7SK3X6Iyk+Pah
	Wt5oNhSf8Vs4MApbHAiieovmdgAhdPORo+ADvxrZ63dvqaQKdNSYknx5XC2wIG4Vv81vNI7YDWn
	U9WK7/ZOBoTyhEAXxSNQUUzm+4zW01wGDbTLmaABz1/wa2XnGjvfHOuAU6xRLIEtAfA+YB44p19
	sZc+y3ynnrIfIvBQurHTkcq0Ca+NKzVdGwSvgU1JLYcqZakboxZ2rTQT8YoEC8qn1Kq/ZJC6s/4
	aQCsJ14OR/Q==
X-Received: by 2002:a05:6512:3d06:b0:5bf:a12f:e10a with SMTP id 2adb3069b0e04-5bfd951d34emr3802682e87.3.1793717777523;
        Tue, 03 Nov 2026 06:56:17 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1b1ddb3sm2037346e87.27.2026.11.03.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:16 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/2] media: uvcvideo: Automatically handle invalid
 uvc_versions
Date: Tue, 03 Nov 2026 14:56:02 +0000
Message-Id: <20261103-uvc-version-v5-0-f23b6d103c51@chromium.org>
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
X-B4-Tracking: v=1; b=H4sIAAL26WoC/33MQQ6CMBCF4auQrq2ZtgMWV97DuMB2Cl0oppVGY
 7i7hRUY4vJN5vs/LFLwFNmx+LBAyUff3/ModwUzXXNviXubN5MgK6jhwIdkeKIw/fGGLDmDSqM
 hlsUjkPOvuXa+5N35+OzDe44nMV23O0lwwRUSltYRoKWT6UJ/88Nt34eWTakkF1yINZccuKpLJ
 w9XQESzwdUfrjKvAJXUVjdg7QbHBZd6zTFz2wDVWjlzrcsfPo7jF6nKJ9xmAQAA
X-Change-ID: 20260907-uvc-version-aedefc4384ce
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This series changes the way we handle invalid uvc_versions. Instead of
just failing it will try to continue probing.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v5:
- Rebase on media-committers/next (drop patches 1, 2, and 5, already applied)
- Reorder patches so bmVideoStandards removal comes first
- Blame missing bmVideoStandards
- Link to v4: https://lore.kernel.org/r/20260928-uvc-version-v4-0-da0e983fcb95@chromium.org

Changes in v4:
- Handle invalid dwMaxVideoFrameSize.
- ctrl_size -> video_ctrl_size
- CTRL_SIZE->VERSION
- Link to v3: https://lore.kernel.org/r/20260911-uvc-version-v3-0-604328d8a0dd@chromium.org

Changes in v3:
- Move uvc_video_ctrl_size to uvc_video_init()
- Fixes for uvc_warn_once
- Remove bmVideoStandardParsing parsing
- Link to v2: https://lore.kernel.org/r/20260911-uvc-version-v2-0-395f27b0444c@chromium.org

Changes in v2:
- Add quirk for Avermedia
- Change the way the compliance error message is printed and cache
  ctrl_size
- Link to v1: https://lore.kernel.org/r/20260907-uvc-version-v1-1-34e45dfe04de@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Do not parse bmVideoStandards
      media: uvcvideo: Automatically handle cameras with invalid uvc_version

 drivers/media/usb/uvc/uvc_driver.c | 10 +++----
 drivers/media/usb/uvc/uvc_video.c  | 54 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  3 ++-
 3 files changed, 42 insertions(+), 25 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260907-uvc-version-aedefc4384ce

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

