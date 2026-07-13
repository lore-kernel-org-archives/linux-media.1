Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816C363C46;
	Mon, 13 Jul 2026 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978296; cv=none; b=cfYhxUf9RhV8uAuYxmHSqSQDBQbIEDjLAL1w9mz45Zskaw4CMN+dVShIY3/5JW4ZK+vtALy4eSZwsKzCUZBxIHVTct+b/5g3DfxsDbW9ZI3UhSUrRPegasEPquq9BObpbsCcgA5HQVIXDhHKSM5ds7ixNR/38Eku7ITVsWPO6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978296; c=relaxed/simple;
	bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAGJpCTNzqBBdFwjuxAftjm3RjcR0kgZ9h2MhP2l9WeUYLWPqGt3upgoaf88ej3GkDSk2dOtOMNv09McZ30M6jzBPsuDEzCcTFmy/7WsDLQqAvJfh+sONqSwTWf6y5SsdbsU/IC4p+3E+2ZFeyW+debK20Jz6deRhNcLDjnzjNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=BzaAWcJR; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=TwulCmiu; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="BzaAWcJR";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="TwulCmiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978286; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzaAWcJRf1fuSNITS63VgWSbr5lHBUYPKoff1N5GWbBgQ04oVw1h1G7iv+ARRXZbK
	 hkwuS6fqsIu3Sz2Gvsq9h3W6H1Ohncx5mafktXZCBn95eKDt0Eg1AJ3KUAzinXST3F
	 3VTGKAs4x1DUJ1k5oPHBi4xDL0fs3MMiY14DoY43Lg+w5cQOuiV58mK6cMXxHNfNUz
	 fkXuz1NTt052BtFRYHhGZ1Ps9jN+GBVTmVqMG/Ho9vb4pYKsacwtQlLWHyQAIXY+ul
	 JyDJk7UF8a94sf8CYVQfsIdfdl6oVo6KYz4IBENULe56rcvGXxMcPXxkG0sx9bK9f8
	 bpi9xqSgYOJNA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 1BA3B41EFD; Mon, 13 Jul 2026 22:31:26 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978284; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TwulCmiugN+lltjlfM2DqYPhNlI8LGpTve9ADDH1HsnZk6DXgFJtqy720R/WLdars
	 VXtpl95Oem7oVX2JL/SBdYtJAN5VvfPl/pRwGFR/WLTOr6m+yjmk7lBMIt5TFppa9F
	 jcjjDIEAAo37DPh7bUTQKWN8pSDyw2/VU+OSVhe9fPfQH2f8E8FQ4kLEPD8SusxDTJ
	 poGEom10IdzicSlkAIiHwE8w5QCVc19C1dNb5pQ+z5yaiAtetmKo+OErEhhKoGNcuw
	 gbBFgK95aEfxgFt+v8O3Fafh0IIdNFGXQEIZEfl4YPf9qOkDEpuLzl5YVzMwsIUDIT
	 hLZI/lrhAFfxg==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id AC44540A3B;
	Mon, 13 Jul 2026 22:31:24 +0100 (BST)
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
Subject: [PATCH v2 07/11] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Mon, 13 Jul 2026 22:31:01 +0100
Message-ID: <5f880faac5530202a07dcf92329476608bbabfc1.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk_prepare_enable() needs a call to clk_disable_unprepare() on
driver unbind. Make it devm managed.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

