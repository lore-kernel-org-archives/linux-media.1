Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2323AE713
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895117; cv=pass; b=vEoBPMnnjl5NZJaULYwQPQaPbGpRhBvHo6d68ARyT8MfK1jm2Ufi6KV8496RAuSs7P0imHHs8FRY8avKxSWQS40SwujNeIGc4dofrI+yMRp55FU4gt817xq9ZECwEYTMdhMCzzi3SdTCXmKtEDLtLl5QOMH4+fa02XwGV6D8PMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895117; c=relaxed/simple;
	bh=yxuunkrMCzjhTG9xtHvbfv5boTd3Y3kfwiIMXc+VbsA=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=jeIsaa65EXWGcgV/yZrJsqiucoTJahT0Szqj0xTuXoZWHLHAXiKpt/Ne57x8gA3KGpeMK/G0/QtXeYjFg1A2pKjU7HzlJpMhEVBOCwF6X2RBaBb7Wb/WysXfBEDZJbX5PaYzcbZgYmG5991KM2pySkc0SQzAl0rb2G/m4T1BvT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=alhwy+W3; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="alhwy+W3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d7200b2e15so7154335ad.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895115; cv=none;
        d=google.com; s=arc-20260327;
        b=RgSByVYzXuJhzthF5b05UYiomMkvhjqpyu/9BVcJMauyTYowOi68ZYeUOawTBkXCbn
         mjdL+xVAXQEJpMd0BkLG2p6HKlx3oo/hMjX9ChDb2KoTFyn33JxU5PonKeQWMIgob1NG
         cRs7uZxUbm5D7sncYWumS5bgKVF46BR+jHCqQkZMa0v2bqZ5gPoXvpqdUJiujAQ/X5fV
         62TCr9/YBOCwgIEpTfUTYVBtFJNOVYYtW6ukTQr+tsfgG9U4w+QJgeb5RCLHjCeK3qx6
         8y7VB68TBZHiLIIzXgLeRm5cZBH6pQe8+EVfZR06b7s0X6azzuR7e1Gc5WHWhMZ7psxf
         YCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=/rV5wL5QxIwuoSfzmLGFHVm670pUqzdREIV4+LvHIJE=;
        fh=8JZNveNk3VrtqURq97l7sgw7yhaAwRoBAPTjV25C/Oo=;
        b=CPaVIe8KXDO7eN7qLD0Moh296H2meG7XhJDt43+nBzZ+bSbCwuta54SCLr0I7dRtki
         gDKcluvqlkHAXeaQTb8bZ+/npG/nym6IUMccyaBhoVsJZ+N1jR19JBaklA8J+46y8lk+
         aY/WnckV8O+HSm4BjRrY6JMH8fTTEkgzu5U1sL2C35zzL8LiG/BNLRWpJOajT79zwb7V
         nkJ41EECRuNacfZpaOU+rHgKuG028uzBo+jd2DIhYTrHDiV26AcQDwpBDusQfORK5PG0
         b5RTL+dOrce5ISgxLO/jsxaZHUTJ4+6yuccZeFLaI0fYfHWRWLwzRE0An17kfd7+z3/T
         nSVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895115; x=1788499915; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rV5wL5QxIwuoSfzmLGFHVm670pUqzdREIV4+LvHIJE=;
        b=alhwy+W3ftc9xn9s6E10MK9HZ22MbFX7e9MDgORH2PaEp61YUGe6QnD+Z7XtLGqOz8
         MtxPkTxmQXEAxQqqGsfbwTfvKpnrDWhNKyGzSzHdpZlSLR3Ej8Tk7Mj7SLPs2HWfU6M0
         BgdJSwu1OBY/JRaxFhC65Rz8fs/bgg3K6OEXqAJeVnRhEExasMmdmRLVJAPHxyBfrOUF
         t+62fCdPnLMduI4YA8U+HjtkCWzxj2F+i9F/YThRcIIv/aHHQydzIyQ0Wybd7ED/gFgo
         Jl1HEuwZRcegibZMTOeyOp+84tj716f8ISRUz2F3bFgKdH7PUk3wIFH9pAGp+VBCm5z1
         VWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895115; x=1788499915;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/rV5wL5QxIwuoSfzmLGFHVm670pUqzdREIV4+LvHIJE=;
        b=GjgPTXnH6Yvhdus5OpwmddbgSuPpt8eNDEfAwFz15fZwageHvfDdSnJ7Inr4BzPvek
         Z1o0ZiYm4p8HKKv2wa4KIiMKiSUw7VdcL3s2UOAzaZ+OpXax331rRtzQWXtsff7/ai+T
         CDaHHMCgc6wuw4OXcZiO4SMB6+Weg8Z97RRgWtC1BgVIi9Ym1FG3ANiuO8FIPDYMJ9AS
         om8B2gJVYVfzwPNu70qgquoT0JCaTaKFaIXq0yogYRt4mvWbGP5kTycIdMxA7PIBWVO5
         IZcDzr2CjywW/uv9sIrT61rVYqOq3g+FCtdUKnua5lBNYK4k1LJAiK8BhwCZES7p2EuV
         ueFg==
X-Forwarded-Encrypted: i=1; AHgh+Rpm3sWUksydLGnM9/M6h+u2Jk8dnPxCnF0sRDLpnqHIC5K7nMYGZdaqyDRnQcazHuR8b/uLomgXJk075A==@vger.kernel.org
X-Gm-Message-State: AFuF++m2ipDnLOwoYBXnDnzcnKRK/rbkx3E1ZpXma2ydFnbWfgMv/a0A
	zXAlq2rdcAap9Zs94OgYcoouLdipRDW5duF+XnRedHW2IsYXgFsxqkkZyXoGioH9WEstyTMldHW
	xdRZK6nC6YffgzJ68sFfITFoasEI4F05YYNJnzmvHwCID38Pee8kyDA==
X-Gm-Gg: AR+sD11SUEmRPcR1ppMMpzWiFa06ktWxll11ehni9zC+8WqJXkXrW0cXZ/vSla4wq6X
	tYw3iQ8vsKZ6AYmruWjxzpN6tlhiK1+BnLk45KyFFrw10JQziFIiKAogeYG38OJMrm/JM8+b08s
	bU0V6LnkVfRsriSRd2KBanMCKayBjfLiyPswEjAD3L/rTYiVwh/qOwrtGTExM7Fm/1YffZ3QjJh
	gx85iyWWciAX14BoI7jLUx0ij71ygSR83N0TRyfwTqrdulo6wizJyMqUzDC42J0WOw2CIaDOVFI
	bsXlKzna8l36Ch90gWnTQ6Hx/kRB1H+RyAORgkLqClUxxaFLz08vzYvOXQV7pHC7QyTA6ykNiJj
	s9jbEt46ULxzmn/fTf5mr34njNal9Xfcj
X-Received: by 2002:a17:903:9cc:b0:2d3:716e:e2ae with SMTP id
 d9443c01a7336-2d74dc5f3f5mr72274555ad.6.1787895113220; Thu, 27 Aug 2026
 22:31:53 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:31:52 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:31:52 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:31:52 -0700
X-Gm-Features: AcwNN1W4BQXiDrdJcKWmHqF4uj8adVeWI4wzh_jjoN2b-eJkUXCI69GFlOOilZs
Message-ID: <CA+0ovCj4o+=Ti0cG73NjoBtQuFcny8b4Mg0CKsya9oWp_Mv0eQ@mail.gmail.com>
Subject: [BUG] media: s2255: vmalloc out-of-bounds read in s2255_fwload_start()
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/147-media-s2255-fwload-vmalloc-oob/

  s2255: usb firmware version 0.0
  s2255: newer USB firmware available
  BUG: KASAN: vmalloc-out-of-bounds in s2255_fwload_start+0x1a6/0x410
  Read of size 512 at addr ffffc9000010e000 by task kworker/0:1/10
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   __asan_memcpy+0x29/0x70
   s2255_fwload_start+0x1a6/0x410
   s2255_probe+0xbd5/0x10a0
   usb_probe_interface+0x659/0xc70
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450

This is a different site from commit 330f2936ab76 ("media: s2255: check firmware
size before reading trailing marker"), which guards s2255_probe(); the read
above is the CHUNK_SIZE copy in s2255_fwload_start(), and the crash is from a
tree that already contains that commit.

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
