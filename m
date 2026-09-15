Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A4390618
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458345; cv=none; b=pGSHxfrjJba8+ur92o3YuO6ighy0GNe/Bk0RULtys7nW17YL1h1ox1TBE3IZP3YbpO7F66wMDfypNSDWVqHXtDpX0yZtD2zvhI5JvYOSKlhYQ7g5kfORnX5HKvGlmUq24SwdKALW6HCxKRFox9+Fef17LBevM1Jsyu1TDSGnzJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458345; c=relaxed/simple;
	bh=0q5TYPEfU84TUtHIpVpq1q9mIMVjpkW5D5F84PgxMEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JIdbDFLI7Ulraq+OR+IbpIQ0/x9Ns9b4NoGwZCw390JvEuUz2SOrJ2AyJTVrrwBOJT7FWu1f12kfzt3oq4gmIw5UHr0RACkYkd1qytgJIhgcau2qm51RUPefxWvVFhJvwK89QkXB7K60DrNssT+t/HXftGlBf1grkijqJHYOXeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raA+ysyO; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raA+ysyO"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a3490bso2844393b3a.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458342; x=1790063142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l9ECc5+a41AFo2eBSy7WthuxX+hdHIx1RiULVK1OybM=;
        b=raA+ysyOwHeDc1rUo95GLLwd+Q0lmvXPXgPMeREeLP2DFOoDL/KMUwRt+AfPk7Z+W4
         +HB1W1PZGQRSpLZj5tWMlsLmumSnPEwgU/y7Nd/YDGIo4VOYgP/NUydL8fGjp5aVJM3S
         niNOk4R1h9pW75DKtpxE4GvHJu2QJsPdZT497t7xhhWWbT9mosFQVTPat0m4f2pmdP39
         vKILU6Oz6rurbBVmZ7OJ00ZSqXKvaGVY2YIncyAoWfoX3GvbLjPw9lZ/LxDYeC9pXSBd
         OefjGfRGqnAEeNUw2GqEUoyb3ge7Ccb7DUHdP+2QF7RdStNSWojTT/AYoIunskNbzkzo
         zcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458342; x=1790063142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9ECc5+a41AFo2eBSy7WthuxX+hdHIx1RiULVK1OybM=;
        b=DMR7gxpolJwYYhvLUh8ct+rNlH9T8OlMaowzMLUIDJT9er92k4oqVRFTLgZTIyGo9N
         mw5atx+ExrDDBFl2sH1WhdSoQhYtaucF/DovaYvZhUp0goxu8aRfb2WW5mK9Xg0SGlrG
         i8ucTR1L3YnnbGNIu6Z0M6zx0Q25pVN9pPU8odZRFzjnTxkUvEx0x7HItu27LCB7G1HS
         zKPX/GlRMcSIpTdcla8RxWYvGS8dam/ujajadB6w5ARr5sXUShLvcmUn/8D4Zx66O9u+
         czYZpyEtxAxCPgQAX3wLHpN4IhUB+TrplhD8yMgaTMlqtLYMOLPxNMgebWe7iU1ssXl2
         IK/A==
X-Forwarded-Encrypted: i=1; AKwUvBwSrQsBCZnBo1zXXTlCHd2mkuFPWfUaMZV4H1MowL6yKPXBiNZxOyiRXTebYSoF39W7nQNOxD+VlmmZsw==@vger.kernel.org
X-Gm-Message-State: AFuF++lggLFq5J6P4TWSbMAatd324aKZQDp5lOPF9aM9mt3kTVErTj6y
	MNPINVSO+dOYhckNR2PvYj79S9CNHagSZcg91ED4AZPhQHC+Z+BXPkko
X-Gm-Gg: AYBFou3QcMrB1PKsq3FYLolbQ2CqO1ew8lBZpUlpinOFZ09W2OBBUx0qaOMmqoo3Aop
	UoFD1JPM1Ij0SEpOAwvFxNAtw3ytTyJjo9trrQinnRH0x2IJCo0zqBYDlOOyFz/bbJ16NZ2aBSO
	sSLqBw2bvXjqiyGka+Qbd/OWwVPiJscSoudB25Npe90wzJoLVhOyCeJaEtvRRHWnIP1/JkSy6Nq
	8Se7rDcKVtUZC69LS6RJ46564lHcLkhm9NvBiMHE9Mx5xyjW+hgT+XeUMtH3gwHBKfG7jqTcciZ
	ZGWyHYl2Inwk+kcuB+T+/usu5dix0hhfgMCkTUxMAeiepVCkc1ek8P0spt7zOjzLFp6R8EkE0AJ
	T6xqfPEkYbWVvMUSkF1Oc/m7ZsuhFb39cCF/5jO3olZcg3VL+1AKiFbJHo1dtA7CZZLdIfHifVf
	LBFWN9ONeavHo4LZ29kbs12qq/GsAk1sDCgdP1QgL9eMCBSCD0p7nL9Q==
X-Received: by 2002:a05:6a00:44c3:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-86f84b1d7d7mr12325942b3a.16.1789458341946;
        Tue, 15 Sep 2026 00:45:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b4c39ebfbsm5795970b3a.54.2026.09.15.00.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:45:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: alvium-csi2: balance runtime PM usage count on remove
Date: Tue, 15 Sep 2026 15:45:30 +0800
Message-ID: <20260915074530.2081225-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alvium_probe() increments the runtime PM usage count with
pm_runtime_get_noresume() before enabling runtime PM. The probe error
path correctly balances this reference with pm_runtime_put_noidle(),
but the normal remove path only disables runtime PM.

pm_runtime_disable() does not decrement the usage count, so a
successful probe followed by driver removal leaves the runtime PM
usage count unbalanced.

Add the missing pm_runtime_put_noidle() to the remove path, matching
the existing probe error cleanup.

This issue was found by manual code inspection.

Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index f51f9b987759..f218999e0ed9 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -2523,6 +2523,7 @@ static void alvium_remove(struct i2c_client *client)
 	 * make sure to turn power off manually.
 	 */
 	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
 	if (!pm_runtime_status_suspended(dev))
 		alvium_set_power(alvium, false);
 	pm_runtime_set_suspended(dev);
-- 
2.43.0

