Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48750AC30
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877316; cv=none; b=eTHgmo4CgvAwI7brEQSfPnV+uFSV3IXAylaakYLg3gmJGEdui/7o8kKjtQmlQN3+SPALUmkD5/1A13FCSP+4I/0VdadIPWmdb247+TEyEPBEzkqRaBcHGMmIh5ykf6Mga+QQVUpSQOY74+7Wy+c1My1ByliCCm9LeaN3PreqmqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877316; c=relaxed/simple;
	bh=SOOCumC9eQ+FqCQBhWQsEMA9l7NUzxXaCBLLHxZm5Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elY2wYljdH5SUsKWe5aH9M/ImRLnTqEd526MoruE755p9kxG8y4WullZHr2TIEyFSJaNrbeO2m8tkm0A+1ZWX7f629QpJv1iacaSAfXKnxUi0pUSKY5gVcZ6KGOMBy4BC1ZaQcFpfLGjSkXzkw4K+ZqqZuWOSqM5+MyDT0J2XhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQZhE5zI; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQZhE5zI"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-917bcc8705fso2995256d6.2
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877307; x=1791482107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAtw3dj8Gb3TJS5ccNgw7hK/vAKH4nT24lqGQ5QRDdc=;
        b=QQZhE5zIEfFTgXYmCslpda8fhWtO9mV/idwQwjftpnZAYn1cFZU/+N3j3Xg98weI9D
         rRxbV5e2zMNnAY2eDf3fpNZPEs5R2RdJ7bY4r8Y7+yb/jZR3SnZXZUiwT6irUAleLjGn
         rlxoh4ItxZWvVso+AhdfqWj2ZWgwn+CPMF5z7xWJyBc91H9c8gT+NoCJG12maWO5AdAh
         IMmtSuQ0Dq9kSF8KPvbj3kC8D9Oka64PEYoCWPoLe81moz3A2ubmh6/LXK8kCzDey4Q8
         mLK4bHQ4bbnREfV0KiOgDi8n/m3PsVr7wOQqGmXFpSxHByhpUC3TAH6e24OakhrHya4u
         BeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877307; x=1791482107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAtw3dj8Gb3TJS5ccNgw7hK/vAKH4nT24lqGQ5QRDdc=;
        b=Kqsvl89yTySUcjzyvNsa6J/ucwD8q5ImzGMBESCs+iOl0YnpetfWdr5CiCpNXeW/9D
         rD/GwsOQMDRlCTZ48eHMkxu9SYqoqt+mTs7hk8zl1rSpiTRkjRCdE5CNzafsPAnj9jAc
         cxXNhZESDgllYbQ1g8EtC3+dFhTJYTIbIbqLfYyN6g2pqS2vNWsgiCHfwz2MfLSAmy0p
         03xzvZwDef5R/KMrvKHWGrGNLoaa3nxlg5pjO2DJLnh9x4EX/3SbSe93pH+ToQHdmqVW
         ZsvgFyLsCmJhSUPJxMMVX5L/Nel+mQ1/3zfPXOD7d3Q9iQUJowIqzHayXRXkbaydmdAF
         28Tw==
X-Forwarded-Encrypted: i=1; AKwUvByxj62p7i3pdvo3T++dYlxPNojbImARGyIRtxmAImeGIkJ/zppk/AkzXrzZ0s79ez+nxezUg51NAwVAnA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIn1et5Jk68rzsOIQ9KqTWDL0dGgXXRaPGlIJ88YtTy3YaW1GBG
	mh1f50CSeRZRpqHHjja4Ws2CzsatR0r7zY2aBxYuZpkqh2mvR/OyRUc=
X-Gm-Gg: AYBFou2VU+EcNNIM38Q6KC6/qyTEWYrzsbvQ2py7ClxyTCC5eRZDWLw8WwUFCfozEGO
	zWJg8qcsBxVYsHYRiBrCDJ4y1AcNis2BztWq+6y08qT2+UFFSQPnXmda1Xoi2uOSRsfw/eb43yH
	eY7fmmyGNC8GWXD+1Fr+BgB3IqifAB1U+zxat+TLdbkN+ycLdOgoyfWJS3lGXo6hgJBix55xN2y
	44A2MnSKbrQ+lNR8LaBvsFi/KW52i7FrFzgIYrvAMhgvvH+/JaSepn3ZYMFol0mCktG5Aq8y5VB
	1OJXy74XHroKavDQ57vt/bei3Yg4jJuycsMwN/sdjkD90nHI1pY1SbkweftEnPAs0x9pzPT2grs
	8utSsetvwZn/1fneQfAn2I2IIoRoZ0pUTLG6gDRsXllQUUi4HVsZ8UxTXQL4bq0R02x+GQK+eKq
	TaIHUkedT2Y4nzcn0CR21fFSK6d86xWIYlRParzQW6pGwjlP6u3k2va3GnhxERuMslv0jt4dfP8
	WwRtEtPdPnELMC2Cv7tooziY9oXHmAcFCrdPWXWofg2p3y9kfctZGaLKQAKwH+MI6PnAdDACv8u
	CKWKmKt0cmZSUbp+72QdpyCpFy9q
X-Received: by 2002:a05:6214:53c7:b0:914:52bb:688c with SMTP id 6a1803df08f44-917c009ef8dmr4828476d6.15.1790877306628;
        Thu, 01 Oct 2026 10:55:06 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a22f96sm32077796d6.32.2026.10.01.10.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:55:05 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: mhun512@gmail.com,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: venus: fix HFI teardown races
Date: Thu,  1 Oct 2026 13:55:00 -0400
Message-ID: <20261001175502.4045853-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191653.3144006-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Changes in v4:
- Rebase onto the latest media-committers.git next branch to address the
  Media CI base-branch check.
- No code changes.

Changes in v3:
- Send through git send-email over SMTP. The v2 cover letter incorrectly
  said git send-email was used; v2 was sent through the Gmail API, which
  still wrapped the diff --git lines before delivery.
- No code changes.

Changes in v2:
- Regenerated the patch files with git format-patch after the v1 mail
  delivery wrapped the diff --git lines. No code changes.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
-- 
2.53.0
