Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB3B30B533
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853575; cv=none; b=R1fmY46TdT/h5uE97c0uWdr/0Z7aIYJPM912iP8hTdJO8BwPqsyPd3mNrjvqSA4q4t/JKLEfi3+3E+JyjBXlj6+R7n+my+BMA5tjde5f0VC1RS21N9FzsRxn+zFd5WEBYICuitLQ4zhko+GH2as62lbzEqxrzf+hpLE7zVQMzMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853575; c=relaxed/simple;
	bh=FkMJTENUW/E8bLe8tbl/GqGiMdpwz+zWAF9iNXXhHYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N0myOAMd5DR13W12VzOBMkCRHSExpFjguhebFvvLdFrwvgV9tjmaQvjvK3q6Uzm0NSXHAM7MFNuvOsaCtVSn3PHiEAbZtLplKP3tKFPRcZis157PpNeckj1SptOxBy0Z1aWpvq/QlGEc2K4KxmFz3dflLWmMe3tgiQ8OcRKVTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org; spf=pass smtp.mailfrom=bitbyteword.org; dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b=Rk1W/PSl; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b="Rk1W/PSl"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-90ea08cc5ceso562330485a.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1778853573; x=1779458373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okrIOhQe2ZLHKZjZRr+SV2MUNrdUF09nc7mShRbgYsc=;
        b=Rk1W/PSl/VKPnZvIIni/hzjl5DNB/qI1OHC+atlkdxNc2tLtSzk4lXn4sh325YafaY
         CLq3SjZftmWUfSq/vq2GXJXhCfuK1IV8xYhB9kvhhxGn8Ca7cJ7JHfwfIJ2vDEQe092X
         XPgUQfbAuysTsJEKi3xYWMDEd1tJNE86RI+h1phrOUbpEHUqrBPDAAuGCd1H5hgr4b0z
         7llqo9DDXfrHytPbpJbwY6vA0Tx84mYyOD2kEAQUjw53HVAk2XeACq3CEjXHJL9jfO5G
         TFPtT01Rdm1hEN0ekRqgqajJPK8bkD8ltBd+BdRL9hAfZO5dbao4EcLfxWm690jgXSfk
         NXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853573; x=1779458373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okrIOhQe2ZLHKZjZRr+SV2MUNrdUF09nc7mShRbgYsc=;
        b=itPboB7FFgbYD/QiVbc59UcSsRyzCQM4fv+x9simA7I6udd+u/rG9x5Tb9l2IdHESj
         VUO00QdgztWrHbKOCPy/VOM8Soy9Hpsylf2ASLgYw332w99FjLQlogRlAY+uc13SW5MD
         8RlAt1Tp7thwf7ZO4rMHBxq6RF7mU8DMhW/Z1LNr56c5yDvZw4lRuyZxYNWZWBY4VJfp
         ufiSqyCGhq/8/cDgrRKTJRDKOex43MygeR6KMTN2jNV5qpYDXaykYE/nidngKw/9jlq+
         +w5kPL3al6ER7ovEHWxRVnsgdlo3ERR1Y27xP0QegzcFbt4PAXM2ifgYjqN3uVBrCwrK
         65Ww==
X-Gm-Message-State: AOJu0Yyd/BGeYcX7Pd4Ye1EDnqhenEKVd+dJ2vhZhoWTHBRRlf7hWTqf
	EMzlT8gyqOAwCtX9SWp6HmJhYAgk6k8T3yMRA1314gBtNMXnGOR6cwtsKeUDKIwml/Q=
X-Gm-Gg: Acq92OHktVpwesrQ+3JwbQIedaVhTI4hfv96EaDhNHr9HWBnjokpv0bvhNWMJGQqrjD
	7xOLmWGmF8jsHMMSWuiQ+MIFtmn3klxJ1LfJhme5bfOJ6Py6RLaHXLFJfV01HBEcKD8tmPM8FWJ
	RKkDEtJm750zPUnUi5UKt+Efq541YMnuGF/gBu16oipySY3pvsKKzEzqoB7EltgzpVU9qbrE8cQ
	CPzzJjelqJr85hKt2iuO09ufoqXv5t08bdVL3jK7gvh6iZF301Y3xMYe9hu/CwkdlmeGeklcqh1
	KTxueYBwsDaRjcIKA3l8tpl3B4C2qL0vNRb1CmL1TBqpZryy/jnDd0kHGNaztDQbQyXO7uLBehg
	nWP3OYSeyH7RGeLsNzuhLHmyzT3n0P7M90/eJbyJG1cQtNuWc2jjGCKCKRCQFTYP6KsYl46zoP2
	WJVFr+Pg8wj6DbV9FyWyKEtVm1Q88N
X-Received: by 2002:a05:620a:44c4:b0:910:3078:5cf6 with SMTP id af79cd13be357-911d02ad04cmr617447785a.44.1778853572241;
        Fri, 15 May 2026 06:59:32 -0700 (PDT)
Received: from vinp2.lan ([2607:fb92:1900:6734:902:ab48:6190:9c1e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf318e4sm535460585a.32.2026.05.15.06.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:59:31 -0700 (PDT)
From: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 05/11] dma-buf: Use trace_call__##name() at guarded tracepoint call sites
Date: Fri, 15 May 2026 09:59:27 -0400
Message-ID: <20260515135927.2238823-1-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vineeth Pillai <vineeth@bitbyteword.org>

Replace trace_foo() with the new trace_call__foo() at sites already
guarded by trace_foo_enabled(), avoiding a redundant
static_branch_unlikely() re-evaluation inside the tracepoint.
trace_call__foo() calls the tracepoint callbacks directly without
utilizing the static branch again.

Original v2 series:
https://lore.kernel.org/linux-trace-kernel/20260323160052.17528-1-vineeth@bitbyteword.org/

Parts of the original v2 series have already been merged in mainline.
This patch is being reposted as a follow-up cleanup for the remaining
unmerged pieces.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index a2aa82f4eedd..a41cdd9c9343 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -553,7 +553,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	}
 	if (trace_dma_fence_wait_end_enabled()) {
 		rcu_read_lock();
-		trace_dma_fence_wait_end(fence);
+		trace_call__dma_fence_wait_end(fence);
 		rcu_read_unlock();
 	}
 	return ret;
-- 
2.54.0

