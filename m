Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279903;
	b=OT084p9ZhsNQDf2PC3S/+Cc9Mw9LIfW0B+yFoynJ479rD0m+aIRHHDw7ApyJYlhthduN
	 +HPlvci+SDXEgxxmRvJF3n+G6nb7jaAvvVFi1QlI+HsW4Awx0XBWJc9fHCJ1/HH0JFd+V
	 E+5r66kNOL8Kif8mNKG1jBUQ6gytPbRWN6tV5fuc2bFNcGxnIfBQMOo+4wF1uqV8epfaE
	 oA3BpH9mF7U4m7bpOnsXrSBS2kJxX2JCb/DHehq44cNcJ8c56JOeWggOllfJvSEZq+INt
	 ovHOdf4RdiXkixRwP2GlyHsqHU8Ruk/4w3mnQncIKRQeNhVf8QErYkKdCKZWy9Dl8Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279903;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P3/cn3pwILkjlLlOHaHkzyfrefQU60f2NBEhst7CqvU=;
	b=GRkpyZhHNFHjAw6V2bKvMu1cUybdGpI9GHPZ2AShRNCzJU8Obqt1sczNAT/sxA7y5Ie5
	 jpIGZf1Kk83JW4rzOpeSWizjLisgZY1+Cz1OtQnvdYkhEij3GbCTGaOVeVJALUPoANGZx
	 3VX6X/IRfVB+nouK+NHwQ+fkTGSyUQI0Vghyf7SLwiRfy9Tp7Dset+wpW6hYS5kNpsuRs
	 SJD5Q0tebSn+gjvMQU6nUc6ipCxDSDj3KgFui1jchl3IYOAE8iUnqocntoTj7+LRuylH5
	 vekKD6AhfVSSHJ2byS7K8KLggsGw1XotR+nlWrlbXw5z57/Q12oiV8RIfjYJilgqVoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=v98qRGkt;
	arc=none smtp.remote-ip=114.111.35.32
Received: from cvsmtppost17.nm.naver.com (cvsmtppost17.nm.naver.com [114.111.35.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90907606A32C
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 16:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90907606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=v98qRGkt
Received: from nv1m-hmac-real-18 ([10.174.201.121])
  by cvsmtppost17.nm.naver.com with ESMTP id fAWSwmhOQPWpnvQVwDRoTA
  for <linux-media@vger.kernel.org>;
  Sat, 21 Nov 2026 16:51:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1795279894; bh=d5EJgpXL4xnft3v1Q5lsyugmR2c03GRVpNSKtJMAjhw=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=v98qRGkt0gsZjl1gjn+mrd/OX0/aC49Uth3eZ5Dexl2jRlxtnrGr7P7qqWYpvcSnP
	 mc3hp9m1CQ5mO1KE608PaE+b1MkRLbhERbNRE2iPiISnfBB9gcPLbG4q5fSn5hjzJf
	 yzy0hh95e36ar3VT5g9kuDuPkMBdNqftsTMujiw62OMVr+MlLVZPARbk76qWSS/O87
	 fOn68N4WcQwZQinF8/qM6XBQR+yUCM0TYpxEmrKYp488l1tszo8358WeHrNEDheCsm
	 uqWa4+smTtE2J0WmA3yum+68oaoAN4Ku1TwJv7ZRHOXjfUXjfcP1wTMvEotsWuAa9X
	 WyvwjQ3N2Zsqg==
X-Session-ID: oecTH1ozQeuVzOx2XmSdUA
X-Works-Send-Opt: 4ZeNWNkvjHwvb4enW4e0bqb/aBmmjAiYKxM/KxulKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: Y9KdKoElFqJZ+HmdaxtX+6E=
Received: from localhost.localdomain ([121.157.61.46])
  by cvnsmtp010.nm.naver.com with ESMTP id oecTH1ozQeuVzOx2XmSdUA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 21 Nov 2026 16:51:34 -0000
From: dungeonlords789@naver.com
To: linux-media@vger.kernel.org
Cc: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
Subject: [PATCH v4l-utils 1/1] sync-with-kernel.sh: upd Doxygen also
Date: Sun, 22 Nov 2026 01:51:32 +0900
Message-ID: <20261121165132.50309-1-dungeonlords789@naver.com>
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

Before a release Doxygen might be updated. Looksl ike the simplest way is to add it to the script.
Unfortunately there is no option to not create `Doxyfile.in.bak` so it was added to .gitignore

Signed-off-by: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
---
 .gitignore          | 1 +
 sync-with-kernel.sh | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/.gitignore b/.gitignore
index ef546cd4..43ed1dde 100644
--- a/.gitignore
+++ b/.gitignore
@@ -2,3 +2,4 @@
 patches/
 build/
 *.pc
+Doxyfile.in.bak
diff --git a/sync-with-kernel.sh b/sync-with-kernel.sh
index 8e29341b..9b6a4de7 100755
--- a/sync-with-kernel.sh
+++ b/sync-with-kernel.sh
@@ -31,6 +31,9 @@ fi
 # Update translations
 echo "Updating transations"
 ./update_po.sh
+# Update Doxygen
+echo "Updating Doxygen"
+doxygen -u "doc/Doxyfile.in"
 
 cp -a ${KERNEL_DIR}/usr/include/linux/videodev2.h ${TOPSRCDIR}/include/linux
 cp -a ${KERNEL_DIR}/usr/include/linux/fb.h ${TOPSRCDIR}/include/linux
-- 
2.48.1

