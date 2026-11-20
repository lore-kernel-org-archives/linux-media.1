Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204554;
	b=Osinw3JuqFTPM3q81QmnmZ5OYMe8p60ctn2hmb+qkeKMomRQmqL5TdFnH8tBNl6KyCpK
	 qZahzvi62JRUwoWESqR7ZeS/IRDrZUeVW1KIohiXWq/mRYIaEfyxl/ulUmfJJED6zmEIb
	 DzghDl9lS3I9yfGAZ/yWs8WqLtWqMN8gB2W5zlDYi9imXRzEQMtshl21Tx3l8bAkYMJkR
	 Cm76XiWAvbFcoYY+dUKxuikGsccAT9YZS98lFuqTjIEM6dxMW/H/DESQSPJco5K6StF3R
	 elMpSylta1OcXq/p9yiGh2aHD8IlkJvy7f1MG35Dv+o8KKS99jr0zg3q3dUY2qyjx4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
	b=q679ORD1KksNUxKML/2p+rU7+PJRgUUH2nHRUUiWcefo84WCb1Cl4IaSv0hJ2ICUJoYs
	 9nGvuSYhiBuS12MSsQ7SBdX1Qn9ML9iWmDPZNXBJVxxDpCe7HSEBwYF+Wf7cIDcX6b0vt
	 VApr3RFrEU+VJhDq9ReRkWPCyxT7qkeyyoFw/QAnLZ1z6FUSumsjYcw9gK7047HbtZcZ7
	 cPq5n7O2y8sYaNQ5i7yHvFL5Si6ZN6mRv5M0fS8zhc14vmjuAjOIhKkUYZIBkdhlYKRXH
	 zbhLRboUPckmGlkPwDPeJ2ffiABCG+EARtyuiklKLYm9ZD96K8j+ZWubX4nYt45nSbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dg5Y4G04;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287C606A6C2
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8287C606A6C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dg5Y4G04
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-4a9971eefa8so520775fac.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204545; x=1795809345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
        b=Dg5Y4G04zd/flSaG2DATozlJ9DAhSpNASpjVFqrRMBoRMS8bvOJuNeFaV2C/TnawEs
         +2a4tTO8kaF4ow9kSvSE0abqK/697h4ySXkkjJMBbLXNbIGGX7U3nLdewFY14+xNQjF3
         CfVvaoueLoif2VZ9dK70GtUGD+/h9eGq4NDq7AAUdUK/RDDuZMv2Z6p8Kxv5Z8lY5izM
         xjE+3r8gV7L7ULJYly73LWnO+ke5o3ftNNYPYXHsehJOQJajeLtqPSVbwZ3pzjKNt62n
         Ulw5bvfClXrGx1JPxpAg3OcKmLl1go0H4mUkgg4Uj3rD4YPLU+Y47rbsjIgq9wUWR6ZO
         ly1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204545; x=1795809345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
        b=WxdIRJihPwL3bZSv0/ovqlAyvdl0dmHYFFf33v6D7Wf08ho9ZJxuiQ/gI5NM28mNEU
         MVlKK9wqcyQ5W8D6v7xWjli3Q+5WHDF88+PGqhOZ3QHOy8l9tZXTQsxIUyRwYSb9uU6l
         0A0KGkLc1oFVH9hMp5DbhvVUDnRWUg2zCmIx/amSiMoD8sEkmkXYzhn5lyXxHqOtpAYM
         WxxTcXkLq9EuSwWwFDQFB7pO5wNSSLuR1HfBnXTc/Ib6RChngf1rw3aSxiCGkjophz64
         2HkxoC+qRafU40enw3NiMPFn37IXEzrUoCsQYn5DNyqwZ66T8k0CZl8aPJLrnpUtywxo
         gCmQ==
X-Forwarded-Encrypted: i=1; AL+hErHkwCkfNO/tEBUtLx8so8X6fSfV1rTnLMOCEtq5ugHnUmZilXFBZwmoJ4pznHffhrdUkXRJNaclpEggjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9cRUCevd02jK9Nq36f2T1es0AT8/JuqZ1NhpWl3b6ju7t/yOih
	6hlSSMKwXRROnndq3eNtfPTS3MX7s/xSF5jn/a+cfMc+AuM1GdJmohVu
X-Gm-Gg: AYBFou3pic6dQK8x90VZBpQJaHnsJPToyq3D84F5Utl7PJHPKr90BDb4eArPfHcGAq7
	sR1RLwEvotuihC+mYTvXUrNPBZfGvltYNZCiV0ebQwbuF145Io8Zj99ZrR1vxJRnhDNgczziLvF
	hUxjFIDtuPD/wEX6l09Saus8vB8ogXX/7vwSQP+TKk+qAJkg4TAMBYG46UiqFkjpYM6MsQYqN9a
	ZjN/AnctuJ458lFz5ntPgAINBwwD6ErvRsmao9OcGjCqVQMfEfAvgzD1b/FYpa+scQpOQ/dOaIG
	hP1oTTELGUwtD6D9+M1mpOH36xc2fnfRFCmMxnjSUZmf3rJLC2hjbuqzsF5rDiQ64H7eHYE4u3q
	UzFI0qBp1wnAKhiXuFNYkXRyNof+eJIrMyXxK3uQWIvVcarVXxhKmqFri8yQMyISwTNAhIfUHAg
	brGgqE4lhpVpDbH6llzYewTQmf1HeLwIVA2uYGXnb4PkWQbu1qZah3gfZJqlceZkp6pWJv0yl7J
	l7epSM1gCwCewzyMe1ENDJFEPkIleZdnooeZysXHKjF1Y8wFPD/yk2wp21hFQoO3zUi0tZglGR5
	j2XC2Ladx5GeuEmLNRgZPI0zqRoTQpv/TOR7Mh0ejX8NX0g9lhMW/V+nECwZT7r3ItI3wsIs4cb
	4TSG9wfYdeTNbjqCxmJA=
X-Received: by 2002:a05:6830:2309:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-863152f7039mr4827356a34.2.1795204545560;
        Fri, 20 Nov 2026 11:55:45 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:45 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:38 -0600
Subject: [PATCH 4/8] media: mtk-mdp: Round MT21C sources up to whole tiles
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-4-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1240;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=5J/eI70FCyDjB2S3myLsMuolgA4DStIsxM91Bga1384=;
 b=SqbifpdhBYdDKEWSD1Bg9yo3dJkJj/+ZjLhPLwuCFT2ajdG3xUkTtmCGEe0nVkbHMfOyIpOuI
 2jFrbzN5uKiABZiVVyvpT+MJPpE0NCPpLF9mPq4/OmLydHf+5NNUDB6
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
2.56.0

