Received: from smtp-out7.jino.ru (smtp-out7.jino.ru [81.177.141.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B7A378D71;
	Sun,  5 Jul 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.177.141.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783255271; cv=none; b=UikToi+mJZ9QU2tAX0pCg9Rpb08WW8wBdhZ1mD5kP7jOrrLSf5iOI+5MZWedNywMP+3gaF0wkjxJPxBjNA+5WY+FRXHI0g+ZXYE952mihwrkdFTOi2F005PUJKs3qcufAfCtzHEDP+3MIQm2JzPPfi4hh7qZjk1fxR8I/gYS+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783255271; c=relaxed/simple;
	bh=ubqInnrHVvYm7bK1kb2JN3YvwjH6DvpXtRQE+mJuLEY=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=eyhUxq6UFCLuXbtAFIHrdm1NMw3zvhFRX3GoDopXRypouJKNmHZVbu3OHkfRnNcER5jdhXjZnm8vn8Qyun34McvofBIl0m+li1N1B8OhDKO7OjZumTncwnaB3apQKB+8JJUbwBLORslYmhzqMITbSjTXZ6bK338ZtspDICXRFXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mapicom.org; spf=pass smtp.mailfrom=mapicom.org; dkim=pass (2048-bit key) header.d=mapicom.org header.i=@mapicom.org header.b=R3Anz67q; arc=none smtp.client-ip=81.177.141.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mapicom.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mapicom.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mapicom.org header.i=@mapicom.org header.b="R3Anz67q"
Received: from php-docker.local (srv173-s-st.jinolocal [10.0.0.173])
	(Authenticated sender: pinigin@mapicom.org)
	by smtp-out7.jino.ru (Postfix) with ESMTPA id 9AF9A3784A18;
	Sun,  5 Jul 2026 15:41:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mapicom.org; s=dkim;
	t=1783255263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GZlX4uWnoT2JeuwEwRUa5/3meDJMm7Y8s5k/mdS9w1o=;
	b=R3Anz67qoaPKTPPd3111kQsOYud50OhwAvnaeQJM3A7bVVP1olgyFW+OFXN1ekUZAbFPQv
	cCNGHppwq6nKQWemsGB149oZs2wRPp2NV6qZkbMFocbLxztrG7Vt2xXi/kSej8l5tMJnWw
	MVdoR1q42is/3xSQXc1ZShfpOoOXVo1+0NStZigKs5cCkHN4CtlMUNdoRoJA82ORvp8jzT
	cWOEb7ryzKaJfti+SjB2xEV7TWDxd9vdxtTqnTTyqktsBQtP/XoA4FBoG4A4N2EAP5cuKG
	LF3TOcEgHtJB3MigPYQA+sYXIdK8lVWo5Vgr1Lw+kmbP0W8TP2veZJpz+atFzQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 19:41:03 +0700
From: Maksim Pinigin <pinigin@mapicom.org>
To: linux-media@vger.kernel.org
Subject: [PATCH] media: dw2102: Fix a buffer overflow
User-Agent: Jino Webmail
Message-ID: <19e4a6eefaf3911f439ef565d8ac191b@mapicom.org>
X-Sender: pinigin@mapicom.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

This bug in dw2102_load_firmware() function appears only when building 
the kernel via LLVM+Clang. Due to reading of 64 bytes chunk, it may 
happen that there will be an attempt to read a more bytes in chunk than 
there is left, which is why Kernel oops occurs.
At least this bug happens when downloading the firmware for Prof 
Revolution DVB-S2 7500 USB.

Signed-off-by: Maksim Pinigin <pinigin@mapicom.org>
---
  drivers/media/usb/dvb-usb/dw2102.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c 
b/drivers/media/usb/dvb-usb/dw2102.c
index 4fecf2f965e9..ad90d7be4412 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -1893,7 +1893,7 @@ static int dw2102_load_firmware(struct usb_device 
*dev,
                 break;
         }
         info("start downloading DW210X firmware");
-       p = kmalloc(fw->size, GFP_KERNEL);
+       p = kzalloc(round_up(fw->size, 0x40), GFP_KERNEL);
         reset = 1;
         /*stop the CPU*/
         dw210x_op_rw(dev, 0xa0, 0x7f92, 0, &reset, 1, DW210X_WRITE_MSG);
-- 
2.39.5
