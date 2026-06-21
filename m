Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03EC40D56A;
	Sun, 21 Jun 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782069760; cv=pass; b=h0iMt44kTWi/+BPeWuspsuVUB3xnR8L8HlMxF8l1VNRzod7d8tN0sIvvGKMI4HZHpa4FH0fvhFeV9HZ5S1Mor260Igoeopu8TslziU+O/MwamRqA0ISM6KODRtpGfnj2u5foSPeAKbYa2w2x32qyEAiw3golfyUhtXZ6Rd+pZjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782069760; c=relaxed/simple;
	bh=0GnMfoCpwpfCJs55l0E2Z9x3vvvURGByfOveIyXs0x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n7Sr8SOb9EU2DlbvEJuPfaYYOkh7QM44Qgw4ua2w6HZKB2joDPihWU9uQRBSH2EgRQAwAHYbsuH9hg/CKCWy5vehTMvVzeJFGxA4wQKeTtVowsc8qWqMDouLREUu1Z9HDS6k3X1Y/l/GvlUTZH2aVPZbh3Smt8vl+j02rTz65Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=henrialfonso.com; spf=pass smtp.mailfrom=henrialfonso.com; dkim=pass (1024-bit key) header.d=henrialfonso.com header.i=contact@henrialfonso.com header.b=GMigfNLX; arc=pass smtp.client-ip=136.143.188.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=henrialfonso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=henrialfonso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=henrialfonso.com header.i=contact@henrialfonso.com header.b="GMigfNLX"
ARC-Seal: i=1; a=rsa-sha256; t=1782069753; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nb1zHl5m0g5m6hJcS1bTcf2gV3uM0g8rAVkT68gZNWQrYQk8xsx0QgjX85g+cs0lj3Z6KZl/DqCevqnTYbxwb3yr8aoKSiqjlZqarkYJPJ4PthncQMrO7Qvf0CrN0IQvgchZ3sqn37RpTwglnDVSXYj6L4xNuxN2JKlCqOFacY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782069753; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v9qq0fVgwQRt+yRFMyxt8b9sptUetYvnfJv5xOfTwd0=; 
	b=fWGbu8yeJOMPaTvPH0kz+ZnHsJ/9Ghs9mlAcLv4M491tIybD155xt3CLJZJ8hc07VPmTRx1qwUv8PO5LTQm5MU6QOIm8LZA3S3Ct9jnpd9ICuKbBWCyVaaeao4ddY5wdgIDTLVW3Wb0Q7fiB3Guam0ne+Gfy3eQ0ZQPGi+IQ74o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=henrialfonso.com;
	spf=pass  smtp.mailfrom=contact@henrialfonso.com;
	dmarc=pass header.from=<contact@henrialfonso.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782069753;
	s=zmail; d=henrialfonso.com; i=contact@henrialfonso.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v9qq0fVgwQRt+yRFMyxt8b9sptUetYvnfJv5xOfTwd0=;
	b=GMigfNLX3rRkyElfGDaK23Qwdx9aG8FnuFZAmshQCJt8DquZx+2AShiMiIGztyIS
	+KN7mvhuMv7w2DVH9p7MXNndOrpOp5GJ1rtbFV0berQFGiZw+5nStjmRyIqcRD6aaEx
	tphXU+oBfuiOzCV7/X2lhBTzk+WjXsqv/4SMLMX8=
Received: by mx.zohomail.com with SMTPS id 1782069751224697.7359679156667;
	Sun, 21 Jun 2026 12:22:31 -0700 (PDT)
From: Henri A <contact@henrialfonso.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+0cd0fb4cf3f4722d6663@syzkaller.appspotmail.com,
	Henri A <contact@henrialfonso.com>
Subject: [PATCH] media: dvb-usb: dib0700: reject zero-length I2C reads
Date: Sun, 21 Jun 2026 15:22:22 -0400
Message-ID: <20260621192222.337738-1-contact@henrialfonso.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Reject zero-length I2C read requests in the legacy dib0700 I2C
transfer path.

A zero-length read is passed to usb_control_msg() with a receive
control pipe and USB_DIR_IN. usb_submit_urb() treats a zero wLength
control transfer as OUT, so the pipe direction and setup packet
direction disagree and trigger the "BOGUS control dir" warning.

Return -EINVAL before submitting the USB control message.

Reported-by: syzbot+0cd0fb4cf3f4722d6663@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0cd0fb4cf3f4722d6663
Assisted-by: Codex:GPT-5.5
Signed-off-by: Henri A <contact@henrialfonso.com>
---
Notes:
- syzbot accepted #syz test requests for this patch, but the test runner
  exited with "FATAL: kernel too old" before reaching the target warning, so
  no Tested-by: syzbot tag is claimed.
- Local validation: git diff --check passed, checkpatch.pl --strict reported
  only the missing-Fixes warning, and dib0700_core.o builds successfully.
- I used -EINVAL because the zero-length read is rejected before any I/O is
  submitted. I also considered I2C_AQ_NO_ZERO_LEN_READ, but kept the guard
  local to the legacy DIB0700 transfer path that triggers the warning.

 drivers/media/usb/dvb-usb/dib0700_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51e..daa541b1b 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -311,6 +311,11 @@ static int dib0700_i2c_xfer_legacy(struct i2c_adapter *adap,
 			st->buf[0] = REQUEST_I2C_READ;
 			st->buf[1] |= 1;
 
+			if (msg[i + 1].len == 0) {
+				result = -EINVAL;
+				goto unlock;
+			}
+
 			/* special thing in the current firmware: when length is zero the read-failed */
 			len = dib0700_ctrl_rd(d, st->buf, msg[i].len + 2,
 					      st->buf, msg[i + 1].len);
-- 
2.43.0

