Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637777;
	b=mhs0COPrPCVbhV7V5MFYVQOABPddV6fv6+YUiYhS98r37nfA3L+5/OdgJM9UKkKQjbCU
	 NZjrUOkaqRHPnNJge1qU25iFcPrL4Md01/VS02cvb9wBZwWrIl2/zUh6spE2SeFB3Eddq
	 iTS3bmPhWK+bZXvrzyCigvx9f+pwjehCUE0FrkoUiDcD/T+xULqzBLza7V2QfEoIFxiHG
	 C1uTFsyrPvjmi7BHYZ2xT0Vtvru8odTKwJ3S7dqic/Y5uFzBgaj/FfnCEn0CJ4tGuNyKE
	 crAh7JoS2ddSCiwP+RyCImSiMqomr3RR4gg1WE7GSTDiKHAuznf4x/XEkNnPsOgVEog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
	b=Y1TORY+zU5dhpNCSffSApiLmiNgx41j4vWFgfMqa9Th8cgJcd3wkIk5A+O+a71DZTOH4
	 C4R3T3rT4bppIqY3zoerFctVFxYGSeLEEqtPr0VVlEuKMJY3o69ZGf7Yh4QKtgKTPr0N6
	 v0Dj6AQyy94iVNtViiwioJ4Jj8siCMhXXNnjTXVMiBRM/gsJ2goA/7C2g3s+L/rcew+wF
	 3vpQlhJ/8hsoVM0VU03A7uMhz0JvemjJbPlsi3QrcmXkHY8E0J1CcW99QkIqRTCok4i/O
	 1PG+a4oRdbYhD/EnLF7s5X6ei3cuY88G44e9slNFBpgKrIwVW07onf96sWWdrNsuUFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qOqmNzN0;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8AE606A696
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 20:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8AE606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qOqmNzN0
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-718facffeffso617045eaf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637775; x=1796242575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
        b=qOqmNzN0ucSw+zj8LLSgvRF92SCBjHfDrQC2yZvYHZXsYAxDiokfKSE0n6AGDO35Nh
         5ldeZTAciKwnNjalKBpIEEJsooFv1JvOvi8+dp+Y9PDGDsXhcN7dGWQvLjxArZpJEitj
         HZvwUCM2otbQvm36LvoGxZx/PQQHpZeX3iimwHCscS0a/RlR3Hj9TROv0Qpc2ex7J/IW
         rCZqBtEKN9XvCXZtGVpzlCymmpIpHSXM8OeahGAI+48YirgOWPXa8dYwZBHZpurpGOaz
         CdI3ZNrPIJsgG8VFwzt62ScAcSpORiokQ9L/SH44XJ2HyrC8krB3UMtzxDwoBfGDtV0K
         l5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637775; x=1796242575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
        b=WeXH9M5jNERuoU5GR/2XA8xVGcGk9LCBVisIX9OGZmODLMRGKPcdGZTSZeK1Wcilb5
         KyRHOD9pvufJK5GE9g6cUI2HNdJba7hBWg/WyOZEMGkjTpDw8oUd0bbRv8J7UeInN0lr
         cPLGDJd3gmXSnpMtqu71GiuOk7fybgn1E89ZBdC5FIjfSYfAlpqu+lXswMIHfPkPqYRT
         gY3vl9AHQ6+l0UGsgf1SxCtS/BlgZ09OOM6u2T+fapWymGF2Di+ZgBxGMSYnfve6UFbt
         +o7XNNrg6hzYvsFCPWWN1LpLMK+emlVZlYWSsgpgx5KWwXPhNSBmHqY3c5BqTYG4A7w/
         wm7A==
X-Forwarded-Encrypted: i=1; AL+hErFNpC6fzkhh7eQc5rFsezEtPzXboIzDICiwj3pZWODPXNQ5bCAAnQigS9JyQfuXrVR8QBdtO85OnZH9lw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8yBwEo1scsg/EvqR/7NC+cznJrENpDBT15u1rif29ppBPMAO7Y
	pirF5akbZ0fjG8SpuxA/dCiHCVnRQsfeLIprcqRbbjqXFNzSNNxKx+ad
X-Gm-Gg: AZFdTZe9SNYu3KIJDXSuGVpwMhgetEEAmCDmm9Wj29IG1cw0CkyUdmYoZ/AtiZW62RE
	ReQkCXrpB50EEl+YDpeVrmRi+bxehBe0itNixCTGOGit0nDDJIXUwLzR8k4LPQFFlwOKqS9XJQm
	aWqkzdoAJS5OiDUYZcwvaGD98q0G2ONDWRdlnTf1xY+dMNuYXvhA82JYChG01UmryhALhj+mw47
	wCEBY/Gmtip20xsoFFBcQs6xgS+9X0mD9RDh52KxM86sybtHE9wznNZYXl9Kj8QEW3WfyjC2iNw
	2CBHXt3dPDpbvonRTbBJM1tIXqaRqQCkoxL6hAtFVaZ0UQdXZTh8T/Vs67xqi6fO+B3nsupXZKK
	GndaZvzsK1GpbRBF5/wU0QDabj6ieKdSIljlgLYFj3b7QffRG79G2pIs40Aw8WMl+7b44pGdnuR
	00XrGyJA/mfIDVdxdfqzVjJkIEicPdw3l3Mjf1/Cvc6RDaPTP4Er1y3Up7FCRQp5RIb0JZuSNYS
	0PNT5HlmxZA9s5u/ch4SyZ7og/ATWxsmIyTMVaNzUxxFbP0BukoOX+1n1n8VglKgcpjFrN909Wv
	D8lbQy4pFleWo1X6Yj7xnA9Jme7qD3D+gVLGZYy2UnSyP11X+z0HvjOk
X-Received: by 2002:a05:6820:169e:b0:71b:79df:90c with SMTP id 006d021491bc7-71b79df0a27mr2553155eaf.79.1795637775644;
        Wed, 25 Nov 2026 12:16:15 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:15 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:07 -0600
Subject: [PATCH v2 4/9] media: mtk-mdp: Round MT21C sources up to whole
 tiles
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-4-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1332;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SML+TmgHSjoTNgMjQurRhuTtIXSo3udus0sid3UwpCI=;
 b=O6W72FlbWN4LuV0iiRLk2CkaYM593a8j+vtxu/b4eIoC58xSpkFVNzhRcnOAn6Ev/MJIHE5Hl
 IFgMC6jS43GCBp+hiHRxs7WXkGzOImAzk9Iax4nRoP1wVzh7g3/DYbS
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

MT21C, the MT8173 decoder's output, is laid out in tiles of 16x32
pixels, and the MDP firmware refuses a source of a size that is not a
whole number of them: converting a 1280x720 picture fails with -EINVAL
for every frame, while 1280x736, the decoder's own buffer size, works.
The alignment was 16x16, so 720 lines passed the format check.

Align MT21C to 16x32. mtk_mdp_bound_align_image() already rounds a size
up to the alignment, so a source covers its picture, and the visible
part is the crop rectangle.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index d2813890cceb..34d02de4453d 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -40,7 +40,7 @@ struct mtk_mdp_pix_limit {
 
 static struct mtk_mdp_pix_align mtk_mdp_size_align = {
 	.org_w			= 16,
-	.org_h			= 16,
+	.org_h			= 32,
 	.target_w		= 2,
 	.target_h		= 2,
 };

-- 
2.56.1

