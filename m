Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C81387364;
	Mon,  3 Aug 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750355; cv=none; b=tjwEQkZUsTZDooSGySx6oJYTjhs8k5IJS4rodRJSjXb0oxQfo14ltaHD3dgLbd/JfZ0obqqZP+BXIT8CEMwNaYaMY0ot2/5t5/WEWdumD31aOZOfzT9BjRzy/528VRp7FZJjGr4xO7IqAMFQTwkea8wfvdPytTeTms1FhUvr9r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750355; c=relaxed/simple;
	bh=B/Uz3/A3TVs9dMBu3KLvCerT/38ofHI7DobOBhUXyp8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cH97uKoxm2x1FHNAcYSedntKyUklMzwHftzJ+3VRh6a0I2cWKL1Reh9BHufjRlpaFKDapDz8S5Ueh75DW+EeHTIfciz8eMZrurYC8qg6iBJitWu6GfsHOWe6gWI/5OvYRpx8W0NBW8EzqL6YdF12NrDKJ0Ld9Xo4GWf+VGzs6dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 18ec207e8f2011f1aa26b74ffac11d73-20260803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:233dd3fa-2ede-4533-ae7c-3d15d2f3e99d,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:7c0264b010e8680e365a23ef89970867,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 18ec207e8f2011f1aa26b74ffac11d73-20260803
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 628142516; Mon, 03 Aug 2026 17:45:44 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: mchehab@kernel.org,
	crope@iki.fi
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH 0/2] media: dvb-usb-v2: fix URB lifecycle on allocation failure
Date: Mon,  3 Aug 2026 17:45:37 +0800
Message-Id: <20260803094539.242495-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes the dvb-usb-v2 stream URB handling when
usb_alloc_urb() fails.

Patch 1 fixes a double free (probe error path) and a use-after-free
(runtime reconfiguration path) caused by the URB allocation error
paths leaving a stale urbs_initialized count covering already freed,
dangling urb_list[] entries.

Patch 2 makes a failed reconfiguration recoverable: the "all fields
are same" early-out in usb_urb_reconfig() is now gated on
urbs_initialized, so the next submission rebuilds the URBs instead of
silently leaving the stream without any submitted URBs.  It depends on
patch 1 (the gate is only meaningful once the allocation error path
resets urbs_initialized to 0).

-----
Chen Changcheng (2):
  media: dvb-usb-v2: fix URB double free and use-after-free on
    allocation failure
  media: dvb-usb-v2: reallocate URBs after a failed reconfiguration

 drivers/media/usb/dvb-usb-v2/usb_urb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1

