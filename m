Received: from isildur.very.puzzling.org (isildur.very.puzzling.org [139.180.180.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5168322D7A9;
	Thu, 16 Jul 2026 05:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.180.180.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784178563; cv=none; b=M47aPNymhRKw2/rrILFr2xry1Fkxv3lXdJfXhowRn67P9LD/7OpHo9S2ca9ghlb6e/Fo9GrSK5JRrb09CxKt892Gmyr+Wzdh45BoHKPDgGXHxTaVICsY7khDmQmYqovvg6wXZCiHGDGag6/0rXCJbG0cD8CaZ+OWvUHPqsJtfd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784178563; c=relaxed/simple;
	bh=C4a5D7HdzzDhCKeD/2KuOKQDuQ/Isc5/IITHMbgVXNg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQk9gzBll3T6NhoESVTWlclSdV+veyLl4996dRse1+fZrkuDvcP4Zcc9RZCT0TxPV7BPj/pbK940UkumH0mOb1Tu1ISJ4a17PI5rkGVVDmU1PtAagKn4/jlqqdU46R8+xLqBAYVrIzqagoLzX7j8IpGrnLTNcw+0OdN4UABIrzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=very.puzzling.org; spf=pass smtp.mailfrom=very.puzzling.org; dkim=pass (2048-bit key) header.d=very.puzzling.org header.i=@very.puzzling.org header.b=i0T0923m; arc=none smtp.client-ip=139.180.180.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=very.puzzling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=very.puzzling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=very.puzzling.org header.i=@very.puzzling.org header.b="i0T0923m"
Received: from beren.home (unknown [115.128.81.176])
	by isildur.very.puzzling.org (Postfix) with ESMTPSA id 235ECADA;
	Thu, 16 Jul 2026 15:01:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=very.puzzling.org;
	s=beta; t=1784178081;
	bh=LbhcNCP3Sg+yI3L6jjcVVSej40gTtvP7cyTZrhgsx9s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From:Reply-To:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:MIME-Version;
	b=i0T0923myo+h5kJPxaegeyndFvWdknZlpDjan7kAGqFw42TU6HFA+j4MCRTHX0ii1
	 yGQRSfgcyMen9eLd4R+uMHFh9yHfBAQc7BuEYJNN/FKmOcvVB7xwt5mZVCEyw5slTr
	 /t+ZwYwqKfti4kgRYVQAOYFpmLCD3Y9bX21yvNaMwBpEKYDRRnzabrrr2W78PLXzci
	 7VnPjQzw7e4zAzIZC57L5A16a14QHXAYN37CXpNIe1u97DjyQZFSQWb+2yw5TX7Tza
	 1KyyXDNA4M241AlVD7y214Y9Eb97VKZid4Fdds5QQ7MDtgnT0nSWaBlKqCjvsShycr
	 ozYrjcnsCEFsA==
Received: by beren.home (Postfix, from userid 1000)
	id BA13741BFD; Thu, 16 Jul 2026 15:01:19 +1000 (AEST)
From: Michael Chapman <mike@very.puzzling.org>
To: Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Chapman <mike@very.puzzling.org>
Subject: [PATCH 1/3] media: dvb-usb: cxusb: fix null-ptr-deref in cxusb_disconnect
Date: Thu, 16 Jul 2026 15:01:16 +1000
Message-ID: <20260716050118.30150-2-mike@very.puzzling.org>
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

cxusb_disconnect() may be called before driver-specific state has been
attached to the USB device.

Signed-off-by: Michael Chapman <mike@very.puzzling.org>
---
 drivers/media/usb/dvb-usb/cxusb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index d0501c1e81..c127bb574d 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -1668,9 +1668,15 @@ static int cxusb_probe(struct usb_interface *intf,
 static void cxusb_disconnect(struct usb_interface *intf)
 {
 	struct dvb_usb_device *d = usb_get_intfdata(intf);
-	struct cxusb_state *st = d->priv;
+	struct cxusb_state *st;
 	struct i2c_client *client;
 
+	if (!d)
+		goto exit;
+	st = d->priv;
+	if (!st)
+		goto exit;
+
 	if (d->props.devices[0].warm_ids[0] == &cxusb_table[MEDION_MD95700])
 		cxusb_medion_unregister_analog(d);
 
@@ -1688,6 +1694,7 @@ static void cxusb_disconnect(struct usb_interface *intf)
 		i2c_unregister_device(client);
 	}
 
+exit:
 	dvb_usb_device_exit(intf);
 }
 
-- 
2.55.0

