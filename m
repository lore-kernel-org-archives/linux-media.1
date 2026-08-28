Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8893B52E1
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894804; cv=pass; b=LkzrQ98oksLlWCHiJuNflgZsffx4h04ctCRwLeCayaLz/GMb8vKgDpx+ylg7B3msgcAtoOKFH+oadVUnrHQr+OGJbJlKqXXHbU1CztVBZ+mlsSyLq12IMpfQr1SfQqRiIMNEbdPP+NKry0AEVhdJNud4NbpfteSZlIM3/G1PRBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894804; c=relaxed/simple;
	bh=ZveIcFp7V32Z1aM60loB944S1YN9fcIoAB31WiB5Qns=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=NCDQAnvMAltfhiLzs+XrQegiIPkCxRzgb3NQLSVhh4+0N4xB0evM77HWWvYVg6ThOwIOW1o9uVSg+1/V8s5Gak/DylRKsGpZZFV9HIx686bjr4fN1wR+GewMa+rMmu6asBU6r28i9w0YDP402gLc4IK9m8lkMpMBijZWLDY845s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=W2VWnFZV; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="W2VWnFZV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso811448a91.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894803; cv=none;
        d=google.com; s=arc-20260327;
        b=B3BGiiBvxjcUKkLftIOBEXgBkqhyB1Y0Fmk5QT8hd/8L5CULb91UANQpBMAXgnS89l
         yrYkJRPpbCaPeWcfntCJ6h5/gHsjHEkK3eS/tpRLg7eLrY8nB59PnPLDKbmJWjf6hio7
         xzHdyxqBd208aq9peJfftV7wuQrekR1GEn5QSPXathZ6HDcABiaBIP6qTvi+psWb68FI
         eFo1v3zQBCYE/ZB3EWUejbwrnAc02fEP4kSTu8IdWE7+bwPDhMbh0MjqWz7JPENf8Mpq
         1p3gOo+AojGTotdVnrY6+8p4DZla4KxcTVlpFfxXyhyL1QppedCL6yVxx4Fmy1Xq9NBv
         f37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=qXhvfTPGzkg+Qu4rqQvBhzoE3FgD8zp6UtjMgskwkcY=;
        fh=socit+dgdESUgQh+IWfS58Odw6BAY2CGsR6KlPY3SX8=;
        b=TLzEFk/i7fVUUBNFT7T5YDIvd6gFGtYr0CbonnijLpxkZsR0BTErBbRAjDE+s9kHaL
         OU02ttNBa/zkKveBTx3eTQLfK29lIhuQa6tlSUYaWzpvrnEZi8PixywNIkjsS0B11lFi
         I6h9TGx/0fZg2jc5tDNhMITzNUawsnEjYiDHXHvqegoR8ZQeUPpumCUoD4d/e1SffdeL
         Lko3mskXhosYTwo/jtNgJ6+YVvgtl68ns8WOmOKlBOsgYFlcPCuCI2o+getplOnu8+i7
         FEku2DYcUXyj1QCJ1oVJ+wUZh8f7gS3TTjXE3MfeEp2k5h0Pg+1evZLtfA2D+wEctLgE
         uN4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894803; x=1788499603; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qXhvfTPGzkg+Qu4rqQvBhzoE3FgD8zp6UtjMgskwkcY=;
        b=W2VWnFZVKME3AFkm5Mgy97bo56ltYngd5nO8J7TDgtQvY0vh+9tb7+dUj57/haCwFJ
         BFHHtV7w6GNYc6GNzAu36AnGu1H4qTRkHG5vSbZtg6gRxoWChue/WmtTr097194dGYD8
         2SGsJBswnnJV3o8ev/L2AohDm1r84U43C8uabwDFq7ewHvLIX0KAmABJXIEis9SWWhsZ
         Mniz98MA/+aCzeDhzc5pAW5dTph6YCG5JFK1q3Lq1hkg/lhtYA2wz/mWmUONR2I5PYoz
         kO68BcyZlo0hdkv11++OZQ7WZ+h2epkKQiaoOoi1al+1FiPC9g6UGukQDkkQkR3pCxGX
         iXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894803; x=1788499603;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qXhvfTPGzkg+Qu4rqQvBhzoE3FgD8zp6UtjMgskwkcY=;
        b=fA5pib3Tmvg+BEJadDn/4E/bhIw9lY5B+h6AOqeNzX6yb7xlOGGdKpggYI9coPGoZD
         SlIDmDrzC7JuyjTq8yR36OmkOxnm66lDq14set2t2oT+OOc7d9cN3HASaHlD+l4syRLd
         kWkShh2hFqeKI54E0/zVXbhEfNeCTbY/5y4/PbgMoA0uLyMnBhR5I8oYjS3c5gHSkkx4
         rWOHA0s50fjA9AHPDR9p+Lc1Yzc6MUeCs70BXHZHA7/hIoTL9QUAE9lYbiftpEmbmvJz
         2rcayj/Xnpdx6EYk/wV9tc3pawkGC1z4+XdmHmNGJRTxtBG9u5F9qeDcIPTabxyuRP0Y
         5I8w==
X-Forwarded-Encrypted: i=1; AHgh+RrV3vlmf28i13W5dN7N8bssAxCwbvycg7OUSI0AzHhrIND/vc2HeOP3tjJn5er9awa9J8invVnw2lxbwA==@vger.kernel.org
X-Gm-Message-State: AFuF++n6N7P7kbhUpPdyb+rIWDb0qwWus8cUVb4yH7nkplvRdAwX4/Dx
	kPjP87GsbJEO41Lf3XLWLwPefDhViFJWUu/J7oMtqNizi5SCUcYE+ahAcXBQYGHSTpkZkfRBW6E
	fYIX6Xbgk5PPYfoisDaSGYxDCc6Skv9ImOW+6EDVi
X-Gm-Gg: AR+sD11fWhmbY/tPHsIfC03eCgvS7fgMwdGkVhbNVxEoAwiT7Zm6J36iEn7ixESIhrU
	8ArJNyulfCPgDPbjWWUuTA889ZDtIFNOdsKgsAQZg5xeU0lUvkBIDpq1wDgZgn+haA8qrLdBwCy
	TIXNK0J0v5T7gO4DMzSHlyhz3Z0OkrzcOy9FbW7sUuyIxw/unsQUsYofIYJ8vBu73VWPJ96SnGv
	V/9O+ilGLnHgYjj0ZQKn2qVyUVgpd3Mmp4Lt7kXSIDIWjsNd/Mnqo0dHJZmWtu9b7YXvjFT5T6L
	cr2FxzWG3bIgOOtGauNfPfuQRqbHqghITryVCOYZ/ivOEdFtE2MBj6METg0K+cLblGO9sPWUwvA
	rSJzx7gz+LzjdDv1bLlI1lrguAET/FenrJ8GyvT2WvYM=
X-Received: by 2002:a17:90b:5249:b0:396:40e6:f631 with SMTP id
 98e67ed59e1d1-396d0e306e0mr9407523a91.3.1787894801955; Thu, 27 Aug 2026
 22:26:41 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:26:40 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:26:40 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:26:40 -0700
X-Gm-Features: AcwNN1Xwmd-yyYQyLqc0tfzNkQ5nQ8fFVd4Htq1RknelBHUdWcKkvTxvEOwzqIw
Message-ID: <CA+0ovChPhPP0o+9785BjSRyNBTNRR0LiFT+K3T1a787GHyQ+Zw@mail.gmail.com>
Subject: [BUG] sd_init (gspca ov534_9) -- strlen(NULL) null-ptr-deref during probe
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/141-gspca-ov534_9-strlen-null-sd_init/

  gspca_main: ov534_9-2.14.0 probing 05a9:8065
  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:strlen+0x29/0x70
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   strlen+0x29/0x70
   sd_init+0x1dda/0x2e10
   gspca_dev_probe2+0x855/0x1440
   usb_probe_interface+0x659/0xc70
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450
  Kernel panic - not syncing: Fatal exception

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
