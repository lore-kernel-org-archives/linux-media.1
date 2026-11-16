Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865639;
	b=z0jk7bRwOHT91yd+93PD0+XhIYfXsLrTw/IC+I6+bTDuIWur2XkiIqfh4s7lVMoUIzFH
	 xvtGGG+KryP44Pk1XCKzcW51drTR1ibBHsctZKaKlHjbEKQM5ppz0VIwwqDOgsRDJjB6V
	 IJj3pAGccPWbycF386iCfw00BlT16nN8cX5xO0b26or05aJz9ISNpgpqcjJD7oHgHls0B
	 4xDoc6QGohbi6IGV+IdD+mTMf8lLtYQbohO313qKJdISLnYiiM3xx4YEBh/XjHg/OmraA
	 mTZ7P2GXU+xADy9WctvCk7yXFvBDB2zZxpbwh6x/SFi4bLc+35+jaSiEhhl95RRoFUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=e1n2CKi5oJJvoneL9t0mB0+WSreaqrGb0vx4fivRmvQ=;
	b=lkPQSmQ6FeRPD2GYX3kgccRZVVUOKpdY9SfyYADV7CdYjU7ZxV6eaAuJ474IgY30Ezkc
	 4WZS9beN3MUcyjc3Gu3W5OBX0QFc1+ZWkHri4odkJCSmsPkqQFIdiL1wfXDXAwNDxn8+s
	 2NqXKuhJylM67VHPGWbKxoWsqf7fRrF6r/qlMhgLq0944RVLd4BA+ZhQHbJuA4cYvzuaC
	 3Ijb3XHDYIxl34iGkLEQ05Qha3xydWFYcxHQBgo8IcESj67swxQ0Ez0PanvV5lF0g0fAf
	 +S7cXxmWsc3kOn04HMBKQx6/gWWXLhis/rddnfyKLJNOJO6CgbeJ4is6oaa6odS740g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULRpr8tr;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC524606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 21:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC524606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULRpr8tr
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71ad047710aso1701923eaf.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 13:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865637; x=1795470437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1n2CKi5oJJvoneL9t0mB0+WSreaqrGb0vx4fivRmvQ=;
        b=ULRpr8trMIroWww4QGiwdeUgo2HEC5RDzTy5Wag5MKjpgUYT8CQVGBwgE/MEpITj7Z
         +suQNwCcjJ66EjwMLJ2rYPEvmODeYJdwytL8X3n3a78dzvJcop8mQtb7t7+N37LIHRWK
         g3H2RL9rTwnu7szK19oa92YJdwD3puFQz/ZOr4ZLZbs97cfX5Dh//9bhS4plMB6WNEI6
         +/4JmdpDmDKF2lJ1RL7NpYYaAYPrB+rMPZpgsrKD/MZGzK7WJyUQTglCOme7TmUoop+Q
         L/H2Ly+VpIF6yln2gAUgx/1RjpoiC9BQf+J6phf7yhqEvab6BwSxBNwgYpqwsVfUxiyO
         LEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865637; x=1795470437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1n2CKi5oJJvoneL9t0mB0+WSreaqrGb0vx4fivRmvQ=;
        b=ESfAcNiLbjf3+LYIvvEQh6dwJf6ce1gEnPeTV3ogsoBR5I4tXQIjQdyfPygRM79G+b
         3Km0cRIMwuWx5COLV4lleoUEHzCAtA1loKp7wdYUISWKiC2eRq5LDba/Y8fv5/KcHFMA
         UJlCGhAJwd2WzrXkNG/mJbyAAwm5LrNg0PkSqRVX/lpH0iv7eB5oRqP7PCleWun3A/3Q
         mu8f1LdDlS86/w2dMVn9uJ2SExohYx4h42xAwhY1S1LBkbN262jwTkW/61mws5U1/jLp
         j0KWv35WzMq5H8LFRnePyHsj9ujrdVRFk27CNs9XYN1NIlGVwyWyTYRcu899OAObsIf9
         7pWA==
X-Gm-Message-State: APuU4Z/Hu666Wu0UQVPpoRe8FCyNrE2IxB4kEROYPjXpo05moeCqPySq
	GubQWTHcuClK4GMYZFAWCLrFb/y7fQ+a30+v0LaFrJTOJmL7JDx5+pnk7ZX4hbs=
X-Gm-Gg: AYBFou340xV+tFOXNrxbUghb0+RrMfOuoJ/84GyD/i0gFhXThBAS7WGG1NvvEeS5JZn
	GufrkxiddCE2PQhxJUFvABjFlnPB/FBlkCG61e0cPtZoixjv5XJUz8B+FuqrxrHXKsDDodIbrRQ
	4uqihA6s2jgUZrAWY+faDb76A0G827STEY7ySLbXRR9CUgvYK6a85DABmJsw1A5xMtVq8K6vU/A
	66bnh9TAvmDqyywzwWKzpzGJSwQ5RkFkqrqI3uz3h6oycaVAEQtACWhHyg6vuelJ+Ox0VnzGg6e
	6iikesZisiciQsDtCwXEHCgK0kZEKDH6qXQ3TrU2jHgjoNSzV04+G5qovJXA3mZmGRq7AK0wBws
	PuRxstloWJ7cpBFQypmIGutRi/tA9nhZ0bOaVA3tyynxNFxbXm+BmN1ONdZlH8RkXQU0SgiTw1C
	vdTZ9ZebxSpXyjJV8XSamHhxb2LLc8fHo7rwn0ZxlkKW4KV3naxY2tTVF9W0B8Hknkjj2rEU8Eg
	AB1h7WpcmrcAcKt0cBlEa0+uxBJ4WZL+827+gH/enVzaDcn149Gwn2suU9dO9xFCSIfpWcgZm/q
	deK2+Ybwz62+vYZ/qfj49ySE+4qBR3YuJEjblRaxG0YeYQpiF4wyViAb7yOgbnIR6pDFWPsC0Ih
	xSA==
X-Received: by 2002:a05:6820:4189:b0:716:d376:1676 with SMTP id 006d021491bc7-71ab523f56fmr7363786eaf.87.1794865637484;
        Mon, 16 Nov 2026 13:47:17 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71af221635bsm3509827eaf.0.2026.11.16.13.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:47:16 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH] media-info: ensure -1 is returned when a media device doesn't match
Date: Mon, 16 Nov 2026 15:46:55 -0600
Message-ID: <20261116214655.6979-1-matthew.laux@gmail.com>
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

