Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96C21C01
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 00:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952187; cv=none; b=ZSvaVJD32WCWb/vkICj51CynJ7b5ifQPHSSeWtJYS5ooS8R2j63ar8IPXjm4u4Tuo/fOqy02i5KWBm1mtmx/T6GpyWp2uybfXspD5HDF7U0/JwsSu0RbnDKvcxjWLr6k8UiYcRf5B3x+H3eq3fgNhNnxDeEO124Ao9UBQd4BySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952187; c=relaxed/simple;
	bh=H//2RBqD3WBB5ha0Q2X9zhRNzK+9XRRvdFwiR+MPoFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RcPFQiZ8ZKHI6JzeTupNPQhCC54/qEWFAxOcIHFOlbEHivg+rm8+0Pf2y7Y9uGX7dZBtB6fjQWlA0wpr2csfYVmLgNWorabmklw0/I8uDM2/t69JvfZfhHdAJ6oYHRppyqP6smZ1zyb/00+BhZ6cCbFVfBZu9Kq+jhuK6pVu6Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAIxmTuF; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAIxmTuF"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b6b0500e06so5714113eec.1
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 17:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775952185; x=1776556985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVmZj6L7AHZTeBNmui9Ed1IC2BesOOnfHMRwlcLz8TM=;
        b=PAIxmTuFhFovZqWyK4pwam5bi/tjpjA3b6n66d2cCOTxN1jw6gjNzMJ/m03z5YwdG4
         GZYQov4+XkReqbqzb96T8Zn7w6VYeZIk3eAlrkyxOosN4Pweto8696mUpkaXkfkbiaRu
         9RHIdfVLV9qXGFYnPNZNwnMIZkZOoivUfNJSCjcZIaVyKbvsNn0K664B9phFTbiEtxjQ
         0rDElFuHa77fpH9ETCFwcXG7zebP1n5pKeDnz+IwiWkbAbyKGWq9XF+bTmZp13pBGPj7
         P68ma6w8pZ66PZw6M5Jtk+fxRXNVw2WTSMrzWZW5bixRyPlQxO9qzE81SIDIhMabF2KH
         ilxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952185; x=1776556985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVmZj6L7AHZTeBNmui9Ed1IC2BesOOnfHMRwlcLz8TM=;
        b=a1LsW0pFJJqgCV0WobMYwsOHiSk0ChERF//DFuaOsxzm/0qt3MRbzb+2dMqsTkBdQm
         QyiKteHjRrQ0a3sgLUWt7UOiPivxSz3lfuYqi9T7zgK96XndVgiwUScwRp+ay+8zcwjc
         HaCViUELXZxADpRYbMU+1wnNnwOlpAKLIxA4CrulItX/Del4GcRBB6gbiijvovPoeuBT
         DslNdHEGmHXUeFhVXkfP9DZY4v06UijTqE9hJF9NLDMaJyKwDETbbgZ96gyXFQ0BQjs4
         KmsS1g1NAXuIsgVsGgUnkcM8V8UNJ8uhaSwaecyAXXcHETQ2OH1Z3R/nTcqM965VZ8Tg
         nzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDIvMmkqfppRQ07iCiT/f94W2NyxdrZkGa+gd665GBsnAL5P0Zzh8b2Kj5kvmGodwnV7ycXCkfvot7Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaNN2+hIQBUNFowOBPoDWDYVWeJgg6WFSWY5zslkX5MHjGbbhl
	jmvG2FY6nPA/Fb7PLBF1UgSmjCREZYXzD5T092gwuQax/jbeSreK42FAhVTxSgnYMwg=
X-Gm-Gg: AeBDiesBmbOssdiI+dKuDAmbfMVpGhSqucGXDbETa8c78tNF8m6hElhTPqpVymwR180
	U/A5yf7P2tXgGdpNazqoIkPMpsp92Brdx7zzkTwqN4aEuLtj0qxlp0G60D40lWtsAGlaTGfSoNj
	xY7VKeLNnxIuoZO68IALbAdaF112dkqOoqZ5WqSKlOmsInizrjVkPtjzf4y6pj5L/rEkFWIPzie
	4ImWJLO0xtwCUaKRJ46O8UlFqumOst+VD5VfSOWMbX2NDRrV6zEiYv896Q2R5XwBxm5LxaJnTUt
	PK/nmIKMo9ll5B+nH72uz7JEmVctXjV4JXuy4PAeryvzhQqUU0c9vdLgFY+nzjEi3Hcot6Ln3rW
	pyuNG/L+doXnrKznJnuCASQdulrB+Yw42P0bBXMZ8OLpaqN3a0G5YVRmfQUOhrGtTGuT11Z1s9F
	HguKY8DqXzG2tBDC4P2Fa6NG4xKJ59m5Cevra9Xl5+gBIOrF/VZ17hpNQ=
X-Received: by 2002:a05:7022:23a8:b0:119:e56c:18b3 with SMTP id a92af1059eb24-12c34eeb7b9mr4215099c88.27.1775952184827;
        Sat, 11 Apr 2026 17:03:04 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459f7ffsm8609844c88.3.2026.04.11.17.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:03:04 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Sun, 12 Apr 2026 00:02:45 +0000
Message-Id: <20260412000245.26696-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL
to signal an out-of-bounds index. This results in a large unsigned
value being returned, which may be interpreted as a valid fourcc.

Return 0 instead to indicate an invalid format.

Callers assign the return value directly to pixelformat, so returning
an error code encoded in u32 is unsafe.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c0b38585d63..966792a6ec19 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -81,7 +81,7 @@ static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
 	if (index >= vi->soc->nformats)
-		return -EINVAL;
+		return 0;
 
 	return vi->soc->video_formats[index].fourcc;
 }
-- 
2.34.1

