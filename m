Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E979717A2E8;
	Tue, 28 Jul 2026 00:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785199663; cv=none; b=S5B7LNL+DgEgGWRra3m4QEj+hxGVI/N82HPo8oiclqju2OX6RVwPxv1QpIrpaAma9h3w5SMXRwUEtEqtFYSpsLuFgT3F+nsN53KY2K4cLpdIXtisfdCHHDXSGnCFWeVyYa+KbjPPUNUOnlhw7MfVCzcmhUBcq2tec1ZxUy7/veY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785199663; c=relaxed/simple;
	bh=3FgbqzB8G4LyhL1mVvbft6AfxDunTB5t/x67Ibf6CHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t7Kze553qUKgJUURegT5NDmrvrkVX+Hor7WM/byYDYVtCCOVhILoY0NYwD8zxbT6NrcB0nkldaKuqwKsr/NqGFnJN6m/aCHPvN2hxCNOpjjDR7KMcwO/vZ7rTJmGyVs8Fju7vS6v2kGevfzuVy5+zdNf90r9AC0v/ivSGKc/POY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: eabb3a668a1d11f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:739f9c1e-fc01-43e5-9aba-14d1b13c237b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:ae914aa2b923422e7de0125382645ea3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|865|898,TC:nil,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eabb3a668a1d11f1aa26b74ffac11d73-20260728
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 452032653; Tue, 28 Jul 2026 08:47:32 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: jacopo.mondi@ideasonboard.com
Cc: dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	p.zabel@pengutronix.de
Subject: Re: [PATCH] pata_ep93xx: fix possible NULL pointer dereference in ep93xx_pata_release_dma()
Date: Tue, 28 Jul 2026 08:47:29 +0800
Message-Id: <20260728004729.12145-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <amc3aBU6dTistIgw@zed>
References: <amc3aBU6dTistIgw@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for pointing that out. I see the issue has already 
been fixed by the referenced patch. Please disregard my patch.

Chen Changcheng
