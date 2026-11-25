Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644435;
	b=UuUsn4yivJzZ7zIl2TO+/5EyS2lBOAGfsXwubXpQD+c9GwYXTQrgkJF3T26wuqTAWiUS
	 u/7VKBCXho1PVGnL6+1xg8QXMGKLGKv5dFeB9QNUBx8XHhtNhtE3+XLfK5PaUZIb78bl9
	 WAt+0cj/UJS85RVoA2k/UW2HuXqQsPAlmB8QFKzYUWvaTfSGY8x57xU05sWz/A23vZyTD
	 PRTfyXpTH/3IAaJZoUuzd56edjWhuh8S1iqxVLiH6DYkSk5S9qL+ewBNjEeQdECMnyoPe
	 dY6Ui06wxPHnTHIkq8c/N1a4ZyKf0Zm7z43PtiWRGF13Ks/7SeIxwLUThaNngdIto2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=T9D0Gy8hA7yVm5+UTs/aLCTpdJwrwTDoSjKAGFCcvcg=;
	b=ea7kf4BMLulJJ1CC2Fecm+5Brnw9XEDbAf3GBH/jfYAGFl64QVmqBnfD8QAkM4sxDIGa
	 lJpqInfLhiIdBtk7qiB9LmIsBgShHbLtyhe/rvggbtKIZp4HutBZ4YpU4mDuOeBhCUedZ
	 jw++2lnqWoDhYyilr08zUGO3bbNCL6NqIcXGdLKB+lt/sYFVjeF9usE2kRySiECnHcVHQ
	 13hTs09FJKipalZ6ecsZjn0A+l1aTv46IAVPZmuDKg+MOkk5JUotjc0b3fmE/KcIf4T32
	 CbDVw0nRHVJcdaOvhhxxKB3uLpPTNx1RGmf7jHDKlmBcE0JNzMNuB6LAqQ2gCsBol+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABrGrYxW;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58715606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58715606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABrGrYxW
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71b30ed75a1so3663518eaf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795644434; x=1796249234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9D0Gy8hA7yVm5+UTs/aLCTpdJwrwTDoSjKAGFCcvcg=;
        b=ABrGrYxWUoFW5+OemXIopAO5rOp8QFyUssAgDYF8+RnTGfOzoXOopP40S3mDQPPVCM
         NCfVj2OnO8EZr1qLhhfnoXJmsTQgiLmF3P/7Q3+sY5X0lZMbC5v5ZrfnZVw0DF3yXd3c
         dlXUydlGAMd4WWUE7SIcISrb2OOwGNr3FTRCc3CPTw2r6wolOCjSVJALK8wIuy3CbFYC
         BRkGU42oc5pn1nFUpuPrVoIecRsXFr916oKOuASMpWL+YDxOHtXUHpd9ETBw2ISzfx5w
         vINXcQJ59FjEpOFgdD1BB5jxDZbhJNbPJ25yUv/JGNeTZeYvNTcSgC6hqU2Ym6+njC8z
         QcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644434; x=1796249234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9D0Gy8hA7yVm5+UTs/aLCTpdJwrwTDoSjKAGFCcvcg=;
        b=MAEDCCyWD+UN0vbpB0I66YZ1v8iQgFqX+QFjH1lHDX3f5SZN/cynKI3DO/6y2CKDPg
         1RSGBULEcPVwl3VX2HDNu4B+TL0njWbO4gUnJp9fXuGt92m1ovPJQAm6xMeXumjj6RLv
         nosX+tNbBiLd31Lj4hau3z4ER2Xql0KK+EQW5uNO1Z9t5mUHFmrM/cTQnR/K+XXhTxpB
         auQ/D5WzfwRHBghaMEQ3sQJQGCkx18dzmyhY16OGPNdp5+HA7THTZb0mjMPulIB23DRp
         +kmH5YMhqFQSbtN2s8axLgh22zdgwVig3uMrWUt+kpX8QDHZrsOwLh0RoDuGXH97cVb3
         7IrQ==
X-Gm-Message-State: APuU4Z/V01c3iT/PZEOl1KmMdPmKKVWkREWZ/lMflFIgau2xCTUV0+pk
	4sc2nWs1GHapr4fGzd2o5CqjqwMGuxJZj7/wgsd6CJpjP3hsg/452zSkrZ5+530m/w==
X-Gm-Gg: AZFdTZfwAaCHLgNbkvdvDenvu7lTfjVityoa+Hg3daR2HzRcPUpXIdComrNwwy8BY1q
	pNyAoIgEV0Niwe4aRgPR8nPChTrG72x4T7JxT1ScezLxuLhRdwBrPUDw53HxSv7Q/JeoshmHLWf
	w+exFicrzlGuEBiVN793QegB9Ai5lCFGdXC2Zz6q6i1N+53XfnkpLa9FVZmQOBzPlwWD5nrQQIV
	F4EPU+aFZ0vQpnYA0T4t4NRB4TjdKZD1JcJBv0KSp7F/A5/iOe7gNaHqEyaV2SenjMXReDjTh5D
	ORSVDFmK7A/h+kZy6UypgtpYAQotxgc2kYdUP16RQJcvWpD+8OYP4demcdCjTesQrzTzCtTPEiI
	BHDwDLIHh2TRJ7A2bqegm0vnL5Bc2/yp+i/p/60VIep8H+0tVf9e+XQoyCRtRetMIg4xAVc2v/u
	90NaBu7rDAf9bdxZ4bJADbKyL8xL8aWC7cWp7Ouci54NwlkR3fMj7DYMj6fGoSlp8NVlFpFyKwF
	YrWLJwT0Oh6MR2N/kIlYprUJlk/qtjK4bHeqX3Av5vZvwO2+qfZvW00GWJm95b3icZ6RQEenuUT
	JWZp4QhFHdUruLzaz7jLs2Q4WGfhlVtiW5cPXLAJvsW8d+ZC6nXN5Dwl1Q==
X-Received: by 2002:a05:6820:c2d4:20b0:6f7:e193:831b with SMTP id 006d021491bc7-71b3947af03mr12012504eaf.39.1795644434251;
        Wed, 25 Nov 2026 14:07:14 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm12936595eaf.11.2026.11.25.14.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:07:12 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: linux-media@vger.kernel.org
Cc: Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v4l-utils v2] media-info: ensure -1 is returned when a media device doesn't match
Date: Wed, 25 Nov 2026 16:07:02 -0600
Message-ID: <20261125220702.26337-1-matthew.laux@gmail.com>
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

In the case of a non-match, mi_get_media_bus_info() would return the last
closed fd number. This led to the "Requests" tests running the "requests
are supported" path on a random fd and failing. Set the return value back
to -1 to prevent this. This only shows up when testing devices without a
media device, when other /dev/mediaN are present.

Fixes: 3b412f2890e7 ("v4l2-compliance: the -z/-u options failed to find the media device")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
v2: corrected subject-prefix to "PATCH v4l-utils"

 utils/common/media-info.cpp | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 6d6d7904..22eb897d 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -245,6 +245,7 @@ int mi_get_media_fd(int fd)
 
 			if (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo)) {
 				close(media_fd);
+				media_fd = -1;
 				continue;
 			}
 			break;
@@ -277,6 +278,7 @@ int mi_get_media_bus_info(const char *bus_info)
 			if (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
 			    strcmp(mdinfo.bus_info, bus_info)) {
 				close(media_fd);
+				media_fd = -1;
 				continue;
 			}
 			break;
-- 
2.47.3

