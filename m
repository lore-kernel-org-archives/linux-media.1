Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E643E49ED;
	Wed, 22 Jul 2026 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715820; cv=none; b=pqVt6u+Hjbm77Su+ov+8yTX5OuPyNG6q8UhN5Q4easTVInWovtRBdfsm++7n0NaFlgKTiqaUjtYqIJ380G3vVw9gbtouCpE683+LCz0HvPskuvCsQtcotRBOj4J6BXqsPvsaxpLjP1Y7Qu3KXq+8AzSQ2zXWSpH6MQP7EX1l4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715820; c=relaxed/simple;
	bh=a1G56zNNur1a8fCqIlqt3CG84kd9mah7RZUxoshwVNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iV6BeOgseeQGF32clj4RT4luGSw5O6bl5tVNF7XMOjXF1mfreAxFSjvQF/wu/CFYNAO42usGVRjTSbguw8C1GRHCNl442DRU20Dl33Mn0FRAF74DEZbpWXF7pYzvaFRiggjoNh30DD31iBjVl6mdO2s4MqqmUbLMbagPZvGOHQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=BYRcon4t; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=F2j/+T1Q; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="BYRcon4t";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="F2j/+T1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715817; bh=a1G56zNNur1a8fCqIlqt3CG84kd9mah7RZUxoshwVNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BYRcon4tJBwuy6QAUT/eADqTHJdXUv11PSGTDaF/xT7I5DUiSIHBLaQj4maBm0dx9
	 3L9ExfaHz0mYCf9V4LNU/syiW7AgsHv9gTBxXyYxDGsLFJ6Guow7crT2cKEC34fGPu
	 pGNogjATtAopFyxjWRbsS01QLG9+Zh6V8qdqqKhYYxqcwmdXTBGeJPckpbeDa47aEd
	 lpGvmOZ1miG90DiT1fZEMKYiraRK3HP3bvX0OYRAgVDtuZM8L8vNR0k+blbNxTdima
	 OAIlmSYRakWcyGEAiYDgWK9y6L07sj3JKcCxdJeHZwH+fAVOnCc1WXShdnYwHJDpXB
	 3BN1T6TbprIKQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 16E074252E; Wed, 22 Jul 2026 11:23:37 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715816; bh=a1G56zNNur1a8fCqIlqt3CG84kd9mah7RZUxoshwVNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2j/+T1Q9WkivPNLnH0GYn8G1Bl9LVGVKp3b/iIeyxChkGYRBPBtcww98GjZDpAEz
	 jKVBJAyQzAHezjlkCbDPZ1eOPTfIO5DRHgnNM/EUd0X1+Op8if+yzHPp7uHn9+8BDh
	 5zDEl+aJslD0lVoCqPfDyLxfvZnnxCgbByGyeFYR60Fw6dCpr2JuTzOrLCeyHlimud
	 pvTRpL/Eg3aKP44TvdjIsoZ/HGmXkW7UOpXT7CJQeaWdNrKSZtN/2XdifxpZsBQ0RP
	 E4T6vFNmXrPD+jS+G/JUEDL8+QZYM1ECZNL5iNOmL+rfjLNaq5Pg5NeMy2fatPbOVy
	 klvU5/r2QB3qg==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 687F141567;
	Wed, 22 Jul 2026 11:23:36 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] media: redrat3: Ensure rc device is freed if enable_detector() fails
Date: Wed, 22 Jul 2026 11:23:14 +0100
Message-ID: <d5d7f661845474c2ca3686afd5ca2696742287f2.1784715737.git.sean@mess.org>
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

This particular error path does not free the rc device at all, with
its priv pointer still pointing at freed memory.

Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3f828a564e19..2b639fe59923 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -979,6 +979,7 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	struct usb_endpoint_descriptor *ep_narrow = NULL;
 	struct usb_endpoint_descriptor *ep_wide = NULL;
 	struct usb_endpoint_descriptor *ep_out = NULL;
+	struct rc_dev *rc = NULL;
 	u8 addr, attrs;
 	int pipe, i;
 	int retval = -ENOMEM;
@@ -1102,26 +1103,31 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	if (retval)
 		goto redrat_free;
 
-	rr3->rc = redrat3_init_rc_dev(rr3);
-	if (!rr3->rc) {
+	rc = redrat3_init_rc_dev(rr3);
+	if (!rc) {
 		retval = -ENOMEM;
 		goto led_free;
 	}
 
+	rr3->rc = rc;
+
 	/* might be all we need to do? */
 	retval = redrat3_enable_detector(rr3);
 	if (retval < 0)
-		goto led_free;
+		goto rc_free;
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(intf, rr3);
 
 	return 0;
 
+rc_free:
+	rc_unregister_device(rc);
 led_free:
 	led_classdev_unregister(&rr3->led);
 redrat_free:
 	redrat3_delete(rr3, rr3->udev);
+	rc_free_device(rc);
 
 no_endpoints:
 	return retval;
-- 
2.55.0

