Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356642;
	b=pw+mlmW3/VwgsaKskDul4hpv+pu4GOKdFb4G/F0VoU0Hm7LcUCzwowTsf41YKR71VJQk
	 38PKrN/7AYhQsyGcxpY7oUKm1lIIEQQpAaKM06v/gCbPyzjHyFRMg7j5pe337sbbG3tIr
	 bUk84IiDhChtSl5qB0fbDVC+0sMjT1jurs8nlHbpEnGytmcylEYXRX0JKaDJeEN8b4AQG
	 dhb5Btkk/F6uWMtCmhqBmSnittCat/6fTpPfhe8f9AJLUC0Sq5Ldm33DDa0Nm5F5VVog2
	 8aOtozRObw2Xc5/r4mGhKGTnV0ayy1bm8McPEVYyrH5CfFaMq8QckiLtXS5JQfKAyBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356642;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WpN9VARvAC8VQSn7VVnKBLHcqrlXVXsU0wyqlnXusXc=;
	b=FJlAo8K+D3/lfbsQJbcRsdZDyDOWpKzguq4QFPPUX1FPU2qnsByhsnPSrovcPfYd8dAn
	 8Ti5hMWzEpJoIkfwHQqJFcnQW3a6DXB/wEl7CW4CVfBxuAWtefZ/ZA4SS7BEGI4+F9fsG
	 SW/8risG4MdmtA7lcIRuiERnK4e4aFp+YY+aow3w3Rc0o2VqsrpGJjWslu6mlDgEzc850
	 grF3Vw1Z8UvGejDXb1J5/pNFqTV1jeokHy2azDHKrFLUFrEOYpXrE2Fh90SanTmsVp91I
	 23PZEd31QKzeWSTsS43YDxhhvKBayNsIOcUOY54eKWAe78j6IfCKBzcHp65EnlKjYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DTg7luD5;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685FA606A327
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 10:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685FA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DTg7luD5
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B5454B0;
	Fri, 30 Oct 2026 11:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793356505;
	bh=tx7/+klhVeWDoS0Mk4T3/5rIMVRmwc+3rRrUOWWg5W8=;
	h=From:To:Cc:Subject:Date:From;
	b=DTg7luD52N8oYBGdh40+rGzHwpWuQ9RQIk8VfV+yk9Lc+zR7/iQ/w2v5t4hEPjLfq
	 Uie9H+tzJNiWQfRRCbVI3ezxO2ks9BKaD27RiiA9+kcycdH9RRIGJVc6/M2rxrvYvj
	 RuI5Yoz6s8SKm+1cRaMb93ecB/D4XiM5N4n8sjdA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [v4l-utils] [PATCH v2] v4l2-compliance: Don't check bytesused or timestamp for error buffers
Date: Fri, 30 Oct 2026 12:37:17 +0200
Message-ID: <20261030103717.3098080-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
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

When DQBUF returns a buffer marked with the ERROR flag, the bytesused
and timestamp fields can be zero. Relax the checks to accept those
values.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Don't skip data offset and length tests
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index dba471e5b488..7d0fb9e58fc0 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -394,7 +394,7 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
 
 	if (mode == Dequeued) {
 		for (unsigned p = 0; p < g_num_planes(); p++) {
-			if (!(g_flags() & V4L2_BUF_FLAG_LAST))
+			if (!(g_flags() & (V4L2_BUF_FLAG_LAST | V4L2_BUF_FLAG_ERROR)))
 				fail_on_test(!g_bytesused(p));
 			if (!g_bytesused(p))
 				fail_on_test(g_data_offset(p));
@@ -402,7 +402,10 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
 				fail_on_test(g_data_offset(p) >= g_bytesused(p));
 			fail_on_test(g_bytesused(p) > g_length(p));
 		}
-		fail_on_test(!g_timestamp().tv_sec && !g_timestamp().tv_usec);
+
+		if (!(g_flags() & V4L2_BUF_FLAG_ERROR))
+			fail_on_test(!g_timestamp().tv_sec && !g_timestamp().tv_usec);
+
 		fail_on_test(g_flags() & V4L2_BUF_FLAG_DONE);
 
 		// The vivid driver has unreliable timings causing wrong

base-commit: be3d75c02de67a75d2a8cf4e5e1e70b6faa798dd
-- 
Regards,

Laurent Pinchart

