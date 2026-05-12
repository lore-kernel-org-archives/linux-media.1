Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD3E395AEF
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589072; cv=none; b=FeSfCHhwpBEwNpaXLVePynWebmpoORetithcc1lPSgaPmSeh0h5vBaZ49tiGWe4saHKtpD0exqj7hVnvn+2gfWEXZOytnO11v/ZMygZ19KbuFIFdpK7TMViEYHp0saCLnYXiOOZccNI+rOby1KpqEm5jBsX/Qy1RFBRch9KxPHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589072; c=relaxed/simple;
	bh=IFsFHog5bWcK2c+UvvtP8pVeEWEu244YwzvaoyzplVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BXgeU2UIz28WpRVDGnUVp1fCBFAvLy26UlFF4EcWoeCTOBWk65Usp/nRQdMopIjVm+3mLnuDyag2k/r5hUIZ55nRuPeGo3R1aT1USZZloOIBsuGzXsGnJjHO5p/ao92uJAE4QZze6NxMPMhrwrfbtUX70mX5cdnpGWH0YeCu0R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dW7PLLon; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dW7PLLon"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a40502e63bso4967585e87.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778589062; x=1779193862; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IuY8V+yTw5VQSBZmRP6A8go4t9q9EJMmfoMaCV58p0=;
        b=dW7PLLong5LBWf6S/KKh0DDIgM0tlIPAA6ShEhhtQEY74m6XOpOVIWKxrwMYypvEV+
         4LjjTh8ToDAg1TqFzBLs0BRZvJUVO3QKQOvWOLJiipO43YdF9ESGNki5UJvllnulCyqH
         g4qS/7L7r0D9TRRlMtNnqZsGGGrgv1HbkJp6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589062; x=1779193862;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IuY8V+yTw5VQSBZmRP6A8go4t9q9EJMmfoMaCV58p0=;
        b=LvYmB/gLh3SigrrAtG6kxa2gOJFbIYbktK/lPUqM17S9f6D9VbFK8NkG8xfxnk9mPN
         d8CzPmoml4ZR72M6RiAh+FAv+v03rgiXRG11FZH3WC9aoGj6jb7pfzWOv7hyTi7BYiJh
         PSspnQaQL8itZiJIxx5EZmp5okysUUV9I87LVA1CBvUaUPHQwl10DR+KbE4th9fW4tXy
         TvhCy4z3tIacmdIBQaeGGJY9XORz+pMHNJIQRQ3BfLsZf7AVu18QL21xLQ0HSJF7FanS
         mQ6BbpGTu6dQV7SWDHMqy4TO2RGBjspYq8J6COxUN49yBGPkly1HK65sP17i8tlhUCMX
         GHuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8J4sGEod3HOKI4REPF8KIAyhkpA4iaDPo58DBPRcYp1Z0Xp9A4BPsn9GuKgHXfaZ/+9lbt/dSHqx+2oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYBCRaW8O6g4yELRLA633l+4+1UyjGzMmUvjFLIhiPQ0TwzMlg
	H8Z7Hr6PFya58XA9+2CLa1/otLXrzx4ttWRRwNGRiCKrJCzT4cA0Xg+He4N3K7FLcA==
X-Gm-Gg: Acq92OF/+FDooVqEM4VNV5v7RkF6VazrTZp7PydDGtMQAXfynYq16oYAYezvgEbTlXt
	YXbQdHwZPldNYdXQnmqFkwezN0a42shfZgA5IzHJVvMCRHyVFkkC/F+x++y0bN1Sh05KjZURqEe
	KsC/Sl3+k1CCM2w1T1Tu41IwhEEfTNidviGSZdRN4F1GwU5JHDO+s47m7Q8mwKKaURtgGgRhxTl
	sw9t92y6AVvjf811GwiselMlw1G2qMWyd7MB8FxAOtT+Q3L+sorkcVozorCfRkQbUt+0bHoiF5S
	sdEYLW0BKoIR45OO04iJ+m6H6nvKG7wOL3CuDn3BkwWJyeoda2/eNMeBNw/mBvCtUIlSiq72Y0g
	c5ARF+1/kA7ucZIJn0gntpytpFe58n8TgNUAJNXCgqmFrlZIPuC7TASEWm4ly/PLBKpXNjkREH9
	IOeG6n2JJkTeAjtQ0uf4UpK6HvYtSk0Iaca/548mwhf/Le6nExU0vX5+KjAAHF7Jqqic/xonCIO
	gEX2PzWUrZN
X-Received: by 2002:a05:6512:3046:b0:5a4:1914:bae3 with SMTP id 2adb3069b0e04-5a887ce5f32mr10157386e87.27.1778589061708;
        Tue, 12 May 2026 05:31:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm1861344e87.22.2026.05.12.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:30:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/5] media: uvcvideo: Fixes for hw timestamping
Date: Tue, 12 May 2026 12:30:54 +0000
Message-Id: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4dA2oC/2WNyw6CMBBFf4XM2pp2eKkr/8OwaMpAZ1FKWqgaw
 r9biTuX5yT33A0iBaYIt2KDQIkj+ykDngowVk8jCe4zA0psZCmvYk1G2OfCjuKi3SwGrHuD7VC
 3SkFezYEGfh3FR5fZclx8eB8HSX3tr4XlXyspIYXWFVJ5aWqU1d3Y4B2v7uzDCN2+7x9oettEs
 QAAAA==
X-Change-ID: 20260309-uvc-hwtimestamp-f25dc27f5711
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This series introduces fixes for the hardware timestamp calculations.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Fix comments
- Add UCV_ prefix
- Improve commit messages
- Add "Do not run expensive code if not needed" patchset
- Link to v1: https://lore.kernel.org/r/20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: Fix dev_sof filtering in hw timestamp
      media: uvcvideo: Use hw timestaming if the clock buffer is full
      media: uvcvideo: Relax the constrains for interpolating the hw clock
      media: uvcvideo: Do not add clock samples with small sof delta
      media: uvcvideo: clock: Do not run expensive code if not needed

 drivers/media/usb/uvc/uvc_video.c | 77 +++++++++++++++++++++++++++++----------
 drivers/media/usb/uvc/uvcvideo.h  |  3 +-
 2 files changed, 59 insertions(+), 21 deletions(-)
---
base-commit: bc1ba628e37c93cf2abeb2c79716f49087f8a024
change-id: 20260309-uvc-hwtimestamp-f25dc27f5711

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

