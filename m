Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4595D4C900F;
	Wed, 22 Jul 2026 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715825; cv=none; b=N97vbE4VXQz8GMzEIS8SMXMO5sVoyTyHASfp0G9xjgNj9X3WNl4Mn8qL6eKfROvy0sSAzYxXsZB1Pcwznl4Qt9k3OkyZW1jzW3EkfE+bfDqyD479V9H/iwCjfT4FtOpRqlx3rgYCRuNLFVgQN3l50gea3Ily1Gw3dRehL1NTKRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715825; c=relaxed/simple;
	bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ai/gqWMUmrAPfECzCnybYQMolalVa300eUsoUlce7VYmCe4bL3Fbt7628h+9LtT7RqGpvLbJ93lcfL6B6CC8fUzuuiwx2Ilqljiq0aEyFN0WbR3dtvWWlBQIPohXa7G1QGIZpyOtXavo56Nvgzgz3YdCWJkKRVJOJyJsYHmGbt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=HzxLcXgk; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=aUxM38md; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="HzxLcXgk";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="aUxM38md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715822; bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HzxLcXgkKaYQcSvFjwQthQLoUoVFV49AzEyrtxOJGsJ9SXieeKiwfq1GVYODlCHIm
	 l2RmdzSZC+g8DuLoB0ALjSfpMjF3q/TGgIrMY2h7SxJb2E0Nnkjxa967ph/hGsMztm
	 8IMGrXiw/Wg52+ImrENFB9nwO6C30Ns805KUAu9YTmwfrEJDd+H1rptVmAQytnOAxY
	 7r2NagwliEVZLh9qeux0fjFHMU/gw1cRKNB1iC1Y/Q4qA1oT6EIUAWVIVw5NkxMgkD
	 XTzysIGgzkzNJQ9m5fr/eaGyb9bdpkavQzU8+dh/N6E8HLnXgqh5MkaiSYdhkfHoAn
	 X6Tx3XOS4tUxw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id D36844253C; Wed, 22 Jul 2026 11:23:42 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715820; bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aUxM38mdUebm/sODIPjAEyhB2MYCSGA5vpuK9NuaD41gzIs8jVMeNLFQfZw/PDYsf
	 4c1/O/w90NCefxlE0SWSsMHmHR3+ExQSDNaXRQ+bUZ6M9c9J7uYxDOU2TleYAKxt5G
	 grc9w6L5D76tEycvdqZexf15/PFQs+d0DIiXxVBYM5EpdHkxhD/5nM2u8bcBU3gn5q
	 E5kgB1lhkHZJ5D5dd1ZRgTEwghIFFUmSENv3wswcIX1XZLUDTJeoqPp5noRWuPF8oK
	 OtwxAwdnROdN8y1cNziAk0PcSIkbZEf6H0fnqlT+qSDRtIMCzswiLFT+SghNwRV6Px
	 dm1cmKhlZ8z6g==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 6AA5F42538;
	Wed, 22 Jul 2026 11:23:40 +0100 (BST)
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
Subject: [PATCH v3 09/13] media: meson-ir-tx: Ensure probe error is propagated
Date: Wed, 22 Jul 2026 11:23:21 +0100
Message-ID: <b34fb1c2603376b4ae99829fafae49897d975625.1784715737.git.sean@mess.org>
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

devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
propagated else the probe will not be deferred, it will fail instead.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index abb107d19e8c..174d5135e1bb 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -290,7 +290,7 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 
 	clock = devm_clk_get_enabled(ir->dev, "xtal");
 	if (IS_ERR(clock))
-		return -ENODEV;
+		return PTR_ERR(clock);
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
 	ir->clk_rate = clk_get_rate(clock) / 3;
@@ -324,7 +324,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 
 	ir->dev = dev;
 	ir->carrier = MIRTX_DEFAULT_CARRIER;
-- 
2.55.0

