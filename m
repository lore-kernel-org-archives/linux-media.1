Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985306;
	b=NueybHWXet0tlgdB4vvbzqSYsJcU+e2PdlzYXhVDSri3I5prpvb0Y+UKaxRzZHb45Wu7
	 2sWiWSZmiXO7jzldFqgL/zThrtGqIDXdbI4o/dIa6cKL9DDLHkVyQziYNt+P42RkFbwyg
	 8LpIAAJhz+NgDC0UU+jPSjHVSHt09hVZNFF5XVUfUNc+DAow1iC3b49c01ApTa+xk3TeQ
	 q82z+ze+opscJMuGZQeBGxs6KwsWJUahAqfcvQjw0mhPcvlnepaddw/b/Te7YM/qxa0pY
	 Bx4SVLyFgV3wO2XRJsvHj/lWvK6I5uIW5pxPYfcCLL4r9L6iECe7QkLo/lNjkbcOflA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mzPETPHnkYVK0UfJpNaFhQVJoXImwU21czXLXkKClNk=;
	b=dMJL4himzMk1aBTF4W5zjLSEw/RWju47PGnmDOPlMSmYBJrMImOL0Qo8jHP9zwjT1KVu
	 prlH65uwkSC5vciCbJT2uspCOcs4MEVtC5S+dJUGKIHvdaHuUmZhrZoqCcg7W+8KcdVRq
	 QjKShCT8pevNPatBUCnjVMeCOxacLw9RIFRQyeaZkhGb4qOzLA6K6IFAsQ8pWoUwBWy0V
	 Dc/N5SIABC3cigmJqhkRkMncPQAjELbbUpJxif0kcGICmYKYY30Iw+sQKrdAJh2JA4AKh
	 tnbhrbJiXJ3YoEd4MRJxC23o99aH0lGNaAyVY5GzFz3Y9EVVL11O9cNZ16cyFg+AePw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU1WEKau;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYHNTpje;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F1B606A326
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 17:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94F1B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU1WEKau;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYHNTpje
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExtkV3324796
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 17:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mzPETPHnkYVK0UfJpNaFhQ
	VJoXImwU21czXLXkKClNk=; b=WU1WEKau5zQSj+GfaHdAlAwBxl+uKl+Xc/Ixwj
	hJ1gFD3A60RZoELqBS7gKmcYPwyRmm1VbfXfxX/b4nW3DQx+f+P19s5XDGoFG+RX
	sSDNky0Fw1gn3yJnMZzn2Y9tCe055TXZTU6lfSETCxL9EiLfK4JpRaOOET+llHq7
	HHJ3W4NQ4snARMyhFqDLzZ6L1Snplds1Zhwd23BeruhorgqCjIzeFAW0DU5Wp3IC
	8/o9P2V0ry1EyAvj+ZuAj5kPvE3zzYGQ3r7FlLBZCtJc76Qhwb69Z088/X72yYDt
	GV6K9jfDji8WKw3bMkCAXcGb6ki/WHvclFsl7yj17H+GsN0A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9bw19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:15:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so2465995eec.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 09:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985304; x=1794590104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mzPETPHnkYVK0UfJpNaFhQVJoXImwU21czXLXkKClNk=;
        b=XYHNTpjemryJKWQ1SwERJ05ceqh/mtc2HFf/NA/dhvONMcgh/SV7aw4b4ACJGbZNq0
         cKI3wo2mcm94ZwyFf3fmVyE0suDq1SabQnNwkxHeD67NYGw4ff4OhYvmP4lW+GtFIuKV
         pNd9zrVtCacHKZgRUDNsls2w8tLDAVDI9JQbsKjL6uAvwDBfFUyFetInufaGkjdY3IHU
         QDsDVsEWM8Y/Kcq5TaURcWGyssptIDSSQc+LSGyqydFsHet9MA8FvoCwVNJeojICt4tF
         VH9iW2DmaxkZpKnYE3GFAO7Xf3d9hX7lSiCorSTzWwcJTcvtoRF8Y7GxuZyWREjXrKBy
         5dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985304; x=1794590104;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mzPETPHnkYVK0UfJpNaFhQVJoXImwU21czXLXkKClNk=;
        b=AtacViaFfq+Rr/qbrPjjLsOLaV/KXPtlVrw9YSqOOV8KS6Da34S9/ucBU1Y0aRTQ2U
         0ESWmrDeyfjiCFvKQQNNuNh2vEw/5rKATOh7ttdBQRLHqG7ZwcHiD1mf06nWc3xhJQiZ
         3Ega8/M2q3ob4mB05792odnvS3bmX53WceEg4V+bcz+dxg/R/nZAIvFdineEwbvfcRPO
         /Vs3uISZ6TDnMoR7m6+KbIudZN3rOSUExm+qfgmuPZrIvdVrof8EAdoeNCtMY2NSlH/n
         0eiCgrCiw2aTQC4lrUZPqyGOYN7uCD6pmp4OJTFmX+qjjBhfKCI5V5a4qYb6TBBwoWzJ
         KWOg==
X-Forwarded-Encrypted: i=1; AL+hErFy1BvvWV9JhzTOGdOgSG91pznIlWWr5+hnVGSGUEYZ2CGyQOTwfwPWlnJrNXMV0ck2CG+CnFlQZtEX/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qbT6ah/VhB6OQ0rDZhcby0P1T2n25MhdDfE3rQYyF5JCUfjD1
	pTJ/AWDp6m7oBkHfh/witYYhsTaUGeWWChjRDBCTBuDa2Pexw7zMft3kfZ5orFtj5SDeNXrhwQH
	KJM+q1DhKLdFaccODeuM3tCy9QS72xF/jjJlwzxbA8ylJuZhOgHC0N37yJ/GuGYvGwg==
X-Gm-Gg: AYBFou0Y4A69Om9MnqG0d3WFLD+mdxhcm/iMBaxvkB0XJb+8YjYmH06zxGWFA4v/c8o
	OtdspNLwfMuu+QIxCEHt5fcvQLPz8ThBvb/cqzMkdpS7fmHrgxeh+RUZtpg6pkAYbNV7GmEcAdU
	t8OwT9fiFzM/vNXqeRUMNtBIfCh3cz5JQfvpbN75rq7pHoPtkx0OucdtTG5CG+tZzmJgM+KW3A6
	HEPSU24ngE/QFMIu+Bx+mgmlp5Skw/PBqTPFtlThXfRdsNj3RiUVD8tg+49nVD/3LLbRVYuttPN
	euGsiMyiWY1Xj32ZIBbFrsiHGxkHEul8j/hsR6Gt+2lmWFnV018JetM0KJrnX8YE697kbzCVU/r
	qPfJ727cCt7uRrbGc+MeLSar6igDBj5IEqlPoLK2sQwPpYMl2QYTrHd2wPGFXzPjUscRuwu4JDp
	LcYpRnAV3F
X-Received: by 2002:a05:7300:dd05:b0:36a:f99:ae79 with SMTP id 5a478bee46e88-36f75a2aeadmr4180202eec.7.1793985303512;
        Fri, 06 Nov 2026 09:15:03 -0800 (PST)
X-Received: by 2002:a05:7300:dd05:b0:36a:f99:ae79 with SMTP id 5a478bee46e88-36f75a2aeadmr4180176eec.7.1793985303019;
        Fri, 06 Nov 2026 09:15:03 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:02 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v7 0/5] of_iommu: add support for "iommu-ranges"
Date: Fri, 06 Nov 2026 22:44:23 +0530
Message-Id: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAO8K7moC/32NWw6CMBBFt0Lm25I+tAhf7sMQUmkrkwjVjjQaw
 t4tLMCfSc7cO2cWIBfRETTFAtElJAxThupQQD+Y6e4Y2swgudRCcMWMtR2GcZy7uMXETse698r
 f+FlXkM+e0Xn87Mprm3lAeof43T8kvW3/yJJmnCktvKqlMEKpSyAqX7N59LlW5gHtuq4/RAXNn
 rcAAAA=
X-Change-ID: 20261103-add_iommu_ranges-549cf3fb0867
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
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=2711;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Z5Ua5oBOiMcZbFYp3oCu5cR6YJYcm7KwL8DCEcA6yZU=;
 b=dLAbyFhw5znL5UwjVUjewzKHN9IhmK8lt4IzRQsAfxEF+wfeGjBKMi7gA6LhDWlqg/7I8BhFy
 kyP382eR98EAPvFVqWUFsb0MnYZTmNPIE/Wqrf6JXkgZiv/PbKP1CNB
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: AmwcL_dURZC56922bwtU647_m73NyYKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfXy4ga00njqTYu
 Ha79yPJEr8Duu9gDEelWDP3QuERteb8iD+PsuJeBNrltKO9rKxSR0WzEuekRzAVbnQnFr6hyNWx
 txvbHsARelHf4g7ZbqVDsFVcmBlR0XJQ5kuChuxmzB8StQa0gogIfiUVMZd0Avu+XFlQIJL1ULY
 a78Zn5gCjAQOuR12JGdpLA3f4zl8ipCPN1Ld4fesiVOi2Mshk0tn5/JuWARZYaB7pSLOxxv31yR
 90xqm0UwIZvsj2tCqptFsO2S3MEbseJpzvTRVu9jXSLCCA/GqpwoppMhHdKtpBYZT1shVMDAvMo
 98SaQO8vSN7k6I0EsvFVy39Nnrcds8IkhVizzTntDUvWfLoMLznsj6zfQvbgHxmPqOK4DXTrbU3
 49mB7ImQ+1GVP/s/iBXq3kL+clPNERodKKYMmsy8ZgCw55Akt0FWExS5PR/9kqSCGc5xES5kvf5
 pd4yuNsY3j7GC+BfcQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX94xilhLITRgO
 aeJheelT1eL/qSKtpva5oaCc9Jl0pHfnpgOdmhebnpyatwJymg37I7op+IMiIkpF8u0tv6IEeBs
 GqIKfFYQH7pVkY+J5xgkMBV2fvd8zkc=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aee0b18 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=izMSoC9YYMgMvuwp5ZsA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: AmwcL_dURZC56922bwtU647_m73NyYKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

The series adds support for recently introduced property 
"iommu-ranges". It adds the required checks to error out for cases 
which are not following the schema definition.

Iommu-ranges was defined in schema with this PR
https://github.com/devicetree-org/dt-schema/pull/207

The patch series is being posted as revision v6, since the patches 
were initially part of the media series [1]. The patches are moved out 
to get review comments from iommu reviewers, which was otherwise looking 
as a media series. Happy to move this back to media series if anyone have 
any concerns. 
[1] 
https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v7:
- Move the "iommu-addresses" behaviour change ("reg" required, non-direct
  mappings rejected) into its own patch before the iommu-ranges patch (Bryan)
- Make OF_IOMMU depend on OF_ADDRESS and drop the #if guards (Rob)
- Use resource_size_t for the size in vfio_find_dma() (Sashiko)
- End the derived trailing reserved region at PHYS_ADDR_MAX - 1 to avoid
  overflow (Sashiko)
- Add a dma-iommu fix to protect the IOVA rbtree anchor on 32-bit with
  64-bit dma_addr_t (Sashiko)
- Use the "iommu/of:" prefix and fix the subject case
- Link to v6: https://lore.kernel.org/r/20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com

Changes in v6:
- Addressed sashiko comments.
- Addressed comment from Bryan.
- Link to v5: https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

---
Vikash Garodia (5):
      iommu/dma: Keep reserved regions below the IOVA rbtree anchor
      iommu: Use resource_size_t for reserved region length
      iommu/of: Make OF_IOMMU depend on OF_ADDRESS
      iommu/of: Require reg for iommu-addresses
      iommu/of: Add support for "iommu-ranges" on a device node

 drivers/iommu/Kconfig           |   2 +-
 drivers/iommu/amd/iommu.c       |   2 +-
 drivers/iommu/dma-iommu.c       |  32 +++++----
 drivers/iommu/intel/iommu.c     |   2 +-
 drivers/iommu/iommu.c           |   2 +-
 drivers/iommu/of_iommu.c        | 147 ++++++++++++++++++++++++++++++++++------
 drivers/iommu/virtio-iommu.c    |   2 +-
 drivers/of/address.c            |   2 +-
 drivers/vfio/vfio_iommu_type1.c |   2 +-
 include/linux/iommu.h           |   4 +-
 include/linux/of_address.h      |   2 +-
 11 files changed, 155 insertions(+), 44 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-add_iommu_ranges-549cf3fb0867

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

