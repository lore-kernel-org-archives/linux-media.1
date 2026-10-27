Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112806;
	b=kM2js5wNCne6OZb0jei4d8BU+wqf9mXg7I03rIwifOTt4VbvtbpnsbaeDPjQ3e+cLvMI
	 XU8FMy32IokDYOI+9UOAWqvFhWkYF6iAj7WBxcIUiNkkg2A1lbdTn1HU1B3XxhfDadP1x
	 0TytjUzYV8jsGZaxrA2YWA90OQwwIxirpOqEOhMcnmu0ooBhaowWMBJGeZBfuHkafFShE
	 ut6K765r7t5OK6kozP1HC2EelK+Rqq+eQiHndZUd2qVNfihyoXsY3cwzGkwK391/8cM75
	 dGDr/ftTvImVjbXreMFFuSpdBlL583FkfNgUdO0Jp6iYMDIbtlDCOYpD2+1xZFvS3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
	b=j3Jvtiw3/Gfr/C+AnF2g2LIEYXoHnuUqAE35y9XoA8YqlM3FaELMGf8Akr5mgt8pYXhu
	 wtFv7eesHFhvQzkH9uyT4YOd1Wy3NGy5oQCTyO25QXF7VR0rPWQesrC+gsXd/v2nvQahX
	 P4DAAYF/MqjT6R8dHQ1Kg0SxRXm203YrDosRtDVZNo9yBp5Klo8+l+S5ipF8t319tmNUG
	 OSFeRE5RnLnayiIzgvQmIVVzhto2Z+YRmk60gAJX0fkQnQDlep+NcRPYkomdpVhdh6p9O
	 LCRuI2HMxPsokdpxKhHt2NNV1KXFmzrlLNxPMe4xXhx5IE7ByBHyeIbHkbSW35ajZ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PL0uNvOF;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43572606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 14:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43572606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PL0uNvOF
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc502d509c0so4542a12.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112804; x=1793717604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
        b=PL0uNvOF6KtmytVx/LyM6gB7gFM05V7MDTXiIU/jNVGVrb8h0a4YBmqrVAgfzJYkM/
         XIIlEJw0YrfmwpzCxmxqRPuPBrSO/A+mN3FRztpVogzN5DyzY3Sq8CWDatzUvbLI2rzi
         PEoaPyAY2SHhTTr0iu4XDHOxPytwusNn66/D7hbTLGkaFvARqeP3wSVvxPrg+czWBFbi
         RvThogGY40pn9hSgBkEgfoaZM+UFVgqyOpQbxAV+BfMI+qMCM7/3D1R4tD+tval28tEb
         ebUXb/xw8hrtyeGU568eNfHW+R/Qs73nxMAMBtE4IOYI4JVt4Tzz/h41aFppjGK698YZ
         ta7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112804; x=1793717604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
        b=eKuVNUBvd1aEmP+7CESPAAcd54GH1bs04re5U0MS34gtB0NEd7eQG+0P5dnGZRS0OF
         Ph+skl/Hf7/xIYHOAWzwQuJN2vsXoItaFtbcrAfObuS32uSrBqKyseAe934EJJrye29T
         cXpZQl7vJ+jm//dFIVA17UXyxEtbGRWDwo55+5sqVzIKWqZ1GU+TZAHnUB5FYMnH4pBY
         qgJAyddVdSDhOEut1LiJDlp710Cf52u3WqnOJffimyWVvf5inpPF/C4p5Ks+YoGastQf
         Y0c4XYm2YSJJ4slMcyIHCpAcOsxB9w/7Ch3wvVHcKMqQJYBm2kmLteRcISJLfyIpCN4E
         syIQ==
X-Forwarded-Encrypted: i=1; AKwUvByHFnnAJnXCmFxIacQFqOG7lqfvwv4/p8gUAf163P03EBKZM5Bb/0KF4DTYGA6VCXbDBF4vwjiy/Dy57Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdS8MZEfuPvrMesx24Fc6Ra4I9zD6oONq92154UObcY/aWZYaP
	l5pAix8A8Cq8WLizh40YT0mpt6Iblaz7nYuVjIL5A5+9EzNtrkrtgh9ODJcn5Q==
X-Gm-Gg: AYBFou1Y3xZziipBbmKCijG58Q5q1Qr2vodYZYR5NInbxJtMPdAjmd9dRqLOJ5VQggc
	/255Qf+pVD76kataCeXlJ16rC0ymc2clf01u9Rqhw6oa/FNjJQJvrB6cKsldluti9lSm3kdZMmp
	PKMijOa1yHekMFc90+ZiI8Hni4S/WjQuAXlSDpT+zGWjWHmMPwp1wkF8RYw7gv90xKOJpn+2dQs
	FfGlXvKjoinJmBbRjjfnse7YnsWxGwfsLYiNFvB5f6ArPRRkB+ZAmrBMpFpdeuYtSIkshT/JrCp
	OFtmFuVWwZ8uhuT1yU65xj41uWif/kUbHJN3V/qdpcygIhf3w1mDnurGZjgtDBQVEtL6CnYiLBe
	04KwNzN6AOUJPeaYe0dD2BvPzklykOX9AjeIeguQxACyPcfSr8Mf15yLbk/JT2XQgA4vBfHoiZl
	kLQ6RLtgmN3e2Ucme0GNASwx3NNulUyc9X33Kr3uRcLQnnABkiBVdTyyY7E9+jRrA1jP7APb2P2
	QAwNvDquLxABKf/3NecZDUEPacmF+N5uN0eQM6nbtgRcOqeHMXEvA==
X-Received: by 2002:a17:90a:b896:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3adead4dce8mr5470253a91.46.1793112804486;
        Tue, 27 Oct 2026 07:53:24 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm4093349a91.3.2026.10.27.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:53:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: exynos4-is: fix DMA memory double free
Date: Tue, 27 Oct 2026 22:53:13 +0800
Message-ID: <20261027145313.136305-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
DMA address does not satisfy the firmware alignment requirement,
but leaves is->memory.vaddr non-NULL.

Because firmware loading is asynchronous, this error path may run
after probe has returned successfully. A later remove can then
attempt to free the same DMA allocation again.

Set is->memory.vaddr to NULL after freeing the buffer so the
existing NULL check in fimc_is_free_cpu_memory() skips the
already-freed allocation.

This issue was found by our static analysis tool under development.

Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index b7d9bfedd590..9fdc352abfe4 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -346,6 +346,7 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
 			(u32)is->memory.addr);
 		dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
 				  is->memory.addr);
+		is->memory.vaddr = NULL;
 		return -EIO;
 	}
 
-- 
2.43.0

