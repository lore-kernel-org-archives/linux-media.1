Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173DC456DE9
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 23:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206922; cv=none; b=ilfsUjhivOR4o9CTmSvVf/A0zDis/34wFh4tO8bqGQL9mrC+ALx0PdL5H/gmDWvUn6VraPSmnS5NKDOFePC8Tcmu9zhRYqWENmq4qpLWuY3fsm6IhOxdA9GBAsBssrvYX/Dmy+q6SoKBUOua2mx1nXBiJ1zaHjVKzwkhYSxwe0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206922; c=relaxed/simple;
	bh=jTYEu6ZtAgdC7ZQ9hXWoQvkVklAqgHKUxm3ZPmigkbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mcpMa50VHGWeaK3KywPC8M6W+PfoA2PcGQtTC1QWtWFS6RlqJkhsW7RWdofa1YoXeC4DbozaIuESbF2bTZvxWcwFTwPdIhP1zIaco+IESw886x7GAJWOMctPevLnW/KiNNLd8WeZo9P2YgDwER59qnQ+dwwIveUO1HytDOSYF9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TupQMrUY; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TupQMrUY"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f089b1e3so1317894c88.2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206919; x=1790811719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlIw0ZbHp60RrT00NlXN0W+bJLKDe7Nj/Yt5yJjNy0Y=;
        b=TupQMrUY1lVUKn6+fxYvS4oQJ4Eyiaz5vK0BL2GIxbdPaKieZb5EY5E174v7HDevVE
         TpRVPsY2aoOWtn4V4HFIQyclkSjz9Oy0r/ssAWUu7sknmQ6VxafK9InK/pgCoTmnAYGu
         7pnnoq0trl+xCqRzI7dcQ8l/EwrRO4vLEAm3YnrrI7xXdBeJaywVP43d/dtAToh8frhV
         loVhgk+MzpoKiE3jv4ZNn6aPpSh+nIbVRk4pCUTPVM7/7K69boqo3XJfsnKGjJGu2ueG
         aMPjQt0TZJJCOWIxNaUYtte3WQzGhsbASFL3bKEeqxyHOQ2LtnpsI/pJHs2ENXXTzW6M
         hIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206919; x=1790811719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlIw0ZbHp60RrT00NlXN0W+bJLKDe7Nj/Yt5yJjNy0Y=;
        b=m6WqYRXkCdyeMhE0TO9C7UC9JKMrJsdPSEnUccrpl9ZFPuDf76ijsyFlH2MHbmakf5
         sVSGtbEPfPtUq7RSv9yaXU+HMzLWFX1kTNGmbU2i3MfzVNjfxZ+CjGvPIKJClrdNNX3E
         SrkTpCKCKYRzM6uk3P8EERlB9W6JwTp2nWT2ts5nLxNa8A5D0CkN3pktDBHgDt/yFAzG
         FRZ4a4wtV+LoG7/taDlKMW/K1zSmfFvgs04kn21zZyXHLRPe2gebjkCUqYBQpVmomwRT
         Vc8sdlOwzyvM7JjcjfltMCLAcPGZTxX6oL6Gh0qN9VgYfICG+eLfvrSFtuxwW0IzDrdp
         xF0A==
X-Gm-Message-State: AFuF++leZ89OwvjEpRB+DfGS3Y4kRVLIFj4cEH1582J8/o2OAOffmYAi
	dr/wjCTGURuQ8dhn3RzTIwzHfT18I9wR2YwJmM79k3zqY1/nzmWA1+/AOeDO0SXW
X-Gm-Gg: AYBFou3TTTV3smMqKnoyCjiiGGCdMZjvMZw8TcZvdYoR8A9LSvoTzqgzllOjofs+5F1
	hR2W4+SBzwS3cCxDrtu6NYro8UUSVWSITbN06xi8606rnLsk+HjyyTwKDsx1r7Wjng5XILU9FgX
	vLl/eRn7UbTj+DE3Ezgxsh+hGdCC0j4PslaWZC8MPBTDan1HrIKKAeiX7yFtxpgsgVjB97/02+P
	VqfWGXDQg44tMkhxHaVIWfP/hU+rP+1kB7hafZJ/ks7Y5wMgsKbQ/9HVXNTf67osUKh0uQH2FSV
	+qSvK2Z448ugGwIulXU2Wlryx0Sgp+ptvGIu8nnHZXDFQqHkUiLPnoi+5Tap6+eXT02Jkaoa0+I
	ISkkJmZE1de+2pjLbbVY4B+uXmp+mvhIIV0Kt1pE30HbEripmLVJS4ltevXMFrbYi9gRdpAc+sX
	trEDEl2+UBZZyxtz58HIKeHe80jOAQkg39uumfGt95X1l//ajsosCd1Y/27sKa2fjmNvs2PrLTm
	4YQnpE5k4lHWPP8pa6+lxxmnc9pP29qY42f
X-Received: by 2002:a05:701b:418c:20b0:143:2982:1045 with SMTP id a92af1059eb24-14504adaed5mr276046c88.38.1790206919445;
        Wed, 23 Sep 2026 16:41:59 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:41:59 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 1/5] media: ov02c10: Drop duplicate register write
Date: Wed, 23 Sep 2026 20:40:56 -0300
Message-ID: <20260923234100.318151-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
The second write is redundant; drop it. No functional change.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---
 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index d622f5dca..730a40e94 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x395d, 0x05},
 	{0x395e, 0x02},
 	{0x395f, 0x00},
-	{0x395f, 0x00},
 	{0x3960, 0x00},
 	{0x3961, 0x00},
 	{0x3962, 0x00},
-- 
2.55.0

