Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128773;
	b=LnHtlwengyPil3SYP9vRniVLdAUnDrpTln7e2BZ9I3AhedhtmT+lRawE7QIPt8LGq4Oa
	 b62JdQ0oi/d42W5ZprRGDeBXcUAuEzV1zkgv5Sf4N2W8njPDAqhKQDeGo1ABWFalqOiwG
	 J3qUDaN5alr3o7NFb3RNdRn/JckNTI1FZbvJIVRmKa4rkXANcQjY9StG66v8TJ07ABNgx
	 VPAOrCjOEQWWpJcUyY5F3JxhCfSn059jTTWqPDcmoOHBJLfH2FHP2V8WmilcZU2HiDwkT
	 UnaYHxcHXSEDddUmOtYV+l5gH98cC7E6V29VdlWBpblQwxtRNhkls4qCP+1bDuiC6cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128773;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZLx9dW9LRFLi13vYBPaJ6CB0qmkd7ZjwY+o4dyvsbNg=;
	b=nLq0aE7WhTlON7ZR7gtDh7kSRwIcWDjsnr+lh9H9gw5eiOUsYtJNDxyjUI6s5MADkuKW
	 UZvN1eZ45iCPbcWNXB3gMKsKnuOM4yPDf/20n8P+B9XVKmWlX8/g8AirQASpmvOYcc7Vn
	 pZFaRK8QGhDlp+C03493rk59OofzPUHP+QSXVrXhvU5vEQMmmBoFdHT7EhkwCSJmMiyml
	 jk5WZSaoB5pxVklPkpS4P5DzPt23VL/o5zaKlpMo5SImYs4qfqAD2k09sH6+ppZNXDIdN
	 FIMusXBCvwTWFHPSWaI1rLzc7CivmC5liatgwFklI+PtW7bHdn4UxagRl9vENpZ9lkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nrOMfbv1;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA11606A31F
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 19:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA11606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nrOMfbv1
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E92F4BB;
	Tue, 27 Oct 2026 20:17:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793128638;
	bh=PJ2Yg13wIZXFg/PTT+jYXAKKjPacUVnEokSGmLr0+n4=;
	h=From:To:Cc:Subject:Date:From;
	b=nrOMfbv1j76+GXvfTWRef/1nuo/9NT//bp7vPl8IkAdcWgsooFs7dejXlzR5HxPHe
	 FifuMOJymQKxwL2PdksttKL9+MXaFjJ36HS3KEDqLN1SbNZ32upRvREfJXO1ZznZWx
	 C3gCf0WZC1aSSQbk3zmOgO+yn5s8mlhZLjvCgFR4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [v4l-utils] [RFC/PATCH] v4l2-compliance: Don't check bytesused or timestamp for error buffers
Date: Tue, 27 Oct 2026 21:19:29 +0200
Message-ID: <20261027191929.2528156-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
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
and timestamp fields are not meaningful. Don't check them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I'm sending this as an RFC because the V4L2 API documentation isn't
clear on the subject.

For the bytesused fields, I'm fairly confident that this change is good.
A driver can't be expected to provide data for buffers with errors,
especially if a transmission error occurred.

Similarly, timestamping a buffer upon error may not be something we can
always expect from drivers. I'm a bit more hesitant here though: while
precise timestamping can't be guaranteed, a driver can always use some
sort of timestamp. Doing so could cause issues though, as a driver for a
device that provides hardware timestamping would need to switch to a
software timestamp source for buffers with errors. That would not just
complicate drivers, but would also make it awkward for userspace.

There are a few open questions:

- Are there other buffer fields that we should ignore ?

- Shoulg (some of) the ignored fields be required to have a specific
  value ? For instance we could require the timestamp to be 0 on error.
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 22 ++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index dba471e5b488..47d4627ee373 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -393,16 +393,20 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
 		warn_once("V4L2_BUF_FLAG_TIMECODE was used!\n");
 
 	if (mode == Dequeued) {
-		for (unsigned p = 0; p < g_num_planes(); p++) {
-			if (!(g_flags() & V4L2_BUF_FLAG_LAST))
-				fail_on_test(!g_bytesused(p));
-			if (!g_bytesused(p))
-				fail_on_test(g_data_offset(p));
-			else
-				fail_on_test(g_data_offset(p) >= g_bytesused(p));
-			fail_on_test(g_bytesused(p) > g_length(p));
+		if (!(g_flags() & V4L2_BUF_FLAG_ERROR)) {
+			for (unsigned p = 0; p < g_num_planes(); p++) {
+				if (!(g_flags() & V4L2_BUF_FLAG_LAST))
+					fail_on_test(!g_bytesused(p));
+				if (!g_bytesused(p))
+					fail_on_test(g_data_offset(p));
+				else
+					fail_on_test(g_data_offset(p) >= g_bytesused(p));
+				fail_on_test(g_bytesused(p) > g_length(p));
+			}
+
+			fail_on_test(!g_timestamp().tv_sec && !g_timestamp().tv_usec);
 		}
-		fail_on_test(!g_timestamp().tv_sec && !g_timestamp().tv_usec);
+
 		fail_on_test(g_flags() & V4L2_BUF_FLAG_DONE);
 
 		// The vivid driver has unreliable timings causing wrong

base-commit: c6600a7e342ef6e336fba02212c90b60a36ca02d
-- 
Regards,

Laurent Pinchart

