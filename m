Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE53F99D2;
	Fri, 27 Mar 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633950; cv=none; b=jMyiON+192gj7Pcbq2TwSeDBzy/9FM3iuWbgTarNm4j91DwtpEZbc+9oFlx7feNQpESlGdiiaYvCSFxxujlMaPAG4PQyrgG7YSBTgXk8TNjy4XnwRzasFrEqEKRwEZStBjJRG5PaAPC8aHJiDgw1YRuTU60B3pYt1ImCm+dZyfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633950; c=relaxed/simple;
	bh=GeHqD5usU+0hZXvl9wngME4FNxLxqfWg1pElecamRF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nwxEPLntC+RDOWnTGx+ufJa2mMcxVT73FWWEwqnrHA8lDYOabGE/u/K3ITNcNwc05D6O4eZj6/kh92+2TyS96oQkfAQyZb4fVbw+KOOH2w4YXaYPifk7inVRS6VS0NqrIYAvfiveEbEaxFR35bEWFTUozbYrvLPNtTFEMyRiRGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=tYHJBTKF; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="tYHJBTKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1774633940;
	bh=GeHqD5usU+0hZXvl9wngME4FNxLxqfWg1pElecamRF4=;
	h=From:To:Cc:Subject:Date:From;
	b=tYHJBTKFpnGsGMMnUpMrsALE+oh6+Mw4PVeb0501fCSRwngOwk8CQKTZ72s8ZSQ5+
	 p91dzztkBigPMMg21Q+uo6ywKbe1TcNE+JHT51sLvRMnvbqq5+8nkQnExFS9An9ioe
	 t6oEf7c/jxnF/rWacyEMBiE/zncsbYdPxDdZHVJ0=
From: Paul Cercueil <paul@crapouillou.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] media: v4l2-common: Always register clock with device-specific name
Date: Fri, 27 Mar 2026 18:52:12 +0100
Message-ID: <20260327175212.443987-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we need to register a dummy fixed-frequency clock, always register it
using a device-specific name.

This supports the use case where a system has two of the same sensor,
meaning two instances of the same driver, which previously both tried
(and failed) to create a clock with the same name.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/media/v4l2-core/v4l2-common.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113..5f3295c3122a 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -792,14 +792,11 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 	if (ret)
 		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
 
-	if (!id) {
-		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
-		if (!clk_id)
-			return ERR_PTR(-ENOMEM);
-		id = clk_id;
-	}
+	clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
+	if (!clk_id)
+		return ERR_PTR(-ENOMEM);
 
-	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
+	clk_hw = devm_clk_hw_register_fixed_rate(dev, clk_id, NULL, 0, rate);
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
 
-- 
2.53.0

