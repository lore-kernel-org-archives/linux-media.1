Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A5283142
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603290; cv=none; b=cbye5aZ4DLo8y+ee4pS9Edc+V6H3s8q3/IQckKraAA+Je7pYaG8j8CnZK5MgqGzN91CjTTXRWm66JzhlStlVsBu65CgM+hRQF/oxSTyxt/hzVY+w6d1vzHh+evrmQ4dtH+qha4P7tzQzQNRLayEHgoTWuzxigybZymTB5qARGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603290; c=relaxed/simple;
	bh=M17dMpulSJ+K9IlvNqYPSi3jRg67kGp6jsj5x+e0dIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpNLVLtOijrSjOGi21ybfbe7pX81Mx/dqy3BbyOo+v5t9eZMrM3+QV2e/ycSY5P+/AjtsqbU89ApZVJ1IS1arr2nI10lg2w66UfI7nmQ4dwOnSwqa9StQgKF73bgB2uoisJgTWjiPrydWO1wCN5U/xUHCKj62ey05Q3PO1Wn5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ORUqMKb9; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ORUqMKb9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ORUqMKb9";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ORUqMKb9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD6607621C;
	Thu,  9 Jul 2026 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783603286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QyxhEkV0IJ8hSdFNqcMWGJIOaTRcxZ42uhAzyd99eAE=;
	b=ORUqMKb9KR8fMePwGoNlvF1HHySyuQR4dbzLLMPimXCgHi8vDGmFG6uSyqbx2WmPdTL9r/
	vhdtugeyjfrbUcHb6LQC3lH8O8toIbCCb77gf8mYfdSp3oCTzy8s4UTo0qF5qMpRyyn40H
	datxcsIfUumeTaZCnV7409h0X99/pAo=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ORUqMKb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783603286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QyxhEkV0IJ8hSdFNqcMWGJIOaTRcxZ42uhAzyd99eAE=;
	b=ORUqMKb9KR8fMePwGoNlvF1HHySyuQR4dbzLLMPimXCgHi8vDGmFG6uSyqbx2WmPdTL9r/
	vhdtugeyjfrbUcHb6LQC3lH8O8toIbCCb77gf8mYfdSp3oCTzy8s4UTo0qF5qMpRyyn40H
	datxcsIfUumeTaZCnV7409h0X99/pAo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE49F779AA;
	Thu,  9 Jul 2026 13:21:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3LZbLVagT2oTKgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 09 Jul 2026 13:21:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] media: stk1160: cleanup error handling in probe
Date: Thu,  9 Jul 2026 15:21:23 +0200
Message-ID: <20260709132124.1453410-1-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DD6607621C
X-Spam-Score: -3.01

Do not replicate cleanup code.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/stk1160/stk1160-core.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-core.c b/drivers/media/usb/stk1160/stk1160-core.c
index f9462a9ca761..5058cada0d0a 100644
--- a/drivers/media/usb/stk1160/stk1160-core.c
+++ b/drivers/media/usb/stk1160/stk1160-core.c
@@ -263,7 +263,7 @@ static int stk1160_scan_usb(struct usb_interface *intf, struct usb_device *udev,
 static int stk1160_probe(struct usb_interface *interface,
 		const struct usb_device_id *id)
 {
-	int rc = 0;
+	int rc;
 
 	unsigned int *alt_max_pkt_size;	/* array of wMaxPacketSize */
 	struct usb_device *udev;
@@ -290,15 +290,13 @@ static int stk1160_probe(struct usb_interface *interface,
 	 * Also, check if device speed is fast enough.
 	 */
 	rc = stk1160_scan_usb(interface, udev, alt_max_pkt_size);
-	if (rc < 0) {
-		kfree(alt_max_pkt_size);
-		return rc;
-	}
+	if (rc < 0)
+		goto free_array;
 
 	dev = kzalloc_obj(struct stk1160);
 	if (dev == NULL) {
-		kfree(alt_max_pkt_size);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto free_array;
 	}
 
 	dev->alt_max_pkt_size = alt_max_pkt_size;
@@ -379,8 +377,9 @@ static int stk1160_probe(struct usb_interface *interface,
 free_ctrl:
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 free_err:
-	kfree(alt_max_pkt_size);
 	kfree(dev);
+free_array:
+	kfree(alt_max_pkt_size);
 
 	return rc;
 }
-- 
2.54.0

