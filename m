Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041249EC5B
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593656; cv=none; b=JfrK3iCxjR0SLM52BAHQdkBA1i0vSRBQZYV+4I5t0WN11vAex26QAzLy7ihVYXThKJ05vAilBCAZpH1O27KFyTZG12BdP6X4s4ugA09PkCUYrEypSqbUfbWB/r4+hg3WlPA5i243xMaUgi8dQpS9ptOZ9soPdt3LoMNQjqi2BLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593656; c=relaxed/simple;
	bh=kkGPwKFmXU81mnhqPqoHHXTsASBpf9HUL+51dXOXJ90=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=n3LwABIQkmuiGfu+/7XPhrkMYQEUbjvOJEcJLVZVTr5xp13DurHLaU8qmsN2FFMWXg5VzQwVQZ6MpasiHEk7gR9d7A7lVeLknZzAxoUpBaW3Z0jdXXowTR8VslPqzz4fVaII4qzhVmL97N+Afm3lLrqgW1mpx+j8teA1azg0kUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=tqEfMbHc; arc=none smtp.client-ip=43.163.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="tqEfMbHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790593644; bh=/f9/niwnhOcBxunscYI2dEwEgE14X2j3gJIDA5iwVng=;
	h=From:To:Cc:Subject:Date;
	b=tqEfMbHc4b5curbTRSKrDod7Vn41emkz6QiF38hks+F6uRvHRDFw9M+UtuGwP6HTT
	 lSSHQ+lbMLuFCt/fSzM73o9ff/TjpQ/IA6b1aO9TlhJhSTgXPPes3WDkdfQU6ALw4L
	 0Du+rprFKevgnvaic+FbS/CLpfoH1MLj/NCDJvag=
Received: from gets.localdomain ([39.146.119.238])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 1D39143D; Mon, 28 Sep 2026 19:07:19 +0800
X-QQ-mid: xmsmtpt1790593639t9ial0jku
Message-ID: <tencent_EAFEF76E0657C04EE304E09B471BF8AA0908@qq.com>
X-QQ-XMAILINFO: MMwjR1C73eIs8AcGtfKcyyHzh4pB9O2XFu0KrhzAqAaKT+KUR41lsk+EqtAbeE
	 a6iR1z1Lh+dDWiWFAVsKHk7rwiWY8jw/SueO2VFyHXLI2qSD0v49PrIvAsboNsdHuyj3y3lf44pX
	 Kcxg53pu8HYfEjgGDlMO6bt+FXRKoRslRlolgwkjs/e9buvkeNHGRVdRrEaBQ64JBLULjPSyC66k
	 Q7lZKACiQjitXNa3IYdEEIO7v8flhYi3Eo4ZhREMsxyjF/cfRDStKsCMTpzBfBfKk8xDeLcCEOwc
	 xhcExMCX03pmRmfFUoH6AV3qMVEbxJE5RGCEv4HHuJe9flLAhjSUl/7uDEckyZt6bxMV82I+lQ6S
	 RORS2swAR5HRxWWUfYPduPDlvY21IucWedKlwFPCYKytYUszZad5WGO8jzAvOD6XBRfs6TiulEE3
	 vdvuegJoopZ9zlR51NYnclxrhcVV3TGtVLVOROc96J7+rLLopEN7xAkkXa8YSTygBDJNzgFDvs0a
	 85As9JE/dU2Ek99f4mmqTgPPZkqCW17VcMjelo6NZzZVGEudFvKTJBEoDKwO5L7mrDUEvs+ID8H+
	 memSIeifHhCxVY6etM60kqUFS3mQpFSpSiac9vBJuZUrCfTBglxrxwkrt2cWsU9+1JbXf+F8UDSp
	 PmDWlDdB1hMIIu7DIG37onzHlCmZCsVpjxNSgnL/l0jxABwe7LUREiP0r9VD8pQVTHpggb68NPrU
	 T/hhoOdGQtMvAW1IjWLXCsWjri9FX6h2iF7EnFLLK13gvgKhXvVSfuSb1OG9aDdLswlao29EVuZm
	 mKU1ystdIryS0tUAj3cJY+N+ivyhJ0aQyyWMX8Fvg/4aPgs68IwHGh+AcwvT/wWzwAM5ZoSuH38M
	 sPdhJzuI//6E16o129izmPbvXJvTZnXk2sKoPyvq7UWM/t660tY7XNY87m4rPLSmjDpiSW3MOc3M
	 J+k4fVe3m9ZaPsQOP+D9TaWULl+ka7sCY8PCwUcaFTT7rkizCG2BN+TrcMt2Rj
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: pwngets <2605452642@qq.com>
To: hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	pwngets <2605452642@qq.com>
Subject: [PATCH] media: gspca: fix stack overrun in build_isoc_ep_tb()
Date: Mon, 28 Sep 2026 19:07:18 +0800
X-OQ-MSGID: <20260928110718.358182-1-2605452642@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

build_isoc_ep_tb() fills the ep_tb[] table that gspca_init_transfer()
declares as "struct ep_tb_s ep_tb[MAX_ALT]".  The bandwidth sentinel is
stored at the top of the loop, i.e. before the "found" test that decides
whether the pass produced a usable entry:

	for (;;) {
		ep_tb->bandwidth = 2000 * 2000 * 120;
		found = 0;
		for (j = 0; j < nbalt; j++) {
			...
		}
		if (!found)
			break;
		last_bw = ep_tb->bandwidth;
		i++;
		ep_tb++;
	}

Every pass that does not break raises last_bw, and the candidates are
the bandwidths of the nbalt altsettings, so at most MAX_ALT passes fill
an entry.  The pass that ends the loop has already written
ep_tb[MAX_ALT].bandwidth by then -- one element past the end of the
array.

A device that presents MAX_ALT (16) alternate settings carrying
isochronous IN endpoints with pairwise distinct, increasing bandwidths
reaches that pass with nbalt == MAX_ALT.  On x86-64 the store is 4
bytes at ep_tb + 132, which is the upper half of the stack canary, so
kernels built with CONFIG_STACKPROTECTOR_STRONG (the default on the
major distributions) panic in __stack_chk_fail() when
gspca_init_transfer() returns.

Only the device descriptors are needed: the store happens while
VIDIOC_STREAMON is being handled, before any isochronous transfer takes
place.

Give the table room for the terminating entry as well.

Assisted-by: Claude Code
---
 drivers/media/usb/gspca/gspca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 594d73e..64bb818 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -753,7 +753,7 @@ static int gspca_init_transfer(struct gspca_dev *gspca_dev)
 	struct usb_interface *intf;
 	struct usb_host_endpoint *ep;
 	struct urb *urb;
-	struct ep_tb_s ep_tb[MAX_ALT];
+	struct ep_tb_s ep_tb[MAX_ALT + 1];
 	int n, ret, xfer, alt, alt_idx;
 
 	/* reset the streaming variables */
-- 
2.34.1

