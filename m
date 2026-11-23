Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445184;
	b=XOFbqxAR/B1mvTpgSnLoOpTrfHdcgrHmoifx6QvIaLcIfyC6/eyX7DHBqBI/gte60nnN
	 JZ3OOd52NlEgaoLPI4jGXO+gvWRUAFhZnAxLFAkt7pd+4t7oE8xrJCSSXgOCXYezZ2wPZ
	 n8sk3GJunaoNQFKW+sQeuDSq7DTBYV/zz+Bt4mDvR8U11t6ILbanpL8GifHjLACgaE/pp
	 8EOEImVSIfEuLvwF0dnjT+oD+WS0eubTlIl09MIem+/xIcusbcX59NWfIWKGPeeOEFkT4
	 6K3An8GBkpPLmLLlHW8U/tMq//BrWGgYYGaUfVK8DJ4TgqPw2XJmEdENDAc64h933sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445184;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cR/1Sew//5vC7BMUh2TH9DNBwrtlAbZzpi7Z/KUi4+Y=;
	b=S5QW3VypdsJH3AO1YetolAVAMbLPWibrVstS57Sa6k3pZzWUkj1tXH4pe9Ts8PmESJ5Z
	 u8FBxaxTJIkaKIwL+5cg/w0wBJggprMXtH+n88xtsZlJwuqAt1sgkEBerhGDJea++0Xni
	 fcpV+UR2tPzC91uvQ1g/HHk2pigdqDIJ3CpWJJEWUUB3BlcTd9y6IBplY2Dao4GipsK5o
	 cuX602NSopL4ft99Yz4ivaQYwhJrMF5MHL/lZiZCyTNqzMoOMgmMLP2oIihXn69wYp6Nw
	 87wqWZni2JcALZNJUQHoGlrJxi2p4qrC1kg1oM6cX1fz47mTuCchSCkly+kmb8RuQ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=NPbFRIqC;
	arc=none smtp.remote-ip=114.111.35.40
Received: from cvsmtppost33.nm.naver.com (cvsmtppost33.nm.naver.com [114.111.35.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12F606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 14:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD12F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=NPbFRIqC
Received: from nv1m-hmac-real-17 ([10.174.201.121])
  by cvsmtppost33.nm.naver.com with ESMTP id jZQ71eDgS228DRUnspdoWg
  for <linux-media@vger.kernel.org>;
  Mon, 23 Nov 2026 14:46:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1795445175; bh=d/Dm8+mNeZ3ij8K0CyxJqSXIzcjDz2p4xFJIy6EKraI=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=NPbFRIqC3FqtqZcGSb98+pMZSzVps/+a7jUEzqEKgwG2CvcM+1Oz/hiOqME9Gd31Q
	 IPHHgwXcNR6MWlmRxJgBStizJ7R3i6+lP1voBdSv3pmOki4jY5c62XB4VtHuKBiHV6
	 FOkudB3k0cnsaohbMH1aGFUYvTcXmh7zEmlYlp2h+M4JtgJaA27RyAy6CvN0nGI85L
	 xKcrezSn3VYY2puZOO1BjQFU8TebkCdRfw6FhlXQhkj8KeLWEZ+n+Fb4OT3KRWucaU
	 Fguz4kANCEMfO9DYLeMVNBXYsgK1tqAe/K7Tic3MzMipGyOLG2hOZpyrXp50MrFYz0
	 VbE4pQbZK1o2A==
X-Session-ID: LJtf7KsCSbGkpE6YFmZNlQ
X-Works-Send-Opt: 4q+NWNkvjHwvb4enW4e0bqb/aBmmjA3YKxM/KxulKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: sdKwFAElFqJZ+HmdFqbZ+6E=
Received: from Linux ([125.132.232.68])
  by cvnsmtp009.nm.naver.com with ESMTP id LJtf7KsCSbGkpE6YFmZNlQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Mon, 23 Nov 2026 14:46:14 -0000
From: dungeonlords789@naver.com
To: linux-media@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
Subject: [PATCH v4l-utils 1/2] qv4l2: fix ALSA audio playback
Date: Mon, 23 Nov 2026 23:46:13 +0900
Message-ID: <20261123144614.3919019-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.53.0
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

fix commit f306132f

Signed-off-by: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
---
 utils/qv4l2/general-tab.cpp | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/utils/qv4l2/general-tab.cpp b/utils/qv4l2/general-tab.cpp
index 7de7e7a6..ca835fc1 100644
--- a/utils/qv4l2/general-tab.cpp
+++ b/utils/qv4l2/general-tab.cpp
@@ -32,7 +32,12 @@
 #include <math.h>
 #include <stdio.h>
 #include <errno.h>
+
+#if QT_VERSION < 0x060000		
 #include <QRegExp>
+#else
+#include <QRegularExpression>
+#endif
 
 bool GeneralTab::m_fullAudioName = false;
 
@@ -2406,9 +2411,24 @@ int GeneralTab::checkMatchAudioDevice(void *md, const char *vid, enum device_typ
 			QStringList devAddr = QString(devname).split(QRegExp("[:,]"));
 			return devAddr.value(1).toInt();
 #else
-			QRegExp rx("[:,]");
-			rx.indexIn(devname);
-			return rx.cap(1).toInt();
+			// Matches "hw:2,0", "plughw:2", "sysdefault:CARD=PCH", "hw:PCH,0"
+			static const QRegularExpression re(QStringLiteral(":(?:CARD=)?([^,]+)"));
+			QRegularExpressionMatch match = re.match(QString::fromUtf8(devname));
+
+			if (!match.hasMatch()) {
+				return -1; // invalid format
+			}
+
+			QString cardToken = match.captured(1);
+			bool ok = false;
+			int cardIndex = cardToken.toInt(&ok);
+
+			if (ok) {
+				return cardIndex; // e.g., "hw:2,0" -> 2
+			}
+
+			// Fallback for named cards (e.g., "hw:PCH,0" or "sysdefault:CARD=PCH")
+			return snd_card_get_index(cardToken.toUtf8().constData());
 #endif
 		}
 	}
-- 
2.53.0

