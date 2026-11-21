Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.247.196.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278991;
	b=F7S/OJWk1nwryyfBblOA31By1uF7YrjyFYkCZahjJgs08mG9wpwmGC6yNqSUxxahUktI
	 X3vyaWxIU0ucp3x6cRbnXzyc/9jSVFvt5Lp+CoytfbKov2ZbgtWZbYTTXGHr4vPaGsQmB
	 kXSOCscIbKg+oFCQquGwctyNDNQ3we66uGz/nDXOdhmZ1FOkspFVd9OGs8XGO2YozOvnj
	 oRxVTToBl2gu+jRPhuSxAg4xh1Hpw1zZZ0YZtLkHmRJc3x5QlI4ajeH6Kt2upjsA3+T70
	 bPBqpr3aO5h3uPzaaxUrEFLPr5zvUj7S/wrmfkwwqSEsTFHoKzNswZIu/aFQWYEaB0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278991;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yknNUMbI5P/P/VAhWIbxXDodosoye6qZAzq+5/Seb4w=;
	b=ZPSkuW7Xp6ukBB2fDhEX5B/C3zRFJXsHg47D4wCAq9ocCfsVJDPq4HrDYWKPcOBxOrnc
	 1/wgLJqeBUL0XZKNlHOIuGqWTTfKH7mHTMxQJQKJl/dvuJRMLHleqewIQJHVaf/1MWYwI
	 bQPSQhgjF5eeNNs5PPm7CqNscJbW7r95//acdMYkkFqfnFa6Nv/BfeRnqZACkgIeU6lld
	 otlnr1gATPZiyiBc1KSp0E4TmTuSH8q+kuiin1tlgY0KLmf0n0Z4XWAmAkZ7ACW3N5N/5
	 W9ZhAZ8GTCZiIOjuLSDdlIBUVXKdHqG/KlfskZSKpSsBShOG/Zi15YPU5xActMdK/xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b="gq2/frf/";
	arc=none smtp.remote-ip=61.247.196.156
Received: from mvsmtppost13.nm.naver.com (mvsmtppost13.nm.naver.com [61.247.196.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B10606A335
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 16:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B10606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=gq2/frf/
Received: from nv1s-hmac-real-21 ([10.180.31.91])
  by mvsmtppost13.nm.naver.com with ESMTP id 6eB68u+fRSy6uQs5wKTKAA
  for <linux-media@vger.kernel.org>;
  Sat, 21 Nov 2026 16:36:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1795278982; bh=wBiYiclXRukEN96/o8kozy/HlITYIXsYUHckYfY91Rs=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=gq2/frf/dvkrRxdQZ3i/TMNbUjlLnk0CGTsFJE8p9WWA/8BS8m11HQBhkgLedyd0l
	 f4wDOpd5PbKrAcN5Du2ydhiQxO43S7lcqS+xbmhzNi5g3leooJaWbhzhsuizFUUhsF
	 QXCcC0Yhlnl07lX9AfuYfKWibEBowsRHJenfWxKc29zxhtsefadm/46hZ2t+68/Z22
	 TtPLVVJp+Snnll9q+quM1JtYqW8LzJoJtGwgTD4Tt/+sdt1G3z09g/ATWHIFS72kzV
	 N9REFxjHiBdhW/7n3qdT4ZQmpBx1OxnUK3ZjH31NQ8L7kCHt770HgvQY2le3gwxWC7
	 UH1QNTNqD13IQ==
X-Session-ID: ISKFIs+GS3WXjhxmKwW+gg
X-Works-Send-Opt: 4ZeNWNkvjHwvb4enW4e0bqb/aBmmjAiYKxM/KxulKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: YdbdKoElFqJZ+HmZaAEr+6E=
Received: from localhost.localdomain ([121.157.61.46])
  by cvnsmtp011.nm.naver.com with ESMTP id ISKFIs+GS3WXjhxmKwW+gg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 21 Nov 2026 16:36:22 -0000
From: dungeonlords789@naver.com
To: linux-media@vger.kernel.org
Cc: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
Subject: [PATCH v4l-utils 1/1] sync-with-kernel.sh: fix typo
Date: Sun, 22 Nov 2026 01:36:20 +0900
Message-ID: <20261121163620.47129-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.48.1
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

From: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>

Signed-off-by: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
---
 sync-with-kernel.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sync-with-kernel.sh b/sync-with-kernel.sh
index 8e29341b..d67bb587 100755
--- a/sync-with-kernel.sh
+++ b/sync-with-kernel.sh
@@ -29,7 +29,7 @@ if [ -z "${KERNEL_DIR}" -o \
 fi
 
 # Update translations
-echo "Updating transations"
+echo "Updating translations"
 ./update_po.sh
 
 cp -a ${KERNEL_DIR}/usr/include/linux/videodev2.h ${TOPSRCDIR}/include/linux
-- 
2.48.1

