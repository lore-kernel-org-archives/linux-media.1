Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223595;
	b=UgO4vp7A2VgR/s1UdWRmu30LzlcfLFlmjurBuVtH9OBRlBw9aRouz2FKWucCXta0QzwN
	 0e06hYoQcFUmjDEKhLQdyYWJjS/rDeZz4WzVY/aACaKDH2P4fkL/UtiHJ/4Ah+yqMpD7R
	 8783iXalohFRLvZ3lB9pQ98EzA2Jljpr5SBfzm+LSLcx7DtlaZpx0+JrSr1Ern4T8HydE
	 L2xmQjHWkx1ss+Pkx6OgnvIG4JnEtO8u2UHNdHJig2vrId1lImxsv86g3txeUGAIcT5xE
	 8I4bBlVVi2+zqD7uF9ZH9MvapkHRmdMOwXsvDl4SC/Cm9IrHf6SCDdIJcM7Bm74M5hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=5NZs4gTrAq39cwK68Ku0hKepWg5vD3snHE5MnInKMp9ESS2/GqjBedqXpR5U2CfZ1wq1
	 t042ZtFaKtF8pG+ldf/WwkHFIl3AucWgoa4onSJlX8q6RXuF/xTa+sm60NU0cn91oL8Bn
	 /aJ2FGX1o5CirBXtzr3Z/F9q18SeJbk0ejEFoyZ85tNL6haTEdZR2fpw5XeR228vICcwc
	 8B6/Zslez+W5ZuYgNLvRy++eunbsFuAMR9duOEBEy5Lkgz66h5UpoNz/MwL7vTSf3by5e
	 nph0YijDBRv8DpmxvVz+7Wn3InlsoeMsN2mv4DI90pq5DPoOqrSEEV+38HPjHAKMSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="HRvk/q7h";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FF7606D830
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95FF7606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HRvk/q7h
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b331cad3cfso4723027b3.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223594; x=1794828394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=HRvk/q7hv6GUxA6ex5QAp3j4lsMWUjdxCseq0wkxqkLNanJUBMmVT86O+ISZV4DVUt
         agZ7fAqjne/fIDciMzkFujvfPOWDPOi9ENgtVCvUOe+X9NaSD6MX0SiCHZQejumyH9hE
         0JplMJt4OknrPIug7uAxojAkE3CfAz/szXEuk8V6oLXoXDOfAMC8YU1ug52yevy/P16A
         pJWm+NGoYZSCIMdn0pxjA8NktfBI/J3RrQPwAhIdDtFTTvqP8pbHG/6l7tpFaXbn4wqR
         V0zoAIMPmvLNDBgTsYcltkD351vEkKT4tjiUO3DGVpynrmZlxKMRzDk2z4QdfkknYr1J
         LSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223594; x=1794828394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=jLEB0grSbp0/NPxy+EIp5i/vu7zJ8MtcCv3/KufkPejDcBoAmU04B9CLuLME30hz4n
         8XeOsG6iM+vPLU3FoUfHHSMjLGRMJV78YOTQmjyjeKDXAzgKPhHxU44lnjw1zLz+qKTK
         5JxvfRYIlIiU/qcB8wDcfwid68NQCojP6k1+dGQKHJMRkKVTxGadbpBOSOjzeBIR7Gzj
         mKtsumMU2xiX3lFqmXjVp8f/3JyT81yYiNv3q6ZTJSu8qtN+eXdARToiOxrJx6NglGk6
         x9mFyIabmryvUvMtDFf/tlWAVkzmGRKlGKq4f+fNyMYtajP9gikKN7b1o5CLPUAeDo6U
         o2VQ==
X-Forwarded-Encrypted: i=1; AL+hErHJZXYIKmhWD9TbZV8JkLmcnjwhG4Pl4jHCRIDixok9slctmklLqSCWubEVPKtNAsnU358s4NK3QzNzLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+i7wan6B0d3Mgt4l15DTnKBCsi7G7sVOf0aH8bJTymRyZUv7qN
	QhPNz6AxpFwkog7AZSVZXQUbJ/wtqIBhw8rOvBevqA2GXfHVUYhaC60dxvvMsN1u4lg=
X-Gm-Gg: AYBFou2FL9wr//qF9S5xg4SjWlOoYB8XuIdSa29LtG+ZVMExpa2NZ4zUaHoRpy1ZmRk
	BMVSfkyJELuqTwZRNOThaip/Po1aCmefszlQN2yNeOoAuLz0ct5o0A2vkBkS2nsKrXlWfnoJIyF
	0LRRJw0dda2TR6hz/P/tJFfcFvIpKfgBYq4kGaWAvvW1aFTwHBw9cGVfqYMd7H6r8GJ9KCTb+zQ
	cgNBHePI3UvmkpFcmyjkYhLYV9XDLw3dD9HUwMCfLGEYtEOBIyzHmgB3DNAkvE6tdFYgZ6FGO7u
	XRRXZMLZo7/5FDaaJyJNnWZTrm7O3FDDIIu6JRLSABZERuZNP1CxxtOh1H0EsuHUaX6rfddndEn
	ubyAWIDAV4Iy1cRkD8WQen8XiIKimzzbDuzxvlCpdm1lGq4srKe+rhibrEiejA8Az38Y7yTmnIT
	okDCZAczNDCuI5fsAgubsxSiB/7ZFaslHKYvttBlTaHFDG1k3jWz5TJ2kA18SkPgvud2QKS2rWS
	W5buAznf/0weOEyl+DYTeobjYWV7qQLNeF7tBn3wGPvkpZVSIF1ralEuC7d4ZDyYRc4SblcN4RR
	GvDSbz/kECdjrQcxMgYiMvzBGXdL0k3jAqMTyXZ1AOzaSBuHAgli7ob2Q+iacCQhulkt
X-Received: by 2002:a05:690c:386:b0:8b0:d9ff:4f74 with SMTP id 00721157ae682-8b36cb0c321mr27400357b3.42.1794223593551;
        Mon, 09 Nov 2026 03:26:33 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:33 -0800 (PST)
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
Subject: [PATCH v2 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Mon,  9 Nov 2026 08:26:11 -0300
Message-Id: <20261109112611.94010-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
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

