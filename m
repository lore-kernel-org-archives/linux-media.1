Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1553EDAC3;
	Thu, 16 Apr 2026 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776369540; cv=none; b=OJEwSJD+kBwOT4LELlYD/+bIQfItFIZ1I2l6NpjGKSLcTIFTt51wk2gS8gxzRu5aaFfUeye5ICR/oMbGfW7lTdNS5enTPMiDPxLm5btnBb0Wf3xSYG6WiwM6tPOgi9AJ4+LxluquxQULAU7kx84yW/Z81Ga7d9/zFWNE2jA2+Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776369540; c=relaxed/simple;
	bh=OLYLo1fNABgrHy/L58BpPBLYtc+wZSkEaMxsZof2Oi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SZY8jrCt7Cwc/FYelmb19y5mcQP/7rH6QbRugjigULLfsnCHqeeiclDFRrpYT7dczYlIYfcSwwE9bGCpF32+VgaJb/lZvBFDYeqq4P8OUdvbysnwsnfv/tnGKO5LsOEzkA8NuxkAcj2YBfI+tZtU3ynmfAYcLRjlUDgNUxUAU8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=q5olt0JR; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="q5olt0JR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BW6VYBfsI5981SCuWN9OSRVAoHdL0JQKHn2ThBxkJb4=; b=q5olt0JRQ0U/cuv/zuEltZw0cC
	GdKhK28M+0I8WMDy+rKhOmLCYnqwMm43MJ+xoHI+vdi3fD0zdEFYAQ4hbEOpmjrcIHfNg7PJASoIq
	B/XcPHz3ShLcB8+rLlni7Gvy6kebtf36beyf4ilUq+1I0NRTCUvrYOHGoMfZcDdG1bGZ5jPwn+//U
	CdmmuyhQjE+e2/XL1DQZ9tyZqkLf19hK7/pUMU+bASFjFSjnoE6DgWHMbDd+J1ASNh34+7dy/D4h1
	P2oSRNEP4QPTAKCFVfwiEtv45idAAGlRYxLr/UOYVugIS6YmKCslOREr3oVPptUWUu2eKU32P90kh
	z6mWBgMw==;
Received: from 177-136-88-193.vmaxnet.com.br ([177.136.88.193] helo=[192.168.1.54])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wDSrR-00H92z-MM; Thu, 16 Apr 2026 21:58:49 +0200
From: Heitor Alves de Siqueira <halves@igalia.com>
Date: Thu, 16 Apr 2026 16:57:01 -0300
Subject: [PATCH] media: dvbdev: fix missing refcount update in
 dvb_generic_open()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-dvbdev-refcount-v1-1-34b3f28cc390@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqEMBRE0a3IGxvQ4K97K+LAJKW+HsQmMUEQ9
 27U4aGoe5CHY3j6Zgc5RPa82oQyz0gvo50h2CSTLGRTVGUjTFQGUThMeg12E3X3UbptUUlMlF7
 /tPD+FPvhtQ/qB73dGTrPC4W42FdzAAAA
X-Change-ID: 20260416-dvbdev-refcount-589bc77e42ef
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Lin Ma <linma@zju.edu.cn>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, 
 syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

After introducing a reference counter to struct dvb_device, it's
possible for a dvbdev to be prematurely freed by dvb_free_device(). This
is due to a missing kref_get() in the dvb_generic_open() path, that was
not balanced with the existing kref_put() in dvb_generic_release().

Add dvb_device_get() to correctly increment the reference counter at the
end of dvb_generic_open(). This also avoids incorrectly increasing the
counter in case of EBUSY errors.

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Reported-by: syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
Tested-by: syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
---
 drivers/media/dvb-core/dvbdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a..84575610253b 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -147,6 +147,7 @@ int dvb_generic_open(struct inode *inode, struct file *file)
 		dvbdev->writers--;
 	}
 
+	dvb_device_get(dvbdev);
 	dvbdev->users--;
 	return 0;
 }

---
base-commit: 1d51b370a0f8f642f4fc84c795fbedac0fcdbbd2
change-id: 20260416-dvbdev-refcount-589bc77e42ef

Best regards,
--  
Heitor Alves de Siqueira <halves@igalia.com>

