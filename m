Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441803BD651;
	Sat,  1 Aug 2026 18:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785607485; cv=none; b=l3SKRY5itgn1i/dV9KFsU99MqhS/YHDf8TjJoYHW+f9pMHFtivFGPfyvjdIPws77N1V9h6Zxdga0Pe9KNuvWiIi7xtNysPFQ5HHYvU38ChG/VA3EoIs6753QrE46RLfdnWapJ24X72bU1puM6yCM2xAbqFr47PTCWH89DUzthqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785607485; c=relaxed/simple;
	bh=OYcOAn8tw3WjuLKcGDQG5AYEhbrlvbmepRClYOZVTvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkNbV1Ogv6MBxUM8qFI+qL8ZD+ZWFvK4ypY4SnV5/W8Sq1JYS0u+jDnfD6GEFyaFAqjL3UJfy/T/+PrF22AH5tZ+ZrfFS/3ZCpTSS60JiifrqIumxj6YzMMavTn7kBWSw1ZfQlybvDpQ3lSLhaOxG5di135MaLxQXT9QNnUUqoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gbYE6W9W; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Wa/Dtg9r; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gbYE6W9W";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Wa/Dtg9r"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785607459; bh=oguetVQLczmfw7FcJ1wwn0R
	zWHZ1bfkBRA//nRZEPVk=; b=gbYE6W9W9K8igM7vGrM474cROOEfITZ91PetnjZFIBcy/KNGL2
	n5yM/MbsnLhELlmPGvS9UiomGyYbbWiFAgFCM10fJZeMhjbQU8Fica5ytMb+qS71IzS1GXbv95J
	tiV4cKZxOG1dSPVbUHh2yBUS3IazKVBhsDF9Htmaxzue/kR6q4a1E5YRm2D7velGt4WbuE8LAvp
	NxKYcg7duoFX2ZSoqCst86tcNImEAk0bro4K6sLhaL/W4su/PTo19hCxJ7liZagpWrlFRyWOjny
	ulUOtS4303yRpinwJLCofYfoAlQZlWmPnjNI+WKW9ZmGni+A0/0ZE1aiKSBRIh12mhA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785607459; bh=oguetVQLczmfw7FcJ1wwn0R
	zWHZ1bfkBRA//nRZEPVk=; b=Wa/Dtg9riDwvCmruKajW+WlJhHnN+TELarAIhn55jQFGFa0Uco
	IAlr41/A0kvi45EfT/tgTxHBnvDH+uH9/JDA==;
From: Danila Tikhonov <danila@mainlining.org>
Date: Sat, 01 Aug 2026 21:04:14 +0300
Subject: [PATCH RFT 1/3] dt-bindings: media: i2c: dw9719: Document DW9800W
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-dw9800w-clean-v1-1-38978de67963@mainlining.org>
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
In-Reply-To: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Danila Tikhonov <danila@mainlining.org>
X-Mailer: b4 0.15.2

Document the Dongwoon Anatech DW9800W.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436e0d..63d4092ef290 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -22,6 +22,7 @@ properties:
       - dongwoon,dw9719
       - dongwoon,dw9761
       - dongwoon,dw9800k
+      - dongwoon,dw9800w
 
   reg:
     maxItems: 1

-- 
2.55.0

