Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830203;
	b=NN0axkLiSdUgBz2AUK20xnai49kJ1x35RMxBv83I3R2GGUzv1FjLEMB/IHc+bIaK82uJ
	 aRdkh6FlNwTuw6Q7h7b0aEgDbcCzuaII+BtnVGnLM/TKFemo9dctxxlJl+EmUMPXJXG5h
	 Rj/FboQnk2kaxTsoqpQVYJ96yacJyapMaN50JgEu/2PAi39BtE49SytBYgKb4/MOCgnq4
	 w5ZhdXZL3Tr3PVnDE4wJrIF0nzQVNYjEpJN01lG/vUxEHYkb+kiceVV0zCizZGSbCYYA2
	 hiivU9chXV89mHiZ7qUH7aFDTRizW2TRpFgLgna53qjmyAgG1nTDdADHcrSbJUpsOxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=75BqASa3pQSiCLazbg9HUnip9NSP2k2e52gEQNem2NY=;
	b=SGtBvWG1FeFOnrbPcntCZ0Ev3zLSwrBj/9IjUAkmwOztCapwbelk5KTHEbK+3YjOkaWs
	 t/xt/3eEHySIODiy+CXFKgn+zW67TyGgvU7WA2J0+1z7VTvfjOfM6nzHKNChjHqvvThIV
	 B4Sp/grMxPJv/BuKDutNYAmq3Je232d8HLkGyJLsCqIXtIGWuxR+DdDEij3e0ojgkHZSr
	 uZ0hNNTllrouN0PsMdQgsvnTJXi6sPhB+ahCi6giX61QjItQSsJegCUiF+Bnj8n4nQS20
	 j7UFc0910GIDLZQXdaurRUZntAeCmaB3Qrq/s0Qqh+u0kVqeoH5YjV7dXbABiJGbJIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R7eMeQvc;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC6606A331
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 11:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAC6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R7eMeQvc
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so36936111fa.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 03:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794830201; x=1795435001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=75BqASa3pQSiCLazbg9HUnip9NSP2k2e52gEQNem2NY=;
        b=R7eMeQvcKmV+YQ0RO1A52l9WKu6AgEr6CjleT4AbxpCF087ib+8qBbk7ylI3LyhvGW
         nl9mwEBSL5R3YwT8HcD8fSldh9XD0xvhB1oGKgsDUm3nfxN2sXcfT0rJRpvYfdS+rI0B
         ano23tip8N3VL1zCVMp+MZ4hN0+YQDLDOcFQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830201; x=1795435001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75BqASa3pQSiCLazbg9HUnip9NSP2k2e52gEQNem2NY=;
        b=zT2eEkVq1ThMpC1irTXVqO7EATmlPt417lgd+hPdBwJTLeVu7HdmAjHSajxSYCbpxI
         +iFHTrwmcF1mSqGEu2lARh9mbyEPcJD+aV6Zs+87vfU2ewYWfW9xXI1+lkgVqGhy89ax
         Pd38blfYqzvRCRD3pQtXbSsq3ZP6+7zLU6osJKU9ly3c2Nd3OBCZDBWl3r35YttElPBB
         jZKNX14jCrxI2xhffPmPJkBu/RKtMHd89cumHVksOOlz2WkTQybnRNNX0zjxp/XTrB2Q
         58RtHj+7xV+X93A4GOyzGCuwywQ8ZnRvCeS2FL7xikRQfJ0hoYyCJeKIbjLOERda8dTq
         TSPA==
X-Gm-Message-State: APuU4Z8Me8wC3fE0b0qkf81Whz8WBiRp60kCBD9qpZEdqsmJIfVpsLun
	Bi5B2VufuVkUY83xFiOjJxVbaZ19ZjXYyWw3UFKIkJUg/nbAOGUfqaFnjfcTyJVafw==
X-Gm-Gg: AYBFou3Kso7X4pz0bwYDXfAUab+PcHfWI/QyyGSyD3zhPpiACVSqgSHJ560GkhymU2i
	PerICEQsqJzAA50szhVsAVCR5jlxNzZ2d+nx0dUH9UHXnru6NLFqJjdBa8Pnr3o5kWWu+FfBzJF
	GPBVOI26ALXCDgPB4H6g1UpduoplSpFJ5r/Q042zyuxpLIsGL7BnA2SX0sr3+NJzaNzixLbcJs0
	vZOMqn0xJ0agV/cMByRjuQA11dgPiZpt35Bmk8XIazcvfJpaA0SpVF4DnmaDKAAZsfVi22X2/q+
	YV0SZYv71tyfnq88OD9tQtHx4jKeUSdHzwTFJ0actRDiA88YxsgpJqPycWcyPdPOm5fcp7KID5I
	n/fqrjJrGgSNQ+SwlFrnI+dQOD4avJUYLLgc3OgFxUBiv/R+NrGvZy/gw0x9SqA4BlZB+kDsAwF
	Hh9JVBLEG7VfCHzyFcJD/qaMrcZlWg6CUZEiHWnmmRZlekzzTd505ju2gxqF3cRmHGuVZnDvJCg
	7UM0ft56rcEFO3burFkD8xd7fHpEEJaPnGnLtkSNPthGA24TkFaGUAXrh4JWw4XKLkRk6OIrFzJ
	uv42FkqE9WbA2Dn92wPZsSRSBLEmZ2fLVtSKPgU2Hu9WDn8GT2yx6EDFyElDdFiCUVmCqjKKLaE
	Ukuc4KkCb9g==
X-Received: by 2002:a2e:8a88:0:b0:3aa:fd7d:6164 with SMTP id 38308e7fff4ca-3ae2b68121fmr25930611fa.25.1794830201228;
        Mon, 16 Nov 2026 03:56:41 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm3183754e87.9.2026.11.16.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Improve checks for medatata size
Date: Mon, 16 Nov 2026 11:56:36 +0000
Message-Id: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
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
X-B4-Tracking: v=1; b=H4sIAHTv+moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mz3dKyZN3ijPyiktzUkkRdc9Pk5CQzcwPzFMsUJaCegqLUtMwKsHn
 RsbW1ALgAAO5fAAAA
X-Change-ID: 20261116-uvc-shortmeta-75ccb6707d9d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Sinan Turunc <enscrpt@pm.me>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

In some parts of the code we have not been very strict when checking the
payload header size; fix this.

While doing that, I also spotted an unaligned and OOB access in a debug
message, so I added a fix for it to this series.

This work was triggered by:
https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: uvcvideo: Reject short metadata
      media: uvcvideo: Check header length in uvc_video_clock_decode()
      media: uvcvideo: Fix unaligned and OOB access

 drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)
---
base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
change-id: 20261116-uvc-shortmeta-75ccb6707d9d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

