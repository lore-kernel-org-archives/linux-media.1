Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D838424F;
	Tue, 28 Jul 2026 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226624; cv=none; b=W7ZOuxipTLBOQ7NWRFn/dOhRn8Ieip99s7cnr7VFrNe9Nnk5kHkmKNb5iOIYCy18Q1hBmn5X6GLUwX1HE4KbNxox9K5uASAino7yZbYBdgu9tdEA+/LLf3PJ8OKjQL8DuCTqB2mejHGYjfsc+QV2lBuRsURgYmlJHTNfK11UyKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226624; c=relaxed/simple;
	bh=pHBsYNB8LFIRezZ1mJUqtqV3XDk17fZLjIPznkP0y7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ph+W/qJwVsOYLRYnXFOPUTeR0WBCQq9uHwcnIcQ42Ors84BcOppf0feJLjp77jmxfNV6WfohP4CPcJEjtFIcN36HdbPUcwYUsY4h18rE1OmNAhlUDSs0p2Nzwwgln+73pBIRoVJ5KjEdZD4QDJdHGi1Z+BNH9eEwAzzIK75Q3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b11acf628a5c11f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5f005551-4425-45be-81e2-f7b98823b1d1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:362ad27872e78062474beee364f3b22e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|136|865|898,TC:nil,Content:
	0|15|51,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b11acf628a5c11f1aa26b74ffac11d73-20260728
X-User: yuebingkun@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yuebingkun@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2019822044; Tue, 28 Jul 2026 16:16:53 +0800
From: =?utf-8?b?5bKz56eJ5Z2k?= <yuebingkun@kylinos.cn>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org, yuebingkun@kylinos.cn
Subject: Re: [PATCH] Documentation: fix a few typo and wording issues
Date: Tue, 28 Jul 2026 16:16:51 +0800
Message-ID: <1785226611234.97420@kylinos.cn>
In-Reply-To: <amhgfZ3lLS6NCv2t@kekkonen.localdomain>
References: <20260728030748.45399-1-yuebingkun@kylinos.cn>
 <amhgfZ3lLS6NCv2t@kekkonen.localdomain>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sakari,

Thanks for the feedback. I've already sent a v2 that splits the patch
(per your and Randy's feedback) -- the change merged via the media tree
is now its own patch:

  [PATCH v2 3/3] Documentation: fix "thare are" typo in V4L subdev routing doc
  https://lore.kernel.org/all/20260728041213.52820-4-yuebingkun@kylinos.cn/

The two Documentation/ABI/ files are split into separate patches in v2:

  [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI README
  [PATCH v2 2/3] Documentation: fix "readng" typo in EDAC memory-repair ABI d=
oc

Full v2 series:
  https://lore.kernel.org/all/20260728041213.52820-1-yuebingkun@kylinos.cn/

Thanks,
=E5=B2=B3=E7=A7=89=E5=9D=A4

