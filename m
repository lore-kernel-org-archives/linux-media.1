Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170973;
	b=iwSdqwY/HQpti3vD16ahRnyyWOFQ9uITn//SPPuw06iwkVmFthUclnmpYXqjyDR65O9U
	 AeCuLSjO/x6mw6d8yTzVyKVMuqlwbbhmLVzGMfirgNAjXp7JhUKhcK/0IknTghKcSdn4K
	 CsCKD1e2ZG9b/r8NQ+tHVU4BJa13F/UzAyiS9dAE3SMCSs5LZBEUTNa8T+sGiZHYd2m1K
	 X+YyK4NcaCL/uHXp4WwkOr5sxaj1ZO4LdK4uXeGpPr2k5Vk4lMQDEXFUZOaGVqOBaArNc
	 M+wlRLjcBWkL0MAxsE8ScXr8LWu0LzGedKJcJ80kVFluVE5PWex2G7gbic58x7zeghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pIfEubddR2pcpnMGyBUcV0RpWLk27H11lQvg0UYImfQ=;
	b=aDC7Siw6lY19zD/RDnkv+R73UB+xZvvIFj+E5CVISWiBDyQ/J6Ii+F1xA677PRkoPD4w
	 9UsL9j6lRKsdjYkbpAlGMHuEE2jnQd8M8w3rGp9Q097iDp7/h6iNAmCTcyQiBnoUMUWVu
	 r7Nb+rEPAqH+IE3dbg811F5HmR9iolC+cvnFGAUIXz80KbUl7NgqpzMyOQOJSWKqqf9tI
	 KrADNWEd5GR6CnGiL4lSh/3ry0yND82/pW0MRx9nSsH8bM4wvLOoBtooitRohqWpr7KVx
	 6RnVIwcH5aHbEUxEeoCKthzDPXPATq0u8mtIeDSJTquHFhlEnw3YByTmGapJO2J6hZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcugcrQR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkfX+kaf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4257606A325
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4257606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcugcrQR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkfX+kaf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewcI605986
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIfEubddR2pcpnMGyBUcV0RpWLk27H11lQvg0UYImfQ=; b=RcugcrQRpXJG+2cX
	u/yN0UKmUym66Avol2QZZENLLL1C1qiJKsNGUVVpxouxFhIQmcFvVY++uOB1LECj
	K4w5dJCAIb22JuWT3egj5keqXqGvDPqWI+jRISryqqF/WjlkBoCa3jlwmdy7DWHC
	c/RX4OAuwm+gAE7ip2IGZTCHMnMiUteLC9/q31gVzEoDjZsWzQp6bg7jIooQad4d
	4GT7vMoEdeaxiR/9wm+COH53gvxIYiAkTLj5NVZkWZfiMNhLOZhaIhfu8WVt/qoG
	S/SI1ZXKNM7NnLytpNT7PsNq3lSMhXRLyK5cWjcAfnfySlPMiWcHkzdHP00AaMS3
	q76F0Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs3um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:36:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso1745304c88.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 02:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170971; x=1795775771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIfEubddR2pcpnMGyBUcV0RpWLk27H11lQvg0UYImfQ=;
        b=YkfX+kafgILz+gdzAlG573EqB+8jM0snWVYVuh17n4ySpagJaP5hq1IzsbAiXMTt2C
         c2anGgoivaDcjiRUHGwfOjJu2eWUUVOsb+lMM6EORfKyEq6kfbdP4aHnHtfBqpr1uNlW
         q/tv9L6hwrFjslzY5o0x49yuDV9GNsfPXfU+LkIqD/E9KWFOG+is2uMPEfzZBssK3RES
         Vna6HHuNU/yEztKWHHfmRxDdO/vosmS60GEiE9dt7+p5FFkbBRv+yISQpmT8ksWzEgSn
         +giqGiVfdD+wpaDVjkH3f0n3HVBPIJNZ396ae8UPAm1hj9FP47xtiPrJWK0rDlaS6p4N
         dDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170971; x=1795775771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIfEubddR2pcpnMGyBUcV0RpWLk27H11lQvg0UYImfQ=;
        b=zcnVINYYihzEn04yAZoEJxievP2FyfwBDcmd2/lhLDBzlMrPMqiJx4rODUfwWAZeKo
         j7My+fzJHn0YgArref/HFt2u+KMb4VDrUQucJEASfmKIf96o7Y7I6VUu9PlWF5XIXjl3
         tBL8gmj7WqoxTtt/VzOsYaYAZkSaFXB760oFSNJYK8U7QD3q7SNtO6Wfsg2mpoxOc+wW
         m51YjJWAabm3Ie2dSeXkoWh/EPGK/TPAKoHWZTfWRtaasS/hGdQnweYqibViqMpkOZ9R
         ssMoFJWl4brhHriqMJ3hkMt4knrv9bVvs5Kpwrtx1RvZU6XCfmb2kECzrZuc9NMMJDAR
         TKKA==
X-Forwarded-Encrypted: i=1; AL+hErEhOdqFZephJyZi3kgMovJpV0PCSN/c8tce8ybzJ5CVkwfby41e3hvORrvA1uBci1Wt9+I0OUQ4fGphHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RuUCUnpwV5vXp70t8J06lYJ9IEi5P62V6DymX4sIf6wes7Kau
	BOPeluL/gvHQ/WP6fXP7M0DmujJR/0BjuNG42xiK78KxF6xJ545/N2OMRpPBsCUCmriMQ73IQJO
	jzZGhNlnt2rCifejkQ/xJ6iOMD7NMPXuu/Trti1Y/C4hVVG9mIRk6J7WStjrVUIfLQQ==
X-Gm-Gg: AYBFou2Xrk0amy8Y2PsRCj5ffXceYFdBCxDuwh3sxSTjSasR49BALPNDoAjA/ryJSQt
	ts6HwMw05/LCNct901tmx2zcji7J0+8d0iARSGvsLsUA1MeU4a7dAiOb9EdI0uNWoJmv87clCEu
	E6k+uJxiUUZl0SZn0luNkdkAj4LQcRmi2u7lmkRMYoDT99HdTtAZEJnBV/xdCiM3IZ7ic3NxtZ8
	Sh/bFKgF18sRDPWHrDVxb0666gqp/wZ5CZr9XY/17VcrB+bTZzSiqajETqXNvDpgxXeQMELbRlN
	FMMeyl/G8M99wmuGTB7WDgRX9UexPSYr4lt7eqGFEqSPZxjhM50bmlOsyUQAy0aTkyCVQGo86jc
	FrS3ImbL7dE5xwwrvTaUO0lqireMiC3TdAIcEUb/RcoW+7yB/+O3UXQVK+6+UXiu8U0xTMWlJlc
	Hus3X+/Afd
X-Received: by 2002:a05:701b:4308:b0:1b5:1a6e:1bec with SMTP id a92af1059eb24-1b5568779e3mr2412534c88.10.1795170971319;
        Fri, 20 Nov 2026 02:36:11 -0800 (PST)
X-Received: by 2002:a05:701b:4308:b0:1b5:1a6e:1bec with SMTP id a92af1059eb24-1b5568779e3mr2412504c88.10.1795170970833;
        Fri, 20 Nov 2026 02:36:10 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm5751096c88.7.2026.11.20.02.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:36:10 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:05:15 +0530
Subject: [PATCH v8 3/4] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
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
Message-Id: <20261120-add_iommu_ranges-v8-3-d90486973b73@oss.qualcomm.com>
References: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
In-Reply-To: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795170934; l=2526;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=8VtOi8S+vuKc7RA+CVg3aczf+OtltBZNKbr3XIYNYKo=;
 b=xsG659uTuS5o1iuLQ6eSuJqdRUJEN1+bgvkjt7FkqqfPKK37yn8B+cgqpCnZxWeW0JXiteD/n
 7R4lNKjGmyHA0Je7SgBkedvZqTo7tgI93FdK/lauEWxlaoswYRhPRP+
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX/WjZ2T/Dl1ht
 ubmqUrg4B5QTvpzYEzxu/EfjHtEmGxfxyf2J475SHaYsyCCPduKcn3qrfUI75M9U/QjrgcuRq5I
 +0M5OkUu32ZY+8t7/w+gwp4CnE8hETHDRakDEdn8z4R8uOqbgF5kGKUOQtLRECK6Pk6E0UvcY5L
 FrL9O59Dny/Pub3lUbaqsoih7iqWVzA9LO1rKUm1kqG3Vk5QQcZKTtMapdMO7Qsj3aqqlpvmN+b
 2FBBDA2looRsbl6rOliefNT5UfVtH2G0t7JDve4+g0hTFw1dkKnpuOMhEEyc3tFFvimeVmC3LOK
 LSEaqXewCzfbyysS/LrZJrS1Yx1SSiycC447xgtANKBALl26j38aAc0fHXqM2p/HBeOIpU6BMUS
 im2thZHx0uYlloCFZ+XRop4MqHvaF9iZ4kCyp21clGvdezT3QYxQhLxtuVryQ1S4dxpOnb2pPSj
 zXcskUkVyJH55+IWHWQ==
X-Proofpoint-GUID: rtUoBihDQahx9X2Odg0HDyel8THTOcq2
X-Proofpoint-ORIG-GUID: rtUoBihDQahx9X2Odg0HDyel8THTOcq2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX0EbhSddV4rG3
 gv47qAAXRdCjRLZIAU+drCP1kDWIc1j6RWJ+lBnFvCiXjD17myt+dGEEcn+zXuxER4WfcbgMLvb
 jaiuHWe0m49JyE7aTMLRTJ3q6nVYvgw=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b00229c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ntQ06SF4OG-o5Uha_HkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200042

Currently, the OF_IOMMU code is built when OF and IOMMU_API are enabled.
However, the code also uses OF address parsing helpers, which are only
available when OF_ADDRESS is enabled. Since this dependency is not
expressed in Kconfig, when OF_ADDRESS is disabled the code relies on
CONFIG_OF_ADDRESS guards and a __maybe_unused annotation to avoid
compilation issues.

The only architecture supporting OF without OF_ADDRESS is SPARC, which
does not use OF_IOMMU. Therefore, make the OF_IOMMU code depend on
OF_ADDRESS so that it is built only when the required address parsing
support is available, avoiding the CONFIG_OF_ADDRESS guards and
__maybe_unused annotation in the code. No functional change is intended.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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

