Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809655;
	b=CzvIOdjiS4qvutWOm436O04SVnPj7oGudIW2rSK28Fp0KVLwCuzr6IKhLtosOe+hsc1T
	 KkrW1ng9zYgKocK+U+Ce+UmRUPR0pMdZul/f1Af0NCzm8TvVo9AfWSkHkWIUwYU42Ez/s
	 BHnTrxBdoN7yTisa5SHa6dx60RfOSTry4agF5SRqxJUuEfahC4zIfQdacu4NxJUcmiRGW
	 SdZlSUHZDh1QmTWoSEHLmfrqJw3FTZm9pPfFFUPUMYsYeRCNVfHSLyAjKFOKx0a3/ttSp
	 UYhthQt9NHfgdfy55k9EXDQ8mxAKW2mSDFdnsqYlDioPzGkQ1AHyZ8B5UZuKr4iQadQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
	b=m2fmqpN/6TAEpjONhiWISqRtO/+cNKUsKTKO1DBeEcrRdYn99yMbll1vqzBvBxzIeF4+
	 ZW2WUrjUBV/O4ATHM1AQr6jYYl/0d80WrznJYGbceyCYECKLb5cMZ8aSqGK84HWACkjhP
	 +0lp/nos8KC6QnmnS/dWcFJF+VwB+J7oFQhSJZ6GIDdbxbAY8LPZbgCPJ1O5n+H/zXI3G
	 j5Rja48CLCf483X42hP4CtgGuwxwaBO991+7n9T74Ix388h2K9q169MbJhE5CS+A2ghP5
	 Xt9+BiQsqbEKwt5HvbHkPUeX4FHSuoPE5N1EYsi2BgKz2WpztT4LFlsEE8omlqGNquA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AcohlYTS;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F2606A31B
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AcohlYTS
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91ba8fcc684so14665136d6.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809654; x=1793414454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
        b=AcohlYTSJMZq+GAAY76u6+mVcRlzqGY9BQkfT6KfgzGu9tLA2/wuHyDW6/dh9oFneb
         34MnawYX5F2Zdv/9zHmkLmUsvPJ4084FqYqxNr/oHLc92Q/udQxfdoQpaBJt8RIW6LWv
         u0Jfd16viYrEUpw3wEfpqbndY7fl5/z6UZURZVtB3d28h7PwXAe84DKLIFgNZQZhkUaf
         Dq4LkyvcYNRaV11ykFfCHHBinmWZXGEKK4F9JlJjewB1YfckPufGRWkQN0Lgt+cQMUpv
         V0F/YouaEMOtu0ZJiMtP0Nty1XFdxctkGQSDNz8JhPj8SzvwX36x6LSdF0+dql7dBdir
         +cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809654; x=1793414454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
        b=ZlMWPDtm8hUxD2dxBvspj5hrv8Ou2KaHECE6gJ+0NdI/iXB1X7ZvxgbmaqWj7B/fo2
         7hntK6nXxyl0oO/kYpZfBukrhROhiYMemSwXI+Lls+vB/FJ14BE2/WcB37oei9SMETzd
         sqg+W3u6NQpk9KpTX05oM4X0CL23EnWi5euqgTR2vTutZnPv1Cvx5PMDYvc7CUlOuKQ1
         3l3BBKyBvljlQHjuGPb2O+PicZfqYNd0ktq1OZqUGdid/67AbB6n0bjPfzlYflKgxf2l
         7cGl8dunahlogKZ2j7GA5QLZG0ruhzLoN9xrtPS9Mgpl6TH7MVkBUf+rGT2VpdAAHY0q
         Swbg==
X-Forwarded-Encrypted: i=1; AKwUvBwER2q4m9/j2xSbPRYv9luFbEW3dCSFFEFNANdRi/Tfcsljcr0PAfLCmPRMm9PdV1lU2rhNWh7ikzWFpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJpjjDJaigvAFylKzZhvHtUJ5ZRda6zrpiLyV2OPvVdbE1WjBrO
	sFs8htbRralCk7/72ybu/mOyiKfg/hj0RxKn3cUUI7FupVlYmnfYMyVPEu4H1jOeHw==
X-Gm-Gg: AYBFou3as4FVZueDk7lqL8/vAa5+7Tjd+gb4y1nb5N8Kgsck/K36Ap53XaKW6tRi3eu
	h9NfFJULXsSKdRhZ/6DlTH/Hs1Gp+UtSn1yUCwvMj24ZD+zb9Ibep6AUetolEboMoAc+lkobY0k
	d3JgmtPaW1B7BMPsqd9SjxR3PuCz8Tul8Z+K3x8iplAA1mAdXG5niWaPtcboYL4Uby4KPfc9gJW
	QKCPOxaeIV6Z0nrKbY2sdMo/b1r0KVuaCcvoFbrmkM1u3S8cmnLd/qCB0Y2EdAajAtxIonGtZ9e
	x9TTZaxHKpgpy8upm5FspUfx5vLTZ9wzrLzR/6ccfdFq1UNpC5uDhn8BYvrFHoSiuesEXWd8lVb
	VXi8XD46XyePD1JmHO0oC5PPfO2qz+DqRDzlJPwNf+3s9Bbzl4dJVmofXpgTnXjVHzTxWtQuUv8
	ZzBe0oVDIGplzax2KQRwY5/IGI105KNpQZ3qVPbeV8jJ/9Pzep+9yICVQpEYECbTtP7O3/VSEwi
	R016Zg6E1OqrwLtPwuo1CT2roq6S7/he6EWZvt8lGe6vl4IN7Tsx4YVCHueJtJU6r48dvvOfFfN
	L+J8SaILudQLAtYUO6mjaS4NTkcM2ZPuYBZfOCVUESq8DNK9bOdx8lXY5moGKDynJu2u8Dju9/n
	PqueoleDbOQ==
X-Received: by 2002:a05:6214:5001:b0:91b:b0ca:9f8 with SMTP id 6a1803df08f44-91c48e57971mr14566376d6.26.1792809654071;
        Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 0/2] media: venus: fix HFI teardown races
Date: Fri, 23 Oct 2026 22:40:49 -0400
Message-ID: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This issue was identified as part of our ongoing research while
reviewing kernel code.

Synchronize IRQ handlers before freeing HFI state, and disable recovery
work at the start of remove to prevent it from racing with teardown.

Changes in v5:
- Patch 1: no code changes; carry Bryan's Reviewed-by.
- Patch 2: drop the duplicate work disable from venus_hfi_destroy(),
  keeping it only in venus_remove(), as requested by Bryan.
- Rebase onto media-committers.git next.

Compilation test completed.

v4: https://lore.kernel.org/all/20261001175502.4045853-1-mhun512@gmail.com/

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.53.0

