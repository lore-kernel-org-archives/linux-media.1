Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888768;
	b=HZcDmpc1LzZUCSAqX/fPnHTTmndARP2opUyFaPPXJQ0por/0auE9fsn9O0z2BlWJWbeK
	 FYmE1UxZtY9BkAt41R0mFrgoHNq6sqG0aECCPH6+df7n02etEhNkxpi0LSag4AszyjaF+
	 3W8VJPyS76m1ORDWCJh/Pzz+lrLauiuWSXE4QpOLAzo+1JmmJxp60tcO0j5oNuRWskBti
	 qVpcKcGFQ717Pq/qLOpoDY5CessANnT4gfz4YwO4dV+6QzWyH4YHfxq0Ys9Izo4JzH6ES
	 XQe0vFyClPdykzcQfyLG5UVRyu58cdR2s3qxJqtuQ3zB7gU8f7PeoAAisYvAC1bA6Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VL1FDtV7Y/ilxiUTM4V+mDRqqkZcTL/181qTv0CNS1U=;
	b=DhSmKMziEAnKMkJHdFc8EB4S80XeyMmdjzC2EOboSugT4HGNDWKCP/ByED1BBAQ3GAtF
	 SlrRoG5FSVtHE/fENLz2cM6Zo+QvVNMIKWNtOINl799uS3N6Aa9FpeGGXn8MvMJYEvTGN
	 V1WsUTcpOWZbZ+nUp8Fyf/BTuG8mBECuSRZ6W9nD3CMQhkYng9TBhr670RpIlvXdCWai1
	 N1TXTzPFD4TrHrKx7BuFtnXn29MLh4DRIu71UpW7TVjcPW2mtv5vj0aaB5z0Tzd5185QF
	 oQEf9zzIkEDGzXOs6ll+xzqwUp0SKGmli+OhL8p24FaLbpmCEe/APJXAXU2SIJGVeGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0HXq6QG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016E1606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 14:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 016E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0HXq6QG
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-83bbcfba0ffso1314386a34.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 06:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888767; cv=none;
        d=google.com; s=arc-20260327;
        b=djfW+E0kngKV6EooI+lmvGYU+HFlnKBXaRyp6rxO8TS0Pe2zWsT/W/Q8kg3irEadnk
         b58TVw6D7wZxF6DWqjobCT8g3KSfdmNi9jucwHOQH/oSpE/Kk1n/4ZRwu5pRwZXPnvOS
         zbVjR7cd2eu03w654brzgqFeszZKfZqJoS4o4Nn74orYppAIBvpFXBDCo+yDzgEcyBJR
         Jw84uhUobRSovYAZovIv+rTOOdZpV/hVvILhCfFX1iX6XPNlkXeQs0qHLyx0jNDRx5b/
         fOmh3Nd4wLsIbSo0aiiS2V8MDdrUHwdbhzlUgrhF/95RltQfK218bS+ic+jgH04cGp3E
         CsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=VL1FDtV7Y/ilxiUTM4V+mDRqqkZcTL/181qTv0CNS1U=;
        fh=32s042C+qRUAAB9mWezawGptTLyJewqfOAG/JBIy098=;
        b=PYqlCCf06SIr0iCobou4pRzgxMD+yDLKUjz1gzZt4kk3lCn3+5VsjobGn+VR2DoF6L
         8inmdTuxokZhY/qdZz/ThyW9Fm1/vteUn8Bq+C7nYrYgRpSFRUpZzFL76a8Z51C77hyw
         kS2M972XvDwQOcKgjL+9QvDcvSPP75YhnsOpjgPCuJdKQONOpCObPAURmGH9N2dicgqi
         /u4jW94j2RmZxajfQzA1D/6QwYgcOgqh/kj5vkjdCUb/jl4d7ALPCUEA9pJk8LXo+4AM
         wrhM65y6fYER4GJaboslBIRWPx5AZoCBMcGqrNoVb14rAonnpCCNUzEhSFg5DR9v5feU
         U9TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888767; x=1794493567; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VL1FDtV7Y/ilxiUTM4V+mDRqqkZcTL/181qTv0CNS1U=;
        b=T0HXq6QGx4tsRNnDNj6TezWY8JXL/QrNw093anH8BDXb+1Z1SZp+nQeJLP9A4D74Sc
         EfTwh+tVepuCrAj8O33jVWFsT1782AqOIwUZoljRwx4fMqtOxBczShB4gHSxzciEr7By
         DQ8CB5WynyFZsMbk3FG269f/pWYO4xf05yt6pLIgC0ewrxMbEH94ZHWf3C7hKiUmbgT1
         1gr+w4KxsvS2JhK4/nw/vvv8NKjI7wxtvk7oAPH+/8y05T6l+csfvgJ+OSy9MJMpGZeJ
         a8ZGYIkhIY5SVtdR8fFGDYBjnlMYsNUNKAySk/PU1lFmoVodcLSsqMPYxV7LLbGiGCpS
         DMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888767; x=1794493567;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VL1FDtV7Y/ilxiUTM4V+mDRqqkZcTL/181qTv0CNS1U=;
        b=HKj5+QZ1C/4XiGrFDj1HimrIzSWhAjwCSDMzWDElK4jZieJN9sPLnCtY7iRz9h88Bz
         7065UnaEQ6LX8plzu+ZRT5isZ48SYR1odnz7J8OpHVQDDrZ9MBWtNjBlj11mYouCRLdC
         cnLgVAJHhBXCKKclrrcxviTMzHy5aoFkyeba2u4MklR6EZhP/I1Dw3HTvVQa+SuGtpsU
         X3ArmK55cF9lMKc1wFmfAshgKrQPnEqEsuWaz7i6C4HZvcTwnuAtqHbBszlamlE1WmaK
         r4ja1IApW/0RbVmhquzIJIP0T9LAVtBKXRB0LNaEmfEAPq7lRAgeALI+vAZm92zo0jiS
         PJgw==
X-Forwarded-Encrypted: i=1; AKwUvByT3v0raAbCM4VfuHnXAUGZZBojPP0TIZwXVZenInF0pculv3yUVhwtFPQj83dJBrAGdW63egI0XrL+9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nbszHiGzboxAvp5ZorBE9YOLj0uCROfqnUH9IHZrs/pr3rAhG
	UZraRH9Qp04H8ffsfbJzt8LWk2dDVsxaK0xN8WoSUUuJZUx7is79VsDuI+LkGmE0yx8t/se0w96
	OlJzqKPSosc46WEF8hjPQ3Kea00mX0U4=
X-Gm-Gg: AYBFou3W5qkNu+SNr4j3kNQ1yAw3yl/1HQXAwSxyIQcGDHiu8jWQQqGlvcLz6frflva
	N+CCURvm/UuXrP34VeqBIkOT46pDkXVRnl160SqTRBCyRMi8UGxMfjiQVfQrTtvTHfg2boCcrG4
	dJqdVpo1Qkba/3+axevn0i32XtJwD93KmJOAnnJRKnLJw15GjYRcpk5wNhJIoCuxLenYGjNK46m
	XvvZRWyc/WOSPnvbquH66S+TvAwVwUSpcD2tiWmRhUnG90b2k7ivUnoEK51tnO0wVsnv8kfmzwv
	vl5Z1bkooGXa2hRHFl5whI07iYv4fspjdEyQyrrBFFbujEGzgHHkvdgvdBAso2n/E/ytm31g+xd
	1nvsbnjCfquU9uY0YPEo3QA5fvDtpZ1WL/MZWxSOy7okWehWrDuDy9xH1CVBr+IEmQWWvorO5c+
	eCa4r0QMZLTcdGn6ku
X-Received: by 2002:a05:6808:e552:b0:4df:5cd0:89c1 with SMTP id
 5614622812f47-567ad730dd7mr3269297b6e.23.1793888766835; Thu, 05 Nov 2026
 06:26:06 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:26:05 -0800
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:26:05 -0800
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
In-Reply-To: <CADZg-m3HZ8qpXdRSQ5RhjTYQ+3Lf6dbu=radMm_m8zDRMB8GbQ@mail.gmail.com>
References: <CADZg-m0hnuZ+KpqkUgwZvkhjUdN24syvc8qxuR+oZC5rkJHSNw@mail.gmail.com>
 <CADZg-m3HZ8qpXdRSQ5RhjTYQ+3Lf6dbu=radMm_m8zDRMB8GbQ@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 5 Nov 2026 06:26:05 -0800
X-Gm-Features: AclHuK-epezXRH_mIvBZpgTJ0vJzN6LMMC6JgC10AOGRuvl6mSY4OPCNVkh8YdQ
Message-ID: <CADZg-m2pL2rY7ptSSD8OXWGPrAJx9Yn7N25HNYGonWNzMKysDw@mail.gmail.com>
Subject: [PATCH v4] dma-buf/sw_sync: Avoid taking references to released fences
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?B?Q2hyaXN0aWFuIEvDg8aSw4LCtm5pZw==?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, syzkaller-bugs@googlegroups.com, 
	syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

The last dma_fence_put() can drop a sync point's reference count to zero
before timeline_fence_release() acquires the timeline lock. If
sync_timeline_signal() takes the lock in that window, dma_fence_get()
attempts to increment a zero reference count.

Use dma_fence_get_rcu() for the temporary signaling reference and skip a
point whose reference count has reached zero. The timeline lock serializes
with timeline_fence_release(), keeping the point allocated while its
reference count is examined. The release callback removes the point from
the list and tree after acquiring the lock.

For a live point, retain the temporary reference until after dropping the
lock, avoiding recursive locking through signaling callbacks.

Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
Changes in v4:
- Document why the timeline lock makes the conditional reference
  acquisition safe without an RCU read-side critical section.
- Leave list and rb-tree removal to timeline_fence_release().
- Drop the Fixes tag because SW_SYNC fixes are not intended for stable.

Changes in v3:
- Unlink zero-reference points from both indexes while holding the
  timeline lock.

 drivers/dma-buf/sw_sync.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b021..8aa3ed777 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -221,7 +221,12 @@ static void sync_timeline_signal(struct
sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;

-		dma_fence_get(&pt->base);
+		/*
+		 * The timeline lock prevents timeline_fence_release() from
+		 * removing and freeing pt while its reference count is examined.
+		 */
+		if (!dma_fence_get_rcu(&pt->base))
+			continue;

 		list_move_tail(&pt->link, &signalled);
 		rb_erase(&pt->node, &obj->pt_tree);

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
