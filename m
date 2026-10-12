Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07504908D1
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815738; cv=none; b=W6r80qXBQyIButVSY/Fu9hefVjyrrzSPFK2hHO+fSK0xELNFiMFBrni0vMdhP04/b/X0l2ArUbLNBb1xoJ8pR0R8qJka7oUBvg/Ogj1qpT8Kr+jUxKcdromIyzBpKvydPtlTwbzmgxTSnJfkGuIegex8YGXaJ1pSHRw5xniUDXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815738; c=relaxed/simple;
	bh=pEjrpwMljWshFQvCBQ2MWFInTxBXJHuVzR4O0M9J5vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzCTaHoGANCgIWZx0TIBLUqGZwM6DEmQYbW/ZsISXkl4bvu7gQr8tNsRcuO3HkrYZkrEEc7H8dJNGjOOAn2R29qnLy07Y4XUJHB42Yc5jfimGWK3eKbByp/bwGtk6gsXI3KQS1d7qFuk1EB1CkxdNSqswRBI09vMaERkkXFWPWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vz8aKkKZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vz8aKkKZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48af27fe287so1700202f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815734; x=1792420534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHdXvGpVSfSzHWfexlYOc5k2ZW4zeZDNZII3r1hS0E8=;
        b=Vz8aKkKZe+F+eGrhHuo6JLMq6D/TpE6KMpg7HYT8oxsdsiDOH+8gea60XZR0wU+Cbw
         M5H3lrGS+2afemJwyw4pk5BveZWUrB0x4wtNh01hZocj7Orlp0F4CZdjBn/tmPoHRhI4
         32/1bwMJyNOXNOCSYL62vgFtRa3fVPqnyGF5JcQNBm5F2TxmpcL46vkpUw75hK/DJiff
         RW0R4717h3ZZZUDMQh3rSOYorrunZ0KyBkN4e5sg98Dk8B8uqqTg6B5K4JEF50WN+s4g
         Iu7+7DLoq6lEdEkY2ZfUE6KNpXGmDL+15WA3vAvDd7UoNYG7DCDB6xx4MzOhu+/wukS2
         y3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815734; x=1792420534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHdXvGpVSfSzHWfexlYOc5k2ZW4zeZDNZII3r1hS0E8=;
        b=NLJIHgZNmgQrn2oQBmNTQF7aJ5veDgdG5D4FRKJF0q4Ht6mBQrYcWfL43+uR/O19xN
         5EQaeQ4KcANLhITgOLneJA25iJ+LECN2D8TBdEheoiz6L1xLKnjRxKcOBoOobRFnR4dw
         A5WkA0jByIANa/at8VomNl/nlJoAvypJ1ypOLEgoerwAM8u2O5IMsv4/55uAKZO+zC1m
         eF+HsxnlxEV4sLzLm0yVB6Qd+chGCtwRvqf8WMYSTTXYt4sW2SJZ9IydUrsRUdyPj9Zu
         j4dKHxMlVH6tf3SRuyoAN6xVKkSSIaSGGl67J8ZOrdWZmx8LRTRmVAOcd8w+scprCBYK
         PVFA==
X-Forwarded-Encrypted: i=1; AKwUvBwf+l/MAZCLr4q5ENHa52RbCQBTTis/tfHmD6bRRlUGhw33i79sNSkWWoDP+2PN6KMf5ju1WLr63ctyVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLw/CNqdYmhAvP5dJDiq7CePfIQuyEsOvfT9F6UEsVwgeVPv04X
	q02S0NWRVVm+sy8XiMPcCeF9R6DxuRiD9dsmgtZ5zduWeNc3hyxQY16B
X-Gm-Gg: AYBFou1gxdQl66wlrFVe1RA8RF1h1FEUJA7ulSpuoW1Vfou2NlRC+c/JOCuVuI/tEKF
	CHnwo+BhzzKW8bEvY/ya7aX2TOvqPDOnu7pLDf3tHg3KKXJbUgg8M/CxxXq6GXLLNJ2AWiDswAH
	FUAS04V+R9ZYr7gYdmUb4OKh2FsFmIkip5NNXzzdxARt6Zzl7ozJCrOT03RVLrLQ/fgNqj2qbss
	KmFG3f8hZs+G7YwJkkhA56jTa3UIRKMeCxlwHfNeO//2kr892pF7/oUQxt6VjrnNazDXMafrsuH
	LOZYHvuBMs8xd0+cLQARHZMpQAinbkHKfn3+e6RWwtddqOxufhmTl2SG2dSALz8RTeg2vghPHbw
	H1GrpJlRybkEbvbhvd1NSSOGxFLdBQyd9FYmt3ns5joi1iIFEXz0d3XX4XOJ5eHwziLOS1hNnH3
	fu8JQt+ur8JNrX83/PcXjcQfJkuRyKn0oaKIv6C94EGlF/zxx/B+BNzFuHYwcywVGpwRSxl9Xfx
	su9g+3ldUskVcLYhMRjX606dwBtAakXgkkJrShIpisOsLKWEo0uGPYX2zzCEZxcNwQ/8KS8ba49
	juWTwKUcNjIJif8NzHFnpBhDd6N1XUi0Q38nf7kkDwafhUWUMPqXCjmd/AR6V1fmgvxL7Ddo8A0
	HdW1Tq7Ms30em0xJcXmvZnauU4UaAyYc6UQmFaexll3ojwSA8KgmaIA==
X-Received: by 2002:a5d:6385:0:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-48dba9e62a2mr13975042f8f.21.1791815733842;
        Mon, 12 Oct 2026 07:35:33 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20899559f8f.9.2026.10.12.07.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:35:32 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] media: ipu-bridge: Add GalaxyCore GC5035 and GC8034
Date: Mon, 12 Oct 2026 16:34:39 +0200
Message-ID: <20261012143443.34897-4-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012143443.34897-1-nicfio@gmail.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261012143443.34897-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the GC5035 and GC8034 ACPI HIDs, with the link frequencies the two
sensors use with a 19.2 MHz external clock. Both are found on the CHUWI
Hi10 X1.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Assisted-by: claude-opus-5-5
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..851096d7d 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -59,6 +59,10 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 };
 
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
+	/* GalaxyCore GC5035 */
+	IPU_SENSOR_CONFIG("GCTI5035", 1, 422400000),
+	/* GalaxyCore GC8034 */
+	IPU_SENSOR_CONFIG("GCTI8034", 1, 268800000),
 	/* Himax HM1092 */
 	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
 	/* Himax HM11B1 */
-- 
2.47.3

