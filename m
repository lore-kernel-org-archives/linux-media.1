Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E441B4315F
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782565294; cv=none; b=JjGEhM8/WmKF9EPRI/G3eB3Drmk9lSEkEl+lPbKfBDlY8RmstmDhcPNMt699i2ep8nWEqCWXiDVBsWD0oAtn1S6bmW+x6LjcmM9NtDH039x94gSWT+KmH6PhUsyq8PQyvN5xPPdQwhfnytyOytE2u5XuSSid7KdOWxYWiOlIL7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782565294; c=relaxed/simple;
	bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPIJuRgsUppqltlG/RhRv+3dP87GvyvuBb9mTFTMMVWtttBus8RaecNz+Gbu0G+zyH3s+hdZ7JGLUnuXtzFDBi5JV150yUxRhEWb+wxwkiEswa0B0Oy44usVw9hmck7YB0p4n1p+15CJkQKtEI58KWSS+dtDDWCgsPYThcanWFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=ARDvmS9f; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="ARDvmS9f"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49270f771c9so3860295e9.0
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782565291; x=1783170091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
        b=ARDvmS9fOls74fvV7aL14wvM9SYBpFBXDoypE664oahFwnWZ4LTbRAPIuLXro9JldL
         hhHngA0lEkpudngzz3Ttql0j9huf10PPOZs5iaiC9YkbS1x7HWe0HG+wJ601awnY3hl+
         yuT/Xtx04+jcmM8VBvAXVsvxQRtN/r2tlRt+DNvXmbW+bkQNL6yRn4FZp4Y81yVoUGOg
         qdCWSd9lUf5kUlbWqOTDzzNiUPaXQrbsYUZRwFZa4J5nTHfaO4Xq4bwwzmXq1x6z4gfW
         eQypt+GhBDcvK9LNzSMmSo+jzF33dW6ybgs140nTtuSOadsAiSvDq5IO6bdsmVLKkNjZ
         hNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565291; x=1783170091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
        b=flvUlTpgdZc/zojnACgCKGMmmT0TEDyMZ7dVBMGG3RmmyyAD7apAd3swnjfoQX4VV8
         rNwYoob029adntQa4NjfN9c3gX/riJsl77nzbss8ZkCegKYNign42qhRrneTbW4aB1gg
         j1dwQ8s3rvC4quNVOyMiwxIzy0189+pWAy0jcr3osnT7xfKkBRyBpHGHdZdJWGmZSrRA
         /qB0TlLp4SHaoiwDL19L8h6rIOkdCwC7Vi6Ijdp/aE0942xneYAVAYTQXUIMOiCSE3Ow
         fBhUYL9Drjp0If+7JoT8rjyuRG4jFakywJk13GSUNK69Z3l95UAnbr1tIkVrR6jNodU8
         8XAw==
X-Forwarded-Encrypted: i=1; AFNElJ/gaDtswv8R8cR5xDSkg+5sWYHQznJ1cyuGWIG6RQ2dBTOptY91cVAgtarsBXn5d93UN6OUOC4jCqGhww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIwCMB5F7RM2/LoYcxqpYy+w7Ut2ZapTAiork5nb3/d4SXmQMI
	DelexrIw+ReyDotvFBB8asMlWYpTghzIWHyoV6WSwzC/Yvg8wITJz3xPwtqY10kKXiTc
X-Gm-Gg: AfdE7cnTnl+/qdBNMRqaDy2u8JmqwrQnz4WxRtJFqFfXNxJnZY4JEAK0DAet537xR4n
	1SMt9pjNl2AWJrh3+r1z9ToB8L2oY2UE+uDk/7urOPuvSIiYV1R86PEk3uwtkwFTxDEmsGamlEc
	JqDY0kVzkHTrUT4EAPtEnvoDZKerRI+rKsh27w2Jt2D7HcRhSEbHTI0cMq+xn6R3Yw5BKlPpi2c
	6yKHkI+3gclQIecReQ2WT84CXz6MB/90UoBWZPfPknmpMfTRrPvR6xOTwv9aRJjiDa7eiF1Owji
	3pGtH3KlTZ19A2UV23NRlqAXtSZX1enT7NkvXUbHKM28CxS0s0CxE54LVh+18LgJHRf8rNMNjNL
	KuorkpqGJU1CYvi+5ioy+EcKN5y+qA1D/FM3cZmnglcYipefR2DqBU04haXDSkKvcqq0BRG7wCZ
	nu5vvL9OVDOQhjAAk+2r37NRBINofi7UtAYsqlNriehbKqH+6yd2GWN9WK6zG+NQC9KfTYPhx7y
	vaUUBZ5JWbg4wfjbzgcaE79b8XAqCT56Eg=
X-Received: by 2002:a05:600c:e555:10b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-4926685af4cmr112906525e9.11.1782565290833;
        Sat, 27 Jun 2026 06:01:30 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c00a34esm82809035e9.0.2026.06.27.06.01.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 06:01:29 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH 0/2] media: meson: vdec: fix two more VP9 reference-frame lifetime bugs
Date: Sat, 27 Jun 2026 15:01:26 +0200
Message-ID: <20260627130126.78749-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this series; both patches are wrong.

1/2 is mis-attributed: codec_vp9_flush_output() is the .drain handler and is
only followed by teardown (codec_vp9_stop), never a resume, so the "dangling
pointer on resume" path doesn't exist. The real stale-prev_frame deref is on
the source-change resume path, not flush.

2/2 fixes a real NULL deref but in the wrong place: the early return also skips
the current-frame MV-write register setup (HEVC_MPRED_MV_WR_START_ADDR /
HEVC_MPRED_MV_WPTR), leaving the hardware to DMA-write to a stale address.
Sashiko's review is correct. The right fix guards only the prev_frame reads
while keeping the cur_frame writes; I'll send that separately once tested.

The rm_noshow_frame() use-after-free ([PATCH v2] on the list) is independent
and unaffected.

Doruk
