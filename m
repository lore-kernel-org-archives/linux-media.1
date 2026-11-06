Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985332;
	b=IsbtiTagl22C5jj5uemyug0nUfhTj23pGKYYAA2eO6WGIJAfR50Siwnime0nsD8dObJP
	 Pfsa2/pNE5Ctcqsg7+1+Mmf9ceFA1n6gOsclsS4Jv7nyRKNzi0pRPHPbvCYRxfxS4jPnZ
	 URvSEP61Hb93PDuGX5dFcNhuR7vNS/xv8DIu1VTwjl9dWmVs+K5piv2r8cXKezpXEwVf2
	 s92J6MKPOskyvL9rGm6zXKWy80SYDjmvhufG+IQylPd81KGiNxzcU4w+K6qOeqjslKg8c
	 +t+TA3n5XJWQ+aemUWSoZqJ/OTiQhwDpFg2TW3WWBtA0kumQzQ+wG0f4mudSZD9f+kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
	b=T4j2gbQP6p/vqQMOC+8ojN1C+Ph4olMEq3Ru8njUsvK0jPfcfR5pIdFQOK+5yjaJ0pJd
	 N+l7jVT6IBHbFCq1kjv3xrnBpYyJjorm9THupqttRQaYisIiFV0VICKzVnsNOmVqz/qm4
	 YfO1SO7bfMris8Kw/PtpulXK4DnMi5rH6z7oHDGQeKH8zDlI7wXhCGSBCEAbPbXc8Og23
	 lEiEezWqLHb9l5oYl/S5JIpf7CKFuqFVDXCsPyxhbi44F3Sbi9LZ9x4W2OC1crYGO5WZq
	 lXEwaMP+Hw7zmCwDa58ZXDvMFLgwBimx8g9iBZawrDt6s/zTiIk3p9BF7nOTd69RZEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3vtkPAE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xhy6mpYY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F596606A33D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 17:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F596606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3vtkPAE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xhy6mpYY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExxLH1039359
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 17:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=; b=P3vtkPAEC2OU1b00
	o9yuEbq8a96oHz1CCQpEWhumD+JCXfrJVBaEIxKLCybmx//oe5RQ+4TB3R4RicYA
	x8TZSJGyfPSH1nDyG03f5E9JggRSUiS7uCxRXY7ILjVYOpxMvG4rRGUMLRaa5bP5
	UuDfaHXj9CtyeReUgmTt/+k92RDns0w8pGXjAknEiMN2jU1c9TcBu72fo9zzYHa0
	GzK/JZh+EJuGhzj/k7it8UPWJ1+AiDsiyf0DcvT3Rl8QRCcBVcoqnvnBA2awSEyR
	mzl5nimqZk+9pnEZH+xGfOExCks0/mVlm+SA7Bcirbuk6TlcOj5YWpvNTsTgUNHC
	60f7hA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9uvg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:15:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso1730268eec.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985330; x=1794590130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
        b=Xhy6mpYYH+FaV0vtIaet0pNDRikfJtbPr3n7+QvJHvxrEkGscfVKGVT9i+0iMeTZii
         eU/qTs7DtHPn0igoyprHP1e4e8Fwtwf/r69jOFHmRODxGKSlLTsWD0g4IW0FxYwZ97VQ
         E49P4oEG0RJho/jRZuP/tgOoFFE+7v95aH19AlpI3/BNSiV2oXop7htxwvUF7aZhLW5c
         LmkCRVShGVzrJi1ez7GmRR9G+6a5QMu2CQ7XS4hCUewk/3aKEmrYm+LWy2B5UonhwQAn
         3F+9CVAhloyYTZYkpcZrlbLxhMrJO6VzzBlfjJgqU0yvbLKmDmet1pas9Io/qF0YEGDI
         Rm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985330; x=1794590130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
        b=NuVNBpmxh4UFMDyrWM4rNisbJTZebg9ExU3HZ1qOiKCM/pwP0apflcCp21WO+KTV/H
         SPiUrcrnjc4HqG+e3luUlx1sxfZsr4d0YdkSx28/sWHFKekt6udwK0B5CrisO2jEkz7q
         qY4PG6hMbCcl6WHL2Dev210Rf3ZhQLqD1OTJSeLToEB28ktidNkpZRP5LAAwiZNDcdex
         h0cQZaZydQSvty56oW9TEWOC1MitOqSKvoAb9uc/J+2uSlbNkq8cRvQwNeLvGTJjLzZ8
         wpThp5RmCZwyoNEk8dJTo8i5nFDzWBot7KE2It3bHoc3M9nlu3KCh6m4ycgwCY/qIKv1
         X+Tw==
X-Forwarded-Encrypted: i=1; AL+hErE0Lb6lnjHijDRRnnDLLu0MDsmAphgenkbO2sKB3enszlnfLiNsadjtOXwLew/ai305O59QjAC4lz8kYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8faQHkofyUR9LhlMLrtj+AmL6E+u2m3/ltXp6aUuElbfQeWDQi
	EGNyVF504QN4sss54gO0kUlV6KFO4I/5g4HLgCxsAWEDb++iAQuvLhGFZsf/E4nHqZoIZZfm6Dy
	nYa7m0+wOJ3JfdovaZXlUm6OWuWPtFpR/IQLs9RFy4IrjmVbzAjN6CER34PeHESUebg==
X-Gm-Gg: AYBFou0A3Fa5MWbzPnZ5VfxcVQCfuvGpF5oTDQacbAWzCnFIyqdLmo/mwdB9Nt+iniW
	88Bi3BQAtszMAXZ5nB2fjXjhnzlkth3SRvX+LU9Ier0b3CVT//TCSxK1hwrJdk/n+acFMBMkK58
	yTFxioYyXIWn6ZvkLkrgY/sWQ7KPNzlntgGvagLb01TMj3vfNBxSm3CF+WWv1TAQhctGuH094TK
	9znoFJbU/njt8T93nJ71YJnCGuI6ali41/dGZHB6/Pb4F/0H2Rbffi2EOhpVtZqOBU/2P/lxkmj
	KUME2dCwoC4YpcXOatzhJiukQN6Cny2outaq3mDDRIkzfM9eC5bTmtyYuc1+G6qokAKkxuB3uRr
	/qsGoXp/G4yYR0kHloH5L7cjxVjONMAsytYu6T1LFDi3qRw39ix9Kc/LKU/MZH2/QwiPgZ7SjZv
	FDvNtO9+3J
X-Received: by 2002:a05:693c:80c1:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36f76d0f26emr4000263eec.31.1793985330018;
        Fri, 06 Nov 2026 09:15:30 -0800 (PST)
X-Received: by 2002:a05:693c:80c1:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36f76d0f26emr4000223eec.31.1793985329467;
        Fri, 06 Nov 2026 09:15:29 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:29 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:44:26 +0530
Subject: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
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
Message-Id: <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=2273;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=NupkmvlL/dCPtTaOqaRQsl8ArnjGwSn52BAlgLqDvzE=;
 b=zmYLfThWfIv3sYXwDsJ6RflfKmCfmALOpmNPBUN8TCisKPeZCWDqMJUW2XSqMOPFsQD3BtSCT
 o8PihuvJzOpAYMe5W/ppgKgNz7pZ2PFLD8vYjYsYkLQ8uPypf6/trFV
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfXwxAIv0g10/qw
 3Uv8Rra2v9So+6FrnQtOly8SX7VHfTUtkw7DZbvzyw+IUH4SWDUPEx7Ckx4f63MtchMgO53vZrt
 ePLoP4e2asZ6L/FWSFE4aP5fZiIYGvc=
X-Proofpoint-GUID: 9N_9KqmYQJURYI-cbh1ctpPZF9GP8Gz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX1sRklWHONi0z
 4tVwWI0AkCxHV5FSDVte9Ja1WSfokdh5DbQRCK8e93n8Xa52AqeYEhvmKXBzxpitCFV+M7AERQY
 0gh7ybhkTVejD4ZcmZ6JltYsCeVV7d2/EcLo03NJRkwCw2tcM+3k8Y8ykljgyjY5HMXcDSSYfRe
 znQqkYEVz5fw+dfYb0garT+d1P2fMcnSeAbWIqUKFHiweH1+8mlrUzXoJZRFgkwMY70WRhVVefW
 wDFJbgp5EbDdOauTIv5y+6b3onk43NuEmYPkOqBa87e3RQzCnmUM90XrqvGuseEggiC7W1GkZqt
 SFWyivuF5xbLEmvkalzSTaBzA2d6ozLob7IWxqE/JT/8EkrxZLeK6fPAKle65BauR+6Er8T2gLc
 xXVsFBqWn4cTIHOQgrYBW7jE/2v8ni26//OULwkdAapbaQ6A3LV7iuNocx19TFQVpQEn5pM/qVn
 P8rlzB+rbOg9VVajoPg==
X-Proofpoint-ORIG-GUID: 9N_9KqmYQJURYI-cbh1ctpPZF9GP8Gz9
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aee0b32 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fdurNWXONF6VWYIYtoQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

The OF_IOMMU code relies on OF address parsing helpers, but the
dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
annotation to handle configurations where OF_ADDRESS is disabled.

Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
preprocessor guards and __maybe_unused annotation.

The only architecture supporting OF without OF_ADDRESS is SPARC, which
does not use OF_IOMMU, so no functional change is intended.

Suggested-by: Rob Herring <robh@kernel.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/Kconfig    | 2 +-
 drivers/iommu/of_iommu.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 85a8d7fdfa30b64e21b8db0db1d5bc268c04f24b..c1e97bd885f933cae45fb7806183477f2d64cd5d 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -147,7 +147,7 @@ endchoice
 
 config OF_IOMMU
 	def_bool y
-	depends on OF && IOMMU_API
+	depends on OF_ADDRESS && IOMMU_API
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5c266511db78910d6fd221af5437cecff4931c22..6675fc900e6c2d55b34c61dc9effaeb48e24f18f 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -167,7 +167,7 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
 	return err;
 }
 
-static enum iommu_resv_type __maybe_unused
+static enum iommu_resv_type
 iommu_resv_region_get_type(struct device *dev,
 			   struct resource *phys,
 			   phys_addr_t start, resource_size_t length)
@@ -203,7 +203,6 @@ iommu_resv_region_get_type(struct device *dev,
  */
 void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 {
-#if IS_ENABLED(CONFIG_OF_ADDRESS)
 	struct of_phandle_iterator it;
 	int err;
 
@@ -265,6 +264,5 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 			}
 		}
 	}
-#endif
 }
 EXPORT_SYMBOL(of_iommu_get_resv_regions);

-- 
2.34.1

