Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD453DDDAB;
	Mon, 17 Aug 2026 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963546; cv=none; b=kpTnpvpYG1dsGtCPpK2vioHgZhTq0910VRMMt6cBqTp0Namaqxjb6HwGY8AZolFBWH/MMa4VuU2JwBhvBBoGSMB+OCZiQWZ6Ks5di9YNlh8AUcS4j9WSt/XVU+Dzv5P0eaSYH0gRYnPmUjStJxZNmaXoRxgwyItyu1bKl1N9ZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963546; c=relaxed/simple;
	bh=1snwOukLU+HPH+VRzh2NpHeNmaJCG0EAl+Ur+fuvp74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NIIvNqkqIg2GMSEchqQyk+GUj1dbOcpa6HdIQVuwZBxjO3pgOEzcQrby9TW0cFhNHNuyL5Gthoo6tAJI/4YJ/0QmZl81vY+hCZEfC3+1VKUCw4EUC/V7IPYDhdwfROwgn+TrJQU6rGyt6jNtsIIiZGBEUczFqZ3IuR+mqk8ojAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c624b8569a2811f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:42a076b4-49c1-4d7a-93d8-42c933e15bbc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:13a27e3163cd59d0639f1b92db9e7fbb,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c624b8569a2811f19a56ed5b684f684d-20260817
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2079965758; Mon, 17 Aug 2026 18:45:33 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH 0/2] media: rppx1: parameters block fixes
Date: Mon, 17 Aug 2026 18:45:27 +0800
Message-Id: <20260817104529.3132552-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two issues in the RPP-X1 parameters path.

Patch 1 adds the missing type entry and dispatch for the MAIN_POST
white balance gains block. Without them, userspace cannot configure
the module. The zero-sized block this hole exposes in the common
validator is handled by a pending v4l2-isp patch.

Patch 2 fixes the Bayer pattern source used by PRE2 black level
compensation. The PRE2 path is not enabled yet, so this is a latent
fix.

The series is based on media-committers next at 31152f5b0f87.

Compile tested with allmodconfig. W=1 builds of drivers/media/v4l2-core,
drivers/media/platform/dreamchip and
drivers/media/platform/renesas/rcar-isp were clean before and after the
series. I have no RPP-X1 hardware, so neither patch is runtime tested.

Linmao Li (2):
  media: rppx1: handle the MAIN_POST white balance gains block
  media: rppx1: bls: read the raw pattern from the PRE2 acquisition
    module

 drivers/media/platform/dreamchip/rppx1/rpp_params.c | 4 ++++
 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c  | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.25.1

