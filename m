Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865686;
	b=A6qdjctNjwBadXaWadWdzw3BUcwrEjvB89namQA4q0AiUJH8jiUG57i7UjX2qIDH7Jr9
	 GCq0OFx5baRvnahDPfVmBd1mFhRLX669/OaOXkUVgHOqoYDL+gCo9ntbqGrsz0aVeR/7U
	 0PZBwTZnHDe49NI17IFlvvlFx/bF4VlEXOWOTzDQKxCZuWQ3KVwh+2atRiZRwVcwqB+1i
	 Sqm13JoFSd7OQxISCErrdhXZiBtIQQmZcAqR0akkAwKHLHQtwbjbZsBuEK768C3Qdq6jz
	 yMUIskT/3IPLRuAbPDVBTsjwnLeLbr0LzGZzlQwnPQWdHCLinwQPdmC5ntYrTg5PhOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=te1i6C9QpRVpXDU3hzzeRn5tm0gArA3d9XwAnwknOas=;
	b=5NojVpdlkXDPmMI76ABoxGxhb7k8gda9nhs36TdzxL70TLqG6I1FdYfSXxG7P+WuwGG9
	 TkpSqJIF8pNh392jo4iLfBexW3jOCUIB7WPxZk4E1E0GUyD5mySnzpWQujezjxmKirMcy
	 iuvKZVOt5gu/wP51sccuk2OJXaKiquWBzd1o3IdU2iS2jac3RJoQHvkLe1SsVWc/9DIBS
	 uiPxvsqwJmGFZO30nmQptRlVnWSAIbX5lXJdOSOWtZUx9pg8+qDOXn8wf5n3/qLtSbcCy
	 CpBXMFVFsGUuu95WlJQOuhZIY11Why1OVD2yz6L+IAExYLsvVpB3+bya1LqaA2VTRWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxzuHApq;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09ED606A322
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 21:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09ED606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxzuHApq
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8470d7d430fso1700058a34.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 13:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865684; x=1795470484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=te1i6C9QpRVpXDU3hzzeRn5tm0gArA3d9XwAnwknOas=;
        b=PxzuHApqJjmOLHHkVAFIgEYYqG9O/NuFtcSEAh3m1OF1PtyKdwgeSZGk/cNqxXNJWH
         cDDYwGO2dCTh0LRYhDtwiJGQpu4qAR4RgWvUDa6xl85yviT5BQWwzpA8LlhuwsxaclUY
         zqoZw56uc0O20O+z0ZSK9ANP0YZkmBOsvnb0LTshCtFCMUHjFp5NKIN9wOHRjPDBAmrd
         c5+tUorgw/42i/PGuJ87DBbj8u4ya6WSJxBwC9fX2BzJlC+c4HTM5vx/UoA64JkNq4Jn
         QmTo9qBbYaBAS/TjYkfAKN2inP89KrPrHC7WEgWfhIQ5pw7oI4MENlQmuBdx8LctLna9
         +slA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865684; x=1795470484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=te1i6C9QpRVpXDU3hzzeRn5tm0gArA3d9XwAnwknOas=;
        b=E9rpxB97lpr2KfF0+GicMEVSm+6QccQCIMRrBJs3BIT1LKFNjocY85rs9XYrpVFdxZ
         60l/2UE9EFIr2RqjZFZEnVRrlQj/HQdZaYRTDwLchq0Q5z4d7CpZ6QndHSEWKORiRXhN
         wqOJGG6dbHz4+eAEarWmUmxn6lbX/ckRBbYg0Sgtks/92jF/Eg0UtknRvA5ia9SjU8KF
         ujp/faiQAhGqxOHfdcIulUEQf7Rwc67C2ioJUzkhFetthI88lWRZjBdTIR4EJ0VhUkQ5
         kRTFGlvA7zS018ID1n74a/UjEgahcCKOnZb/62iz3v8aZNrqSk/zWyOLxsGydaSDNAKC
         2aFA==
X-Gm-Message-State: APuU4Z9J15jQAM/mnXV61qz3GkC3KSUmIDShfuXkJ7XRMWRYd+5puqnp
	t3445KUpeBQ5BpiJyh5JQdeo6s+pndqOZhRawPFaeBJ0JKucrE7PdhVjZbnL9eU=
X-Gm-Gg: AYBFou3PJE3lxWPIqr4DFh7Oq13uPZnL5jUxsMfq118C74TWu+v0vAWNNHsw5iybBNY
	j1GmC9KY9mMzylQrfK9K0KP3eJZsqmYbeE03AExYU3lm4/L8JpppUmnH7Vazh6pxgXcHilWUqdT
	SH98Cs88PUK+QrJcKjVk/EKObRO298ywFLCrB6gYFScS+1r370D9E74XggJzBrqxFiOlVDu8wl1
	sJdJMqg9TAYla4mi7tWcaHg3fR/8zAkxrYgjKoLWc36GE6G9H38jB5lSuX1qa9WNZZEqeGmikFm
	a+ge57TqO2VvFmHHKSsqJ2FL0mT3WFBZB7CMdvnxMFRsyQrg0rkCXEN5jKGmx1ByYiymAMgiNfm
	ipLmlpUAdRYlIOUN7Gk5BHBCQxU37g5arJHwUnKpJ9FgeEWljrso4nJ/toea+6Dz9xmeLHA/9vR
	7rwEOi/7BeHYSqPZQ7MJzIJSTDvwKkvtPjl2y5qvYb7jL5tSL1J9Q7+sNoYFIrtPACNmoKxgr6y
	JTLR9Oq/KhqwyxzFCsrQzvVxtEpkNCDTX3f7sj8+dkXYce1OyW/OWgv08YHsMnCiGBZtbTUidys
	WHCA9aUHyuEvy+hxYVP9uBfxwD7EH8OKmw+pLbZd+3INN44OSzgeIWJK
X-Received: by 2002:a05:6830:44a7:b0:821:a094:b26d with SMTP id 46e09a7af769-862898f49f0mr11263531a34.13.1794865684442;
        Mon, 16 Nov 2026 13:48:04 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4020571a34.13.2026.11.16.13.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:48:03 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH] v4l2-compliance: fix sequence number checks for FIELD_ALTERNATE
Date: Mon, 16 Nov 2026 15:47:55 -0600
Message-ID: <20261116214755.7040-1-matthew.laux@gmail.com>
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

