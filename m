Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ACA1A6813
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 00:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086077; cv=pass; b=iEWYUtx9ZTWU/LH3ennU0PNGuwC1AZ0lWfHyzPH4tXAQf0+yssZLl+RazIhmJ9eDPDSNtraYf6rptPPMH63fR4JNm4fzpcanfL6Y/27XPu+awOw04+oKU3ocTMQOe9wcJRBSIec1MTXK1quPJm6jHWOdCCQWzUOTXakN1xbBAJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086077; c=relaxed/simple;
	bh=hrC3CZNtK6yS7r2+RY5W9pabOYMUQOPoehpW5H2xwlw=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=QaShJ6JX3GTsM2mUBFVhDCH1F5RRPHwG4xgjGooG47c+cg5M0sxilkmke2E+Xz/Eyie/BVNcEa3B2D/0CHG7xKDUMS+WJa+ERYYXNBN+dToCH7TSkpikKoUqOjH2U+/L3raRNc8pz7EdH+p2ENWqUdGJo4244Qj66Zkk8rm7I3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=CKKR7SHn; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="CKKR7SHn"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso257126b3a.0
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 17:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086075; cv=none;
        d=google.com; s=arc-20260327;
        b=hsMw+L5iZ2m7IQ4CfegmgDyke/TuILafQjzN2qNwgNiTQC63nQhsq613AdylA+Ucw4
         kRhnidt/lg/rj43NJZ7wS46tYv+90DJQb1QGHggdl1aXYzK+WsXSY3a5t6/ertv9/a74
         rA6NwdcMKzQca+nWLTknI3+Xzu5M7mzEegmnbjM/s2HFE3drGZYfGc3lS0Ekmv5WJciR
         jMRenxwfNl/xkIv58tEVGw4CptGvwn4i7hv13XchYNMlDlguxIfpBcEFdEUqgs3fNv8l
         DZuETcrDt0zl5vGByVBKpUXeVvH5dZZ58jIU/05xH3w1uVoeZxIlqeePhYPsU6SUrd/l
         SDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Vqmq5tNiyBg959JtrG/LPDjR/CFPsT9DkZvL6x96FQE=;
        fh=3wV8nuv37v6eowM7/a16DDyx12Lkj3oSkMGBF51I28o=;
        b=QVncYwU+5it9YY4/tvgXDQ/svtfwFil6E+Z3EhdozFnKHpNVaUBHVQC22djnBlyyDT
         fU3rsPp+d0lXv9eirMMsAt+YrgdUeiNF3hiqc8OApNASfsC5Nh7mayrg/yt86ikanndO
         Ptmz5DSSBggdTi6AcLYnEtOss60wFQ7qbgpO9bKSb8FIWjFB8BcpySMwsPFKpSSPq4sq
         JYBHurs10DCYaDEltlzjke8bItOGrbWLDObLNfCMmZ7VmvcfOokDQaiF6J/NZWKOAnIF
         OhC/5Gad7qaJMYClc7WFSBz0iaMeLx7Axwj2heYNTauy2jnu4aal4gIgjwK04VDXvOJA
         GPdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789086075; x=1789690875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vqmq5tNiyBg959JtrG/LPDjR/CFPsT9DkZvL6x96FQE=;
        b=CKKR7SHnh/M8yZ2vy0AUwZbFyRwKBQo0Hrfi/54jMTIc+SQs93t/PxnkKKE3LfQlym
         a1Btbe0/wP4pF6IqFc1haneh9gYGdXyaeda945ahGp6+RGLO9HyaCycK9U2xdt9UkZ0b
         O3vSX9+i0++oHm9aQ/rWo8CdV8wzAdq/U2elEGBG7uSDiyBDBwIdXgr4VG3iiRMAZ/cj
         2KbaDWJmqz5tR//+Pz5khNwQ0xh/PYD6mmhLdVboXMpBwMItSMIbWbUyCsAK4qJZlOxC
         b8/rhwtCBXs7pwoqCAXynP++PF7Jw0+gSIX3q6uOW/xmjfnmlUNEx5+KqOhCI2/ab9m7
         HtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086075; x=1789690875;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vqmq5tNiyBg959JtrG/LPDjR/CFPsT9DkZvL6x96FQE=;
        b=kaucwyRSMfUQpvCFzaGoAcRS2FQ82WG1j2yhmRjkuHCFEFwOKrurzlqzwfYsSWJqk+
         eemPRr0/M5VgE++SLu7SnTp66O+wEOosPzLhVo857n/KHA4g1r8OF0sybVHoTTpa8wyo
         j3LNNRXknKKT9eEmEm4ZN8EoBvYk9lJtoNKEX06EOfXM57y+/SZeTHZ2Z7fWQ3owjSQn
         ct8gzgPShRY8mlirUp5sr94h+dS/oBu1G2F0R5nWJROMyBOgwQJKxSNhqe24EAGKt2iz
         is6CoxkI5qAbIeltJcalheR1MG1bX/4kVPy/j9m1d+2Xaf/sc0EgUGywOeeyZdZfA5fq
         7isg==
X-Forwarded-Encrypted: i=1; AKwUvBx5k9xCmWPsamysQxudCmHdEIFrWNdkahyt9zFaMG+hTguI0LQ5jJdEqvUr0ySQ/YlaQYp5ZODO1wwOSA==@vger.kernel.org
X-Gm-Message-State: AFuF++k5vxLPKiUae5OvGoUnNBwIYKreiKqJWNThUS9+ND46yKwafXZX
	JN9ZKzowZtKv6Zgtfmn6iiM1o28BChGKoM0RGhqH4w9KU179yrZILzIuv7HsRVPE5ZpvqQ2P5LH
	8jJMLnv5tJwu/aIrufAtly7zciOvyEVDL+PlMG5zy
X-Gm-Gg: AYBFou3HTqatwOjL/6zoW2O3gRntPmV6jeuoXIrTIhN03HdhmPWvFa8dwsse2ZRUYC9
	QAo+WDQYnCkw24HqCTYQojLQxSbBSMcfA102UmxgBnAgAQwDARY33lUWOs5D1zqqH19qFCv+iRU
	U2LBMzZO4pLI+ziIzBVmu+qJm0oSe3nfI8nQReFncb33hqoM56d/UF5CECAQBez78wJSYTf5kB5
	tKgEo7vXvqg1ekEo5Vajaz6dp0v4eaKKlxWMCzkSfChKJTYxM0hJmt6/SrKRgZt9bq8eVcJu0gb
	S9xcTyE1PCILn+A6d+CAoF312FijtR3J88o2nsiSsSEgW1+G7NTiyGepGb/kZUoP0eUieSHaR23
	xneqa4dEyoo7TvZDn4ikECI9Es+5Xvj+GsHlDAnzENt2GikQv4sCzyQ==
X-Received: by 2002:a05:6a00:3a26:b0:868:9662:5137 with SMTP id
 d2e1a72fcca58-86b31907b6fmr2162208b3a.11.1789086073847; Thu, 10 Sep 2026
 17:21:13 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:21:13 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:21:13 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 00:21:13 +0000
X-Gm-Features: AcwNN1V4dTU8mbsqm4SKDv1bFeQoaKcJ7y1J2-Jx15YlpkvuczFgpG4juL2uMLQ
Message-ID: <CA+0ovCgK_Zt7kTmgqZWz-fOBx1J-rX+Cr8V65vMCEAD4pCnOyg@mail.gmail.com>
Subject: [PATCH] media: gspca: finepix: flush the worker before URBs are freed
To: Frank Zago <frank@zago.net>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

dostream() dereferences gspca_dev->urb[0]->transfer_buffer on entry, but
finepix flushes its worker only from .stop0, which gspca_stream_off() runs
after destroy_urbs() has already killed, freed and cleared urb[0], while
gspca_disconnect() frees the URBs without invoking any subdriver stop
callback at all. A worker that starts running inside either window faults
on a NULL urb. Flush the work from .stopN, which runs before
destroy_urbs(), and add a finepix .disconnect handler that clears ->present
and flushes the worker before handing over to gspca_disconnect().

Closes: https://lore.kernel.org/all/CA+0ovCiqm0MVi55RpNtbUQoOjiSxnbjHXGN9rq+P6aJJCqCguQ@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
The device was emulated.

--- a/drivers/media/usb/gspca/finepix.c
+++ b/drivers/media/usb/gspca/finepix.c
@@ -217,9 +217,9 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	return 0;
 }

-/* called on streamoff with alt==0 and on disconnect */
+/* called before destroy_urbs(): the worker must not outlive urb[0] */
 /* the usb_lock is held at entry - restore on exit */
-static void sd_stop0(struct gspca_dev *gspca_dev)
+static void sd_stopN(struct gspca_dev *gspca_dev)
 {
 	struct usb_fpix *dev = (struct usb_fpix *) gspca_dev;

@@ -229,6 +229,17 @@ static void sd_stop0(struct gspca_dev *gspca_dev)
 	mutex_lock(&gspca_dev->usb_lock);
 }

+/* gspca_disconnect() frees the URBs without calling any subdriver callback */
+static void sd_disconnect(struct usb_interface *intf)
+{
+	struct usb_fpix *dev = usb_get_intfdata(intf);
+
+	/* let the worker see the device go away, then wait for it */
+	dev->gspca_dev.present = false;
+	flush_work(&dev->work_struct);
+	gspca_disconnect(intf);
+}
+
 /* Table of supported USB devices */
 static const struct usb_device_id device_table[] = {
 	{USB_DEVICE(0x04cb, 0x0104)},
@@ -265,7 +276,7 @@ static const struct sd_desc sd_desc = {
 	.config = sd_config,
 	.init   = sd_init,
 	.start  = sd_start,
-	.stop0  = sd_stop0,
+	.stopN  = sd_stopN,
 };

 /* -- device connect -- */
@@ -282,7 +293,7 @@ static struct usb_driver sd_driver = {
 	.name       = MODULE_NAME,
 	.id_table   = device_table,
 	.probe      = sd_probe,
-	.disconnect = gspca_disconnect,
+	.disconnect = sd_disconnect,
 #ifdef CONFIG_PM
 	.suspend = gspca_suspend,
 	.resume  = gspca_resume,
