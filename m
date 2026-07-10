Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC693DB33F;
	Fri, 10 Jul 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673640; cv=none; b=cHORCkp1gQLe8rqJ9un9WIxikYb75j1DuiqGdLJYqBxBEr63sG6ZxVJWjxzlJ+c+N4Z97e6rtaTL+pOwoHVeiNJxheYCQf0Tg4HfqQTY/NqNd9zk6RdokTTLm1ssZVhpUamjapf33UR2VmzdcCCWWdnQT+CPdf8XfImaKxtZnZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673640; c=relaxed/simple;
	bh=uxrv4RU4kx2kz4TN49RM0DA9U2uRkeYrAsniJlkVWGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPNTTrxTSWlQybReR8PzEaIlcvwbBrTxxhhioxSm5VSMJKKcoh3fLCCQUTexZmsUcJ39mEVe9dkDJoxHBZy7C7BCb3UfTs4k2y9HJqPyCtkLcEseVXld/O6XP2/3PeP8sUDND4RSZu9hDeI1sjlrjxoBM9gB204YawSR8QeKOiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=TxIk0f6X; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=tZUyiT1p; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="TxIk0f6X";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="tZUyiT1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673632; bh=uxrv4RU4kx2kz4TN49RM0DA9U2uRkeYrAsniJlkVWGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxIk0f6XWy5cxyaguSGDZjjYRC7Y+Sfnm6Qf0KRRImcbmbB8txi5fCzwnEMwrAjRM
	 gPRDFcKEiz7sZRk2v3j1iRNm0UguiBY2FyS2roSwQlQ8r8iZPkkVBPl7jvfjj1UFox
	 0oBJJeJMUvxlZQQpKFQJhvr0ilFjb2/3gj0hQvKc3A+xYjO3WLCg26ttfPmLT3ln1D
	 WD4BIscrD+UEps0Q5ivnWt3t/2oORyGYnLJ32azkTBO50jPdd89w297oJw/TI5l4P4
	 4Ct4XVpNQr4a7qDsY4PtNnQHbBWjRy1I1tXOXpa+jcPkgXZ7MisVGT2G/y98xQg21d
	 ds6LMXs3RfvjA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 0196540B52; Fri, 10 Jul 2026 09:53:51 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673630; bh=uxrv4RU4kx2kz4TN49RM0DA9U2uRkeYrAsniJlkVWGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZUyiT1pLkcDLBaxdGo1d2qyxadn8fyYS7IVBEz3BbahdiWSN+QUYHRtenYNP89I2
	 KYgLloDRAKfgjEVslrcHUezE8WYuWY429IVf0CxTYxeYMzA0bWVKE1zsqdwkDmaff+
	 eh4CHSN+Aug9p83+dc0A7H0VGvPi8CKu6DlyJoUzoGi7Pui0NjiFRPi3a9zsLYrdTh
	 eagij+o0OBCwGW8ji6MO4I0hhib/bSJGy3zVXTai5PNQBDR+A2F+hMXURTPsQZs0OJ
	 ClNKahqCN0MwhlfmHBOfuWVAfWWa4i9fNWmWfVzqXM4eoFZfoN/UJKkFyXTEOSztak
	 3hali2luY2P2A==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 6E95140B29;
	Fri, 10 Jul 2026 09:53:50 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Fri, 10 Jul 2026 09:53:33 +0100
Message-ID: <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk_prepare_enabled() needs a call to clk_disable_prepare() on
driver unbind. Make it devm managed.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index fded2c256f2a..e7bb107e6a84 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -288,8 +288,8 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 	if (!np)
 		return -ENODEV;
 
-	clock = devm_clk_get(ir->dev, "xtal");
-	if (IS_ERR(clock) || clk_prepare_enable(clock))
+	clock = devm_clk_get_enabled(ir->dev, "xtal");
+	if (IS_ERR(clock))
 		return -ENODEV;
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
-- 
2.55.0

