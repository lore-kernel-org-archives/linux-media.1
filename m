Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164C3845D5
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802401; cv=none; b=ZWR0XMGa4wQ9LYsXV3sJP46E9e2iPb9C7EJW+vbmTzJ3oKl0Hj2eLM66n+hLK801/kFpXsQpq+eZLoc2ZsiEYvzmzATM3CN36pEPxTbJIdFv89cPZpfEOG916s0xK6N00swUvvllnww6YJT9aURu0+vL9aMBzgEpESP9Vu1Hygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802401; c=relaxed/simple;
	bh=WBdR+Pa9MECsVH2zWYA4pufWwidowE/sGBM4Qspyv6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4+83JmZDM2MYhmTu9n4gKyFEb8PaLaKopz3ftea+Mpvl5EXkFf39CmenL6NqMGQqBqhHiCJXfJ+Eu7Z7drOUSgIvuO1k0l9kz64gUYNEmlc9Lv2Tur+YHV3cvaFsJo5ekxXFb0rtgWk95YxffOCnC+X+qj9W9lROjmZTu0J6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI4wkkc9; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI4wkkc9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a5aad413so2781338a91.3
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788802399; x=1789407199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHpQ550r1xJVd5hJxlbP/ggPyAbrP04jIcC0YlMdAkE=;
        b=OI4wkkc9LuVD+9DrgRdmAtVXdHQVFWVqsse8Ujbf6hcia+/sEbzsfJ6PgZLk9riU/7
         6FzNtWgFBJCHHTownuGi8reEOKrQdx0u+om3mguaADdlDnTkrkEU483ySTOWpzlmsKou
         1ZV5rtO5U/ZpQX+qyIiPgEsDBQCCsGpG7OUNR+9lxWKWyMsSi7h/dB8XrjNqszD+JrH6
         gn3FuDYWlIloCpACgHdu7eJZsfkZhPaVYF7pX5EytUKzjxWo9MZoz7gncN/NxGPX4ltm
         6eB8XkYMopcg1qkP61oTwbrXA5PySSqHdvxwinzMR++dbvuNO2DybEvU32hXas3SQ198
         XwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788802399; x=1789407199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHpQ550r1xJVd5hJxlbP/ggPyAbrP04jIcC0YlMdAkE=;
        b=r0PwkFUPWsm+svZngEfzsY29SkzXZF72wZEgR+AAqa/8CXWi+VNNd/98tQQplpNm8K
         g2v7D7o9TrKm9RWVAhmovdEe4Drb8VHTAi8wezNJeW05Jzfax5mf93u0VoMMHNujcuiw
         fQKt8wETszZGosXEldmSYm/W9yKhPdozQbXhkZWeSSM8VUjX/exFfh1Bqe0gkNkcAKwG
         Xs66sZQKF6jk6cFI5zla1ons6sIjve0bccuJDGbK8pg8eI7fBeO3kk90GopMhFVRaKnv
         dseCY6GO5b5krJA8IhtY0scWRxoxRCIRG8WMZ0REbA1Jsxu0GGa4VsESwMqGwOqRGUOj
         Vthw==
X-Forwarded-Encrypted: i=1; AKwUvBy4eHw3CIqpiSe3qQ7PA3BFVWN2qZagUSceTTf9jrbI1vsaVriYxgtMeL4PRtcEwdzZsmpDFAb0HwTv2A==@vger.kernel.org
X-Gm-Message-State: AFuF++kbQN82kb28vq0rhp29l4vFZ/JNFjMXye3N5GKNABRukKAgSc6e
	gFdstD5dbCcUKfhyVjwgYGH5he1viZJYIJcq8KvCE94sy3h4ZWtOwv34
X-Gm-Gg: AYBFou1pjygR2rjilDiS4BMLq5Nb6IomOIcQcipa4FZ4CTjzLwuuXqTxYTEqnz0kxJi
	ErNTbdaZ3OKPt0QTQozfFA01Yvni/4Q4zBpdYIS7wVL3Tx0QDoIzU9sAMWKDYGn6M8QRGII7ZIq
	xggj9r584HeVjdqyTMl34biXL9wHjsf8gOtT2o8vm/mD9u4LY3jGNbLcXH4IHO6ACTdrb0UWadS
	5lS91qnRfuO8IojhQPxm+wu7Ec54JcWp88nZ2n/ZTYo15hISLi+ZzRH6/uyVc8tq6xEV6KQNeBl
	fvRUxBmAsvOAwuiIUjqNu70tvyk6DjmbQsFIgxnRBlTLK0OncOqAXZtrOL77kwyZ8y7+ArPYwBw
	vscVJ9aNOf8Coe8A+VSbPHGmqVRqOaHn7iXaVDxKO9IQqjIxvlELlLdngdG+xjsUPnsJHnJgnQ2
	K7U8McaZ9O586AvHaQhjL122GVCgWWBK8KP8j1VLr3Xxq5sn8mid27xZw6p7urCyRP
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39b25f78ab8mr34395694a91.0.1788802399187;
        Mon, 07 Sep 2026 10:33:19 -0700 (PDT)
Received: from G15-5520 ([103.246.195.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm33581587c88.15.2026.09.07.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:33:18 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org (open list:TEGRA VIDEO DRIVER),
	linux-tegra@vger.kernel.org (open list:TEGRA VIDEO DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] staging: media: tegra-video: use BIT() macro instead of bitwise shift
Date: Mon,  7 Sep 2026 17:33:02 +0000
Message-ID: <20260907173302.23053-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining instances of (1 << X) with BIT(X) to follow the
kernel coding style guidelines.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index eb1fc5b7e2cd..2586a137d9da 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,15 +177,15 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
+#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
 #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
 #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
 #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
-#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
 #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
 #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
 #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
@@ -214,7 +214,7 @@ enum tegra_vi_out {
 #define       CSI_A_PHY_CIL_DISABLE			0x2
 #define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
 #define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
-#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
+#define       CSI_B_PHY_CIL_ENABLE			BIT(16)
 #define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
 #define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
 #define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
-- 
2.53.0

