Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402156;
	b=dczjRpUqTmk3iSSAybwnyovLZBmvVN+AH9zB/iF5htCB3FBE0koru9rzBmxtHXqtDzsq
	 lmAnu9m3Fp/9Is+2M7Y5wFbSXDLy55uIzaZ2zoFFAc9y/FYGHhNLKP+jK+fAYpXweIZXL
	 memQ9xzgsQ8cXvBMMaYDnk6VY1pZ+DPqE2sQUHYUDqv3iufzBwdq9viAWLkOAc1eSNYDH
	 NLlgokBWjHxKR/n2kCFv5wW+jRei0IlEpC8olcsiCylAL00k+WGGrlSEEkrMN6lXH6n1W
	 Z5s9+73NGuGVGbSHfrIsONuT00CZ8i9jW0R56X/SQm0SC8cZuYQpujKvHCvh2cSUvgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gL7PRluqOkzpLiN/UK7bTD43fl5T1IxvJlK3ZPRyK2w=;
	b=Cw06JJ/LXdlRIQ4wKavyFClCVtV4rOfgoXuqVTnUTua1LxFHRjgDviCGXNm46e0Kt9N/
	 Rn/tC7GnGjDZOqTOeSyal/qdSuEQQSqlg0iqwjBgPRfDSlO3CFixFbLTJYd0XIZuHQaE2
	 IZvQnsLLbn4UnoPxfGgcZoGoMNhemSR38nSYw3AuQIlz5hGaHFNqSNe02cD7OB/RBrHKi
	 UOse2cABZGMhnp2c2HImW5BAxhPsp7hwiS1zRsbtauP+DHGcrPArl3j+ZlfnZUpzZn8Qt
	 Kwuz10uK14QkkWEnmsmr7n328jaWCrH5ITKXLtCfSO9nZRKI7iUHU9MaYBBUqsu6Kcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMYvY7ez;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZuShfxc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA8606A884
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DA8606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMYvY7ez;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZuShfxc
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYqjP2286472
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gL7PRluqOkzpLiN/UK7bTD43
	fl5T1IxvJlK3ZPRyK2w=; b=EMYvY7ezmzJ0k40Xt1ZuHaDmzZ3tilOwId0a9hlK
	AQFxTU37UV7LI9UXhgIZXO+CS4P1RpIm31tkGUjuTadL6oV/3qq5WgSSD226R9jq
	qbuJpilJYMz5hu+B4t0TpR9eAGf0kyGl6OxeDSpq33jzWKKYVKt79BbIX4u1X0qP
	cJm3uxvBWcuaQzBZtQiXE3DtrPa7XqBEy1P3zNquohvHnQRdxZEtl8aP4O8ghzH7
	uRH0iP7kni+J5wq4twsVr3vu5IRzq71lqawbB3iNG2K8r+T+a3vPWopy/oXK/jEt
	GJr5A2ke5Kkqx9r8eJKJwPyt0NYJlJ0rwoN4LJOSqulQGQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm98p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:02:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece56bfeadso2570412e0c.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402154; x=1795006954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gL7PRluqOkzpLiN/UK7bTD43fl5T1IxvJlK3ZPRyK2w=;
        b=bZuShfxcAnDXihKmV6NZOlW0JhFuxnBRGMS16+chGl/HRrzhkJEmqP4uO6T+uoCh92
         /48tV2jeBN8k2MV/S0n+e8Vp5JuYVS5JGCi3niBhahbKeZcKPVojNv8P3mLOrAZ4X08v
         yuhok4t95QqzPG4PhjQG1hs38oAJK+/9H3InmTxdFC45vlHkeEQ1KvwilLoUZFYGLv71
         AU2dfI6zSA/ANkB1GlzglY93eTm2w90k8B5Zi8BR1GCYOq/o1wB3grtMiVFoHpkrbPNn
         kyITVPwCXx0rQxZegCLHq8bJpQ/ivNKdj9snwFil3xbG8OWnBlmkjHvHvQcvu80mgt9Y
         J2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402154; x=1795006954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gL7PRluqOkzpLiN/UK7bTD43fl5T1IxvJlK3ZPRyK2w=;
        b=TBPG/7pyn0Ybq/0jmKbiEUdSmB8a+lsDPM7pCRLesswrYBioOeQProt/RyCflmTmJP
         d5HmUxous9wrAUpR7RN+6WZdMqJ3vzpRfiMnxUsyiUTmFC8oRH8Ft7wqZAbsssNMBPZ2
         lVZmAXCvXgJS5c6ZKSaOIHGW8ovyY3CjRdoPJuyhDy+g6tCKItr0+s9zLTNtnZ3o+EdJ
         EuQPraMRd1V3xQw4vOJE5f6sZLxk2p85LTakHHbbUOVzo11oG+h8NvrmuTLZmp1nEuuZ
         9CLiYIrN2v/pmLZbjwxV3gV9SRA8gdPCOqOpdvVdjCMY901XfIF7hSs4XZcmwLfpFS/g
         SRUw==
X-Forwarded-Encrypted: i=1; AL+hErGPKXmqZMXH6eHGitqT9uO5OBEMjRB/Uwt1uuQAjldglbkR9c02gsRmJILJLOsjceB2fWKJUZ2olWDJXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q3OmHfTBJkec0pQAT0M9dQ//ERYn1n9mAYobOgKSPMUoDRwj7
	7CrEO3DWmTb/PguuQRq+xvRzsm9iwRkQOWzIh3nQjR5VKrtf9JDkWA6HhZhFZe5OlAbiVsf5eK8
	nqw9bSDthv5HB+msPQfjxUe+a20hRx94SqW58XJY2dmjQapyboAbtHXZn0Yu24NeOCw==
X-Gm-Gg: AYBFou2ML+GkUotXX8vG6rj1vJXHbz/QAn1T38UolPiWQO+ruXFAGlcZb77hE0ZijVP
	URVDUfjRY7Sm0fF7QpIOp7Lj9fbUHLkrCmL4o3BmSheCELgUU7mBDe21vHdeTG3VbsGbT9Qrbt2
	5bH0RnaxM49gFEyr1RdN1jeEbBXU6twZOFcM1QApNwgeRr21Lb6iv+BifhGM5uDnJsVHqLtSaAB
	jS8sJSwsIXev65WJFaTMcZO72kT5R4S87kBaCtSfuNY/eJxFxu/gV4sgus6VscaGrEWvfhg5xx+
	eCFyFuTTkKrjT0oyXfTWbORIVLNXZphrWPo2qC7ojRlVXS4Khfa/LAVb4qPFntHllCKBUvAkWp7
	YA6Mq5fNfrvvKTTkK7lSfL64939sy4M/ziDySm3d59vyMOVvOxzDsgBI0yinrLZeCuPmo9BZMlR
	4Tq9OhtNLuYJGxr1MF4/6sGiq1a06pMErS4OFJ8cLxakpLHRdjMOI0BMn/gAE13w==
X-Received: by 2002:a05:6122:e248:b0:5ec:c180:e1a1 with SMTP id 71dfb90a1353d-5ee1c292c8bmr762369e0c.2.1794402153765;
        Wed, 11 Nov 2026 05:02:33 -0800 (PST)
X-Received: by 2002:a05:6122:e248:b0:5ec:c180:e1a1 with SMTP id 71dfb90a1353d-5ee1c292c8bmr762282e0c.2.1794402153278;
        Wed, 11 Nov 2026 05:02:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baba35sm933313e87.46.2026.11.11.05.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:02:32 -0800 (PST)
Date: Wed, 11 Nov 2026 15:02:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/5] iommu: Use resource_size_t for reserved region
 length
Message-ID: <hn7dczsvgtq6siyikoaf6y5stlacmdyq53eg4mhyonugjhujlp@7k4cxflzuu56>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-2-5c0f72083e52@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_iommu_ranges-v7-2-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-GUID: QRvAnV27bKuIsH0wGbTHwlEQlPY9p2cR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX83K0I6gz+bga
 qqrR9uB2salEKFAgR0mOyShfpDL9JX8z+eJUYb8BuIbOg44LOBL48ysv6J+3v8CPZzjNg+Aabya
 nX2oFEY+6JDDJseJGlcKAzx4yBI5Ww8/BjLUCmMYhmr43TMN9YsTM9IYQNtVtC8mwsjujge7tCN
 VYD+ApTFYn6pvm3ncKQUwYSyXjAQ839z00BMYeIiLTvktIo5tF7Zf+wdWzG+DxNajQEsXtlf+KZ
 WCTrAv8QrjUXRYJmpGwbccaW3eKNibe2sE/wegQQz1mlvY7EY6JOTakhaZXGOBiSIz8wej5PJMj
 MGcigHpOWlZmdTyysIKw5A/0Mp3433eVhU5+eV6ucl2DMHslxb19jGnh+RmwBSlaAofwAexegMm
 MEth3oUzGM1jprEgsQ4TAIIGo4VvhWZB8ngJMQCoDb6WP4g8RNP9dtwhuJAgM/PYHMOmYzkVNDI
 AcAjxEZ1VSl7F2t7jfQ==
X-Proofpoint-ORIG-GUID: QRvAnV27bKuIsH0wGbTHwlEQlPY9p2cR
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4676a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EE9pRYFAw_fItPXnlVYA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX58IwRgfXa2h1
 49hc7s7ahL5LRdxW3/Oo5aW/hKjZdQey3oLMZ29Z0wznHJaH1RBziICwU8YtwrOc0diNaimZYf8
 GNBzC5w9PNe6XuF8VmEq/xn+4f6ljG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:25PM +0530, Vikash Garodia wrote:
> On 32-bit systems with LPAE, physical addresses are 64-bit. A reserved
> region can be larger than 4GiB, but its length is stored as size_t,
> which is only 32-bit there. The length gets truncated.
> Use resource_size_t for the length so it matches the width of
> phys_addr_t and holds the full size of the region.
> 
> Fixes: 2b20cbba3390 ("iommu: iommu_alloc_resv_region")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/d223ee9f-b262-408a-a201-8b16d310bbe0@oss.qualcomm.com
> Cc: stable@vger.kernel.org
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/amd/iommu.c       | 2 +-
>  drivers/iommu/intel/iommu.c     | 2 +-
>  drivers/iommu/iommu.c           | 2 +-
>  drivers/iommu/of_iommu.c        | 4 ++--
>  drivers/iommu/virtio-iommu.c    | 2 +-
>  drivers/of/address.c            | 2 +-
>  drivers/vfio/vfio_iommu_type1.c | 2 +-
>  include/linux/iommu.h           | 4 ++--
>  include/linux/of_address.h      | 2 +-
>  9 files changed, 11 insertions(+), 11 deletions(-)
> 

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
