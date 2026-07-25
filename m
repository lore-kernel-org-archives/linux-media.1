Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B95282F03;
	Sat, 25 Jul 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784981162; cv=none; b=JFivAe2SPQo2cPfIVeehOYvyu/E0ugAWwV+Pt2jrJn9x/7ypPt+VD90woo+yhgy4iyb96zScwZJCWTCW7xGHs/Cu/fn4andpGQznuSJFXgh/YHbHsGdWXtHN34B6oCxAG9Vnq7Tr47lswKU4c4HIqwBfpPEYXXso0vijJPqQRHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784981162; c=relaxed/simple;
	bh=1wQq1JuNEPD2ZBIgnBZLg+dAsJhDbpcrZtHJnhO4584=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nVax+tPNTj2XRXkSKtJ7Hfi74PlXvSp1O/LNAukfbi6NNJ+8BbvyBzq35myYO7uM98G3lDJM4FkiNvkU3WeV9rGT44m6znEH2aay4Fie986rZ/zf4Jy5Ci7hVfUj0aneKzq5HWGXue0e4KNM3nLQdcn1pRx7S4eL/UE30jYmIbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=i3DhQW+w; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="i3DhQW+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784981158; bh=1wQq1JuNEPD2ZBIgnBZLg+dAsJhDbpcrZtHJnhO4584=;
	h=From:To:Cc:Subject:Date:From;
	b=i3DhQW+wo3HarinXQwJDY1Yg35b4MzU1USGa8JjLuI5t5ApEmv5ouJrD3VteTSKRl
	 P0WX5np/BQTN5LRBMnu6KGtYUh7i9Ae0oN/4MN6sIVenZLU3Y7ii8C9B31/BY1lA0X
	 KBYu94Jm8K/N5+ZnWYTm6daBAtTW+G9DbsJAbSaU=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: ov5648: Fix order of a call to pm_runtime_set_suspended
Date: Sat, 25 Jul 2026 14:05:52 +0200
Message-ID: <20260725120556.2262456-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

It should be done when RPM is disabled.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 drivers/media/i2c/ov5648.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index f0b839cd65f1..0643440a6f5d 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2566,8 +2566,8 @@ static int ov5648_probe(struct i2c_client *client)
 
 	/* Runtime PM */
 
-	pm_runtime_enable(sensor->dev);
 	pm_runtime_set_suspended(sensor->dev);
+	pm_runtime_enable(sensor->dev);
 
 	/* V4L2 subdev register */
 
-- 
2.54.0

