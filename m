Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295663DDB03
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356052; cv=none; b=e48vZ7Ra/YBmWkhDX035wBx3JRx1hiVbn9BvhcjVwnrtgdG/eKMPbR+KYV7x1gnVmGlX9AMydCQIebJhDMAKv/kxH9KwMuFSMwVKkStmTGzGrVIG4+jYsEFpDcX7AhDDER7RBLZ7n0Ys3p9rK5y359gHpfx7UOyGWlha1g4Dqrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356052; c=relaxed/simple;
	bh=3POjkudjwJ6EJxTxrfVNUQfMbWObNEMuI07xROIvu0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIdjXCFfRWuiFv1unEgvDaMMK6GEPZCffzIayrV7mQEgSXdzJOwvnx0Eb+R2utauN/xc+sIViEMQ8dRMbZM6fUqrYOv+aBhjlgH5+Z+B5JWKLgMIT7aUKESXCmgCiPRWskyaSzbTY7rvBuXI9xkMSp3tBEwJ+PpYxVJEGVSA4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls12/Usw; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls12/Usw"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78e1a94b8so503003a12.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790356037; x=1790960837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU0uuuuRr+p5OKNIYAUGPnmlCF9GOux6FtDbWrmbBmY=;
        b=ls12/UswfmD2c8TY3P+N3aZZ1F73eYVSjDZwmKy7n6iORAnUk8PG8zUtJ2YyxUZNj8
         lcMI6hcTMH5X6etUWqlx1FkET6L4FsYMgo15eQpdbX4yyeTmG9NNnd9mrQEm8Z0SpQuc
         kQRUQPVBGEO4mBCyuSR7cH7ilV/j9NNTdYBSrB5yjmH4rHy2qx1IaqbrMYb+DKzs96YI
         mHra2QeI0TGQzulnT2pUO/OVcCGzybgNvDcfwHJnspnaDE2Vbfk/e/45KNZjnT6PV53x
         WP1QbkdYEiLoO3w4yzQVdf88I9w7BlkONi6TVrBhwMiR39r/GCT6c7v760g9RdIzVOO3
         mZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356037; x=1790960837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jU0uuuuRr+p5OKNIYAUGPnmlCF9GOux6FtDbWrmbBmY=;
        b=iZObKOfZOEzvlsAl76KzLul23WHEP9kzP2jLMGNP2tDLeYDVRSx0DqZcfnoUm0uKQw
         gBqk9dYH157WbQ1BHFe5ccLjG/OlwLP8kwVek5LN+bmaGcHfT8KYrvRWf40NTxDCHlJM
         m5VAWQrMmxsl/q5z6HBZscMGye5JC6QYiZgQuZ7uGkSYIBNgivO/of/iEJA3MR9qxv6t
         NYLYX1peseWpnANVATzW7Q/2XbeLpBKo5lUqUQ7X9q/eKSQq1c7Ue97Zkt3/TYE+lBns
         nlTa3YBBUZCO38gupsP3GZyd8JSl7kobuSJPkIHd5V3Olxau3feH8+AdRKnhY20Zn6Tc
         pd7w==
X-Gm-Message-State: AFuF++mk5iKsAri0t4GqSekXxXTZ6BEDdMoDSrcHcMSSU+fY5R/V3438
	ChgqFZieHnFfJW0PWKyTdpeD5+VEQfR8qsEDvyK3m4MLxe7iPZS2Ibod
X-Gm-Gg: AYBFou0CXqFtl74teNSDFlYJD2qh+nuos/LP/+YHE5WWHw75czhSwdOnhhKs4JJ3Lvu
	ZTzGH+oXkD48MowYAqvisgUr4TbnSSUgxVhcbvD1Q4SyiFWIxXuxV8o/hEOWDDOp/GJn90SB1re
	GfJt11E19wUn5B3zDv2HyDZEN8L9yPu9RB6gsofdKpZcc3CyrpgTPXVwU88g5OH+lRCR4jxHQyM
	bZPaDJxIwIyqKajHcBZc8BkaXmdnWEnhUJMXSCU8ep7DkwegiaCZT6phlAK/pTa5Ly8KYeIOQK2
	n/ug0CN8TBIFQHbkf3yxD7tbnembgraAP3nJivcjOM0ejW0YOyz0zVYEELMyKPt2CKH73G3zITk
	VBNMLkKGTE9Z4JKXEY68fMK0lsrVMANYxrU2jcHA0jZhpHIIcdsGkKnsoD9jU4TVXKZLGjvkK1r
	stZgCUYQbpt0zI3dhb296ejtc0ltYd29XOH2ddMhamTrTAB0tsmsqt5xbJ8KOynFT83ZBObXtOu
	clMviBgnIb5UFUkC2EH3NNbwKE=
X-Received: by 2002:a05:6a21:e93:b0:3dd:a196:53a4 with SMTP id adf61e73a8af0-3de0e97b9camr6669562637.70.1790356037407;
        Fri, 25 Sep 2026 10:07:17 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:6850:49fe:a642:bbf3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8811c94d5d1sm285987b3a.21.2026.09.25.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:07:16 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: redrat3: unregister the rc device when probe fails
Date: Sat, 26 Sep 2026 00:07:11 +0700
Message-ID: <20260925170711.22447-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

redrat3_dev_probe() registers the rc device, whose input device points
its name and phys at strings embedded in struct redrat3_dev, and only
then calls redrat3_enable_detector(). If that fails, the error path
frees rr3 but leaves the rc device registered and leaks it. Reading its
"uevent" attribute afterwards dereferences the freed name/phys:

  BUG: KASAN: slab-use-after-free in string+0x4a9/0x4f0
  Read of size 1 at addr ffff8880272bf758 by task repro/4968
   add_uevent_var+0x183/0x3a0
   input_dev_uevent+0x162/0x900
   dev_uevent+0x2f1/0x870
   uevent_show+0x1ca/0x3a0
   ...

Unregister and free the rc device on that path, mirroring
redrat3_dev_disconnect(): stop the URBs first, since their handlers use
the rc device, and only then unregister it.

Reproduced with a raw-gadget RedRat3 that reports detector status 0.

Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Cc: stable@vger.kernel.org
Reported-by: syzbot+2a123f6269da57ffefaa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2a123f6269da57ffefaa
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/media/rc/redrat3.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3f828a564e19..e9dd563e9cb3 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1111,13 +1111,19 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	/* might be all we need to do? */
 	retval = redrat3_enable_detector(rr3);
 	if (retval < 0)
-		goto led_free;
+		goto rc_unreg;
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(intf, rr3);
 
 	return 0;
 
+rc_unreg:
+	/* URB handlers use rc */
+	usb_kill_urb(rr3->narrow_urb);
+	usb_kill_urb(rr3->wide_urb);
+	rc_unregister_device(rr3->rc);
+	rc_free_device(rr3->rc);
 led_free:
 	led_classdev_unregister(&rr3->led);
 redrat_free:
-- 
2.43.0

