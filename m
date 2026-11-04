Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793832118;
	b=KdTwCzSkphRq2zRReE83xkA0TGXRKnnXFAStoVARPjwOB4fMfRX8218GcCgQ6fIdjdhY
	 3jNu9ZUrZ1bSJTTl5Q9k6pI3vw6H2yW5wfGq34qy5+GJW/EDnKLlAPMuw3f7P9GA0rh0n
	 TfH6SLBVrU2j8FU+uCu44T0/MmKIcHaU3fIKzhtSDbXxTLTi2RrXnsY8M7hptHu3ndVZr
	 UKlMPphb6DfnKEmZ6eTfbDwg+e7MGxuHFI9tvWUyYaj1DNlAidoIiKh1Wu0IN+tL5EoGQ
	 NUqb8mcPMWv5ZW7RYOWbN/40/Kw0BzdA1wNiBoWCEqoW1RS/mGtN/kKisOuG9NU0PNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:X-Mailer:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=BYpBQ353zIhpm175VcNMdcPp6xP6hMG0uG7gLNUoCYQ=;
	b=n5KkwyGDQK2T11Xat8d4DeyIj7C98TUfp1NMU36UX3OI46DIr53UH3rXbzl9V12yAy+R
	 wpDmQJK6QFpo3Jbkc0xnDHb0NFjr+Th3QARdankU13v7qZ31+M5ckZVt3l2+Mlc7RPrcV
	 4esUcH1TXys1wuItx+trIWNH5uNmJ7p3R+vdCxTQddM2X0zeHXgssAD/iOsQKsM2enRex
	 YHgSjpv7OmsKSYOGSedW3zHzh7k2X9xrCPdXzcZbac6ehMCPOjRDGHyfbWQQ6GKPNwjrJ
	 mC3W9CpXEsIFxYjL9JbXPInua0x/EYR6v0UwlpZhNkxIoHM+dcC988fNTLSkUP4FTfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltpZkAGx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC74606A326
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 22:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC74606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltpZkAGx
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so57858fac.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 14:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793832116; cv=none;
        d=google.com; s=arc-20260327;
        b=psUNfdVovHZAlQaY4t413n/1Z4Owen+m4reNeBIcGtazC+k/j68byXxGMurKv6XXpK
         aG0bn+XpFVK35rWb6Ak0l3/+cadeimXfus/6POOhvT1Fm6d7jGFmEfCIbIlzo182Av+1
         SNULcR1ix9gJYat7OpS+A04xP+4AQ+ZxRjXdLGCdXGSsRbNdkMabymSe9ZeKpwgxKRaf
         IMy8fKxDA1JP+y3GPXfgJlP49bMwNzY1hwB3bSnDLiFJxVVJgbL27OokDjlpnjov+ckI
         +wW5BVfqb8Tcroonph/C0hIYAzI/C6sqfo6BW7YS8CHFoBCLLuL/vkkxJ6prtljH+jOZ
         +tAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BYpBQ353zIhpm175VcNMdcPp6xP6hMG0uG7gLNUoCYQ=;
        fh=+W6NBiKugjIB3AvqxwAKq1bUZhSr4W/KJ2YBrV96o7A=;
        b=WFuq8EYNVp5g9W1DFxePduSGJG3E0VpL4uzOekdCsODxRwGeWHCDarGQN3gZVoZVn7
         NNxFSwcdy6U0xSPSk861du2sgG0i25AvTx03ZN15mHfvvxXOKUxysXIDiskmcyeg9PDu
         E/hL5liS9GbOk78HEnk59BRXczObDRgwfD/2jVg6OaesZ3sAUWBKk/+qsGr85LyGbyGy
         sQzN1N5jrIxCWLaC7YUyd0kcQUXBlerOQWCZRD7wWqzeLjCIUYueRkri7Cg1Bm9UYsad
         BAUM/r1CM8tTLcFqLAEj/SlEK1juNSnu9pSr2q0lMFPWsdIjC8pE/u6xPB+atZQRepjK
         gUVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832116; x=1794436916; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYpBQ353zIhpm175VcNMdcPp6xP6hMG0uG7gLNUoCYQ=;
        b=ltpZkAGx/Rejc5GMPasvhEzAYxVNWz9hE99IiCXFqM4kAbGNVvtg6iMZ47/21FGNgv
         jB/un/Cx2G4Ne+MAfLX2364mt1lx2yylFmDudCR4Z+C5v9hFJxtma7AO4bWuleVbrO0s
         xwxb9mmSsIiSQw2UKCtmUPaNlbD6GbY8LcDcigectzTEbalm03Y4d2wleRqXmKf2EGtR
         MewUCUKlCSVdChylgBHw/6Kr7gonOHSvyLOXWZWzVT+OE42sfXCtAcUR9oOCryk6Ty5j
         D4QqisQ5kw0eDYtfY6Gwz20LG9e8spsSHfau/tZcw2GpUokGJ93KK1ve2YqN9Phu8ep7
         6Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832116; x=1794436916;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYpBQ353zIhpm175VcNMdcPp6xP6hMG0uG7gLNUoCYQ=;
        b=xE4vS3X/DlEKPZMwxFG36nmpIzMD9v1WETvad9zmLHV2KwnbgdwjnJJlLJ+udu97yV
         Sde1UctW4WdjsQVj5zQO4S/T4egfRb9pdpALJNEtVzWWst2RqKjW0FEBXHL6IhVQ5/dH
         SQUh7p3TFtaUx1tJhHTWeRc2vl6T0hNeZ/u+TvSZvc02HnHaeXazv8AivptTP51WwD88
         ifI278fGNWcC3x0QuetDwOkdi49aQR1o5ulEuvPvnBQClpmnfmK07YLRGMQLxJ+TwQ8j
         XhmvHkftkuKlzIjivBfp+yv2/AtrnUZot7zNwDZ4MNbaL3rzOc7uMhWBlBfekD6W6N56
         4OIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz80lwWXN21Mez79H6DnGSX0+cx7GFS2lhbhNVd6RadR71/ZlIwsDvTZFC/WYraLhOOFLryGWQZON55QQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z++qxA7vRue/p8U6XstlGmwdtutC0Z1LxDvJI47yHUz5+UYOsu7
	ohhHkQFJOQLMZCAdk7A0VpMvU6p+keISax8dct5zulVG81fh8rlMu1ArXXpO9Kp7cCkkj40RTVc
	qncAl+axtFdlpuRLY57TUiNYbq1zyyl8=
X-Gm-Gg: AYBFou3MG2Ds6h/YF41HjhxH44ViBY7rVqlSwk74gkO7TOohx4G0YBxf6/XQMPx9WVJ
	d3sE4E/Lm6NnYBqGX8fP6+l7b7sDadk26FLHONh/3bbq8Uli2n2QywoHD0Z9WTDGZn5lArOq0uK
	r+7Ff2q4gWbhC+CmxLb285uCFH8PLRTJMGcdkiD+bmhs8cBVuyJFC/1DOuMTkaWReZJdAOdGv67
	zRRMfw8trF7YB9FOZXQ5SPNhEaDq+4KlkiTjNf1EMyWZMky1f7bc2UY0g3a1/URH6nYjcHXQu9T
	JGqky+qlGa6dZ1K/EMJGSgEUVxDzjVCypA/xN7w2qYgTVfPl8uGHu3Ch6MSSO0zK5W2kvvOd8pG
	kuXWmBo2bsGgAg0vQuwZCcYU6zjNUrLPEw6BxxNr38BMUGyOkDO7nXNJAUD0aFrEJIkDrNew=
X-Received: by 2002:a05:6808:6615:b0:4b8:4703:db8b with SMTP id
 5614622812f47-567be491be3mr630414b6e.20.1793832116524; Wed, 04 Nov 2026
 14:41:56 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 14:41:54 -0800
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 14:41:54 -0800
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <CADZg-m3A_i_X0L-UBi=eMEx7RzhR_sqU5NVLrQ75JJdR=2ASKQ@mail.gmail.com>
References: <CADZg-m3A_i_X0L-UBi=eMEx7RzhR_sqU5NVLrQ75JJdR=2ASKQ@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 14:41:54 -0800
X-Gm-Features: AclHuK9q0DstbFq8CTWr-e_98cCwTuTXDKvqxHLH8rzqGH0pREtNGc9JRBFGoLg
Message-ID: <CADZg-m0hnuZ+KpqkUgwZvkhjUdN24syvc8qxuR+oZC5rkJHSNw@mail.gmail.com>
Subject: [PATCH v2] dma-buf/sw_sync: Avoid taking references to released fences
To: sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, syzkaller-bugs@googlegroups.com, 
	syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

The last dma_fence_put() can drop a sync point's reference count to
zero before timeline_fence_release() acquires the timeline lock to
remove it from pt_list. If sync_timeline_signal() acquires the lock in
that window, dma_fence_get() attempts to increment a zero reference
count and triggers a refcount warning.

Use dma_fence_get_rcu() to acquire the temporary signaling reference
only if the fence is still referenced, as sync_pt_create() already
does when looking up an existing point. Skip a point whose reference
count has reached zero: its release callback will remove it from the
list and tree once the timeline lock is released.

The timeline lock prevents the release callback from removing or
freeing a listed point during this check. For a live point, retain the
temporary reference until after dropping the lock, preserving the
protection against recursive locking from signaling callbacks.

Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during
fence signal")
Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
Changes in v2:
- Resend as plain text after the previous mail client reformatted the diff.

 drivers/dma-buf/sw_sync.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b0218a9..7f1eadee4cdf 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -221,7 +221,8 @@
 		if (!timeline_fence_signaled(&pt->base))
 			break;

-		dma_fence_get(&pt->base);
+		if (!dma_fence_get_rcu(&pt->base))
+			continue;

 		list_move_tail(&pt->link, &signalled);
 		rb_erase(&pt->node, &obj->pt_tree);

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
