Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859435;
	b=mNsFQfAPJUbXSmC/35LIZ5soaSYk6YKrNAcwpdUFKmx012KFIjAQOEFA12JK6WpzCuLk
	 /pPrDES7Mpgr/iHetHms20LJeD+E3erXlw6+E2IGjbYfmaMqDCG6eTVCa+wgBLM+WvFTF
	 qtJJZ2Ni6uRv6vprOxeFsh8yN7xilPngVfz78AYpQRBdRDmm50w6d7I04E6Z1/C9YG4Aw
	 SvNz6LnPNS91CAOL8kwv9Tuqsk8bt7i8ZuwcLVE8NoLNf6UrtHV4qXgjGz19jb63YjNoZ
	 dPfRPC8ia76anB59lohRbR/li+7sh/GiJT6aRcE2MbcvMXDFBFQVVf7hJC65aWRYHlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859435;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=2fhJPgi4N0vS6qvt/AjimjQouU19nt2BS+q72lJ5HLQ=;
	b=aNCi5ylcalRZ8PEeYBQr20voEhdt8SRulfA8n8jwKklPTwVn1opZyTjqAP8USYd8hHyg
	 KQhIsAaxWaQDY8FVbdci+rNG5rUv8SKgkbp33Th/c4ybEuMp4gwd47rKgR7R4kve2+Wfn
	 psxylXjbLHP1eq/dgtEPT+/UwhkDS3q8tttykUI38bCmGs5yF82QJAL8uqb6uuriQr6we
	 ZMlHX4LvqUfjV9Ni+OlTLfYZt60LzaNyGPIP7LwYVptGMkSHAfwovOcDZdxhvG8IFj3LW
	 MBvr20hPznKfsqenFvqgDz/eJz0/OISPHNXIAKmzUQZmgcfP8vNbZB8c7FvyG8VurHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=idBX88IW;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5353A60A2615;
	Sat, 28 Nov 2026 09:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5353A60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=idBX88IW
X-UUID: 22ebdd60eb1111f1b9cf3d4034dccee2-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2fhJPgi4N0vS6qvt/AjimjQouU19nt2BS+q72lJ5HLQ=;
	b=idBX88IWcrGGdsqnnj0hpF6XVXOolRiID4ixvVZjYFYqg24aRgzmHEi0y5mJR2O7xYckUdLi3gz258IfAordwhs/KPHTxnF6XBTZ695Djp9lGSkCv368WebKKcFUY7nBxJH7FR9ifNAbUZ8QbyY+oMQmj2qpuf6G7fUkyFXinZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:74ab804f-08df-411b-87a8-355d4b3cbec1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:2c16e766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 22ebdd60eb1111f1b9cf3d4034dccee2-20261128
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 956172555; Sat, 28 Nov 2026 17:50:25 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 17:50:24 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 17:50:23 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v13 06/10] media: mediatek: vcodec: Fix vp9 4096x2176 fail for profile2
Date: Sat, 28 Nov 2026 17:50:10 +0800
Message-ID: <20261128095014.3128536-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
References: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
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
Content-Type: text/plain
X-MTK: N

The DRAM address of the VP9 decoder tile info buffers may require
as much as 36bits for 4096x2176 resolution. Fold the 4 most significant
bits into the lower (padding) four bits of address.

Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 decoding")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index bc21935b7..3041416e7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1134,9 +1134,17 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 					return -EINVAL;
 			}
 			tiles->size[i][j] = size;
+			/*
+			 * If the system supports 64-bit DMA addresses, the upper 4 bits
+			 * of the address are also encoded into the buffer entry.
+			 * The buffer pointer (tb) is incremented after each entry is written.
+			 */
 			if (tiles->mi_rows[i]) {
 				*tb++ = (size << 3) + ((offset << 3) & 0x7f);
-				*tb++ = pa & ~0xf;
+				*tb = pa & GENMASK(31, 4);
+				if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
+					*tb |= (pa >> 32) & GENMASK(3, 0);
+				tb++;
 				*tb++ = (pa << 3) & 0x7f;
 				mi_row = (tiles->mi_rows[i] - 1) & 0x1ff;
 				mi_col = (tiles->mi_cols[j] - 1) & 0x3f;
-- 
2.51.0.windows.2

