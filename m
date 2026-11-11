Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405242;
	b=U5ZsOgZWgw/zNpn3jbniqfIVOKnV45u8ubqRplGE5Ehs7hvv7coR4vJDh7xDaF93fyLo
	 ZpjD4rcI8YQOP3b21A1DG7fKmu0sFA4R821dzx2UpCjJtTXan/UWTfPbH9V0VaShLpWxc
	 BdY4sAzCdALFddFNv5YrvNgwOLzhVc7x+24X3hRlPmrpbpI6Sv/tM4oNnl8Zf/7sSh3yS
	 13qWmqaouXV54PtISf3VIUUIrj/0O4Pr69dbgYueyWnahAP6dFQ8PB9mLq4KW4A4g8K8q
	 MgHMVZ6vSoL3X30zLnHZRSsPFm0qL/8SyH9FokPtt9J+sA3iQ+0TZq+5QYgoVUpr0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=elKvumjq0mmdkVpoqWgoyQMQ+lktvpz2+mcKpJZX+ETLH0JcIrueTST3nLQW2RGrH8+U
	 rOWaJIFPiWVR9U2ZwYnC5Rn9DEYIj3qVLWMV1/ja5mhBMKep09+3wZCS8S1TvQ/YAUaCB
	 Mpfwp4HKWwdkhPl90jpERLpaEY3SYsteMt3Pc7zPVz4s4npO7ScudiSxTNBUQRr5EueXK
	 2qIQR4SVGN336ddbRW5sH3AU374ydG2AZE37DcbMKlRqLeLH3DPUMMVX+PfdWdG8Yawt3
	 3aKtLtZAoK+KERJX6uuO3Bir8WAxSUhmXXKzI7Rzju6DI1SFwZgzzWTQprDiu9kK3WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JLYlk39A;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10592606A88D
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10592606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JLYlk39A
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eabf243d05so1023840e0c.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405241; x=1795010041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=JLYlk39A+LWuJ5c5BVu06EQUramJHojKBYOzACSa9v7IUaad883H39T5vT3jdiazuT
         FsPEWbTjY7gL1CFEyrDa6RMVWReweb9MskpIwhEPt4w9RDlJZ4CcsERLdkhK/UkNBDB3
         3vbsBgdIMlCPHxoKs7vfOpAoq/UivQAS0sq24NfxMo6EjmAOLLafZkQJ/aJyrPRTHV9D
         bKRz76RDqXhmHZAFBmuKNIJbpxfoTbwVp0jpAii7eOAyg4SB2KnbUc4LkNmTp6EDRg9l
         1Zw9ZQCD+42M+CsTwbOadDOwjpItO3mjJirfzyF32jWE5eoJFAZRW4f+Nk95IyK+6X7u
         L1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405241; x=1795010041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=gzQ8wD/GMAQVy7ULnyS0zgVv12q9oHqKgHF53z+ODVlGkd+2g4fhuqBQkhH3raQj7Y
         XsFlJX+2w//qMe+6lk90wwRqJxt3hQTUyR9JNrHYfAjfY61WzGg6Cz7hDQiU/EunE6Yq
         uNQwtJXRH3Udnd3spWGWNJzjbUBXc+WZ5YEgbxeyAUVj3Fi7JZdKUcpkOBY/8+FvGh8d
         ZoPKNtZgFEpwMfIv+3Gzf2m0II+/K5MZ47Pq1UuVPjkV4MtokGWnpjDxP5Zb8bfb35Sr
         CH6geY4i0wz6s17HYYH/Sz7EHvSRhM2Zec50YWtXfVdGwU17+8yRUbSQ+m/a3uw+AyR8
         jMjQ==
X-Forwarded-Encrypted: i=1; AL+hErHrQ2Y9zS2jV0Vbod4sz8lOcLvMqkjQzGoq2ZczM6XOCgp93pHrdF2C/HczpO+dIn56G6USN542DWgNaQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/9JhAeg4DgBXgF6Fq5J4UtNdN4clby2+RylygoyM5fFNIVkQN1
	rYakg542XllxHw4x1E/UfkU9/vIlqPazzCZRiNJg3G2sng6YEjKVr44rP1QC2JzvGc0=
X-Gm-Gg: AYBFou3EN+czMlF5bx9rf6oGk1gkMUCT9F1VeE4dzjlvoPpOu1cK3QZDTn+mGHgDT1e
	IMUnsmHBGCDiVsg3ne0W4DSohGgHy6AxR8n72FGCGdHxRqmK24NZYNuc2keyUEpQaaPPtBMBS9u
	uJqeXavCL27HwAJ4IJTcfVV8DnQCaFO+3nA43B6EH392vUIXl+jqjuhQFZ3T/K0d6+CqOiAH2PH
	2a8xasyDVaL6JPX4bAdeQh9v218Q1MRw7LZ9VaDkAO1TEduPEnLShMrnQwiIyTDdgLbNNILFDpY
	CiyWnH6v2NNJh/AY1v7GtklzfSI2hGEYjwMbOXcIOZwoQHJe/9WvP11dkAtJOneVTvgoOKKzl3a
	9d7/QIKGdbJ62Y2xPNxiOvYTKZNghq88ocO9tC1oUrnxBbs5Mjs/aYatVFN56xp75QaV6wQSFEY
	bSyYtGvIls5bcT/Ki6Vvk8/+d2dHaHtHXLwhJqpwhCdYUVLr+4s/U6S8STBiz4b6lXCd1jNvXG2
	1xFLDPlUoufbgRwXN+rG9lymcuXGDYCUwnwLToCAls/BAhg39y50NZ9TGdMfYRhG61SGWysydML
	iC2FjPMXa/LanLiQSBC5zAQN/xS5IhV8qtFHhib1caxzrXdHS4pIKvSoEo1hTZFcEdWaOCfOIGg
	GRqCb
X-Received: by 2002:a05:6102:2928:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d5060b5d1bmr601415137.14.1794405240958;
        Wed, 11 Nov 2026 05:54:00 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:54:00 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Wed, 11 Nov 2026 10:53:38 -0300
Message-Id: <20261111135338.27008-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

csid_set_power() powers up the VFE with the same index as the CSID
before the CSID itself, through parent_dev_ops->get(). The VFE
implementation, vfe_parent_dev_ops_get(), returns -EINVAL when there is
no VFE with that index.

On the ISPIF based SoCs there are more CSIDs than VFEs: MSM8916 (and
MSM8226) have two CSIDs and a single VFE, and the ISPIF routes either
CSID to it. Streaming from CSID1 then fails right away with

  qcom-camss ...: Failed to power up pipeline: -22

although the pipeline CSID1 -> ISPIF -> VFE0 is valid.

Return 0 when there is no VFE of the same index: there is nothing to
power up for that CSID, the VFE in the pipeline is powered by its own
subdev. vfe_parent_dev_ops_put() already ignores such indexes.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93..532f6d36d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4631,15 +4631,16 @@ static int camss_read_version(struct camss *camss)
 
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
-	int ret = -EINVAL;
-
-	if (id < camss->res->vfe_num) {
-		struct vfe_device *vfe = &camss->vfe[id];
-
-		ret = vfe_get(vfe);
-	}
+	/*
+	 * On the ISPIF based SoCs any CSID can feed any VFE, and there may be
+	 * more CSIDs than VFEs (MSM8916: two CSIDs, one VFE). A CSID without a
+	 * VFE of the same index has no parent to power up: the VFE that ends
+	 * up in the pipeline is powered by its own subdev.
+	 */
+	if (id >= camss->res->vfe_num)
+		return 0;
 
-	return ret;
+	return vfe_get(&camss->vfe[id]);
 }
 
 static int vfe_parent_dev_ops_put(struct camss *camss, int id)
-- 
2.43.0

