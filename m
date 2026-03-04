Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AAC3D1CCA
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650228; cv=none; b=LtraFoD9AO9Fc8s+Pgxlhzu/CgQluZbObBpKdLYWyrjwfgeztG46BZB6BmJzhFSTsmEAh/HHtmE/EXge2IoaB+hivp5PsRqEnbpxbtnlk23+WQGZA6pfS1K//zqroOKyvu0ehHVLYkvHzPZ5818JDgejr6W32RgO0D7zag18Uyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650228; c=relaxed/simple;
	bh=CoeSUcu5JKP2vlIyuq71hLdki8LZeHARqdF+DbG35Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2+SlS1EZbIYFn7dOMCRkiGMSC4PhIalyJQfSeJvzxCrfJbZai1SEd0U/oD47s/eEzRrpUmk+F5xbmSyY1jL0BxmRZujklKLQbOBLxAoGJoQubRVNCZbGnzp6Z0+oyTHI85j7moTJpmp7rxwIjg5SuLx5fCD15TFcACcOfJqPTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdbegZ+q; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdbegZ+q"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so14017841fa.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 10:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772650225; x=1773255025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcDfVsxOaZtMJ1kOTr1x0s4TukCtP+zyp2wxcrrzJwc=;
        b=gdbegZ+qc5hmNjpKXkQdl3QD7D7SSXs2ZqPrMc23J1nJB9k3bJ2TKVeQI7p2Be1TPk
         IP8vkYi+2R/nhMbmzKS7Bwr5DmLhlwAWdW6vg2SkPO9U08CvuumAKExpWxhzc8OBmWnf
         JGG3Y+1S24JF2ws9WE7joZaSdAa3C1j0GRznpokZL+DJyDDwyZDtYn43JLIMy/rW38ze
         H6S9l1kSOlY0YLXzCGBxq/+q7y0jetsEZ8wZbbHd8AHHyqGvgdBwo9lZNNGKz8YVBeaA
         WGG+HrYvLcByhaiQI+uJc2zyB0T6yRDGWgXU5o+rhBKO6TpBoPG3I+HcyY2bQH+EpyEy
         EhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650225; x=1773255025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GcDfVsxOaZtMJ1kOTr1x0s4TukCtP+zyp2wxcrrzJwc=;
        b=t3Ca4jT2Ok4x8T8i1QqhkvPNj0w7zNobZS3Pj95QzQHv2jrRqRFpWlKqFXpmNSf7Au
         3iSigjFNhHUcv3j4tJCkvIYCbAjqIvkif149obazmz3QU8I9+/DEWYHkF5reZkaAZaTM
         2buLSecNMHDqQc1MSrvM91asSvp/uXGhtll9UVRSpU1STsw/0NowOT639s7g7KqaTlFu
         C/z9cUr+MUywdmzMYTqLSzSlSjZY7pXEgxfQ0LqHcoYaU6fKRSPMbmnSImw90faysosi
         YmV28gaMdgOO/99HT+Gn6Qm5TYzrbmqof4V6yzMnA54yAI139eHI8K6I6wP1X9/06DYT
         wDiw==
X-Gm-Message-State: AOJu0YzJOsQabdQQmFxb2GKKNpe3ZIgqd2KpBRUaz1ct/bOFa084zDO1
	Lw/L8rK/PGqbEHzQtU/5GrSqw5Qo5EJmtdSGg86Vg0iJacNVm0F5um6S
X-Gm-Gg: ATEYQzw3+s3lnQsf5dcqYewJqa1DNNQXgPY0hdKmHm6qyPemv8aOKaTYSIrCLSQL6V8
	EWfKpMQMqb23bGrnRICkrU3s+DmGwcqVHHH2580nh1fLn1QqsCroZ9cwUzQaAzsyoH8hLyYC0mn
	Ip+C7qqnmYPnbjstiChSvsv6DPZt0f4q/RbvKiuxS1MYwJpJ4aYBBDw0C4Pl5K2lZZnZA6hoU1H
	nF3dE7FplTSgjdNfQATO7CXnXdl+r27TFIlwSegp/CW8VEL3XLngP9gAQpNgCMZq1pzrsg2Rz9b
	0AlyOV2rn8dR2bpDswaqOD41yGITiYNJaLa+t4Un0kcLWsR1Aubhwu5ppnJDWL5VKtE/iZtddhQ
	d3g++6WoxOnOEx38h2h+VwwVK+MRfW4UQv6GhFtCIBqgukIeIeRd7CFwtDmlHIc2zjZvq0C4+bu
	7ajDWR3BgZWLGW
X-Received: by 2002:a05:651c:440a:10b0:387:20:bdbd with SMTP id 38308e7fff4ca-38a2c5baf27mr21840811fa.19.1772650224971;
        Wed, 04 Mar 2026 10:50:24 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30179e9sm36636101fa.33.2026.03.04.10.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:50:24 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: media: mt9m114: document MI1040 sensor
Date: Wed,  4 Mar 2026 20:50:00 +0200
Message-ID: <20260304185001.82988-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304185001.82988-1-clamor95@gmail.com>
References: <20260304185001.82988-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Aptina MI1040 is a slightly different version of the MT9M114 camera
module. It is used in several devices, such as the ASUS Nexus 7 (2012) and
the ASUS Transformer Prime TF201. The compatible "onnn,mt9m114" is placed
first in the enum, as it is considered the default compatible value.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index dffd23ca4839..e896f4db2421 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -17,7 +17,9 @@ description: |-
 
 properties:
   compatible:
-    const: onnn,mt9m114
+    enum:
+      - onnn,mt9m114
+      - aptina,mi1040
 
   reg:
     description: I2C device address
-- 
2.51.0

