Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403204;
	b=5gUW0PZPs3uy1mKbmHBqzTiIYtZN0vWdVgiqraSbYgqrRc9GIJWKg9rtPmpY1/QFtzTQ
	 DhDWBFMSeomxYeXHpTApQb4Yt3/tW11e0TJGWl4cP7MCu2A2gnNYRnk+u0lMRMPHbgo2k
	 vo8HiC7ipoKzAf7/F3Ef9Z6xUsdhlHnws76Syj0m1u16MpGyO8shlB8ZFY8Tw26UhTD2Z
	 2yaVWZKHrDWSgOtmuhrycvETQNPZxRcuCW9Fa4S7N4FRyx90lVGrkui7KlWZLsfEZJV+L
	 8dS9WpdZoL2YSvAr8BVqYI4X97iUJ945dBkOAZ6TsQJpRCCya+ahbLE/VWu3qBSL1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403204;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cR/1Sew//5vC7BMUh2TH9DNBwrtlAbZzpi7Z/KUi4+Y=;
	b=aNNJj7Jr9amY9AUGnVeiEFQaNzeYLuuLL0CdF9QeHvtra/79Ufm+iz9SafLr+W5iDCJF
	 H22l2/AVYWR8sXbfNiqwkztaYjkAsDP0QB0jY7L/C69TJyodKLShUBWvoke0VW4jhv+Ay
	 N01HYM8oeZs9L7WUnDG8yvY7oGY5MpBCyoyJXFGiC5R2+rbGejLIljXHJgHtLPk7UnR3P
	 Ec86j/hoBjAljrjplHJuRsPM1DpqFHJ1VUT1DdGblHn3hsYGM/N7nw5spzs2bZYXlR0cQ
	 WpsLwWZehBfzERSL3MYMw3+56DHWxxhtVKtWSoe1jXeD1/6wwxTCsrq7x0FCwylhnRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=HF1jckLA;
	arc=none smtp.remote-ip=114.111.35.39
Received: from cvsmtppost29.nm.naver.com (cvsmtppost29.nm.naver.com [114.111.35.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975B3606A687
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975B3606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=HF1jckLA
Received: from nv1s-hmac-real-23 ([10.180.31.91])
  by cvsmtppost29.nm.naver.com with ESMTP id 4YBV2FDWR9mh24ElknNiSQ
  for <linux-media@vger.kernel.org>;
  Mon, 23 Nov 2026 03:06:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1795403196; bh=d/Dm8+mNeZ3ij8K0CyxJqSXIzcjDz2p4xFJIy6EKraI=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=HF1jckLAmgAP7mBvJ4uqp3wl+8BYw1l9AA3d/OTt8oLJ579zNUmdGE9uzg5hOBio8
	 yTfpb5xW+xmaotRV4j2AM3NJpH8kj+4zOlz9oPSeChWhSlmfdMa+SlQMWaMxUYEsYZ
	 PYGrWjXOVv+atgcQQZtF1jhxN/TFnhGn/BRwNaWfYkjFEhZ3p061WrfCzzzaUFs/a2
	 WOXCv2CM5prCYzfeOOG/dPHQcaIuyZexJtEM/N4CZFUaj/7tvjyN45ptFl3Trv7blP
	 HSrP2t7XL7q/wvVIh3ThQE5Svp2rXNMZ14Q1lBkXejb1UCww47Bzj42yjOEtuYWwuL
	 UeCTa2XdykNoQ==
X-Session-ID: fXuCAha-TNuGCC0Z3YrUyQ
X-Works-Send-Opt: 4qFNWNkvjHwvb4enW4e0bqb/aBmmjAFYKxM/KxulKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: gdbXKqElFqJZ+Hm9axbm+6E=
Received: from Linux ([125.132.232.68])
  by cvnsmtp009.nm.naver.com with ESMTP id fXuCAha-TNuGCC0Z3YrUyQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Mon, 23 Nov 2026 03:06:35 -0000
From: dungeonlords789@naver.com
To: linux-media@vger.kernel.org
Cc: bwinther@cisco.com,
	Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
Subject: [PATCH v4l-utils 1/1] qv4l2: fix ALSA audio playback
Date: Mon, 23 Nov 2026 12:06:35 +0900
Message-ID: <20261123030635.3692170-1-dungeonlords789@naver.com>
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

