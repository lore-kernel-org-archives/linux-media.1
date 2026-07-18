Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315C31326F
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379776; cv=none; b=YZhKdjhH4AP/+sJTMXAvAONF9TmZefh9UTnJb0WnPn3NG72E1AY7s5h6KX9xv44zEgugg0Nyn1OVrc4Yo5E0U5SPQjpmF6wyjJFPe47T6zSjO1H9eX5q8IhEfVRdwldR1JgTyBH//AdprjxblHN8Gl3eGRM4oEOnhgDjsZyqcSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379776; c=relaxed/simple;
	bh=BxaIARLOZ1sPdfpbc81kJB8wWroTMXJIcprc0wC30WM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=I7cUuQu14mnDlTA6YFZjyzxG9WsjRfeWXm6XrTNcY98X/7TzcFGpgAYF9Cvx82K8OJ2xet4W+rLxi5Zta6sC8EBJq3udvSHZQqcGfIRA88W7NSci11IlRyUdYtlVRms9jyBhfyQaoaC4C8uA1rzokd7holliV7zKiGS0hkfnLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBaiFDuY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBaiFDuY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso104560a91.1
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784379774; x=1784984574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILBggN9C6EDJIXFyu30t2HN5bPa89ODd4heQ2DxUS0U=;
        b=SBaiFDuYqUZIb44r8eiIogsdkpEecJsMbSgSxNB1agle+aAWJJ1mj5uUQwOIkd2V6A
         DfMjvK9QwEioQdghi9vM78HSuHqkcpov4fIyRbi60MOYGLT3akOL8RlH+U5AdFJPhhA4
         Rul9lGpzXu7nfSybUOkH8XCzH0iB8Z8Spas+BykOpxLJqFpuIHU3ngWsWnhu/+xaA1Gg
         wKv54uFzPNTevaoiBwFodcZj4O4aLEgwUl2gx6JLZMF2lfVC+7IUlAY1EmZawEmYf6R5
         7DJdBngav+Dl6hTYXrZzM2FnIv4upsUIqlosAOzzowA3K1NJYta5sjV2iOz+5bZp8bgU
         mfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379774; x=1784984574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ILBggN9C6EDJIXFyu30t2HN5bPa89ODd4heQ2DxUS0U=;
        b=f9LwHwk6bgWWI/sBGLtGR5BaSWQVkZPSUehHPa6PrsvjNuihuMx+42ukJu6VT01Tkc
         Ek5pVGIcLPt8myL0BhbYijv6vsPzgn/N7haoVRtZ/+P7tyXIer+PQE5qhdW3r3nyoTM/
         ivwtKx3HshqS6TF7OExqwf4hfZ/fOIBna6ZTJlczfLV6fkjoWh1PXy5EjtCNwnT3XvGi
         GyaubdWRMZoOkFcVVujSFIm0hAsa2Iq57DzyXw00d0ce/kYHCIrYgzmsjudVnTsWwyaf
         uP7/fT0XPir4UdEd+/JpD6yi+92E9xY9MW55QOmzsSPi97DAcTMKwQK4dVuHV5idQ+C0
         Ntbg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4V6JedsAMymCekEcdlS8R8LneM0dO16IcD3ZIc1N6/VL91zYN1w6/OqggYZXrC72c39oC1rDeM2+1TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyimN0NJWD1vOokiUe+eB0CXiDAwfWUn1/s2/LvYbRBM28bcYNS
	QfGLmxOiMgjupuPthdVj3vSg9a+BILUeJMkuJfYhQPflHuI3OQy1BElu3fivFfjhW8VNBw==
X-Gm-Gg: AfdE7cmVBhy/WPGvBt7YxT6gwBYsTB/l9bpvQHM1aMPl+xawuF4iCeqks6zG/G6B759
	3Pg3R5x29a4simmoCYnTK+Lgx1iAXj4ciQmk+rLQpu/dj2oeRrkhYajonR4DQXEsEZ5sT8F04PW
	qaKa5kucVsUE1Juxon/Giz4Ajjx7VIRbVK5GnKuUsmr46CfRCFjRqiQABcCZ6nA/9ECqaKFZYBY
	wI3snr7jMMRBIMS32eGOsrNUDcv/tvWkqOaQ4hQVxZQAIpgnrKUnzH/ZZ+0Wo9RbhSSMNMbq6n7
	MPaGFgtareFnszYG3CpdNVzVN3onsldKRglAQkeG9cId7n8+yVO8FfCje8Sv67sUIlx/jnFuuF0
	3JOzO3iiH2y3J90oCjTVbpVviq4UhM2bvUhnn+9wVUg4GUYacp5zc/X8KK6Nh18mDQS2J9Gs=
X-Received: by 2002:a17:90b:3942:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38e4b5d99a6mr7038779a91.38.1784379774490;
        Sat, 18 Jul 2026 06:02:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4aff383dsm2766845a91.8.2026.07.18.06.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:02:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: chips-media: wave5: Handle decoder runtime resume failures
Date: Sat, 18 Jul 2026 21:00:35 +0800
Message-ID: <20260718130037.3306626-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series checks the return value from every
pm_runtime_resume_and_get() call in wave5-vpu-dec.c.

The first patch fixes the capture-buffer queue path introduced by
cbb9c0d50e47. The second patch fixes the start-streaming,
stop-streaming and device-run paths introduced by 2092b3833487.

On a runtime resume failure, the decoder must not continue accessing VPU
registers. Since pm_runtime_resume_and_get() does not retain a runtime PM
usage reference on failure, these paths must also avoid calling an
unmatched pm_runtime_put_autosuspend().

Each callback now handles the failure according to its interface by
returning or completing queued buffers, cleaning up the stop-streaming
path without touching hardware, or finishing the current mem2mem job.

v2:
  - Check all four pm_runtime_resume_and_get() call sites in
    wave5-vpu-dec.c, as suggested by Nicolas.
  - Split the changes into two patches according to the commits that
    introduced the affected calls.
  - Add callback-specific cleanup for runtime resume failures.

Guangshuo Li (2):
media: chips-media: wave5: Check decoder qbuf runtime resume
media: chips-media: wave5: Check decoder runtime resume errors

.../chips-media/wave5/wave5-vpu-dec.c         | 44 +++++++++++++++++--
1 file changed, 40 insertions(+), 4 deletions(-)

--
2.43.0
