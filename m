Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D79345ED5
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753615; cv=none; b=eECeyjMX16hTcH94kLZnmduiAzdKPYbl8h18e9wlFjuPZT8cA7rakqxhT4/O1BmZHfFphlYh8IlrNQO3VkWN0nTB/DnHRjxGYBNTLbekwQ3K9TLZU4gfkuP+9h1ppXZWQPRhK5KR+bJNN9Zodwmhy066v1vsL90AxKjvDy9q33w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753615; c=relaxed/simple;
	bh=wd36Mr3YTeEOobPW20YCTlYcPkBxI7qt5NNnKBJ1b2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q4PRVj4fvyfWSXo1OrD4kxsTSQmYLyGUCK3icWgntwxzW1UNK/tnfd1o1FhZH2QiomvNowhp2L0RAZJVyjJHztqgZOrrB2TLCRX2Sqc9lGP6GmoDMvWk53iWRVjGvwTsq2J3EFVX2s7v7+9rw4rZQadYjTbrTEj+5Uk1ybKzL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abUfNNwo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abUfNNwo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38101f85591so3063333a91.1
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785753613; x=1786358413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=STul+ZYNBULZFVtjqLupAxbSwpG28GFI6NairUsKHOc=;
        b=abUfNNwoC8XBR7iGBXZYDB2duZPJk0EEfTAr5XAchvAaoZLLptP9JR/9SUMGPLNqSw
         OGFb88zWSRdkhpc6p7R8L5yh4gyHFtQ7bBZQBL1KI2Rj4BUn1p9LGaRpaC9A1O5Oa0aa
         +4qeN3W4ThXyG3y1+AXW4+TOdZZi/MZVMBr7417H1MieCJbDrPkwEX9uTLgpSKjGXDcW
         L9RFiPUHqjVxWX+gIB5bVcQt3ZrIhWAg7qIMlc73KeMHGSBTNrRkp+BVoclIDEFTppGM
         3pm7g7UJg1Oz1jIyYAu74hF77hJ887zUsl/0z64ZzjOooRKgYK9PYgsbJYwjXcMPZEGs
         9MPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753613; x=1786358413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STul+ZYNBULZFVtjqLupAxbSwpG28GFI6NairUsKHOc=;
        b=VC2NvjyvVnyz2AKxdSvvn6jXopZHb+bRlh/7619gVNyMYslZP7z1i5IVGLF4dUsrhR
         ZcoJ9h03+XJ8dtW53oRw5bGLdNr9fl9gvtQ5+sAryfl0EoIhCAsjKigUsJiA/dtq82no
         7um9aY/ZUbfkUH7cKML7TFXiqKAh3hHPLV3lMtpYtSD8BRYWZUBacxdly6MRd9HvPcH2
         ye/lDKjMNouK2OOae5/lbslOsGeUFEzPEcyo90aZhUmaVnaWyu3yIRZZjFIrv6Cybdpa
         qI16k38kSLk5oWd2gU1P0AxU0SrmZ7V989wLGi5X1HHkhACPsEfLkLx6xMaKZJLzfDSu
         P4Sw==
X-Forwarded-Encrypted: i=1; AHgh+Rpl+bSZ9D6y9Khywa2tLte22ZUZfmN1Zt/WNA8fmbSHpL3y+hGjYp2X6zN+qb3UGn3+eRkuELdBWCm1+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YygeknSE2IwjgjY2QACoFUFRPyxrxNnMocTpfslJCYxo/ebSn24
	zgFjMjoLQ4jdz0bB5TiLgupghBGCBp++T9242nJ8P/I8AR5umzgTcrhd
X-Gm-Gg: AR+sD12njENT1qRSRWcedd1ga6OFPzFw3+FzG0FCyomgdhpKucEU+OjWDYX3X0nPwSz
	4cPBh7ioCJ8+7j/wkIQxQ35kiwy90lr4A1QHuwcgxkEPkJj5h3jGZihHIlp+DAKHGDQwNNBDrxM
	r7sNfLE/FcY7JFNeMMacMOIY3qawKxOIXy7BT1C8IGu7wn1mcwHAQIcmwCmmK8E4G/Xe2rBk3LX
	LFs+ejNzJ+P87RXRfm7t6/JYq6Yax18EJSHITHUtbnxqdBuQj2al1VUhsji/Z/c3Bed1ZFopUuQ
	k1U2n7ynT7/wY0dNf9M4BunfRCPMWYG9QrCgYlSQLPopRNOrihI0hiW1SJT1RZcM1eulhXXSJzC
	YBF912Mvjgnahl+l8Uh/f8j0EfqUZrMNBJdznsQWYQvoeAuZzXjFHnmJvkJZUEu9qAdMf+gaefC
	rVeMfEdkCHvBHZjfbG+2zz9mwvL5NnPkYgPsVksFAndWkmk/fak8pzFtEraK8Pw7yj9bt70LaLI
	kgC7S2E80eWm64Jh2H2BIQf4KEwpONUUElQ
X-Received: by 2002:a17:90b:17c5:b0:387:d5bd:622f with SMTP id 98e67ed59e1d1-38fbcae2162mr7349457a91.18.1785753613490;
        Mon, 03 Aug 2026 03:40:13 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm33263736c88.1.2026.08.03.03.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:40:13 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: isely@pobox.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+20fef510634faf733060@syzkaller.appspotmail.com,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: [PATCH] media: pvrusb2: fix URB pending flag leak on invalid endpoint
Date: Mon,  3 Aug 2026 18:40:08 +0800
Message-Id: <20260803104008.2605452-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In pvr2_send_request_ex(), when usb_urb_ep_type_check() fails for either
the write or read control endpoint, the code returned -EINVAL directly
without clearing the corresponding pending flags (ctl_write_pend_flag or
ctl_read_pend_flag) or going through the done: cleanup path.

This left the pending flags set while the URBs were never actually
submitted. On the next call to pvr2_send_request_ex(), the URBs would be
filled and submitted while the kernel still considered them active,
triggering the WARNING "URB submitted while active" in usb_submit_urb().

Fix this by:
- Clearing the pending flag before returning on invalid endpoint
- Using goto done instead of direct return to go through proper cleanup
- For the read endpoint case, unlinking the write URB if it was already
  submitted and waiting for its completion before returning

Reported-by: syzbot+20fef510634faf733060@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=20fef510634faf733060
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 3c270ef00..3a857e95b 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3669,7 +3669,9 @@ static int pvr2_send_request_ex(struct pvr2_hdw *hdw,
 			pvr2_trace(
 				PVR2_TRACE_ERROR_LEGS,
 				"Invalid write control endpoint");
-			return -EINVAL;
+			hdw->ctl_write_pend_flag = 0;
+			status = -EINVAL;
+			goto done;
 		}
 		status = usb_submit_urb(hdw->ctl_write_urb,GFP_KERNEL);
 		if (status < 0) {
@@ -3699,7 +3701,13 @@ status);
 			pvr2_trace(
 				PVR2_TRACE_ERROR_LEGS,
 				"Invalid read control endpoint");
-			return -EINVAL;
+			hdw->ctl_read_pend_flag = 0;
+			status = -EINVAL;
+			if (hdw->ctl_write_pend_flag) {
+				usb_unlink_urb(hdw->ctl_write_urb);
+				wait_for_completion(&hdw->ctl_done);
+			}
+			goto done;
 		}
 		status = usb_submit_urb(hdw->ctl_read_urb,GFP_KERNEL);
 		if (status < 0) {
-- 
2.34.1

