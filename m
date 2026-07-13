Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64670363C40;
	Mon, 13 Jul 2026 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978296; cv=none; b=jf7Ux9TbEF9FU0cE+2FhonHp7MN8j971B/gxJBJJKcd2DqWop+gtUGLod0UP4XllqWusayoKLFW+BOi1MnYcvnbXdEnxrTSVTMyrEa8fYVgL4Zk1bGaFc4v9E3nh+kG4Jj6WA5CHnKpxhJS7JHbsLm4csBfQlbtOEITYAIAfuUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978296; c=relaxed/simple;
	bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjXbMM5VR+/kFdK+IQ2GuzqAbpP0A3ombtiAr1ewEglLwVjaMidrB2kEQwwKGhxDaVzK2jQH/xpa3Js0F4RNIaExX++YyG3hlPFpb0P8VMAAoycMEIuGMfKdo8PqNj5eLDzXs7a3Fmcm3wYzBletRO1sfDyA5MQXwzXRC5weMug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=BuLXW2gX; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=GrlviD/u; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="BuLXW2gX";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="GrlviD/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978286; bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BuLXW2gXORO7XBE6hR8HzYlR7f7rAxZlFCWgTzZfPXzeDsSW2dIgsVm+hqvUUBkQL
	 RpDn93kzO23LwMmHXvXDDDcsIBeC9CxGye2fMMNogkpV2lsiXkoMgcWp/b+BS5pDgE
	 mv7jp/2UIVtDc4nXXP+CN4V1qhIqmcz0fZN+eq+SlG8c8DXR0TDwOkiEL5PMiLPBkF
	 sc7JIM3o2IG78Cx0XcpshPzrieYJO5k9HTkDf9loR4bQD+9c27DiWtXccdxPmWZE1+
	 iszlBAdZqoVtFUT99blSl068EXjWxacvK/mav4DtBNuVq7teiowJW4KhoKSe/4XaxW
	 s3iJLzyxxy0Gg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C1C1A40155; Mon, 13 Jul 2026 22:31:26 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978285; bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GrlviD/u9Tu1qOcMyBP9v6JK+1DdWjeXdWSvNmO+11UwTBd9ZNU1TKmX/hRc+bjGw
	 fPt1EJeC3B36i+90wJOLPRr72PTR2+PTABH2otHx8fX/XcS9+YG4OjahtqLCWgvq/s
	 JnoUvVPthe16UVRYj1zGxX2plFIXBmXeHK15chzal1u0BtGj0hTIgn//+mmmpXgrtE
	 fqzcqFPRasO4beEIZ45+BVBueHjH8FPiOnhhTzni/Hf4CrIO2BybGVb3zdE7GDCCM6
	 l5IDjBXSj45pSORAzjFRr6iS447X7zRDqTbACmPMUCiJKudfp2PppnngsAhTe4SwbL
	 M0xbhDaAHFgNg==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 687C540155;
	Mon, 13 Jul 2026 22:31:25 +0100 (BST)
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
Subject: [PATCH v2 08/11] media: meson-ir-tx: Ensure rc_free_device() is called on unbind
Date: Mon, 13 Jul 2026 22:31:02 +0100
Message-ID: <9f28638da11733f8ccbab4e62c703b7c2f80884f.1783977550.git.sean@mess.org>
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

