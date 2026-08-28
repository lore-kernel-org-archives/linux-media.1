Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88723B531D
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894842; cv=pass; b=mvWBOtUrWHx0kAHXe+xSWdyujU4bPz+scueJ/qcYJYQeAFI0LtJRfeb26UxwZmWBLZsFTFbPg1MktDPgqM/NuqDTOVXcA1TmAMIJA+G3PrZ5/tXZBKrlJ12hwTRiZQOeCmddJv5AB8KT6TQdI9J2IHQYI6RHWR/p80G0wJJcQoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894842; c=relaxed/simple;
	bh=qknhTVvrNWiUFYoeUVoxKM09N8GNhFH0uwvqgFGoYFA=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=LDWvNS25/HWTxU5wZQfCYOlBeqCNNlaacaR7F68J30SuFYj7IZWwVRNfM3vswLLr9vqwvx2RRgemKdnxQUKKjq8JEAnWZYRtRYYq2cJJZxYt0/DeOKNLfVwTwtwx1N2aVdxj6Ez93rxm+PbeMM6eR4xNnfHDX7Gye6pyqf0NYM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=qWw5hx4v; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="qWw5hx4v"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6f55a7089so4943005ad.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894840; cv=none;
        d=google.com; s=arc-20260327;
        b=KdbtQRJYkFCOCNbRKUH9YnX+ZQfpQgFVUDNbHRMlnBUMO7pXtxjHSMzV/lzBmxUXXX
         33dbfUdhXDiGMD9i+vuKKc7mbLMDoBji8LdUU8T2SSo8EqfH1Bp171jwCZHjC0Fp9atP
         UcZ83lRgxMxMTcmr2JRn5nJZVr3h7BJ7t5BAVEw/SVcXDByk6uREx8y0DfgKvDX1QFMY
         UiQQpr7wjdyKvRCytYEVxpxmF/rJE4SBmcV45VcOmS7N0ckQgjjM7PZL85RLpTEGdltd
         7dqq86TqbWyVXkfETUmulhFCX9/66kVtofxBo2//9FBkSYdRRYW9Nv/TKu8/Hlsog/QV
         tbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=QNqYqbr6RrNLG0vHTLzh5Dr6ZclFSCwh9zU0WwR5q3A=;
        fh=TC0CpIKT+dr/YHpufmWY2kUBcqpNzcTLWXswLkK5USs=;
        b=Pfm/cz5mx8v0vHON6kFLOamsFVEpPgW7bPKQbNBtPXrbIQG5SCuh9MksUWs86iKCn4
         KRWPIYCxKmFhI9elWq1YaCZwSNSZ3HSsHqml7vR9oTy0RmbCW2giBp+yFWp7SfSHosFN
         nKibuLhb9Hieiogs3nVPdrISWyq5Rb1KvkjPqJfUhmKX3WPsx8ZBgeX7xuNwf8DdK6GS
         0gKQE2Vqk7V6kAWCmqc1EVtOWRUjnv7MFDJd8hbIF8yTs2RKqdRuSzz/G9KQ21nz3/8n
         s+ZpNjKI7jI4u80OixeqlPM5c4ppTj3xK+1FEIZUmJr5dhCOmvMNBf4hLcshEYIWao6S
         yDVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894840; x=1788499640; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNqYqbr6RrNLG0vHTLzh5Dr6ZclFSCwh9zU0WwR5q3A=;
        b=qWw5hx4vsq8kCCPDp8vbWYAZeg4hkxoACcoIBB4STxmwYmFFVgOtLKIJtHWhlFAY/e
         V47t9V3rgB9b0H1hmGBHj30RLJSHg0+5P3vGkR4AJdhmLZYjMQE5rVBBMaY6S6mR6DnP
         jrCxxJTYdaLQPWpTn3Zwg/2unQL0UaU9EGc+njUfXqFItD94NXeJoJ1BBWn39u+Gfpqv
         33hAzCOyitaDlHbdUYY9MP4y7kWki+HfZ50oJayPPhMAssC9iG+2iuyN+WlR3aUZHN5M
         fqQsDGiHQ6G1Fbo6fSSEXbCRQ+Kdb5fYLGj/EjS4QI9rKPCpTyZkV3PsAE+8Lpv1xQF6
         dKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894840; x=1788499640;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QNqYqbr6RrNLG0vHTLzh5Dr6ZclFSCwh9zU0WwR5q3A=;
        b=jDzOK8P/u6M+ElB2132ISToBSLfAcLVEQSFmMCTRhthspcnKhyZzwRS5es+QuuwLeg
         5DbWyXkfiCSDs+tisdzbl7ExZIOevJ1rhS/oNDFRLws4j2yrWFVLxSdM+MEuFfZmaeRU
         YbdsfjBHSlIrujeYUeONi53sht8g0ILAontn4zmnXwhyFBmZ/mCfoGm9Ptbey0VDmiXo
         hWkVFPVqTYLFxCLIFvm/i/Jnarf4EILXfW+BgInAHE4fWVqeqvrWJOE6tOthDJjR3962
         90Nf4Tugje7dw+CwJ6NJ2GnpqRz6tfpq5HzbIDfxKF0wzVR3hJ5RFHpOl2+KdaXN9ncb
         hL6g==
X-Forwarded-Encrypted: i=1; AHgh+RraYkpoFoTbbvnemcF8XXxahl1mv/KhrMqIQl6q5w8XjUyGZBSBuz1IlsgXjglseUwXTuoF++9dNw8+oQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kJ70XJ/HtiOjZACkaGBsSodyNFTNVIjFJUeuEaXWxq0x8qUQwP
	JNIZTDOipl7+M4oe3u/pQ+XJpNb0X92p+IbkD9J10Rmk+vqPtJrh7fdh1APWJY3z3o3jP6GJ3Jf
	gOKyDN2ptYZOeMia4pZ1Mzz/MgXB2GJwx1oxCLgZX
X-Gm-Gg: AR+sD11sofIiAn5HB6e4B28SqgzYrVt8VLRGAWhfXtQWIYRmwguWxFHrmltbEZiBJV5
	mFScLhcRCvTXbKMSyGVmeC+TfABxdDmUFc1S6wiVQmjLjuxn9nTRNQZ9h9vG9rJX+pZi+THgiND
	2LGvQ7oltuuy2YDq9neCHpPCzG9pC6zu2nI595mAOy1Ya9WggjtI0TbKVCItTyzut3dR7sR2Hdm
	knEXgQmXh44cqXtt0sVdzO3L3AZrAumQoHa1rrKt55PBJiEcv5AFuAomliZ+81WQ8JMF/dfLBFg
	ZgRL9eIjb3nCVRdPEhqo1qc2OTEk9TBKAc9Z1YBUKIEbo0LNlV7R5SO3qJrYM3a7ULXcsr/IUrK
	0+wN1U57HYK8qJ0trT/w8z0I2VjwrREW+ww==
X-Received: by 2002:a17:902:f546:b0:2ca:6c8:abd8 with SMTP id
 d9443c01a7336-2d74df45042mr70861905ad.12.1787894839110; Thu, 27 Aug 2026
 22:27:19 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:27:18 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:27:18 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:27:18 -0700
X-Gm-Features: AcwNN1XKQipKkQxak39pU7cE8Se-7vCK8ALFEruuOKEDcVG8_CDFnXw1OSaRaK8
Message-ID: <CA+0ovChhpCfQEm=3=23AbpKnWBXqaPkhG_Z2sTCJA0=iW0bx8g@mail.gmail.com>
Subject: [BUG] cx25840_init -- WARN_ON(1) reached in the seed's own task via a
 sysfs bind
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/142-media-cx25840-warn_on-generic-mode/

  WARNING: drivers/media/i2c/cx25840/cx25840-core.c:2313 at
cx25840_init+0xa3/0x110 drivers/media/i2c/cx25840/cx25840-core.c:2313,
CPU#1: kworker/1:3/10687
  Modules linked in:
  CPU: 1 UID: 0 PID: 10687 Comm: kworker/1:3 Tainted: G             L
    7.1.0-rc5 #1 PREEMPT(full)
  Tainted: [L]=SOFTLOCKUP
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:cx25840_init+0xa3/0x110
drivers/media/i2c/cx25840/cx25840-core.c:2313
  Call Trace:
   <TASK>
   cxusb_medion_register_analog_subdevs
drivers/media/usb/dvb-usb/cxusb-analog.c:1730 [inline]
   cxusb_medion_register_analog+0x2fa/0x1110
drivers/media/usb/dvb-usb/cxusb-analog.c:1793
   cxusb_probe+0x664/0x710 drivers/media/usb/dvb-usb/cxusb.c:1615
   usb_probe_interface+0x657/0xc70 drivers/usb/core/driver.c:396
   really_probe+0x267/0xaf0 drivers/base/dd.c:709
   __driver_probe_device+0x1ef/0x380 drivers/base/dd.c:871
   driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
   __device_attach_driver+0x279/0x430 drivers/base/dd.c:1029
   bus_for_each_drv+0x257/0x2f0 drivers/base/bus.c:500
   __device_attach+0x2c3/0x450 drivers/base/dd.c:1101

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
