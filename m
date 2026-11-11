Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395112;
	b=QjnlhZqqEsU3Kqv5EWlV3k9hL0TAwmzUJcvgQVULoYyucie1V/I4ZwDcBy/BkZJVZhdw
	 lF/v79pYvpo7h/FY0x1AEXC2HDnB4lWoehNRwkrYD+ok36KjtlmpGNOMdSGftbbqI9fIn
	 9q3lPn0HhKlchxDr88t9mEpC4uXuyQH3Qb+/3svMLwGJOBDErHD9ON9rASnt819u9zcZN
	 YNAVVaJc2Tpr1p8jx8uCe/ZH5y2NGAVclnEVUVQX1eKh6Ow0Lo69MrIJEn/hsTddjrLNR
	 sTg3aPrp7qyWuqPT0SfzA4laJPRjv6zz2DFmPizqR+HFQa8PZKvxkeAHC8Z9pdUBYjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aWDnnNx26bu9eNBEE5EhcsojfHfv5oN9+T/oze9PJL4=;
	b=i3l/PpQ3+5XApih38mQEgNNoIxUwGiumZfWjer1U/gCnxnDnrCCKgjywEIUyP5Ks18G5
	 NvrZ7Wwl9yM4U1FXyOceJqAVJG7x5FhH/5ZUE+jlqbbsCEeAJ6Z+uZgC8jOYubBY15rk4
	 SUFPpw3Q6Wz26xTKjPWq0EZdPGUXM5LX6pSsModnjfxCCHNn9IB+CXi3KawVZQG5wpP2r
	 EjqOeXInTrI8vWpkltSmQjhVPYYW3barH5oZrjpUdJ9t5cCXnuLLCy0F8mKC3TT0oaGgf
	 8VsLvdukrVHz4sivxm4oGMdOCKkeyT1g8zGca5hmE1vwV2F6O6qIAbFZNvkf1KsSxUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mz7BvnsU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EzLuUJ//";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21FD606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F21FD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mz7BvnsU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EzLuUJ//
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAlUR61052608
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aWDnnNx26bu9eNBEE5Ehcsoj
	fHfv5oN9+T/oze9PJL4=; b=mz7BvnsUk9uvZQBPrlrCP0FY0EpKMK8Fnk/BJHJZ
	eIoz6x8b3e5HhK20kdOqW2ekkFFf4tIzIIQd5SEedf5uMjSOn1lfN3HMweVk6lH5
	ntz+LJKj1xA3zC1lWMiPjWdkI7P4ItEVdW191lQ5ipmefuyWEOahTrGjWcSdxLuU
	6o+wZx4H6jlX5sycKyAHYbwEDsNvpGFbhB0YgljGlpALYPGUt4AeZiDZLjWRE7EO
	9Vv4M/xETI0XHrHJGE+QWvWV4JiSzyR+bb63NyL/COQ00bTFpK9FUgmvXY0PAZvi
	blXIaVCaAkAuxykk5ieBxYSJL7zNSqx6hLI4vaa2D1tpzA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh28qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:05:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso616408eec.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794395110; x=1794999910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aWDnnNx26bu9eNBEE5EhcsojfHfv5oN9+T/oze9PJL4=;
        b=EzLuUJ//xrWGfwX+3r8k/nxd7OXTopxuBG/mXXyND/7E3CnLEwXXVJ0042K6vTwmiA
         cZAi8Y6U7C5eTDfduKkzZaA+IemJrrv58lK9Mh3xtpf1bxYsRJc6gU9EnT/WwjPJn0Wt
         0pkCX30kVPDexZb1VCpIznA5suqMd6AL9A26ECMm85jHamay/XsOVGDjad3c+F/U0F2l
         9zm/LWmn1cMEybuA6JWpRP+7oiVlTJbHuAIIn660mkyWMAY4HIJHe9eyh+8ztKDNG+le
         JYbMnYoGMwuolq75QXCU111y3/yR2b3AmDeyuW5HKEDgI2IwVSWYT9AkL1H4R+KF40AS
         BZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395110; x=1794999910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWDnnNx26bu9eNBEE5EhcsojfHfv5oN9+T/oze9PJL4=;
        b=1nbei0sJvVXnj8h3kXKx1rxdLvMIWVNzcMSEJDc/3y7PDv//tc5KzrTbhhyDutSpIo
         eyEjY9AHtBK0JvwymQoArkRJObRzMMhTGCYH3mUFxBS+y/a4ZoS3tX53AlseW00S7T7I
         BhYv1uj1xRZZtevNxB0VrkZ361qjJaMMZfuRL1yeh72MQtVcnn72+8iRGEQoGTyxUOyC
         jhwkx+LRuwyQM8k3VsxPX16QuZl7bnkSMc1AQX3VBzyd91hAX1xEjqgjdHfViunPKYFZ
         9fZhXUf8YC6JEE1NenOUAFnpbbIu0PI1a8slSCcSIM71ldtsT8P+vV4/zkwoxtOzinVE
         9p1A==
X-Forwarded-Encrypted: i=1; AL+hErF/NuMG5blKiuqemzmIa0tth2WttV0YCpZx0H6GtH4klrFo1TqHgAZD0g8g7oTfdQsNe0D40RhuT9o0oQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tn9gZmd6g5m5gTWcdKFjFzfcdqyPsI4+E7M/4WH1mEeigdjyI
	/HeApZkwTnlWRYUqkHKXXiX9zMD9u0OVwXP0xowoosG9vCgCIjDzbvBRTlnHSug0GUaj+kk3wyS
	1ft7h22AqTJtzuXuNJb8rugfALqAefo07x6DKy8iNgUs+6g3RpKXNw8Ue6N+hqeBlkA==
X-Gm-Gg: AYBFou2U8vO26RLsv/OmvJVYe2VSzzkuJppUymHRk/I1RBEm7QfGhncHrCrCNSbseHK
	djGNX6RZtn6TstQoDhUAgmUyogKff1j7TfydP5IYWWzg8JecIoMLp3mAv4jzZwBXvFqs4n2pEwk
	Me0HCI3C3/+bLuGucWW7PDNIEx+PBoV1ePTlCJCzRy/Zf9NphKFaWuNAaPgYRzr8ueae5HVJnq8
	7AYbllyAdHe6o/ky7DRlqiXmRLA8RKa0FMPJa+g8i/JZtEBa1oRDjkKo/57UJQGDFFTqRB1CXRp
	8SefsKND+TV+RTE6LCVDwx+2SP9ABr7rWGvVA4hXUt0CnyXq+LrphDv1TnrzCZLE6vBDb/RPfTY
	Mq2F4ZDFdTTYYnlWXeqORTYDjC8bsi5dtgjo9s2Rg3MKMZOfp7++1k+UnnEmRQg5M/Xsp7dgyBV
	dE0v6SALs=
X-Received: by 2002:a05:693c:6391:10b0:376:c208:ed7a with SMTP id 5a478bee46e88-376c208ef25mr1678176eec.8.1794395109786;
        Wed, 11 Nov 2026 03:05:09 -0800 (PST)
X-Received: by 2002:a05:693c:6391:10b0:376:c208:ed7a with SMTP id 5a478bee46e88-376c208ef25mr1678128eec.8.1794395109019;
        Wed, 11 Nov 2026 03:05:09 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm13502136eec.13.2026.11.11.03.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:05:08 -0800 (PST)
Date: Wed, 11 Nov 2026 16:34:56 +0530
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
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
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] of_iommu: add support for "iommu-ranges"
Message-ID: <avRL2AeIXEpA8SE/@hu-vkatoch-hyd.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX7klKRFU59sci
 9PJYb5qT4u01dugYBG/aRqSct8hN4qRthqUoqkjNNaRfG2XjH2yTaaxeH/t9rvfxdqxbANe400a
 SYb9JlWUll8z41kNaUDZbCNeZ8LRHGc=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af44be6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DzlgiSjgYWYhIfnXaHkA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: _6TaCR7py5dbLZL6yjMTsqyCed-dI5sW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX6gx94y3zZSFt
 EkzLCkORB1nmaSOAuaLMQ9ruDfZe0m8teIrn2E+NRFStmXSBoQfdzB5p/aJLPOAAmGV2Kholr6U
 YvPVl0ZmfhAYSE3nY89iEiIfYz7fBZrLGKu2DujgsWEOoLB9BfoIbmQ6d/ox1I5Y06d+jk8AqRK
 EA5aJ77BajG7yCUf5HgQYF0h7v/I0jZ06vqksoFecYCXBmP2t0nrSc6DS0Badk1VV640mdaQsef
 cXdfIXAditfu5smuH3gdzIkwmWRGuawZcM5T1SPYn4YgwTmaXF4JQY34h0sEsGjyjeUEYUg5ptR
 ep/rOrTyDL62/I8tQf83ggbZ19l5+ntdWCiReUnZWf+vytRk5pFd88r537LInLghoZ0rhI93SVv
 E4oj9Ef2o4WLUU2PzDnuJiO/Dhpq19oXwfyhJaZZzokSPyVjCkZmDxlDWbT9XxMf3NswqTR2/Fa
 5WOMqMC1j0an1tRYjLA==
X-Proofpoint-ORIG-GUID: _6TaCR7py5dbLZL6yjMTsqyCed-dI5sW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110044

On Fri, Nov 06, 2026 at 10:44:23PM +0530, Vikash Garodia wrote:
> The series adds support for recently introduced property 
> "iommu-ranges". It adds the required checks to error out for cases 
> which are not following the schema definition.
> 
> Iommu-ranges was defined in schema with this PR
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> The patch series is being posted as revision v6, since the patches 
> were initially part of the media series [1]. The patches are moved out 
> to get review comments from iommu reviewers, which was otherwise looking 
> as a media series. Happy to move this back to media series if anyone have 
> any concerns. 
> [1] 
> https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
> Changes in v7:
> - Move the "iommu-addresses" behaviour change ("reg" required, non-direct
>   mappings rejected) into its own patch before the iommu-ranges patch (Bryan)
> - Make OF_IOMMU depend on OF_ADDRESS and drop the #if guards (Rob)
> - Use resource_size_t for the size in vfio_find_dma() (Sashiko)
> - End the derived trailing reserved region at PHYS_ADDR_MAX - 1 to avoid
>   overflow (Sashiko)
> - Add a dma-iommu fix to protect the IOVA rbtree anchor on 32-bit with
>   64-bit dma_addr_t (Sashiko)
> - Use the "iommu/of:" prefix and fix the subject case
> - Link to v6: https://lore.kernel.org/r/20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com
> 
> Changes in v6:
> - Addressed sashiko comments.
> - Addressed comment from Bryan.
> - Link to v5: https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/
> 
> ---
> Vikash Garodia (5):
>       iommu/dma: Keep reserved regions below the IOVA rbtree anchor
>       iommu: Use resource_size_t for reserved region length
>       iommu/of: Make OF_IOMMU depend on OF_ADDRESS
>       iommu/of: Require reg for iommu-addresses
>       iommu/of: Add support for "iommu-ranges" on a device node
> 
>  drivers/iommu/Kconfig           |   2 +-
>  drivers/iommu/amd/iommu.c       |   2 +-
>  drivers/iommu/dma-iommu.c       |  32 +++++----
>  drivers/iommu/intel/iommu.c     |   2 +-
>  drivers/iommu/iommu.c           |   2 +-
>  drivers/iommu/of_iommu.c        | 147 ++++++++++++++++++++++++++++++++++------
>  drivers/iommu/virtio-iommu.c    |   2 +-
>  drivers/of/address.c            |   2 +-
>  drivers/vfio/vfio_iommu_type1.c |   2 +-
>  include/linux/iommu.h           |   4 +-
>  include/linux/of_address.h      |   2 +-
>  11 files changed, 155 insertions(+), 44 deletions(-)
> ---
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> change-id: 20261103-add_iommu_ranges-549cf3fb0867
> 
> Best regards,
> -- 
> Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
FYI, we need this series too, for the extended mapping support [1] in
the fastrpc driver. I'll be posting a new version of that series soon.
[1] https://lore.kernel.org/all/20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com/
