Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9344E34BA42
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005073; cv=none; b=TVRvlu46E5d+ogcAEiDVbDokZuEJmHtc/qBQyaPXjShxFlcPlpDnrTrzANn/Pi5c5kjyFi/WYQTPi2tq8fjNiJACSvPudSHRX/+moYn77AW8/yfe0oIhWR8gB6Gu2JDtOrGwiSMzgwct9hf16iwU4WXE7hbhqaktjjRAbCEQ7Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005073; c=relaxed/simple;
	bh=ANKCTnU58OUlAOUIJqwRrknbTWPLfqPCX+uSvNWICrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JrNdpCP1aXtjg+RjE0r0YQTVYSGIfrrZ/1Gd+mBzCQSCQZNF2EqEIMlNIEg/QPI+E0TCJyknFz6dykuV1ZBwtm4CghXAWFartro0JIe6aQ8nLBwcPnaRSOUzedywlRnWvNc3a4zLgBmfrvweZzgPnkcXVNqQyrAEY2Y4M1cIOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/gs9wyE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/gs9wyE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso45969375e9.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005071; x=1781609871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C06fqdDmC9XoMbgwTie0uFIDoyxOFPYJ9w0RtZztqRM=;
        b=K/gs9wyEqHWmzT3yfp8+yE7/cL2T+/Kpk1fn/jSyefWQgSF80lYKB29N5s9RMx2hXe
         72atqlm2UTs6XaQ1/u53j6R0n4Gca2/nzQ8TVdOriJQq67jvijiLDsfoA50Fs/ReS+Av
         ZuMn5Rey4I+v0XZ90uPqIWjU6em2x3ZT5K+7Qo9+B3O7XziqW88L8bu1A22McdD/zHjP
         4nWRtyFYQRztGescDMC+TjNTMKAv7nKeG4UnK2B1KGp7L43ZLww0yw9wVKACn7B5R6oB
         93RDLcP3r9zh8h0r+35Egv88Isc7FkqW1u6GgPRTkl/RWEOlSsaecJUN27tfpYwYskWj
         1yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005071; x=1781609871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C06fqdDmC9XoMbgwTie0uFIDoyxOFPYJ9w0RtZztqRM=;
        b=LsEhCVLXI8OISYfMEIY9gE6i0SHHw3aZvdW8tQO6xmhpwCvmnZoNAoIZHQcbyP4shv
         FV+H3UhyVQ5i10ya2DmjbPJUBPQ++jxAHW2zv2R/ApU7USJLOCpawaw2zktv+07yWSM8
         j+p6b8gVu3mIIwOhHFiMHoOwHzeoOclFzWLXSwxHBjKeL3Ch4wr2tVXaJlUG58xVIpuF
         hWJt/T9QDyNoGm7ug9cUxCJqcsig2Q/LGWGwdaftv5iHbgsi/ustPzOoYcXWAryOqw+4
         p2C3xE4sHc/wZLZ9j+D7zY4vm9vbXCUYMKRNQP/rWe3HJT/EzZ79dgW3myGXOu54DJYK
         +aUA==
X-Forwarded-Encrypted: i=1; AFNElJ8/RdxTLdQi5fQfQBXWtsxGJTxbYG3r9fDz4EYKfb1guJsW6eiAz26I7isCsxl219d0Mlr2edVnehJ7aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/PGPXBQs8s6cvfPR5kX6kS685DoC3ETublCLdooy71IJNGHAL
	AUltFbvS206r9JB2KwnStP1YfFU8XQbokOBhbgE7LPr9kKuDdt4qf/M2
X-Gm-Gg: Acq92OHQKHJrPgFzx80kUGTqGAo670qRDKoaohiaCKb5wgnml4m7RCsG69+1E1zna69
	yQd7ACHxd/1/j2iQEY3PvQ0ualpQKK1yuqj03Ktbhix5lCIKMcWL4eSvsFHpK3p50I2rwZQ8Ttw
	LYpmZObt51k6a9n+wTkEL1oRMYHtuMkyHbqQifB1copOeCJKVzm7+tmbezXg39BEL20hvxejxVf
	UQMOA+CUOKbn7q48sheGCb96PKZjS90o/jgz10QL2Hi6DMsCWh5LgvHBcgdGusgP7N87T7S/AuO
	jFCn0VQha3D+M8hMY637RfInVKlFPtS2qpNmx2ygmh5y+O+ZDKJ9wfHO3tN0SOo1nLQ96hAgEru
	LFRgzbrNOCsB8l05MdBVsZqe/e8nqh3NR1/OmCQzBIq7/1cP4N45ABZO1klFKZcPS9fbMcLqhrN
	dLXzbf/7l14I573MrjmSmailP/tr33BL6E0NYQmGmmuYAHzW2ImqP7/bwGcqVwWsQWQnIUpCM98
	aKyrcvtTsy4+dT3yIyItA==
X-Received: by 2002:a05:600c:1c1f:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-490c2598382mr318719865e9.6.1781005070590;
        Tue, 09 Jun 2026 04:37:50 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm486014105e9.7.2026.06.09.04.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:37:49 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: Fix clock leak on reset deassert failure
Date: Tue,  9 Jun 2026 12:37:47 +0100
Message-ID: <20260609113747.39592-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__mali_c55_power_on() enables the clocks before deasserting the resets,
but bails out on a deassert failure without disabling them again. Both
callers treat a failed power-on as already cleaned up, so the clocks are
left enabled.

Disable them on the error path.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index ee4a42674..fb81141d1 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -699,6 +699,8 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 					  mali_c55->resets);
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to deassert resets\n");
+		clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
+					   mali_c55->clks);
 		return ret;
 	}
 
-- 
2.53.0

