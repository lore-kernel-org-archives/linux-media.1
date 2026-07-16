Received: from isildur.very.puzzling.org (isildur.very.puzzling.org [139.180.180.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51836382380;
	Thu, 16 Jul 2026 05:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.180.180.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784178561; cv=none; b=jr00OQXWGtaiKNvylDEMw2szQ7h709BveKyNWfaVcpbbd1Xx7dbHT6zaMyzyRE6G16a/pHb92YCPx90WVelreMcOQPYKiHw2t0lWrOPyBhe4DH2E/ggzPvWDLYP1XgqNc5IqOao1/TLNAqX78sPMjTHbiOSEg7iqySOb6zrneIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784178561; c=relaxed/simple;
	bh=6X7bZh8IXa7nX2yklw7mIwUS9JZ86Fh0UHbqiRvPe+o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKLyG20DVNkJYgJ9Lv0MSnSVmdhJOVNO87eBkCzmVCLvLpyoNInpdS5j59MZsGEqVf0VAhuaLhXtkLqQoIUc1n1RGpNLqpRp5okpXDDuOQVoM5OIMxK1Bh+lKVJsbRpA512PHIPKou57UPSfCZnDYTCDwjXDSE6IYfJKRAKu9Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=very.puzzling.org; spf=pass smtp.mailfrom=very.puzzling.org; dkim=pass (2048-bit key) header.d=very.puzzling.org header.i=@very.puzzling.org header.b=MgGOlyaO; arc=none smtp.client-ip=139.180.180.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=very.puzzling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=very.puzzling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=very.puzzling.org header.i=@very.puzzling.org header.b="MgGOlyaO"
Received: from beren.home (unknown [115.128.81.176])
	by isildur.very.puzzling.org (Postfix) with ESMTPSA id 1BD2EA4C;
	Thu, 16 Jul 2026 15:01:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=very.puzzling.org;
	s=beta; t=1784178081;
	bh=UT+8l5jzRYIVaBbFouAzrbN8rTvujOKe+ORwEEuPfRo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From:Reply-To:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:MIME-Version;
	b=MgGOlyaOO762J74nY8Cd61FuXkMRvAhaFF1O+AdSwA8CRc1k0ECjVfjpyQbHNY1TW
	 eTZSrBkHbJSg5A9J5CnP19HMKRahqsCt/iG6oQEuKTt+rqTsyCQ/1j5I/HP+0Q+mGw
	 l64SkcUgzyxu9LzlJwCo0Faxn06mBjl6g6PgvkUN3CLJBjwTct1BBn9Pbdd/+5RbYg
	 QSQy627XmY25hE58Z6Wum+1PYn1DKAFD7PLW7DSxXAusAUc+CFl7kWZ4HZk++d9ezX
	 Hyen6cVU29bQZndQQ7GPerUgFNav+Zi0icJgDnQPz7j907Iy76f0sCkRaQKvuvv0pZ
	 yZQbwCcEBG46Q==
Received: by beren.home (Postfix, from userid 1000)
	id 9D4CA40080; Thu, 16 Jul 2026 15:01:19 +1000 (AEST)
From: Michael Chapman <mike@very.puzzling.org>
To: Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Chapman <mike@very.puzzling.org>
Subject: [PATCH 2/3] media: dvb-usb: dib0700: fix null-ptr-deref in dib0700_disconnect
Date: Thu, 16 Jul 2026 15:01:17 +1000
Message-ID: <20260716050118.30150-3-mike@very.puzzling.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716050118.30150-1-mike@very.puzzling.org>
References: <20260716050118.30150-1-mike@very.puzzling.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dib0700_disconnect() may be called before driver-specific state has been
attached to the USB device.

Signed-off-by: Michael Chapman <mike@very.puzzling.org>
---
 drivers/media/usb/dvb-usb/dib0700_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51ea..2d281a2f45 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -911,9 +911,15 @@ static int dib0700_probe(struct usb_interface *intf,
 static void dib0700_disconnect(struct usb_interface *intf)
 {
 	struct dvb_usb_device *d = usb_get_intfdata(intf);
-	struct dib0700_state *st = d->priv;
+	struct dib0700_state *st;
 	struct i2c_client *client;
 
+	if (!d)
+		goto exit;
+	st = d->priv;
+	if (!st)
+		goto exit;
+
 	/* remove I2C client for tuner */
 	client = st->i2c_client_tuner;
 	if (client) {
@@ -928,6 +934,7 @@ static void dib0700_disconnect(struct usb_interface *intf)
 		i2c_unregister_device(client);
 	}
 
+exit:
 	dvb_usb_device_exit(intf);
 }
 
-- 
2.55.0

