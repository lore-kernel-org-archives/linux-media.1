Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E13A8747;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783305811; cv=none; b=FZhlkcEDozHQlU1pGNnz/sja29hAUmRmmQEZ9rEcscUt7CcjcFOP4BWgXY2u8a0ftSJBiW3GCYWDohwEFnjvNAzUrmwTN+qYXFktvKr/qzvnMb8RboREhh74Z+ZzCmH4o+M/YoVuu9ooNIDHAETG/az2EAz35H62nd15C92Uti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783305811; c=relaxed/simple;
	bh=RdHJ5I75Tcbgivqf+f/sQIrZyTTONH3eIvRriKAVuhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aOLhJBmb3NUDdL5QCr+hl9QMkYH0q8CdqKqXk1by4IhRcILbBTo1TyZXtr9DI3wuVry5lH06Ii0/VQ6fRGEhtHzOGM+dADCOi/SlwD7A4pwQR4R4ml1YwAw/B3TKoDTdpXYqkV5OEOBPw0IS6owemIZy2DlxnWeA1sRgpx3AU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIrdOyn+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIrdOyn+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93682C2BCF5;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783305810;
	bh=RdHJ5I75Tcbgivqf+f/sQIrZyTTONH3eIvRriKAVuhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OIrdOyn++q3OekiH1zDQY4tqQ750ZnIn66/vXdQv8Re0k+xQFZA9VZc3w2FthjsXj
	 BeZBXZ5Uoc/tcFRnELL7ZbuqrEQrU+nC7+tgMzpP/21zpDace43pp9JX8FynOK5dCf
	 ya0h4dakRTpBTcO4ntA9CGvjxwTFWwkG2pTklBsRnrVR+NzevYoSOeHOjBsPdd/fWW
	 +mBQ9XhI8hROno7oc/IacKGYyhMQznEyFUQqhMBxdOjWpnhlnddtTn6PZ2H7PFRrJ5
	 yX+Gn87z80xe+Nfa7mv2eZr8cdrhl9NQC6b8vl648OkSQU7osNDEwSU5BnJlZp6Wpm
	 +u3hj/RpGwCFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FECC44500;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 06 Jul 2026 02:43:27 +0000
Subject: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783305808; l=1001;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=zbm1gpme/ld1wK4sUZ5JpKgpU+xuYVReKQPeHKlYNSc=;
 b=HW66s1CZtmd6uNLpNkxRqmusfq/dDOVZlGpW/vZYF/lQfw1W9ziZFq4h6okqg13y93in2GZA3
 DStB+h1BUCKA2+Us+plj3yL28IDY8ygsKhsljLbuxRcyv2XfNe4+4V3
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0


