Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3E913790B;
	Tue, 28 Jul 2026 03:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208078; cv=none; b=ZpHekf7Canyiz8Rs4WMceKdtmZ5t/ZVhIV8C2Fm+H6hFogjAp4e8WSd+Rr0Pbt/EkXTED70uZhMxnHmf2c5l62WiHWd7D0yKig2NehnHfGnJ5cXWbPAS7VgTSdIbzm28cH+8U4pFzBOI3yLa9TTuucQrTy+UxFSmpHJJfxGJjGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208078; c=relaxed/simple;
	bh=NmV9K0y9dLbqp8ZeU7qkJHfNMmD8xG8WJm3/MM2tNnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iY21/dqFF1n9GEPg/3NstG2ngAqH14BQ3IsPHXnplbQua+GuqhNvsNlCDe0F2Z3LQIMK6e3Dpi4ObmezPLnBEqWtn5C5B7geUP7jSA9VwhnagGKEQZRYqGXKAAMA1xeJBGsY50pNxY7gUErm1DYOishjk2sK/GF8hKmxRoDhthg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 84f1595e8a3111f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f862f994-2fca-4844-948b-cf20dae8376c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c6f9318848837cbb6ff2c4b469e2e3a9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 84f1595e8a3111f1aa26b74ffac11d73-20260728
X-User: yuebingkun@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yuebingkun@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 839337244; Tue, 28 Jul 2026 11:07:51 +0800
From: =?UTF-8?q?=E5=B2=B3=E7=A7=89=E5=9D=A4?= <yuebingkun@kylinos.cn>
To: mchehab@kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?=E5=B2=B3=E7=A7=89=E5=9D=A4?= <yuebingkun@kylinos.cn>
Subject: [PATCH] Documentation: fix a few typo and wording issues
Date: Tue, 28 Jul 2026 11:07:48 +0800
Message-Id: <20260728030748.45399-1-yuebingkun@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This patch fixes a few small documentation issues in Documentation/ files.

I am a newcomer to the Linux community, and I am eager to contribute
and learn through small, helpful fixes like this one.

These changes are limited to spelling and wording corrections and do not
change behavior.

Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
---
 Documentation/ABI/README                                        | 2 +-
 Documentation/ABI/testing/sysfs-edac-memory-repair              | 2 +-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/README b/Documentation/ABI/README
index 315fffe1f831f..27c962e6a872c 100644
--- a/Documentation/ABI/README
+++ b/Documentation/ABI/README
@@ -62,7 +62,7 @@ Users:		All users of this interface who wish to be notified when
 
 
 Note:
-   The fields should be use a simple notation, compatible with ReST markup.
+   The fields should use a simple notation, compatible with ReST markup.
    Also, the file **should not** have a top-level index, like::
 
 	===
diff --git a/Documentation/ABI/testing/sysfs-edac-memory-repair b/Documentation/ABI/testing/sysfs-edac-memory-repair
index 0434a3b23ff3e..ab199132ffd8a 100644
--- a/Documentation/ABI/testing/sysfs-edac-memory-repair
+++ b/Documentation/ABI/testing/sysfs-edac-memory-repair
@@ -160,7 +160,7 @@ Description:
 		in trace events, such as CXL DRAM and CXL general media
 		error records of CXL memory devices.
 
-		When readng back these attributes, it returns the current
+		When reading back these attributes, it returns the current
 		value of memory requested to be repaired.
 
 		bank_group - The bank group of the memory to repair.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 6f66ca38589e8..164cf0ad35931 100644
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
-- 
2.25.1

