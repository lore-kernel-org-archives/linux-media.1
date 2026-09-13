Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2914D34A78E
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331123; cv=none; b=ZK05Q/pJRtbUezvRU7wcmMFRXI9jAl1/V+Co7ywtg5w8Qu/k0/hRcnQGJjxMpYUgG8wihEGUye1CFp/rrIDxJ/zbzjwZEL5VfSiEWeuSTg9Q9BHJDo1pCLruFkPvxR5kqzhqffFTdvLQRcaE4zwllPT5RImj4cGJCz3+OE+Cf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331123; c=relaxed/simple;
	bh=wVPdfHHc7Y5YOi1bq3/wbK/y4FPB0AGJQDgGhhASs/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k9AiQUpG5Q8lFtzpCkTLs5DE9iTCLug1OOOdsFuVwOLlkhvkLg98MqiRcSkbt4dRm4dDkEmUha5o09ZecT1Ztm3LAJZc7HQBkA2cIEbagpB8Bwwie8b4KPMeYy4x44sw9lm4NL6qWseLnavuJWzgDvTk2ofcbd2jX2OGMYtpQ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jS9Oyhi6; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS9Oyhi6"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396a51b2605so1322550a91.0
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331121; x=1789935921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwAJqMNkilHzTnH+YC8CauxeBsxg3wPDdOMmRVO1D3o=;
        b=jS9Oyhi6WQ4t64PinJABMWXnDoH0gkUUs9MKRahfYm6jv5ifrAejreoAVEK9Jm/2sA
         HVRhXLJzPeIPQdbHolwGYEtojcyWJDVudMfQyrTlCcBrOK4obAOn9NA7uNnswlQArbFe
         RlwZcg0bgpOCg6jLEEOZsTciEI50dDeABpzY3nijbe2uw98XxQKhWV4f3Z1MQPoriyb8
         vLQ2RxqPkPpecyT4O1DJ4TXdkMZYjyYRdnwffnQUiLAOVssixjVE4X9omjm7khGV1LYT
         wWYoLEXoRECNbnz1IJVfekPIK0bu0CMeDMxjOmhj6RU6ikLk8homfnSBTgqhm5CDXU5L
         SY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331121; x=1789935921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwAJqMNkilHzTnH+YC8CauxeBsxg3wPDdOMmRVO1D3o=;
        b=EY9VTZoQ4L2JocrIJzoF4sDtbl5cBqYYATwIZItPPyv5sdKzUIqk3TKOliC9dj1mvq
         Kir9AeVVF3Urit7jf8IZDD6mEfu5q+2TTTkMhSRPLxSWipxUe//SA/yvkBYP8HaIbmO9
         cPic9hmMXPkELpWY3nCWy6RYYFkHptriROKO0VCh+CTSQc+dMgVTZyqlLJZaHCUsSBNB
         bkmx9cInb7bXO3tGuuRUNoqGn16r1nPFWhgdFg8sLBnevf0V3uVVpiti7Ac+YwXCuo6+
         LxF6NgS/eJOUIapWnjkBh4qvPtAIpj9Bc+uEY49NM1h+zaHKLup8YUdTVklHqeJoijxO
         /FAA==
X-Gm-Message-State: AFuF++lymqVrWrJzVBru6x7Eh7WCcHkG/RvNYbTSdxVuBU5Uylxe5WqK
	AMnr2ROqA1yB/u1JyP5Af46Ixv6DZDTeoHVpQoosu6l8v8VLoA17kN5e
X-Gm-Gg: AYBFou3Ks983znxQrfRJmR5cvDAFbOoB8l3fKPwE8SBhXJOthoFY71GnqveNOdvyEyR
	Ggtqj2ATqWR1OTSfU3zlJ6jmw4JR/RmNyLODGfZxybhaIt5N94MxLbBrH71xlwVJtx03jeAb12c
	gAIPwgaE9jRQZhk5AeS439H/AIcxpe5OnFZGc9XNHn/oqSh+LomkEPxrGOeiOkt9EqfxgH80smm
	vKK9CTeZqE0zfa3l/DssPPv1KvnsykgpGNVXMTG4zFhIH5mhIAQ/0/sLOqDtUQ0atv1mQ4hy6pP
	VrIleElXFaDyCLPWo1m7OIr1fSwwmWe8PCNBCeloDHFhlRs4bh0zz8TOzKufIO1e1Oi6lfNbkNl
	6SHI+0zHH1Gje5GEOlxAadOFVxI5xo5cm7VBFYAK5U9QQSG64tPgbZ6SM39AB5biP5cmA5yhnSx
	3eGbzwR6G7I0ZMnZcVfkkPurFme+LruEaZd/izbIBRFRqdanp0xxF7NmzF5LSNf75w/kEDubFiF
	uhb3OYlLwtAFspcpCUF2g==
X-Received: by 2002:a17:90b:53d0:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39d9c3597b5mr23602257a91.23.1789331121452;
        Sun, 13 Sep 2026 13:25:21 -0700 (PDT)
Received: from localhost.localdomain ([112.158.192.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm19214591a91.2.2026.09.13.13.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:25:21 -0700 (PDT)
From: Hyeonjun Hong <hyeonjunhong330@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyeonjun Hong <hyeonjunhong330@gmail.com>
Subject: [PATCH] media: Documentation: vivid.rst: Remove stale capture overlay mentions
Date: Mon, 14 Sep 2026 05:24:22 +0900
Message-Id: <20260913202422.1230428-1-hyeonjunhong330@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The introduction of vivid.rst says that the framebuffer device is
available for testing capture and output overlays, and the feature
list mentions capture and output overlay support.

Commit ccaa9d50ca73 ("media: vivid: drop overlay support") removed
capture overlay support, and vivid now only implements output overlays.

Update both places to mention output overlays only.

Assisted-by: LLM
Signed-off-by: Hyeonjun Hong <hyeonjunhong330@gmail.com>
---
 Documentation/admin-guide/media/vivid.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 034ca7c77fb9..6741f25220fc 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -6,7 +6,7 @@ The Virtual Video Test Driver (vivid)
 This driver emulates video4linux hardware of various types: video capture, video
 output, vbi capture and output, metadata capture and output, radio receivers and
 transmitters, touch capture and a software defined radio receiver. In addition a
-simple framebuffer device is available for testing capture and output overlays.
+simple framebuffer device is available for testing output overlays.
 
 Up to 64 vivid instances can be created, each with up to 16 inputs and 16 outputs.
 
@@ -35,7 +35,7 @@ This document describes the features implemented by this driver:
 - Raw and Sliced VBI capture and output support
 - Radio receiver and transmitter support, including RDS support
 - Software defined radio (SDR) support
-- Capture and output overlay support
+- Output overlay support
 - Metadata capture and output support
 - Touch capture support
 
-- 
2.34.1

