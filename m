Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C70333441;
	Tue, 28 Jul 2026 03:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209175; cv=none; b=YNQqJP6nlROcc7RLYTGGvqeh0M8rN6xVy5wv1a6uaXkfIPcgQ6t7Mv8qi8ux9uFykaNx6KKEOtApGXUt91wS2rELWx8G8+xZocwUt0I88aa2l/TXcKpNIf8q2QBPXEFT78SOvo3olzHsJ3T3wTbkPZrUxIk0XflleOFG3m7sfM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209175; c=relaxed/simple;
	bh=u0URWDwXVapq3iUUh8EKsRYAOHrmQOSPU2geMJD5M9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tuSpEckBPb2fwa2to8KUY62IEd2CWCpzmTyIa51irUYJ1EOEpJIrwFViVOcmhjPZCxwh5YfQmZn90ub2z7vL2thH78DTFaTUkJ1EHiPsBX0bTBwzSNqnGGHRvmZnJ0Vls7WzWT+zwSDQX6u4jqh+NwGswGI4/Sm4GeQf27vNpXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 114d05fe8a3411f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:92d36279-2b1a-475f-8068-b1502675a1b6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:c01dd43a00a348c4b46ade0ce6340786,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|865|898,TC:nil,Content:
	0|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 114d05fe8a3411f1aa26b74ffac11d73-20260728
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1745616413; Tue, 28 Jul 2026 11:26:05 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: mchehab@kernel.org,
	chenchangcheng@kylinos.cn
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re:[PATCH] media: em28xx: remove unneeded semicolons
Date: Tue, 28 Jul 2026 11:25:59 +0800
Message-Id: <20260728032559.52090-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260716093151.175539-1-chenchangcheng@kylinos.cn>
References: <20260716093151.175539-1-chenchangcheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mchehab:

It looks like the same problem is already being addressed by:
https://lore.kernel.org/lkml/20260629-cocci-7-2-v1-1-5884c80ee3b6@chromium.org/
My patch is now unnecessary. Please feel free to drop it.

Chen Changcheng
