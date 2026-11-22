Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313459;
	b=wyHjWzjGPEwBh70ANTO4fhbPDo73YIVbwccwObsUyokWjf8svy8+XyeLvlzZs7O0fUvK
	 MQqBCn/Uwt0aDM/RRr6rwwschaHQjuFFQaFtuC/DQgcnXM0Y//1shvM9QnfeUKx2VRPlC
	 9iLf6QVaboRmtatzhVK/rtJLybvA5ZAr1+/+pYAKWPvT9HRP40rEMdKNMwstSEwR6ZmND
	 XfKySsaNb2shq7wlxWVvD4vdgKY1ULpW1kce3VSoNrOQwJy2+4fE8NI2PgtzARQF9HC0A
	 8jeO9a72Yo+G/DCh1btrqx42fcpsBK9mp9AnJIIWDPbB8UQPyxxnThKROfOmsoGLBVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
	b=igVw2XUwkudM6JaoBiV6QsqUG4NgMuYP+jQY0q3Ul8S/NLczbFSg1biOZttgLkTpA4ji
	 o+ASsx4CQ4k987Qxv8SQYiI1aOfP/T9dNc42Qfa02SunbFE7tYjrfqAhjbXGdBbm0I1RH
	 gLslj6dc+AsU4OUk47Ls0pO61J19nG38uNAobEFXAWkwC6fgnk79umo18VYqI49pK4bnY
	 JKQrH9gPZGWpb0WcZnLWYDAoJl6XtApQgxZyS7NuXFoNob+srYBXyNVaR3tuOPnaIIWhd
	 oi3H5Shpt7QIM99D88iFbvWCyl1gNWZxhwXihHr4PcyPRMoKYrRYbQ05xMV/ktKdYZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kqxzZHLn;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CC7606A338
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 02:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CC7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kqxzZHLn
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-497614c95f0so1227795f8f.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 18:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313458; x=1795918258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
        b=kqxzZHLno1siIGU+x7Wo9LNA2v5s1GUJ3RZMNYH6OK56Ie70MKKn5eWy2OlpkdBAs7
         zM+P1HPoZ/ioPRk9pYvBqrVAa3wrkyslrv5+SCeRQL9rvueBIIlEASMSelW1N5399QKP
         AvFEkFTgZaLsXsty1/v7DRU9mR89ZwjPrlKrWBN3612xJnbtP8jk5Hp3pjXn3yr9TvaF
         vdzVAlxIn44gGN5yFIYvPQYxKDefYb/nQTfy2+k4RWEGdYxIb7t4cfex6W/WEfMtp1h8
         JlpibIxgiHXUKwR44MkLY85A09Uq6QLp43mpbgi0s/ZSWFA/ARz7HriFCHjn+dCNECFN
         Dxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313458; x=1795918258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
        b=IcRk4NNiVmsoS9eKnYpa53Drfm6txhM62jJm+TvugnZxm8C2uhNFEz7ePQg8DZQe6H
         wykwPQxyp1kgTtKneFbngzoiFtRCn8utpx5bDz2aK7T81wsCYHqjovpAXhvQdskl/1rZ
         iQa5ImMQiWG+EN8a1jubIg++HCuynrQZf8LEaOIkT8fkyxOm8T8nhhPP52i7c5h06ThV
         oOhVNUmbKUo76+QbZX5UVcG40Fcvq/JhHl2ldHLl3HOj5lYV8Mb/xkjwhzuOBw+VW5tH
         kAvvU84E+fhrmcR8saKsFR/17W45hJjNQcUopXkJOfS4rx9orUTBqwe/0921rcW3ihdW
         j/4Q==
X-Gm-Message-State: APuU4Z+D50ejN0T39LWW+ucuAnEr0Yk7grbR14e0mQDDWTEteh3FMUce
	LMwt6uhR5BveBOnkHLx3nSTWexM4uGYzMYbLYbvU34tHC9bdR+h8blhrx+I7nWokYyFs0y9vNct
	Jg44X4Ao=
X-Gm-Gg: AZFdTZeqAi3o1eGtcMil9X9Y3ia9mCl15pquGM3gVyMs10SS+b2d1Qdmgxf0d0Gm2x8
	LaV/4rIZBp1dfx9ej0lCdwcUX1N8SDKZtNDosjuln/rGzIixxdY6RoMILmRFC0P7T8DTXk8pk13
	yqsR7KIX3dQgvmGcCXMdLC1xBKsgKgmVKIg4Rv7NolK5XBh744PqJ6Rcw0pGKU4S/xCHaHqM7KD
	jeaYg8bbaugMSpiV3WLUYU8WxZz5gqjQFjXSO7qKvIW7p2Coxl/vfTWs35ThYTnXo3wV36L+5T9
	l9Lfu2YFLhu25sp+aVWmKEBAvFUGbrvj7lVHkV5M/QUSOz3PZPv9dq3EevQKK7WG5lpDgsrO7rN
	JwT3FPkNpH4mJox85vEI41DODmPN4a9tO7f3S1Z1u4P3rjoWsnjmBG16M2ZxIwxUKGJx6ApVbJU
	JF1Kj7Ah9FLVCQbha5hwg4Ho+FQmWjvbhBc7DjpU7BbV89NHuaxJYpii6TfiHjlQW7dZTDUUbmt
	9i56FmGPf/sauDwEqAcY/IktYDxN8gT+ZceTFcHKscRcJ7Hmx1EEKvz8ujxLv+NjfhEflh16oa8
	/AyP9Vn5JpBD4qdaMDjW
X-Received: by 2002:a05:6000:2309:b0:4a7:45a2:ec26 with SMTP id ffacd0b85a97d-4abb0f3bc89mr16386094f8f.16.1795313457577;
        Sat, 21 Nov 2026 18:10:57 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:56 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sun, 22 Nov 2026 02:10:49 +0000
Subject: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
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
Message-Id: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395; i=bod@kernel.org;
 h=from:subject:message-id; bh=9VmSMCiwAd6wMvEr0q8cG66RISBCUbwiO5AxYnBJo4c=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8qevMZBnrtbTMdBwkqggrhWOGUyKtR4e3jN
 vwdWCwOyoyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKgAKCRAicTuzoY3I
 OhwuD/9M/iAtWfoIEszZWFGErOTtVbgxKUhxHaqpvRVjoww6re2QW0l+5blOSNQDzjwwqGDvE10
 FsJZqgGIv9qxtBK9yRN0ozcJp07T3HgPJPItriY5OiTMBeccWuDsAu3MrbRPGq8slp8TNXf21kY
 dMXx4xX7tdThaPmNHzVEsllN2nFwQqKTlh14p9tlgM+18HX1VV5txsUY+wUeW6F7IYpUgHdve7B
 ZqWb4hO/DKS9WNI5Gm7nwN1sPBAfQEWzwMqR1uoNBvgaf2iYKd/PrLhR48khaBb2f3eNbmh/kda
 PY5nC7iTv340t1f8jncX/Jhw1Mptycabggd1xKlIVISiPqTxKGNzBw0ZgSqiXPtDN3Z1Fr7U1wG
 z+L2pvczkGdz7+Jg+aaHzfWvKKEoO7LY5MNJaGdrQRORsq3+Z4B8YGpz4O5XiaNY240AeHYCXJX
 Em6Vo6NnIbSJ67exig60YOHBZQOA9pQPlT7hxisaPa2qcmFtZ2rsDo/HEoHVA4oEpZZsZ+CTiRO
 PWigdSXgePrQHv/3lH4WJR/EDYg3RusOLRT/NoG8zsWpZR5gAtJ2lFLSLvoDCLtjWPzD/tu/Nw0
 gQn9zuCefC4foc6j4VqYIqSfa2Qx1xJgdvVN23myNedWAjo/1nTs7ay9NmRotLheSiggvow0w2J
 OvVWNuT2ozZisBA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This patch fixes a basic routing error that has been present in CAMSS since
the addition of non ISPIF platforms.

The ISPIF platforms can route any CSID to any VFE however this is not the
case on the non ISPIF platforms.

The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
Demote the spurious poly-mapping down to its 1:1 real form.

Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_entities"")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index aa6d01d8fcb2a..060879a55e483 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5257,24 +5257,30 @@ static int camss_link_entities(struct camss *camss)
 					}
 				}
 	} else {
-		for (i = 0; i < camss->res->csid_num; i++)
-			for (k = 0; k < camss->res->vfe_num; k++)
-				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
-					struct v4l2_subdev *csid = &camss->csid[i].subdev;
-					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
 
-					ret = media_create_pad_link(&csid->entity,
-								    MSM_CSID_PAD_FIRST_SRC + j,
-								    &vfe->entity,
-								    MSM_VFE_PAD_SINK,
-								    0);
-					if (ret < 0) {
-						camss_link_err(camss, csid->entity.name,
-							       vfe->entity.name,
-							       ret);
-						return ret;
-					}
+		if (camss->res->csid_num != camss->res->vfe_num) {
+			return dev_err_probe(camss->dev, -EINVAL,
+					     "csid_num %u != vfe_num %u\n",
+					     camss->res->csid_num, camss->res->vfe_num);
+		}
+
+		for (i = 0; i < camss->res->csid_num; i++)
+			for (j = 0; j < camss->vfe[i].res->line_num; j++) {
+				struct v4l2_subdev *csid = &camss->csid[i].subdev;
+				struct v4l2_subdev *vfe = &camss->vfe[i].line[j].subdev;
+
+				ret = media_create_pad_link(&csid->entity,
+							    MSM_CSID_PAD_FIRST_SRC + j,
+							    &vfe->entity,
+							    MSM_VFE_PAD_SINK,
+							    0);
+				if (ret < 0) {
+					camss_link_err(camss, csid->entity.name,
+						       vfe->entity.name,
+						       ret);
+					return ret;
 				}
+			}
 	}
 
 	return 0;

-- 
2.56.0

