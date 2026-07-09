Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19B280CF6
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603291; cv=none; b=gZ4QFKQT0obY6WAih3fsg9HHb4tuSmn+CJGr0OJrEBney+ISc4IVZytrLam6hRCUj3eZs0ugMsLicWmi78D4HC65PChwMup0vGoBd2k4H9+rkF12rqapoQzUX/qdc3aQdxQ9bg5/dgb0DYHq2t72b8II/Rk1oQ12/BisPhfanJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603291; c=relaxed/simple;
	bh=WtTBgcmnHtv1pAYHiul1Ga3BWXNSOwi/34J6VWd0MDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGoIt9Xxzb/+JrMmNw995XP/rdzH+5iekKPEQqwBfzDepjVM2RRUIFQcfaqCpwB3r6ybPbuZutcIETjg7UDAbY6isDQbzEHi8AjzI9fBTVfA1e8B1wfpL3Oe+6+ODhlzzzoSj2x2pdh+uYVy0snTXdrVo0NEcIhbzIsEuEPR7dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ALANPZ2x; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ALANPZ2x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ALANPZ2x";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ALANPZ2x"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16ED57606A;
	Thu,  9 Jul 2026 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783603287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAgK9nE7znkT2mO8Waz8g6StkdgS+jWk6LKdL3vtKTU=;
	b=ALANPZ2xiuWMqbG7RmwAL0tdjojRfxrCyWXPX9WyA2V1VmB0jrg36Lj6P1mGwtVCI1HB2d
	wIzb5AJQockYbtpCf8N3THZDlhvFON4hZMu4d6Y1UMmkA3gAdHiJ+P1X3UNIRffHtuY6rP
	+NeyMDWfB4jiLM7vzGU8dL/UVLAhneQ=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ALANPZ2x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783603287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAgK9nE7znkT2mO8Waz8g6StkdgS+jWk6LKdL3vtKTU=;
	b=ALANPZ2xiuWMqbG7RmwAL0tdjojRfxrCyWXPX9WyA2V1VmB0jrg36Lj6P1mGwtVCI1HB2d
	wIzb5AJQockYbtpCf8N3THZDlhvFON4hZMu4d6Y1UMmkA3gAdHiJ+P1X3UNIRffHtuY6rP
	+NeyMDWfB4jiLM7vzGU8dL/UVLAhneQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2C9A779AC;
	Thu,  9 Jul 2026 13:21:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ANtNNlagT2oTKgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 09 Jul 2026 13:21:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] media: stk1160: handle ESHUTDOWN gracefully
Date: Thu,  9 Jul 2026 15:21:24 +0200
Message-ID: <20260709132124.1453410-2-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709132124.1453410-1-oneukum@suse.com>
References: <20260709132124.1453410-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 16ED57606A
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Give it its own error message.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/stk1160/stk1160-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index f4baf9263286..020b75fc5b2d 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -48,6 +48,9 @@ static inline void print_err_status(struct stk1160 *dev,
 	case -EILSEQ:
 		errmsg = "CRC/Timeout (could be anything)";
 		break;
+	case -ESHUTDOWN:
+		errmsg = "host controller removed";
+		break;
 	case -ETIME:
 		errmsg = "Device does not respond";
 		break;
-- 
2.54.0

