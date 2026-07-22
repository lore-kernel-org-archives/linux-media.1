Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF84CA287;
	Wed, 22 Jul 2026 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715824; cv=none; b=ILLhh3cbIwbymZrRIDlP8SLm3GOBYSloizcSRBScH5TXGgmQO7qtA3ATi4/RSNsNlE8ekpxQcHyXtOleHxAvRPP9qy4vCD/LsgSy8hqayVnpkBIG+rfK1Uyitvy96/GheYRf9bJR6dMR0L8GqTJUUu9YgSPPUk0928zrPoNyQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715824; c=relaxed/simple;
	bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLFMkXvhJIXcwqllq1vKF3zix/peJ5ZuZKroe7ct14JSneZtaRllGY3KS1/bkGZlz7hyV3f648Ro7W8m1ElIx+NeE2PF/ToTvaw1YGiXgQVP0GJfwmzbF24FbqfeI2UFDg+dHkbctOtCEvPLpkTksA9UERPTVt1kkquGrxTEhpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=VUPr5NkB; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=RSBe0T+u; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="VUPr5NkB";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="RSBe0T+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715821; bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VUPr5NkBbXJ6ZCEnoJ94cJPTHx3NEeN9hEEzOraWppANJcewQPt+QZBNjrfCY8cKs
	 Mclj/4En6hzrRKayQ1ErOQDbavhAgatClvZEdJIe3TLwqviadImcsE3eQj+Gu4BO+8
	 T+MFCKTlSXImatsfZ3QGbG/7yrN8b8w7XAPOeoj5tEbKqMMsvfc6j+0Oufe9OSiDak
	 eQ+zcDmt8FO3j37fWIHKrr6zU3H7aanhztR5vHHmS4FIlR0coNqVqwher6LHJo8jQk
	 /nRfJ6sNqblpSs24Oah+1hT5PGahluXRkba4SDNzd5LWWxjpav9s60kqCDp17Imelh
	 o2Xqx9Y+mK4Mw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 4DDE842534; Wed, 22 Jul 2026 11:23:41 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715820; bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSBe0T+uNUqE6lYdYPl+glJsWQ8ISBAagSMukBOdLpJ59DGQScSkPmVQcFsjx7Gfs
	 /A/jSXwKYMs3yxfwP/ZaoFqk+4eR2ZX87EUofM5P8HORG78DnToYT+oniXPyEvLv2K
	 i0XRBdv/T0yU41aaMBB8Hpsx5Cq7sea1jwQPQ3z8imYVzD7ILMikuqOtKVeNR6i2cn
	 MW7ErIuqGT242dYTzVEz4fm1I4DTUdeswxUWZUMwYfYdkoU9TOhUEEe/A+XDhYNC4c
	 2XRQ+wfNE2UU/xSy4guGTQAqCEwNdzEasL6xXOnTuWNLHCakIwiOysblzgXgDgltuu
	 2i7Fw1XYpNgpQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id C890742544;
	Wed, 22 Jul 2026 11:23:39 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/13] media: meson-ir-tx: Ensure rc_free_device() is called on unbind
Date: Wed, 22 Jul 2026 11:23:20 +0100
Message-ID: <bb206cf5e5bdf607bafda87ba3af4f8f05c30f08.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make rc_dev devm managed.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/media/rc/meson-ir-tx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index e7bb107e6a84..abb107d19e8c 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -345,7 +345,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "irq request failed\n");
 
-	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
+	rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW_TX);
 	if (!rc)
 		return -ENOMEM;
 
@@ -358,10 +358,8 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	rc->s_tx_duty_cycle = meson_irtx_set_duty_cycle;
 
 	ret = devm_rc_register_device(dev, rc);
-	if (ret < 0) {
-		rc_free_device(rc);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "rc_dev registration failed\n");
-	}
 
 	return 0;
 }
-- 
2.55.0

