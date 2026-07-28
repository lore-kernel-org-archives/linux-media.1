Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BCB3B19DE
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250384; cv=none; b=P51Befokg04afWxg/1qd5BsLcT64FddhFyEiiTrrlAXttESOxtNv3kxx+54nCgnJvB1ok4SXJzqZl0fmgEpmYNwW3WsWJeRSQHdos67SiiQHX1b6JjY0zi8VyKDrqr/UbSysH78yTSdQfCb5dsbn4cScTdh+kq38TISWoOXK+V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250384; c=relaxed/simple;
	bh=A03iBjjsrmd7P23VLLld2IqB7k/iKwPpQglupny1yDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AAEoH9t8lRpUyzjGtQd0G7SjSkm1iv9YxjsiLS98vx3+Mxmel/du0lcTHwgP2uGeCtGwaEys0PcTAT02zXjVP2IQqDRW+EC8qq+uMIuko/Joj5bKD4wqnaUDvSW7ot/x7UxKTf3kN+kun6VYGhwJahCtTPDvsjpfMbPjuL77E/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJmH7qST; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJmH7qST"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4478286a91.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785250382; x=1785855182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fb3zEYy7ohdbXLHiAFwUrnVAHlOI76SPN4KCq0oGPkQ=;
        b=LJmH7qSTWKm5hIGcZi8fmloOHir07nQiDe5w888v8kZNOltnbAY0C1aUV2g6mgpX8O
         UxCGziCrKHeNXGXa9PKrxA5VtddDUJKq2snOswRVyFmg2Dj7SGgMzyqrcpXsSaia+hiz
         dw4EzDQQjJ/aLmz0Yc6wSl4tQKr5q1pmQ2DSIE75oUlOvmzdv8iKWTrdDYsvN4sP5XJW
         sDBS0equAvEVOtobHM6aWASeBeu9odBSPPdMPfZzD7WlguFcq9y0T09CAPu0TI4fYpwf
         j2Ym7ZvxSk+dK1iMNkHLEMiTjPkm6zQPi0Eg8HMOThC+k6n2kG1BoLuB8oZ0FSfluQ0n
         +2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250382; x=1785855182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fb3zEYy7ohdbXLHiAFwUrnVAHlOI76SPN4KCq0oGPkQ=;
        b=HOD48PNTdiXGEMYfP4tckjoA8P8yxP0Y45toP4SoeXFv/jKnexs+9HLmUn6JdShwFp
         r67HQjLNHGEymOXV9cL6K+MWhyuz6hGZqUTx67WAX+dhizuGQW4KX4eofsNbhQqqzkoi
         FLfkiWM06kApAuLINvXGzOj9XGb2eeuiU9EAwd4MPUXx/yutjptAYdn2IdIDdysQZ10d
         i9AvajBlm4++ryv4XNwmlZ0cNcnzLV3CeUoxZYTJVVE//Y82rwabMGnfuRvX86ubu+6T
         mMdnjHr+F2+L3xy3KKPnmKyuC7AgMOpB7NcIXvJZKSHG05b8Fxpllt1jasrXqYouqiqz
         cPmg==
X-Gm-Message-State: AOJu0YzSaAfMi8lIt0piH6e5XuCeybNUt3UVQWUi2PgDA3xMIsD++Lrd
	bliAL11H5BZWaQ/DvRRB8/oX0qncs9eNOK3FVap13YXwVm3q0jaVRf7J
X-Gm-Gg: AR+sD11grHlNkPnUODxdsKF6qqLDUVBq/WVmcKaxlA0KX0N88DOxBwcUWDZse/aTFZl
	Usbq81MbCOlbuCVWjbBrd/C80k+cRX1Z0HWnjyrmG0WXvQDaSh28CvN1Hitlx0tbIAggu59J1AV
	6ZtsrKatUi8JGVYFWm51PB8VphpSjAhoI51SZnQJTz/gKLrU457URgychFBH0sG+O3JNBs5M7zV
	s2b5Jk7BSQ0Y8Uqn700PBLbW8TFafOn5irv8wlcUUPKdA1i+EPDiYPLdtM86AsHJlc0YSXUAVgO
	TYjN0XrFDLfwIOIO5UCF3Km1UPBw1sTfx7ElKt1TXTM6qjtcstcuBZaxIjwIfT28t40DQfaauNY
	8JsRREF9j3oYAk/sNCjB93us1u8T/ZrMZY1uaQRCa2x1qL5aqQmTjL90UyhaM7DeJ3rlqU0Iq4u
	9WBJCZIu88xobdsogdWZ7vqADMQLSrXbw=
X-Received: by 2002:a17:90b:46:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-38f6a3d4d42mr3273038a91.8.1785250382299;
        Tue, 28 Jul 2026 07:53:02 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412acd7sm1447320a91.6.2026.07.28.07.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:53:01 -0700 (PDT)
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shaikh Kamaluddin <shaikhkamal2012@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation: media: fix spelling errors
Date: Tue, 28 Jul 2026 20:22:52 +0530
Message-ID: <20260728145252.9326-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two spelling errors reported by codespell: a misspelling of
"there" in vidioc-subdev-g-routing.rst and a misspelling of
"struct" in legacy_dvb_video.rst.

No functional change.

Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
---
v2: - use Documentation: subject prefix (Sakari)
    - use full name in From/Signed-off-by (Sakari)
    - reword commit message so the media CI spell check doesn't
      trip on the typo being described

 Documentation/userspace-api/media/dvb/legacy_dvb_video.rst      | 2 +-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
index b9fd5cadae24..71d044605315 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
@@ -344,7 +344,7 @@ Variables
 
     -  ..
 
-       -  :rspan:`5` ``stuct play``
+       -  :rspan:`5` ``struct play``
 
        -  :rspan:`4` ``__s32 speed``
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 6f66ca38589e..164cf0ad3593 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -67,7 +67,7 @@ subdevice routing table. This may be smaller or larger than the value of
 drivers may adjust the requested routing table.
 
 The kernel can return a ``num_routes`` value larger than ``len_routes`` from
-both ioctls. This indicates thare are more routes in the routing table than fits
+both ioctls. This indicates there are more routes in the routing table than fits
 the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
 with the first ``len_routes`` entries of the subdevice routing table. This is
 not considered to be an error, and the ioctl call succeeds. If the applications

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
prerequisite-patch-id: 912014811782d33538ddb17f00b64c15b364425e
prerequisite-patch-id: ccd9499245f9528a029f13653f6a670c70796caa
prerequisite-patch-id: dd62b9e9a5a590acea801e33ebcf110932d52a12
prerequisite-patch-id: 604c7b67fbc5678938599f8dfc11621e9d6e7bad
prerequisite-patch-id: 76849a9365b2ef77eae25f4ee42c11f124b1ea0d
prerequisite-patch-id: a0d7b90a4a5e251a58aa682ce414c7048eb47bc7
prerequisite-patch-id: 0208e7fa539736cc848ac91c09d7ca825b11d8f9
prerequisite-patch-id: 7b1377967ede9d22f77df0171f54207067158e71
prerequisite-patch-id: e39888d68322e429ea71d6ed6d49f4295fbbe14e
prerequisite-patch-id: 7f0dcaca727eb421484eabd62e791b96b3721874
prerequisite-patch-id: ff5dc6989d168666264e0eae2853f348a95d99b6
prerequisite-patch-id: 301b88e47a5d4cdc17e2152ebaf134b3f6685902
-- 
2.43.0

