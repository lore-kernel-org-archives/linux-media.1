Received: from isildur.very.puzzling.org (isildur.very.puzzling.org [139.180.180.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5170F33CEB5;
	Thu, 16 Jul 2026 05:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.180.180.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784178561; cv=none; b=mBoAboQ4eXRuvBiaG1VDOAyL7OXwBd+l+YcTayr8UF2GftznfYLgSmYqnm1gMRBMIEIjQecw529BBlZqrmueMC2pMZeJqPl7qHtENOHUz9tSKy+YVHcX3IX2Z0Ce/Pde1yDmneAwKC7hsfz3qFghvJiJGScaf3WdGXm0ewMQE8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784178561; c=relaxed/simple;
	bh=M5UQkyAx7rYwV34fxoC/Y+LX5jVhpOQhf/6+1J8ziH0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTe6V94jVecKbLGDPtxHGu8dhVZmwGzzeJpkHbeTLIpvM01HW4EBCO0WnKUQBIMoipAxFsz11YbBOvfECauVyKXAgJTTVCG6loIGXLKo7heihwEe0kdrNrkmytAZQM40tyY2Z5Ir7iNNQh/SGcy7AsyaYdHnO8Pz9liUye1EsyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=very.puzzling.org; spf=pass smtp.mailfrom=very.puzzling.org; dkim=pass (2048-bit key) header.d=very.puzzling.org header.i=@very.puzzling.org header.b=GI6Njn7o; arc=none smtp.client-ip=139.180.180.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=very.puzzling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=very.puzzling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=very.puzzling.org header.i=@very.puzzling.org header.b="GI6Njn7o"
Received: from beren.home (unknown [115.128.81.176])
	by isildur.very.puzzling.org (Postfix) with ESMTPSA id 207F8AD9;
	Thu, 16 Jul 2026 15:01:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=very.puzzling.org;
	s=beta; t=1784178081;
	bh=KGfkywko2NUlL6xNJDzA4eSuOK7qSeMJRaNa9FIHG2Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From:Reply-To:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:MIME-Version;
	b=GI6Njn7oHPw+10k5WghT5MgbudOdG7PFE+T2vWFrqQ/0B3oZZs/hzWcMi1GuOU3C0
	 k9P7mRDao9iBYSYPhnLcB2mHuWGkIJ9SDhe3SSt2pfuFb5fhTtcziOHAHW4NP7GIhY
	 6A4N2Eb2CutF4BL0wgiEWGnmN5JYGuyUm1UQ8/Z34UFzO3F4t/eY4mCkWjfFLz3pke
	 5T9K4QC6PdYg1xfbgK0wJXk2KzqG41p8OXiTtv8Aeo5+WKmZ/hfCjqYifKJ291O4ji
	 XNNuLQj5sSX/yqCO1lxVQ8mwCGNs5+76lEDbG+WTGvraWR1rnOGJmb4YA4aXN0joam
	 u8QJHq8nLbVBg==
Received: by beren.home (Postfix, from userid 1000)
	id D4BD141BFC; Thu, 16 Jul 2026 15:01:19 +1000 (AEST)
From: Michael Chapman <mike@very.puzzling.org>
To: Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Chapman <mike@very.puzzling.org>
Subject: [PATCH 3/3] media: dvb-usb: dw2102: fix null-ptr-deref in dw2102_disconnect
Date: Thu, 16 Jul 2026 15:01:18 +1000
Message-ID: <20260716050118.30150-4-mike@very.puzzling.org>
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

dw2102_disconnect() may be called before driver-specific state has been
attached to the USB device.

Signed-off-by: Michael Chapman <mike@very.puzzling.org>
---
 drivers/media/usb/dvb-usb/dw2102.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 4fecf2f965..bde7021a34 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -2618,9 +2618,15 @@ static int dw2102_probe(struct usb_interface *intf,
 static void dw2102_disconnect(struct usb_interface *intf)
 {
 	struct dvb_usb_device *d = usb_get_intfdata(intf);
-	struct dw2102_state *st = d->priv;
+	struct dw2102_state *st;
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
@@ -2635,6 +2641,7 @@ static void dw2102_disconnect(struct usb_interface *intf)
 		i2c_unregister_device(client);
 	}
 
+exit:
 	dvb_usb_device_exit(intf);
 }
 
-- 
2.55.0

