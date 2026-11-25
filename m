Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644449;
	b=hJ82h+0RuX0o1Ek9eP2JKdCYlhUpOni8QPLaYlOYPq3CaRT41jt6vYoYrvORaR+5VJ6h
	 7CR2Lygn+S8njTGCXv/XaHdoRmceVKugJS2bNb8nnvd0e7J5jn2g3EvMBLc3XQbqH2TIb
	 8XNPrXDbFqsMlwjw9t1HJjAY8TkBhxxl/Xwx7zGcgHsGkeYWQnOJ/tCp3rqZAIHRQ/+u5
	 2mvJAux8LfU6YwSP4pKNx8IB6wgRm7RDVEoIl1JNOCc4FJNVabVj8G+eoTNjaJxD0D2Hh
	 9DHqsARIP8uBJNcpNgAQ2gt/c1UdwBclTbgMAmG+nOil5QTTmLwS2wjvEXCN+LLn+JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5NOMuzQCAls5itd+gr4fkbM2bzGyYoGj7xbAJT7sjT0=;
	b=CeaRcbaioyMj/dNdLOVuppSqL2tLUHcUDhkLNrfl6WcI5LPuP8zOiABs4nUKj18Jy4F3
	 goIAQUZi6ymKFapJ3E2ExOuXamEBPcrB1GKZs/7uB+Whb74hwtQqzi4IaJU1vOztWKBSE
	 R0uUBYhT1mnKHhIULaZ7KI5FSvcFdjQQOj2kdP7cbakQ1W/kzlP7YNotqrfj+DyqKCJ9p
	 OrF6Ckc9SoThPCGCdbk2tCBabZAZ8aG7CLub1tMdtkC4+vF6S3cguq1iuTtV/RsBCE4uX
	 Ir3pKT4q5K8Y1E/Su/A4p3ljxAeA8KTp0/HJGAhKTyFttDUq3he5Ev/g82hrnt9TA1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Af0Lkenh;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD20606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Af0Lkenh
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-53ec92375d2so3843218b6e.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795644448; x=1796249248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NOMuzQCAls5itd+gr4fkbM2bzGyYoGj7xbAJT7sjT0=;
        b=Af0Lkenh+dq10spkJN5RZhfonm5f47bfKfllbIXfGwkvh4i3KSKyR7jWOefMl8bFdJ
         okp0XT1jS7sI8m7plHPCNfYVnMgenzSY8ilpwdoSL8xvY8VFUQ1UvvayaoisINoOq4i5
         jAKNjmIyLN0UfxipU7XDO/4vCvfJHwyGqJ34sqy4Adr6G3KHTKfiLNstkk6CfTLaVnSV
         UhLBADrQxF4nskgHf8a8V1NruQjLBD4qOjIkztE+w4In4NrZ6tgEI7NUtlHVFk2jLSjt
         WJTxVW06kNF8aQlW5Bs5z3EkkHXBTIufhS/uIuV5KoZG9Xd1jWPjOuiFWoLlj46qInSg
         2JjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644448; x=1796249248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NOMuzQCAls5itd+gr4fkbM2bzGyYoGj7xbAJT7sjT0=;
        b=rc+j4PLVbKcqHBp8v6aEw/Jj8AfziNXlNOU1SfDaXBAYyFz2MzJD03KcAE7lPzCgFz
         5psmJuT3KFTes7BlfpRuEZW9Fvkx0ve9GZgE7h7hq7DDx3QpHJlH2SVcnFKihaq5hRVY
         osD4BXU+Iq7C3nFlavQZE/jBINkZ94CcOBFgjRy/K8yLOucl/MJN2TOG5XXX/VIlaPrR
         2nFys8/led7YoLC6QoAl+yvT7Ss2WEPsXJObYjSuhUGKpZT6IUucjHxDv0eOgf1mLBEu
         R33nP0k+Y3mGAJF2xnW4KFuEIZ2Hc41IdupRY4MFI6WXobTgFP82GM0NCVZcjJabXsU6
         BfuA==
X-Gm-Message-State: APuU4Z8qdBZea/xRTZrv9PIfU7ad/Gee9rJrAC6/RqApaxpg+X/v8tol
	/vf+a2Duh0dBSDXP0ptI5nYb5ET5kLAyN9qjbuac50OiZJKWxD3cGxQ5jwquEfVaOw==
X-Gm-Gg: AZFdTZckE4VA4IoK5uJ6jedkEAXnLlnvmDxJZLhwuQZedQth6Z+w5BKzKnPIYWsIvWr
	1nWREkTnR9pagFG8vrhGJhfGm9+g0J3z/csasPnuMiXUlvSkGOa0F+VOgO2v9ykDK2netpewJDi
	YOEUuuGfVKaBaXmzXdgzFs1VOpzQf4ecmAK/+CiYd08kGrdHxGDI5UDJvJ/zjRlajKK3vUI7rtO
	kpC1wEHAIEjP3We+VPFCR4pbeMBdE46VQQnrToP9sFPKOoAtGIbfyR3JGW0fjP+sUQ7bPVzd6+n
	3gcyRLwOTlhpLh3G2H3iwzQydmOvOsYIeEhBkw5TanHVFwPveZDGDkW968Fkjpi+z7A51o7GuGp
	Ke7uhweVo+KolKLNXUHI6AIEbFDnBkK9a7c9gTXBMuDeDNHpdImlbqLEmpsc+ojWQCx0nYHhJU/
	y0dBvvNPTHkk/8/wFWLPlRxgVSKF3Ul2HSdkqbKURI5G9OpXQ+kmxzjOn3iFmt5zwIfI/JJ1Wuc
	nrbm4KiqCJsxCplhVJNvG8UQ596sTtlKMPM+NQX4VdxxCmWW9DtoUn9vjRDT7gwxsO9T4VO8Qhy
	Xo6Pg2D6uM6UA+XYNG86shYn697Dx7WtnKXGv6SIxwMwjlrpNPqaWjVo
X-Received: by 2002:a05:6808:6607:b0:568:e5e:8058 with SMTP id 5614622812f47-57a0a517a73mr21633614b6e.19.1795644448375;
        Wed, 25 Nov 2026 14:07:28 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485a164sm14228068b6e.10.2026.11.25.14.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:07:27 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: linux-media@vger.kernel.org
Cc: Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v4l-utils v2] v4l2-compliance: fix sequence number checks for FIELD_ALTERNATE
Date: Wed, 25 Nov 2026 16:07:22 -0600
Message-ID: <20261125220722.26361-1-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sequence number check was impossible to satisfy for devices using
V4L2_FIELD_ALTERNATE. Allow the same sequence number twice in a row for these
devices by making the minimum the same as the current value on every other
field.

Fixes: 11adf49a3b56 ("v4l2-compliance: warn for non-consecutive sequence numbers")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
v2: corrected subject-prefix to "PATCH v4l-utils"

 utils/v4l2-compliance/v4l2-test-buffers.cpp | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 7d0fb9e5..7a621f6c 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -408,14 +408,19 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
 
 		fail_on_test(g_flags() & V4L2_BUF_FLAG_DONE);
 
+		int min_seq = seq.last_seq + 1;
+		if (v4l_type_is_video(g_type()) &&
+		    fmt.g_field() == V4L2_FIELD_ALTERNATE && !seq.field_nr)
+			min_seq = seq.last_seq;
+
 		// The vivid driver has unreliable timings causing wrong
 		// sequence numbers on occasion. Skip this test until this
 		// bug is solved.
 		if (!is_vivid)
-			fail_on_test((int)g_sequence() < seq.last_seq + 1);
-		else if ((int)g_sequence() < seq.last_seq + 1)
-			info("(int)g_sequence() < seq.last_seq + 1): %d < %d\n",
-			     (int)g_sequence(), seq.last_seq + 1);
+			fail_on_test((int)g_sequence() < min_seq);
+		else if ((int)g_sequence() < min_seq)
+			info("(int)g_sequence() < min_seq): %d < %d\n",
+			     (int)g_sequence(), min_seq);
 
 		if (v4l_type_is_video(g_type())) {
 			fail_on_test(g_field() == V4L2_FIELD_ALTERNATE);
@@ -430,7 +435,6 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
 						warn("got sequence number %u, expected %u\n",
 							g_sequence(), seq.last_seq);
 				} else {
-					fail_on_test((int)g_sequence() == seq.last_seq + 1);
 					if (static_cast<int>(g_sequence()) != seq.last_seq + 1)
 						warn("got sequence number %u, expected %u\n",
 							g_sequence(), seq.last_seq + 1);
-- 
2.47.3

