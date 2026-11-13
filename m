Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596075;
	b=cTVrGbnVOqdOFMhtkkzSQ73oAYgiRTnXFYtFVVWy/L8TA94h3jOXeuUlIxfokvMhrpBF
	 q9PepOPvnrdFqrkslfPpsSzkOd/dpdNOvPEaXiLikeVK0pm/JKY+6DtPeBgGRfFx5u4Vn
	 OhO+6wRu/vtgy4Y0eMiUoJlnF6fUoOFXylpVUTD4h4aHXMADgCwjbWWNTbTqzDrL6+mnv
	 2sz1bV5pJLL0Ig0hYnBJ/4L9FLqP14NhjL/21DfCi+53/eOvuVbrNtSFt/SJv2nTbltuw
	 B+9pwUqT8wVplOzKvc7RXssimmsFv95Ve9J5IIok6Cgh11/8so3WFfDZaCzf66XPTaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
	b=qZpjZD/PAQEXqGfgR/zS+AAAgojxM2sRgkPtlxu1kT52L8hOJinNxfPKRc2P1cotarAE
	 Cog/dT9b+deoYbD2F6Isz6TKuaxopl8DxpMprv3RGtGKgVvfE1mvE1ZCqbxyiNYZqIctn
	 6/Gm1UrYmc3m332t+J+aZu+3ab1zDs9K7eZFLZlNneQ/UU9BpkmfaJ9PBvqXKi7u6flti
	 whdtJpoHU5NVFjHFNZwmegJlaB8pO6kNOgRJqJSU6tEiekIFkO1hnsiAnLZeNSqHVCJLP
	 Ha3elNVMtOnWmSVlWNM+Yie0eHf6VB0Y1WREd0ImYcNObQX8OWzukWTxRmCDSpQ9TyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMKw03Ef;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSrGZdFi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504B60A6F65
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0504B60A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMKw03Ef;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSrGZdFi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRld3296047
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0iSH72bVkOb
	J6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=; b=nMKw03EfbnLviR49OfokSBHZcX1
	3teGDzpcCErjbqy9PXFzmTwRaCV4+5x73O2NLnI/SKSfL4f2qZCpqc1QgU1yTAzZ
	bohP8oY2w7ysZYL4GeijVUVGjZY7i2fnxwZk4l3Y/fDVLpLWCVutBIrsxHb731+o
	cuGLy05Q3tQXaVx6N9MSEc6TSvYZ0Xwd7O4lyB85OjohreZ1Syo+huuxomIbZpA2
	lqiWOG+DWIpRlTAc9+m3ZF92IJCT954ZJedL0k4CgQ5wYF0T/Cb1c5E4opbQy3g+
	fr3Er1PGcfsphCEtqUsbEpgch8yp6k9CapUKDewaQDt+WybJVlFtR8LyAlA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tptn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:54:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso5771887eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 10:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596072; x=1795200872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
        b=JSrGZdFiDkpbCuRGhVn9KZJeMsNNqNJkszqfdkyZ721lmPoXc18gesTudQe1f/R8W2
         tPFfHFCJDE4ZYUhuDbD5u9FIjSG/fhw7dNGqr3n9Jrza/dNnXebfDIRvvSxE+bRbxctC
         stpK7GCvS3ipI947fRtLLV7ZSunZ7daBNxCLtmNV/en1DLqfEL28Z1ZKazqzaHmvgpfX
         uz3kYMx7ZHzUH1EauhL3BeGVFY6GMn12KSgnbG1V7TY7nyNXeDqSs9czyQqPuT937Gml
         AKLX+898vVB+/y3zEnzshecxiFHEbL8nAmdRjEeifQHhihLaLa6sTtwM0SnI1id1S41t
         uWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596072; x=1795200872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
        b=r90n2eo+ckhedtamXVbqMQfaKkpdbM2Srl3P1yURlusCRCyN0J1gcx1x2c3KbifGPs
         v9flGX5mMG9txNdkhhYQhMM9v4sL0yNBEG6vkbLd5VV5RQ9Om1LZhovnrWto7LSGMKhI
         U0DI8+agA+xSynJQOsZPlV9bFJqnE4pcXn1x7ghAy0vhGFxG35jPCQyTaWcCADw+EjQH
         fJtknQJ55T9VXXwH6oOm2rRjrMAEPTEHI1U9Dh5aVoIDjLderrHPqoua01CHmnU1mhLi
         4yycq9iBodfwX8DGq/OiIHCuD8ZWaBlGXInB+31MbPwsEZwsTV5TDOurmp7GaFzWFye/
         aqTg==
X-Forwarded-Encrypted: i=1; AL+hErE1zr1nxnHzSly/pMEcoN07ohvcDG3He69ock7QfSn6AuxEWa9K6eSzIw+Hz34w+j9VsKuvjJ8YvgzHeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9puCEbXJiZ8pnlEPdm13HULVrSBFswFszvDGCSJhFyuJSw4hI+
	mo/EcStz01q7URAHIlLbFzHCWy9m+haZgaQGYHhMQp+WjF7ZpVZujHKMj5I+52CBu6X/QAQH8BZ
	oMEexIsegKzMx1Whe6GcpBQQqTwcnn+JCN381OvgUvFL8XAe/KRJXF4ZXNa/8JfhKOQ==
X-Gm-Gg: AYBFou2SL4rPeoUIe1dq9q1LOpnfWbefxt7Iz0f0XWnIzS9wGXpnoPQwRw3+Bmnv/BF
	tE2rUTUR7TT3BjkOxYbtP6CMCKVDHen1znP3K/pbSCWdtJtTDQw8LEvj3SSeeIvsIwgS6lJbHNc
	ynGBuyqlAwnbYRuTS9Lhb5uuEsHpbS8Kn9QMUZe0lWeqJTtGFA1PLWgg4a2VyYQFNjFJ6SWRQAH
	n++g+iiP2dxih0WICo58HBf2lbIxJHfufWnBXmU30I942YaPXaCb6b8CIPMRRbNNPL5jlg7by+y
	5e4PtXDeV1XrMxlGFZcbLi1wVhgbPPM1+YASh0zW1FMv1nTnmWkq7ZyhSjuF/LjnaKu8p7yNBLp
	Jjy0Ys5OxWvmHyV16z6ZjLhk4j82h+k4bcwU/HMjkt8I6yG08Uy27R3Bi7CNvT8DxRcB1UhcxBb
	w=
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr3452347eec.34.1794596071779;
        Fri, 13 Nov 2026 10:54:31 -0800 (PST)
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr3452284eec.34.1794596071051;
        Fri, 13 Nov 2026 10:54:31 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:30 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 8/9] soc: qcom: mdt_loader: remove qcom_mdt_load()
Date: Sat, 14 Nov 2026 00:20:08 +0530
Message-ID: <20261113185009.157893-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXxEdAbO8+bvRd
 YgCIKmxJOoh18zBkS7nhQG+DCYbOvhrFi3e7sx570bMT3E4ACdEPcPlHx6FdRGkNLbrP18+wtu9
 1HgeSKs+O2nLS2R4eLb1Io4Y2DATGUcEjkAMeBEUsmgwiGtCBQV9K5epNi4TM6ucXACJXVyDaT1
 Z8dn26iu37PL5h8EYK/OFTPkXVjBFjZthh35rS+9TfZkoVch/dlP4FO2dbjQdA5TBVPJeL8ykbp
 B27l7cqgLlNNtyCtkSYFjB412iCBNOtOUZ6T7VGoMUhkom6ikfi+RPv3N+CJsQd8Kq/jPBiVfyl
 XpjLUQVVkCmwrEFk7BVBs1I3whncsgUig9gqE1oaO3QWhscaL3nNB1K717NH+1ZIJS78OML+leT
 8HG2NK53DYIMVflIPdaRtXP/Scse1qwmDdclvIu6yr58PxJsftiy1rxgDFSk2WhkHZmwdSJ7aS4
 VHsatZPV3ZHYuKGF0Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/vclzz+RZTFE
 d7lVB0vKgl36zDE7kp4hCWGEgNSx0oco/EGAQrPg6X6U77vVx8MWakI540U+Zs4kSGqz7Phif1I
 3yO2+oz7tPTuO+RyoHa3Oa6CPhRjBkI=
X-Proofpoint-GUID: svacHvrYPLxPGmKVqFRh3k4nbEG6Gl_y
X-Proofpoint-ORIG-GUID: svacHvrYPLxPGmKVqFRh3k4nbEG6Gl_y
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af75ce8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=GTbpKQ6npsRNubDcNtEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

All callers have been migrated to qcom_mdt_pas_load(), which takes an
explicit qcom_pas_context instead of a raw pas_id and delegates memory
setup to the context.  Remove the now-unused qcom_mdt_load() wrapper
along with its EXPORT_SYMBOL_GPL and header declaration.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 59 ++++++++++-------------------
 include/linux/soc/qcom/mdt_loader.h | 12 ------
 2 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c6ec67e1da09..fd638833b17e 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -329,7 +329,8 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw)
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @fw_name:	name of the firmware, for construction of segment file names
- * @mem_region:	allocated memory region to load firmware into
+ * @mem_region:	virtual address of the memory region to load firmware into,
+ *		or NULL to have the region mapped internally with ioremap_wc()
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
  * @reloc_base:	adjusted physical address after relocation
@@ -344,6 +345,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
+	void __iomem *mapped = NULL;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	ssize_t offset;
@@ -353,12 +355,22 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	int ret = 0;
 	int i;
 
-	if (!fw || !mem_region || !mem_phys || !mem_size)
+	if (!fw || !mem_phys || !mem_size)
 		return -EINVAL;
 
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
+	if (!mem_region) {
+		mapped = ioremap_wc(mem_phys, mem_size);
+		if (!mapped) {
+			dev_err(dev, "unable to map memory region: %pa+%zx\n",
+				&mem_phys, mem_size);
+			return -ENOMEM;
+		}
+		mem_region = (__force void *)mapped;
+	}
+
 	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
@@ -437,39 +449,13 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	if (reloc_base)
 		*reloc_base = mem_reloc;
 
+	if (mapped)
+		iounmap(mapped);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-/**
- * qcom_mdt_load() - load the firmware which header is loaded as fw
- * @dev:	device handle to associate resources with
- * @fw:		firmware object for the mdt file
- * @fw_name:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
- * @mem_region:	allocated memory region to load firmware into
- * @mem_phys:	physical address of allocated memory region
- * @mem_size:	size of the allocated memory region
- * @reloc_base:	adjusted physical address after relocation
- *
- * Returns 0 on success, negative errno otherwise.
- */
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base)
-{
-	int ret;
-
-	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
-	if (ret)
-		return ret;
-
-	return qcom_mdt_load_no_init(dev, fw, fw_name, mem_region, mem_phys,
-				     mem_size, reloc_base);
-}
-EXPORT_SYMBOL_GPL(qcom_mdt_load);
-
 /**
  * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
  * (typically contained in the .mdt file), followed by loading the actual
@@ -489,21 +475,14 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base)
 {
-	void __iomem *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	mem_region = qcom_pas_ctx_map(ctx);
-	if (!mem_region)
-		return -ENOMEM;
-
-	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, (__force void *)mem_region,
-				    ctx->mem_phys, ctx->mem_size, reloc_base);
-	iounmap(mem_region);
-	return ret;
+	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, NULL,
+				     ctx->mem_phys, ctx->mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 74886f772d46..f49de7b388bc 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,10 +15,6 @@ struct qcom_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base);
@@ -37,14 +33,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-				const char *fw_name, int pas_id,
-				void *mem_region, phys_addr_t mem_phys,
-				size_t mem_size, phys_addr_t *reloc_base)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
 				    phys_addr_t *reloc_base)
-- 
2.55.0

