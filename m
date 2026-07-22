Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8C4D8DAE;
	Wed, 22 Jul 2026 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715825; cv=none; b=m3f/BLcBzd+LdjsBR0sb/hsso5xm6NkjkZUPeLvZI7AJ8wxljfXChYR34iSohhLqe/4cqn+v3+E8YcC8tb7wPJOfPzitVI/uZxGO9pijmpwk9IENFKhjM0sDrdAmDTkppB4OxfTCtk195nUrdI/3xwe66bnTOF7ffKzBKy/1AGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715825; c=relaxed/simple;
	bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpiiU11Xf5+2JwPNoFqTmzs4BBZVwl46et8nlqvgXqqp9SQFHF59DL54K1XsO9PoIgepbN1hriXDY/3WLxcW69TpHjNKsnB1QM92Ko0mKBKIwP1pcYvmp/i3L8+hmSORdHvIlmPnzioydx9Qhhp8s1xJrssxpUIOQ4boaEyzJY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Htw+KTJo; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=hQKdhAVG; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Htw+KTJo";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="hQKdhAVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715822; bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Htw+KTJogq0sNc9ZNcqNPOzczLe4MtamPn6iSaHn9nzAjuSkdXEuze2hiAW4pGAhi
	 jTGDrEZ12CtldNTNhZ31Zg+qvHCGccz8EUIRgFqyjDd6r9S2iAPRgjPmDrw9dWe39t
	 aLwQz4yCJkIVXzrBKOogw8RpD1+zMTlMZKQRngH9J67PmJsvIZbI2fvYOHoGlrL6RO
	 ZTWBPO1sRP4rQAL1kId5mlXCra/OB7FzNfadZxA4SjUgHpKOdyxySQDOXFT4tD70Gt
	 lzDsjfx/qi61KigfIQ12di3hN0rhVzXWF7XJTjh8kgc9p6LkO6klESazoD0urv4Bw0
	 Es2krPx3rJJmg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 8A25742526; Wed, 22 Jul 2026 11:23:42 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715821; bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hQKdhAVGRVEkKeRuoYiEmDN6MYdWl9H4YzWkV+jCJZS+Syc6/DIpa/9V3xGZqjZrf
	 aA4u/H1eY8lDcJMam0TWoaD5zQ995QtsT0xXZ1l8/uWbAfBg8oJxs/zKmDV0jotPk5
	 zCG+mprwx1YED0mnB2YuHQcF7YzkG+uvSFqsvMtQUjQw2A8O2vKAacdKTP9bT6mUv0
	 DSSfWFdx5BAvxWpEOSIFkL54FQrvFtLNYPeFMTYfDoVyXYPiUCQo6qkR7vjBpDqsTD
	 HVXKTyCk3OqPgQ9zBfm17A4tCS853bXnxTFmQQM7jZa7wqQ0Som5b2IoRYdiGgukIp
	 wsWkHmrjUbFsw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 0C34D42528;
	Wed, 22 Jul 2026 11:23:41 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guoxiong Yan <yanguoxiong@huawei.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/13] media: ir-hix5hd2: Ensure rdev is setup before interrupts are enabled
Date: Wed, 22 Jul 2026 11:23:22 +0100
Message-ID: <15e90d3160697f58a97b0798b73fdacc5559dfb5.1784715737.git.sean@mess.org>
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

Once the interrupt handler is enabled, priv->rdev can be used. Ensure
it is setup correctly so there is no race condition.

Fixes: a84fcdaa9058 ("[media] rc: Introduce hix5hd2 IR transmitter driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir-hix5hd2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 1b061e4a3dcf..aa3de4d57a58 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -316,6 +316,9 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto clkerr;
 
+	priv->rdev = rdev;
+	priv->dev = dev;
+
 	if (devm_request_irq(dev, priv->irq, hix5hd2_ir_rx_interrupt,
 			     0, pdev->name, priv) < 0) {
 		dev_err(dev, "IRQ %d register failed\n", priv->irq);
@@ -323,8 +326,6 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 		goto regerr;
 	}
 
-	priv->rdev = rdev;
-	priv->dev = dev;
 	platform_set_drvdata(pdev, priv);
 
 	return ret;
-- 
2.55.0

