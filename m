Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5F242D86
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288045; cv=none; b=sos6bB0yxHON0Bvs8VB7W4gVwKFNQxCdKzEabmCcqvycJPCwV4Wi0mQFAH4Y2gyevLROs2VICqtnsp/7KJWniCg3IJIDLG99ZZ5miCshDjYteV9Zy0OH78kZjHGkWlSNUITvU8/6JLUCPl5+WC+ChFs5cQWz5S/jGQmdi/DY7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288045; c=relaxed/simple;
	bh=Toh8WfeMNLXt6DADlEJBFqnv4eGFPJoSXPt04u7zLAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqzQc5Hh1/+FoQBROePdGzUPrgRTokKM+KtCjvQqJTUABy3KeX54oF0oohXSXdMjqN1fHpnD06jJlb+S178V43Ein8ukIg4ETG8DVAHQvY4hSKE7gQUQo/BV+hkq+oD7QgOeF+38YEkq1DXhTim1GoiGFKvXDyuGwb8nJhpmMQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv0CQp5X; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv0CQp5X"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb3dfb3461so393817485a.3
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 16:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288043; x=1771892843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bkLrppSycIxmkV68TSyhILxOTHj6vATFc9npwdaNyI=;
        b=Cv0CQp5Xj8/RZV1Ej1q42HksMP+0quklMfTfzYis1u+Oe3BpUwEEBqdIIS64CFox+H
         /5jI71p2YUfRiX21+kGK1ZPc3/oPkHisbiCGzMnEfw/p8Rn/yISE4gzhMtgshUTIDBTK
         d85GnbGKX5GmiglSRkIbFWqWpQ6m9mKJ6iJe6L0TXrnvb04qunL+SSO9ALUVXBU6WvF4
         gx2Pnk9lPJ2YqYP2RLqdxmgKiSmAwv71CXRmX21IBUkwwuIM8IgXqWzTrSGCaoY/ApEw
         BNMi5Cb/YIA+oKyZEx8DssWJpnkCM47RG05ZvoFaSJsKbf88aR6KDBJRfRUk1IwJiD+t
         4KtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288043; x=1771892843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5bkLrppSycIxmkV68TSyhILxOTHj6vATFc9npwdaNyI=;
        b=ofqYhKVxt4bZWE+u3QGHVbpkYKaFm9y42+6JWGSeO8pyzHj2g4MZuFHH8glbOF4RWM
         BMChHa4KqbVL0zvGz+MzbsEKWz5u57JGHlwmVsh0i5gfgUejPWb1XkHLhU0+w/TgTQy9
         +OWVqqT0N/7gHcv5/l4Sfc0EMAuM4sttM9UK5yGc8NvkV7bsgIz+yBx3/L6rS3wAqx+m
         AxBEY9xhkRVM7GuTBXhYha6pWoUrDZ/QvyKBOGQYSFkwuROLfJxkbZkKsoXyPHo1r24g
         2bXWeky0gXy5fSDWRTnnXgzQI0O3695GFKQ1kgIFEVTxQspfQgXOO/SAFOobdRsG9Nov
         BoUw==
X-Forwarded-Encrypted: i=1; AJvYcCX8IbUCki+fwQc5b65WHPlbZhNKw/uFgaeW9FGvl9hBm6jDUBzmJF5xI2gNpaUTFI9aw5iy0uylBCBD3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5f/vvU6ythUtNQNA8sW1OxdGfD8EoY9PqZt/VbO6joa6LCuTR
	RFkcqQLckjXfGOTxXONqL4teaKHaqLinXFHHFLQK+qrfi6tQcT9XEb6J
X-Gm-Gg: AZuq6aI+xinSzJqFW5hC+W9pnMcJcCKFAqRM6iJBu1hJaN+4DHGiEOd3X9++RMnfZBh
	ZECF42VF70KMH58rRaBIgbsozVrf/BTMD6FsKLt0X/p3+5ymCyNxNCgelPSnM8mdrm112/qIZbn
	q1Caf3NNYDKC6ClswWobQfvTU/VcWXQxR0MbQgiZgXabN4rLheKKuRVJbiFYSu2QyJpelbPVhP3
	ItZ/WWicRb/UWakCCEQ/A9/w2maDOJW2040LWDSsf7k81nE8NxQr+psB0Rc7CoXOEEVt0q75Hfa
	QCJykT02O2RP8ZC4bNvUi1LCBY/SqLHLZ6NaBac+cMZHbjgRswE6jpBQZbvYUqi+yhL+6RtRKu7
	0DBiQv6rkZ3SbBXCe9XbnYItPXlw0WbLhkegbLGvFqAQDoLYerrigFpczA6eZ2AxMcklpXD5ekk
	w5oo7SwHvLge7qxsxlP010eN74VlAkjA==
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb66dca52amr244592685a.56.1771288043428;
        Mon, 16 Feb 2026 16:27:23 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc957c8sm156277346d6.15.2026.02.16.16.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:27:22 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes requirement
Date: Mon, 16 Feb 2026 19:27:32 -0500
Message-ID: <20260217002738.133534-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-lanes property has no effect on the hardware configuration, as
of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
clock-lane property"). Since boards with new camss support can omit the
property, remove it from the required lists.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe22376..38b308f441ec 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -124,7 +124,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -147,7 +146,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -170,7 +168,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
-- 
2.53.0

