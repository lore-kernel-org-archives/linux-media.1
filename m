Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793834220;
	b=4wyhJSAhddQQgOUPTZ223vJeXMXeOw9Fg5fbM2o1IwOCL/bZONFop4+6l7ogIi+zIBs8
	 XPoFOdfVk186VSTRNRRP6qMBCqdhGy/vISGFPW5cbdyFR341/xKZsBpkvyhIhMrW9Xfqw
	 rYgWd932VTQYrDqNLL4oVnyquPq7AgB5L2I9A3Ff9rBWS/bxeQFK4tbAG8/o/eLPwkhn+
	 I6M/k0NoYw8BadgkhIgxq/ZlaIAK2OlDnz/aur/UKrFaqOqe7nm2gNu7+z9rgvKBlPZ7I
	 2M8h8TJehZvMph430Ii69pfs+7vUoARgWjxuA0epf8F7AgjpPwnwVnE4cEtJcn5Q2JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Eu2VU7+z+HKfMP6vJYsfzm0I9qWr/gxSKl0LlmZhiXI=;
	b=lwBKlU3aQ+xh1TVjTUyjE8o0yTBYNPk5gkje6dnUrfFR6VdsJ2cZHnxe0UQwEEkS6AW3
	 LTD4VU/GZtLJfEYcpFuQstLHAPe4d5JTy101MWyIi+VjJGRQhdn1MjQR6e/RxgNjrb17j
	 kFVhkJTsmaWTQX7reiqxwCrhp1sewq2QthZfByYuxKD7bpKbyN8e7yOWVYv6a03VkHxsW
	 ezyunr7g278DcnnY6v/r8TMvWSM2M+YjT+K74JlOCiZq6yWo9s5q+9Amrot/5qAMxPdvx
	 JAzXZnSs23SYwgTUs9Sd4Sq/fzyRs5dG2nfFn+Gs5tn3/rkUQBVAr8oukzGG11I99Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ocNps4D/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4E606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 23:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocNps4D/
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4d198f1a591so767138b6e.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 15:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793834219; cv=none;
        d=google.com; s=arc-20260327;
        b=jZQeYeTeF9rM/TKGh/W2+cGW7Flv3bMo0M77PTVEbjX8tIdn+sFidNkCrH5tUOa32T
         uWSqq6MpMkGv31/5tlVxUJDUp+KKLXix79pQRd2m1Md1MdMKB9o/6vOAhCTdLmLC8HeB
         0Hu3oXxxEMU5I8IfRwCGlBX2Lla9/t5cKjMF5wf7ZQfKFxaRj9iLlizWyIZ2dFP+bKmj
         O7KQ678sRNR98pvWC/x2R7E4rhSd34D7ZANc0shFD0UAUXtsEefvfuH0aLBNICV+z8hM
         HSk/ixl35adjwSh+f6Yms/F4knAXES8OjG3y17ZZ7qLXy3zj3yrSnPBlGi+T8mWoEAMp
         rRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Eu2VU7+z+HKfMP6vJYsfzm0I9qWr/gxSKl0LlmZhiXI=;
        fh=6dQgzuSn1k8jBu1injAeomR3pYSAHvo2fS+6iNojlcU=;
        b=lUgGfVngw5zqF5g7QPEsBw/MjDJ/ZrXL45jy6fuvrL8JEyC9S8h+EKwEktboM72Ect
         Mxjg4uRj3nmab8ftJALziVbfIQrGJ4P/AyBtB/BR/ICjC/fimZjTJhHGGG3Mdrz8iO+x
         4KQvaM2nQR1mADiLIK9aBrgoi9kBAWtO0bk0N4O4QnqxDhj5BpPsYff0UZjHtTn30RwE
         OLRDQ0yHaON5FQ+sswA0nYMR1buWC7qbtRHcRezEZNsx0gfIjyhVWwLxuLS4nrbDmCUv
         K6skg+jpUnCoLEA+A331biM/ObPy+SMwanoordqlF8wRRe+oUSZ0iAJ2Egl3D6QbiIx+
         CIwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793834219; x=1794439019; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu2VU7+z+HKfMP6vJYsfzm0I9qWr/gxSKl0LlmZhiXI=;
        b=ocNps4D/xXnSy2T0xs3Qw7RwYUxmH9DknGPHIT0I35wBL4+Per1v1vXRJQtnne5/5i
         9Yf1w0VeMnEC63aAvNThhNYcZX54pFFfNjr46kCLQCULerEvv3qVVfR8wkPn1E6w+CHv
         VLLBdrtnzIwNqLgIvAZ1xMYKdcnO2M7KwYsmI6+0hyUzT/cXflXzdDznLTD+l521e9F+
         70cjoeTaJSUXDf+XcVTVHT6ds5Szt9b7TAoHv6pmWT6UpZx7KjfgDYr5x0/9OIA1Aigj
         MZq5Sqx1fFYoEiHNASQjKbfqPFoV1OFr37B66F5Umq8aRb4kFjLzntHpFI+ciQgAFupX
         tMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834219; x=1794439019;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eu2VU7+z+HKfMP6vJYsfzm0I9qWr/gxSKl0LlmZhiXI=;
        b=F1whsJGbpW3xwa+f21vuPm3imtzX864XmPfJiRBtSeo2aFLBzHQ7R4YHDVISTX2DY9
         FI3H2hZFVhvP+fjQzmNUx2YfH0YD57nNBjqhEtly3rtUqt/WfDXAiEQGAJ5hzQAIyRYk
         /kUPrvfXMfuh+fS515plBFIOb8cu75Oplbzkn9/9ApTSLxQ1likRV4j8jkPZbqjcxhxI
         pZIXQVjmNM9dCgBCfJJmvfuRomxaSwBbvDTfNX2ZlaRN9cILezQxVj+COoYsGY9GtQNa
         rtTKIOeqeahlKd/tqLmecM13qj32xW29eHyds90AsxxjIIiAdXXC+T3V072rmKR7casL
         +gMA==
X-Forwarded-Encrypted: i=1; AKwUvBz/dtIVIYSyCnY+/KRNst+4v6/21GHq9BBLy15+zF4iJcoq2npCZfy88V6T0a0yQ1uLf/+VimNV1VBSjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z99DzCMFUytFZUx5YJuuGPq2GhtM/tHbpD/GBO7HPCOtooqCA5m
	CgUQBO1uV5wmJb1ZOro2Imm/J6FT2TUpLvnNKvTmqeUGy/pFh5V52IdOcXCfFKGEKxUUtMG2srn
	jwOBwrv2HorgdrttSJggv7YZQsWlmfYk=
X-Gm-Gg: AYBFou3Qh9rCS5SitU5Pv4XArO4mfxiA+izRf4krnGmWfepG0Y8BfRgvXGynw8Sg0Nn
	4pygfVsP91hOOtg7umsJOi3xQSASBtyiLE9JAtJKjrukhx4Gd1WgE4KLZUrB0WEVwK+PZpxm06C
	yKjaGUScMVR6M+YTvot4CPKhJ0mpW7N+tdFoUDu8RCWPa7Upq/N3vgHn+y7zWIUBazH4U50kyCP
	w5h08k/BbKPtFPeyXniVc2f17YswRYYPSULSwdnaglEWi867MkupG9IFGQ1Oa/M8B0oiPFLf7QM
	EqYgX/p84xrpgpIL9ir+3J+uX/tAZgRTYeTMh9nlUj4wa/XO9PMmt/VU2LL/b6TIXfRVWQpxAI/
	ZV4ZPDLM+4vtn34jU5ARmG47GNybONfIHOxfmVyf3jUHk1UgFCJRfpBOaQvqwYwGfsd/6nqU=
X-Received: by 2002:a05:6808:2218:b0:55c:95a:f10f with SMTP id
 5614622812f47-5640de58220mr13092358b6e.52.1793834219392; Wed, 04 Nov 2026
 15:16:59 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 15:16:58 -0800
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 15:16:58 -0800
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
In-Reply-To: <CADZg-m0hnuZ+KpqkUgwZvkhjUdN24syvc8qxuR+oZC5rkJHSNw@mail.gmail.com>
References: <CADZg-m0hnuZ+KpqkUgwZvkhjUdN24syvc8qxuR+oZC5rkJHSNw@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 15:16:58 -0800
X-Gm-Features: AclHuK-H-X-4RHKJJTl8yiRj9yZvh6aBYUGlyyiyik-3gLApeo0lzV-MBKHf-DE
Message-ID: <CADZg-m3HZ8qpXdRSQ5RhjTYQ+3Lf6dbu=radMm_m8zDRMB8GbQ@mail.gmail.com>
Subject: [PATCH v3] dma-buf/sw_sync: Avoid taking references to released fences
To: sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, syzkaller-bugs@googlegroups.com, 
	syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

The last dma_fence_put() can drop a sync point's reference count to zero
before timeline_fence_release() acquires the timeline lock. If
sync_timeline_signal() takes the lock in that window, dma_fence_get()
attempts to increment a zero reference count.

Use dma_fence_get_rcu() for the temporary signaling reference. When the
reference count is already zero, remove the point from both the ordered
list and the rb-tree under the timeline lock. The release callback will
see the empty list link and leave the indexes alone. Removing the point
here also prevents a retired entry from blocking or misordering later
timeline operations while its release callback waits for the lock.

The timeline lock prevents the release callback from freeing a listed
point during this check. For a live point, keep the temporary reference
until after dropping the lock, avoiding recursive locking through
signaling callbacks.

Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during
fence signal")
Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
Changes in v3:
- Unlink zero-reference points from both indexes while holding the
  timeline lock, addressing the ordering and debugfs concerns raised
  during review of v2.

 drivers/dma-buf/sw_sync.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b021..261bc98b1 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -221,7 +221,11 @@ static void sync_timeline_signal(struct
sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;

-		dma_fence_get(&pt->base);
+		if (!dma_fence_get_rcu(&pt->base)) {
+			list_del_init(&pt->link);
+			rb_erase(&pt->node, &obj->pt_tree);
+			continue;
+		}

 		list_move_tail(&pt->link, &signalled);
 		rb_erase(&pt->node, &obj->pt_tree);
